#!/usr/bin/env python3
"""
nco_scheduler.py
==========================
Author: J. Timothy Collier
Created: 1/2/26
Last Updated: 1/2/26
==========================
Purpose: Assist with scheduling Net Control Operators for the Sunday Night Net.


         Schedule Net Control Operators for a given quarter using:
             - SQLite as the system of record
             - OR-Tools CP-SAT as the optimizer

         Constraints:
             1) Exactly one operator per Sunday
             2) Operator must be available (t_nco_avail.scheduled = 'Y')
             3) No operator may work consecutive Sundays
             4) Workload is balanced as evenly as possible

         Manual assignments (source='MANUAL') are preserved.
         Auto-generated assignments use source='AUTO'.
"""
from __future__ import annotations

import argparse
import sqlite3
from typing import Dict, List, Tuple

from ortools.sat.python import cp_model


# ----------------------------------------------------------------------
# Database helpers
# ----------------------------------------------------------------------

def connect(db_path: str) -> sqlite3.Connection:
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn


def load_dates(conn: sqlite3.Connection, quarter: str) -> List[str]:
    rows = conn.execute(
        """
        SELECT net_date
        FROM t_nco_date
        WHERE quarter = ?
        ORDER BY net_date
        """,
        (quarter,),
    ).fetchall()

    # sqlite3.Row supports mapping-style access by column name
    if rows and isinstance(rows[0], sqlite3.Row):
        return [r["net_date"] for r in rows]

    # default tuples
    return [r[0] for r in rows]

    if not rows:
        raise ValueError(f"No Sundays found for quarter {quarter}")

    return [r["net_date"] for r in rows]


def load_operators(conn: sqlite3.Connection) -> List[str]:
    print('In load_operators')
    rows = conn.execute(
        """
        SELECT pers_call
        FROM t_nco_operator
        ORDER BY pers_call
        """
    ).fetchall()

    if not rows:
        raise ValueError("No operators found in t_nco_operator")

    return [r["pers_call"] for r in rows]


def load_availability(conn: sqlite3.Connection, quarter: str) -> Dict[Tuple[str, str], bool]:

    rows = conn.execute(
        """
       SELECT a.pers_call, date(a.net_date) as net_date
        FROM t_nco_avail a
        JOIN t_nco_date d
          ON date(d.net_date) = date(a.net_date)
        WHERE d.quarter = ?
          AND a.scheduled = 'Y'
        """,
        (quarter,),
    ).fetchall()

    return {(r["pers_call"], r["net_date"]): True for r in rows}


# ----------------------------------------------------------------------
# Solver
# ----------------------------------------------------------------------

from typing import Dict, List, Tuple
from ortools.sat.python import cp_model


def solve_schedule(
    dates: List[str],
    operators: List[str],
    avail: Dict[Tuple[str, str], bool],
) -> Dict[str, str]:

    print("\nIn solve_schedule\n----------------------------------")

    model = cp_model.CpModel()

    # --------------------------------------------------
    # Decision variables: x[(op, date)] == 1 if op works date
    # --------------------------------------------------
    x: Dict[Tuple[str, str], cp_model.IntVar] = {}

    for d in dates:
        for op in operators:
            if avail.get((op, d), False):
                x[(op, d)] = model.NewBoolVar(f"x_{op}_{d}")

    # --------------------------------------------------
    # Exactly one operator per Sunday
    # --------------------------------------------------
    for d in dates:
        todays = [x[(op, d)] for op in operators if (op, d) in x]
        if not todays:
            raise ValueError(f"No available operators for {d}")
        model.Add(sum(todays) == 1)

    # --------------------------------------------------
    # No consecutive Sundays for same operator
    # --------------------------------------------------
    for op in operators:
        for i in range(len(dates) - 1):
            d1 = dates[i]
            d2 = dates[i + 1]
            v1 = x.get((op, d1))
            v2 = x.get((op, d2))
            if v1 is not None and v2 is not None:
                model.Add(v1 + v2 <= 1)

    # --------------------------------------------------
    # Workload per operator
    # --------------------------------------------------
    loads: Dict[str, cp_model.IntVar] = {}
    for op in operators:
        vars_for_op = [x[(op, d)] for d in dates if (op, d) in x]
        loads[op] = model.NewIntVar(0, len(dates), f"load_{op}")
        model.Add(loads[op] == sum(vars_for_op))

    # --------------------------------------------------
    # Balance workload
    # --------------------------------------------------
    Lmax = model.NewIntVar(0, len(dates), "Lmax")
    Lmin = model.NewIntVar(0, len(dates), "Lmin")

    for op in operators:
        model.Add(loads[op] <= Lmax)
        model.Add(loads[op] >= Lmin)

    avg = len(dates) // len(operators)
    deviations = []

    for op in operators:
        dev = model.NewIntVar(0, len(dates), f"dev_{op}")
        model.Add(dev >= loads[op] - avg)
        model.Add(dev >= avg - loads[op])
        deviations.append(dev)

    BIG = 10_000
    model.Minimize(BIG * (Lmax - Lmin) + sum(deviations))

    # --------------------------------------------------
    # Solve
    # --------------------------------------------------
    solver = cp_model.CpSolver()
    solver.parameters.max_time_in_seconds = 10
    solver.parameters.num_search_workers = 8

    status = solver.Solve(model)
    if status not in (cp_model.OPTIMAL, cp_model.FEASIBLE):
        raise RuntimeError("No feasible schedule found")

    # --------------------------------------------------
    # Extract solution
    # --------------------------------------------------
    schedule: Dict[str, str] = {}

    for d in dates:
        for op in operators:
            var = x.get((op, d))
            if var is not None and solver.Value(var) == 1:
                schedule[d] = op
                break

    return schedule



# ----------------------------------------------------------------------
# Persist results (SOURCE-AWARE)
# ----------------------------------------------------------------------

def write_schedule(
    conn: sqlite3.Connection, quarter: str, schedule: Dict[str, str]
) -> None:
    # ### CHANGED: remove only AUTO rows
    conn.execute(
        """
        DELETE FROM t_nco_schedule
        WHERE quarter = ?
          AND source = 'AUTO'
        """,
        (quarter,),
    )

    # ### CHANGED: insert with source='AUTO'
    print ("*****")
    print(quarter, schedule, "AUTO")
    print("*****")
    missing = [
	    (op, d)
	    for d, op in schedule.items()
	    if not conn.execute(
		    """
            SELECT 1
            FROM t_nco_avail
            WHERE pers_call = ?
              AND net_date = ?
		    """,
		    (op, d),
	    ).fetchone()
    ]

    print("Missing availability rows:", missing)

    conn.executemany(
        """
        INSERT INTO t_nco_schedule
            (quarter, pers_call, sched_date, source)
        VALUES (?, ?, ?, 'AUTO')
        """,
        [(quarter, op, d) for d, op in schedule.items()],
    )

    conn.commit()


# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(description="NCO Scheduler (SQLite)")
    parser.add_argument("--db", required=True, help="Path to SQLite database")
    parser.add_argument("--quarter", required=True, help="Quarter (e.g. 2026Q2)")
    args = parser.parse_args()


    conn = connect(args.db)

    try:
        dates = load_dates(conn, args.quarter)
        operators = load_operators(conn)
        avail = load_availability(conn, args.quarter)

        schedule = solve_schedule(dates, operators, avail)
        write_schedule(conn, args.quarter, schedule)

        print(f"\nSchedule for {args.quarter}")
        for d in dates:
            print(f"{d}  {schedule[d]}")

        print("\nWorkload summary:")
        counts: Dict[str, int] = {}

        for op in schedule.values():
            counts[op] = counts.get(op, 0) + 1
        for op in sorted(counts):
            print(f"{op}: {counts[op]}")

    finally:
        conn.close()


if __name__ == "__main__":
    main()

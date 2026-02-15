"""
Script Name: nco_schedule_old.py
Author: J. Timothy Collier
Created: 12/26/25
Last Updated: 12/26/25

Purpose:

Net Control Operator Scheduler
==============================

This script generates a fair schedule of Net Control Operators (NCOs)
for a given quarter, based on their availability and a master list of
Sunday net dates.

Database tables used:
---------------------
1. t_pers
   - Master person registry (call signs, names, etc.)

2. t_nco_dates
   - Authoritative list of Sundays for each quarter.
   - Columns: date (PK), quarter (e.g., '2025Q4').

3. t_nco_avail
   - Operator availability (who is available which Sunday).
   - Columns: pers_call, date (FKs to t_pers and t_nco_dates).

4. t_nco_schedule
   - Final schedule of assignments.
   - Columns: date (PK), quarter, pers_call.

Algorithm:
----------
- Retrieve all Sundays in the given quarter.
- For each Sunday:
  - Look up which operators are available.
  - Choose the operator with the fewest assignments so far.
  - Break ties randomly.
- Save results into t_nco_schedule, preserving historical quarters.
- Report assignment counts per operator for fairness verification.

Usage:
------
    python scheduler.py

Edit the `quarter` variable in the main block to select the quarter.
"""

import random
import sqlite3
from collections import defaultdict

# Path to the SQLite database file
DB = "/Users/tcollier/Dropbox/Amateur Radio/MACLoggerDX/MLDX_Logs/HARC_SNN_3_PROD.sql"


def build_schedule(quarter: str):
    """
    Build a net control schedule for a given quarter.

    Args:
            quarter (str): Quarter identifier, e.g., '2025Q4'.

    Returns:
            tuple:
                    - schedule (dict): Mapping of {date: assigned_operator or None}.
                    - assignments (dict): Count of how many nets each operator was assigned.
    """
    conn = sqlite3.connect(DB)
    cur = conn.cursor()

    # STEP 1: Retrieve authoritative Sunday dates for this quarter
    cur.execute(
        "SELECT net_date FROM t_nco_date WHERE quarter = ? ORDER BY net_date",
        (quarter,),
    )
    sundays = [row[0] for row in cur.fetchall()]

    if not sundays:
        print(f"No dates found for {quarter}. Did you populate t_nco_dates?")
        return {}, {}

    # STEP 2: Retrieve operator availability for these dates
    cur.execute(
        """
                SELECT pers_call, date(Net_date)
                FROM t_nco_avail
                WHERE date(Net_date) IN (SELECT date(net_date) FROM t_nco_date WHERE quarter = ?)
	            """,
        (quarter,),
    )
    rows = cur.fetchall()

    # Build dictionary: {operator: [list_of_available_dates]}
    availability = {}
    for call, date in rows:
        availability.setdefault(call, []).append(date)

    # Initialize results
    schedule = {}  # final schedule {date: assigned_call}
    assignments = defaultdict(int)  # count of assignments per operator

    # STEP 3: Assign operators date by date
    for sunday in sundays:
        # Find who is available this Sunday
        available_today = [
            call for call, dates in availability.items() if sunday in dates
        ]

        if not available_today:
            # No one available → mark as unassigned
            schedule[sunday] = None
            continue

        # Choose operator with fewest assignments so far
        min_count = min(assignments[call] for call in available_today)
        least_used = [
            call for call in available_today if assignments[call] == min_count
        ]

        # Break ties randomly
        chosen = random.choice(least_used)

        # Record assignment
        schedule[sunday] = chosen
        assignments[chosen] += 1

    # STEP 4: Save results into the schedule table
    print(f'Now updating: {date}  {quarter}  {call}')
    print (schedule.items())
    cur.executemany(
        "INSERT OR REPLACE INTO t_nco_schedule (quarter, pers_call, sched_date) VALUES (?, ?, ?)",
	    [(quarter, date, call) for call, date in schedule.items()],
            )
    conn.commit()
    conn.close()

    return schedule, assignments


if __name__ == "__main__":
    # Example: run scheduler for 2025Q4
    quarter = "2026Q1"
    schedule, counts = build_schedule(quarter)

    # Pretty-print results
    print(f"=== Net Control Schedule for {quarter} ===")
    for date, call in schedule.items():
        print(f"{date}: {call or 'UNASSIGNED'}")

    print("\n=== Assignment Counts ===")
    for call, count in counts.items():
        print(f"{call}: {count}")

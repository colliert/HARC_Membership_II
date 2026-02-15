"""
Sunday Night Net Date Generator
===============================

This script generates the authoritative list of Sunday dates for a given year
and stores them in the database table `t_nco_dates`.

Database table used:
--------------------
t_nco_dates
    - date (DATE, PRIMARY KEY): the Sunday date
    - quarter  (TEXT): quarter identifier, e.g., '2025Q1'

Algorithm:
----------
1. Start from January 1 of the given year.
2. Find the first Sunday.
3. Step forward in 7-day increments until the year ends.
4. For each Sunday:
   - Compute its quarter (Q1, Q2, Q3, Q4).
   - Store (date, quarter) in the database.
5. Use `INSERT OR IGNORE` to avoid duplicating dates if run multiple times.

Usage:
------
    python generate_sundays.py

This will insert all Sundays for the year 2025 into `t_nco_dates`.
"""

import sqlite3
import datetime

# Path to the production Sunday Night Net database
DB = "/Users/tcollier/Dropbox/Amateur Radio/MACLoggerDX/MLDX_Logs/HARC_SNN_3_PROD.sql"


def get_quarter(month: int) -> str:
    """
    Return a quarter code (Q1, Q2, Q3, Q4) for a given month number.

    Args:
        month (int): Month number (1–12)

    Returns:
        str: 'Q1' if Jan–Mar, 'Q2' if Apr–Jun, 'Q3' if Jul–Sep, 'Q4' if Oct–Dec
    """
    if month <= 3:
        return "Q1"
    elif month <= 6:
        return "Q2"
    elif month <= 9:
        return "Q3"
    else:
        return "Q4"


def generate_sundays(year: int):
    """
    Insert all Sundays for a given year into t_nco_dates.

    Args:
        year (int): Year to generate (e.g., 2025)

    Returns:
        list of tuples: [(date_str, quarter), ...] inserted into the table
    """
    conn = sqlite3.connect(DB)
    cur = conn.cursor()

    # Start at January 1
    d = datetime.date(year, 1, 1)

    # Advance until the first Sunday
    while d.weekday() != 6:  # Monday=0 ... Sunday=6
        d += datetime.timedelta(days=1)

    sundays = []
    while d.year == year:
        # Determine the quarter code, e.g., '2025Q1'
        quarter = f"{year}{get_quarter(d.month)}"
        sundays.append((d.isoformat(), quarter))
        # Step to the next Sunday
        d += datetime.timedelta(days=7)

    # Insert Sundays into the database (ignore duplicates if rerun)
    cur.executemany(
        "INSERT OR IGNORE INTO t_nco_date (net_date, quarter) VALUES (?, ?)", sundays
    )
    conn.commit()
    conn.close()

    return sundays


if __name__ == "__main__":
    # Example: generate all Sundays for 2025
    dates = generate_sundays(2026)
    print("Inserted Sundays:")
    for d, quarter in dates:
        print(d, quarter)

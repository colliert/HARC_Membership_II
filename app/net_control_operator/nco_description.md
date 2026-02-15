# Description of nco_scheduler.py

## High-level purpose

This Python script connects to a **SQLite database** (`sunday_net.db`) and generates a **fair Net Control Operator schedule** for a given quarter.

It:

1. Pulls the **authoritative list of Sunday dates** from `t_nco_dates`.
2. Pulls **operator availability** for those dates from `t_nco_avail`.
3. For each Sunday, assigns an operator:

   * Only from those available that day.
   * Preferring the operator with the **fewest total assignments so far** (to balance the load).
   * Breaking ties randomly.
4. Stores the results in `t_nco_schedule`.
5. Prints the schedule and participation counts.

---

## Line-by-line breakdown

```python
import sqlite3
import random
from collections import defaultdict
```

* `sqlite3` → provides database connectivity to the SQLite file.
* `random` → used to randomly pick between equally eligible operators.
* `defaultdict` → used to track how many nets each operator has already been assigned.

```python
DB = "sunday_net.db"
```

* Defines the database file name.

```python
def build_schedule(quarter: str):
    conn = sqlite3.connect(DB)
    cur = conn.cursor()
```

* Opens a connection to the database.
* `cur` is the cursor used to execute SQL queries.

---

### Step 1: Get Sundays for this quarter

```python
    cur.execute("SELECT date FROM t_nco_dates WHERE quarter = ? ORDER BY date", (quarter,))
    sundays = [row[0] for row in cur.fetchall()]

    if not sundays:
        print(f"No dates found for {quarter}. Did you populate t_nco_dates?")
        return {}, {}
```

* Queries `t_nco_dates` for all Sundays tagged with the given quarter (`quarter`).
* Stores them in a list `sundays`.
* If no dates are found, the function returns early.

---

### Step 2: Get operator availability

```python
    cur.execute("""
        SELECT pers_call, date
        FROM t_nco_avail
        WHERE date IN (SELECT date FROM t_nco_dates WHERE quarter = ?)
    """, (quarter,))
    rows = cur.fetchall()

    availability = {}
    for call, date in rows:
        availability.setdefault(call, []).append(date)
```

* Queries `t_nco_avail` for all operators (`pers_call`) who are available on dates in this quarter.
* Builds a dictionary like:

  ```python
  {
      "K7JTC": ["2025-10-05", "2025-10-19", ...],
      "N7IVK": ["2025-10-12", "2025-11-02", ...]
  }
  ```

---

### Step 3: Initialize tracking

```python
    schedule = {}
    assignments = defaultdict(int)
```

* `schedule` → dictionary mapping `date → assigned operator`.
* `assignments` → dictionary counting how many nets each operator has already been assigned.

---

### Step 4: Assign operators, date by date

```python
    for sunday in sundays:
        available_today = [call for call, dates in availability.items() if sunday in dates]

        if not available_today:
            schedule[sunday] = None  # no one available
            continue
```

* Loops through each Sunday.
* Finds which operators are available that day.
* If none, marks the day as **unassigned**.

```python
        # Pick operator with the fewest assignments so far
        min_count = min(assignments[call] for call in available_today)
        least_used = [call for call in available_today if assignments[call] == min_count]
        chosen = random.choice(least_used)
```

* Among those available, finds who has the fewest assignments so far.
* If multiple are tied, picks randomly (`random.choice`).
* This ensures a **fair distribution**.

```python
        schedule[sunday] = chosen
        assignments[chosen] += 1
```

* Records the chosen operator for that Sunday.
* Increments their assignment count.

---

### Step 5: Save results to database

```python
    cur.executemany(
        "INSERT OR REPLACE INTO t_nco_schedule (date, quarter, pers_call) VALUES (?, ?, ?)",
        [(date, quarter, call) for date, call in schedule.items()]
    )
    conn.commit()
    conn.close()
```

* Inserts the schedule results into `t_nco_schedule`.
* Uses `INSERT OR REPLACE` so re-running the scheduler will overwrite existing entries.
* Commits and closes the database connection.

---

### Step 6: Return results

```python
    return schedule, assignments
```

* Returns two dictionaries:

  * `schedule` → mapping of Sundays to assigned operators.
  * `assignments` → count of how many times each operator was assigned.

---

### Script entry point

```python
if __name__ == "__main__":
    quarter = "2025Q4"  # example
    schedule, counts = build_schedule(quarter)

    print(f"=== Net Control Schedule for {quarter} ===")
    for date, call in schedule.items():
        print(f"{date}: {call or 'UNASSIGNED'}")

    print("\n=== Assignment Counts ===")
    for call, count in counts.items():
        print(f"{call}: {count}")
```

* When run directly, schedules quarter `"2025Q4"`.
* Prints out the final schedule (with `"UNASSIGNED"` for empty days).
* Prints the participation counts for each operator.

---

✅ **Summary:** This script automatically assigns Net Control Operators to Sundays in a quarter, distributing the work evenly and respecting availability. It writes the results back into the database so you can report on schedules or operator participation later.

---

Would you like me to write this up as a **formal docstring + inline comments version** of the code, so the script itself serves as both runnable code *and* documentation?

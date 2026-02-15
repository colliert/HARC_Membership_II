# Description of nco_calc_dates
## Generates dates for all Sunday Nights for a given year


This utility script generates the authoritative list of Sunday dates for a given year and stores them in the database table `t_nco_dates`.  

---

## Database Table

**t_nco_dates**

| Column | Type | Description |
|--------|------|-------------|
| `date` | DATE (PK) | The Sunday date |
| `quarter`  | TEXT | Quarter identifier (e.g., `2025Q1`) |

---

## Algorithm

1. Start from **January 1** of the given year.  
2. Advance until the **first Sunday**.  
3. Step forward in **7-day increments** until the year ends.  
4. For each Sunday:  
   - Compute its **quarter** (`Q1`, `Q2`, `Q3`, `Q4`).  
   - Store `(date, quarter)` in the database.  
5. Use `INSERT OR IGNORE` to avoid duplicates if the script is rerun.  

---

## Functions

### `get_quarter(month: int) -> str`
- Maps a month number (1–12) to a quarter string.  
- Returns:  
  - `"Q1"` if Jan–Mar  
  - `"Q2"` if Apr–Jun  
  - `"Q3"` if Jul–Sep  
  - `"Q4"` if Oct–Dec  

### `generate_sundays(year: int) -> list`
- Generates all Sundays for a given year.  
- Inserts them into `t_nco_dates`.  
- Returns a list of tuples `(date, quarter)` that were inserted.  

---

## Usage

Run the script directly to generate Sundays for a given year.  

```bash
python generate_sundays.py
````

Example output for 2025:

```
Inserted Sundays:
2025-01-05 2025Q1
2025-01-12 2025Q1
...
2025-12-28 2025Q4
```

---

## Notes

* The script connects to the SQLite database defined in the `DB` variable.
* Safe to rerun — existing entries are not duplicated (`INSERT OR IGNORE`).
* The generated dates in `t_nco_dates` are **authoritative** for scheduling Net Control Operators.

---

```

---

Do you want me to also prepare a **matching Markdown doc** for the **scheduler script** so you’ll have both pieces documented consistently?
```

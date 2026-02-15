Below is a walk-through of `solve_schedule()` at the level of “what is OR-Tools doing here, and why does each block exist.”

## OR-Tools / CP-SAT in one paragraph

`ortools.sat.python.cp_model` is Google OR-Tools’ **CP-SAT** solver: you define a **constraint satisfaction / optimization** model using:

* **decision variables** (mostly booleans and integers),
* **constraints** (equalities/inequalities involving those variables),
* and optionally an **objective** to minimize/maximize.

Then CP-SAT searches for an assignment of variables that satisfies all constraints and optimizes the objective.

Your function builds a model where the decision is essentially: **which operator is assigned to which Sunday**, subject to availability + rules.

---

## Function signature

```python
def solve_schedule(dates, operators, avail) -> Dict[str, str]:
```

* `dates`: list of Sundays (as strings) to schedule (e.g., 13 dates in a quarter)
* `operators`: list of callsigns
* `avail`: dictionary keyed by `(op, date)` with boolean indicating availability

Return value: `schedule` mapping `{date: operator}`.

---

## 1) Create the model

```python
model = cp_model.CpModel()
```

This is the container for all variables, constraints, and the objective.

---

## 2) Decision variables: `x[(op, date)] ∈ {0,1}`

```python
x = {}
for d in dates:
    for op in operators:
        if avail.get((op, d), False):
            x[(op, d)] = model.NewBoolVar(f"x_{op}_{d}")
```

Interpretation:

* `x[(op, d)] = 1` means operator `op` is assigned to date `d`.
* `x[(op, d)] = 0` means not assigned.

Important nuance: you only create `x[(op, d)]` **if the person is available** on that date.
So “unavailable assignments” don’t even exist as variables. That’s a clean modeling trick: it shrinks the search space and makes it impossible to schedule an unavailable operator.

---

## 3) Constraint: Exactly one operator per Sunday

```python
for d in dates:
    todays = [x[(op, d)] for op in operators if (op, d) in x]
    if not todays:
        raise ValueError(f"No available operators for {d}")
    model.Add(sum(todays) == 1)
```

For each date `d`:

* `todays` collects all variables “operator op works date d” for operators who are available.
* If nobody is available, you fail fast with a clear error. (Good.)
* `sum(todays) == 1` enforces **exactly one** assignment.

So you will never get “unfilled Sundays” or “two operators on one Sunday.”

---

## 4) Constraint: No consecutive Sundays for the same operator

```python
for op in operators:
    for i in range(len(dates) - 1):
        d1 = dates[i]
        d2 = dates[i + 1]
        v1 = x.get((op, d1))
        v2 = x.get((op, d2))
        if v1 is not None and v2 is not None:
            model.Add(v1 + v2 <= 1)
```

For each operator, for each adjacent pair of dates `(d1, d2)`:

* If the operator is available on both dates, you have variables `v1`, `v2`.
* `v1 + v2 <= 1` means you cannot set both to 1.

  * Allowed: (1,0), (0,1), (0,0)
  * Disallowed: (1,1)

Note the conditional: if the operator isn’t available on one of the two Sundays, then you **don’t add** the constraint—because at least one variable doesn’t exist and consecutive assignment can’t happen anyway.

---

## 5) Compute each operator’s workload (`loads[op]`)

```python
loads = {}
for op in operators:
    vars_for_op = [x[(op, d)] for d in dates if (op, d) in x]
    loads[op] = model.NewIntVar(0, len(dates), f"load_{op}")
    model.Add(loads[op] == sum(vars_for_op))
```

This introduces an integer variable per operator:

* `loads[op]` = number of Sundays assigned to `op`.

It’s constrained to equal the sum of that operator’s assignment booleans.

This is not strictly required to *find* a schedule, but it’s essential for **balancing**.

---

## 6) Balance workload: track `Lmax` and `Lmin`

```python
Lmax = model.NewIntVar(0, len(dates), "Lmax")
Lmin = model.NewIntVar(0, len(dates), "Lmin")

for op in operators:
    model.Add(loads[op] <= Lmax)
    model.Add(loads[op] >= Lmin)
```

Here you create two integer variables intended to become:

* `Lmax` = maximum load across operators
* `Lmin` = minimum load across operators

The constraints:

* `loads[op] <= Lmax` for all ops forces `Lmax` to be at least every operator’s load → it can represent the max.
* `loads[op] >= Lmin` for all ops forces `Lmin` to be at most every operator’s load → it can represent the min.

By themselves, these do not “pin” them to the tightest possible max/min. That happens because you later **minimize** `Lmax - Lmin`.

---

## 7) Define “average” and per-operator deviations

```python
avg = len(dates) // len(operators)
deviations = []

for op in operators:
    dev = model.NewIntVar(0, len(dates), f"dev_{op}")
    model.Add(dev >= loads[op] - avg)
    model.Add(dev >= avg - loads[op])
    deviations.append(dev)
```

* `avg` is an integer floor average. Example: 24 dates / 10 operators = 2 (floor), even though the true average is 2.4.
* For each operator, `dev` is constrained to be at least:

  * `loads[op] - avg`
  * `avg - loads[op]`

Together those are the standard linear way to model:

$$
dev_{op} \ge |loads_{op} - avg|
$$

So `dev` becomes the absolute deviation from the average (or more precisely, from the floor average).

---

## 8) Objective: minimize spread first, then total deviation

```python
BIG = 10_000
model.Minimize(BIG * (Lmax - Lmin) + sum(deviations))
```

This is the optimization logic.

* Primary goal: minimize `Lmax - Lmin` (the range of workloads).
* Secondary goal: minimize the sum of deviations from average.

`BIG` is a weighting trick to create a lexicographic-like priority:

* Because `(Lmax - Lmin)` is multiplied by 10,000, the solver will generally prefer improving the range by 1 over improving deviations by anything less than 10,000.

Given your domain, that’s reasonable: it strongly pushes schedules where everyone’s load is as equal as possible.

**Caveat**: This isn’t a formal lexicographic objective, but with a large enough `BIG` it behaves like one in practice. A true lexicographic objective would require a two-phase solve or dedicated support; OR-Tools CP-SAT typically uses weighted sums like this.

---

## 9) Solve with CP-SAT

```python
solver = cp_model.CpSolver()
solver.parameters.max_time_in_seconds = 10
solver.parameters.num_search_workers = 8

status = solver.Solve(model)
if status not in (cp_model.OPTIMAL, cp_model.FEASIBLE):
    raise RuntimeError("No feasible schedule found")
```

* `max_time_in_seconds = 10`: stop after 10 seconds even if not proven optimal.
* `num_search_workers = 8`: parallel search.

Statuses:

* `OPTIMAL`: proven best objective value
* `FEASIBLE`: found a valid schedule, not proven optimal (often fine here)
* otherwise: no schedule meets constraints.

---

## 10) Extract the schedule from variables

```python
schedule = {}
for d in dates:
    for op in operators:
        var = x.get((op, d))
        if var is not None and solver.Value(var) == 1:
            schedule[d] = op
            break
return schedule
```

For each date, you scan operators and find which assignment variable is 1. Because of `sum(todays)==1`, there will be exactly one.

Return `{date: op}`.

---

## What OR-Tools is “deciding” vs “computing”

**Deciding (searching):**

* which `x[(op,d)]` booleans are 1

**Computed from decisions (by constraints):**

* `loads[op]`
* `Lmax`, `Lmin`
* `dev_{op}`

**Optimized:**

* range `Lmax - Lmin` (strong priority)
* total deviation from `avg`

---

## Two practical observations (worth knowing)

1. **`avg = len(dates)//len(operators)` is a floor**, which can bias deviations.
   For 24 dates and 10 operators, avg=2; a load of 3 has dev=1, load of 2 has dev=0, load of

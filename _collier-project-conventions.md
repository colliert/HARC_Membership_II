# COLLIER_PROJECT_CONVENTIONS.md`

---

# Collier Project Conventions

## 1. Purpose

This document defines the architectural, structural, and governance standards for all Collier analytical projects.

The objectives are:

* Structural consistency across projects
* Reproducibility of results
* Separation of concerns
* Database-first design discipline
* Data governance and repository hygiene

All new projects created from the template must conform to these conventions unless explicitly justified otherwise.

---

## 2. Architectural Model

All projects follow a layered analytical architecture:

[
\text{External Sources} \rightarrow
\text{Ingest Layer} \rightarrow
\text{Analytic Layer} \rightarrow
\text{Domain Logic} \rightarrow
\text{Application Layer} \rightarrow
\text{Results / Persistence}
]

Each layer has distinct responsibilities and must not bleed into adjacent layers.

---

## 3. Repository Structure

```
project/
├── app/
├── domain/
├── db/
│   ├── schema/
│   ├── ingest/
│   ├── analytic/
│   └── results/
├── data/
│   ├── raw/
│   ├── staging/
│   ├── processed/
│   └── samples/
├── scripts/
├── notebooks/
├── logs/
├── tests/
├── pyproject.toml
├── Makefile
├── .gitignore
└── README.md
```

---

## 4. Layer Responsibilities

### 4.1 `app/` — Orchestration Layer

* CLI parsing
* Configuration
* Logging
* Workflow coordination
* Database connectivity

Prohibited:

* Heavy computation
* Embedded SQL DDL
* Business rules

---

### 4.2 `domain/` — Pure Logic Layer

* Mathematical computation
* Business rules
* Validation
* Algorithm implementation

Rules:

* No direct database access
* No file system writes
* No external API calls

This layer must be testable in isolation.

---

### 4.3 `db/schema/` — Authoritative DDL

* Tables
* Constraints
* Indexes
* Types
* Domains

Rules:

* No bulk INSERT data
* No backup dumps
* Structure only

---

### 4.4 `db/ingest/` — Raw to Canonical

* Load external data
* Normalize
* Transform
* Clean

This layer handles external data volatility.

---

### 4.5 `db/analytic/` — Semantic Layer

* Views
* Materialized views
* Aggregations
* Derived metrics

The analytic layer defines the meaning of data.

Where possible, computation should occur here rather than in Python.

---

### 4.6 `db/results/` — Persistence of Outputs

* Run metadata
* Model outputs
* Derived result tables
* Audit records

All computational runs must be reproducible and auditable.

---

## 5. Data Governance

### 5.1 Raw Data

* Never committed to Git
* Stored in `data/raw/`
* Regenerable from authoritative source

### 5.2 Staging and Processed Data

* Never committed
* Regenerable

### 5.3 Samples

* Small, sanitized datasets may be committed in `data/samples/`

---

## 6. Git Discipline

### 6.1 Repository Hygiene

The following must never be committed:

* Backup dumps (`_Backups/`)
* Large `.dat` files
* Bulk SQL dumps
* Log files
* Virtual environments

### 6.2 Commit Standards

Commits should be:

* Atomic
* Descriptive
* Layer-specific when possible

Example:

```
Add analytic view for monthly returns
```

Not:

```
updates
```

---

## 7. Naming Conventions

### 7.1 Schemas

* `ingest`
* `analytic`
* `results`

### 7.2 Tables

```
t_<entity_name>
```

Example:

```
t_portfolio_account
```

### 7.3 Views

```
v_<semantic_name>
```

Example:

```
v_monthly_returns
```

### 7.4 Functions

```
f_<action_description>
```

---

## 8. Reproducibility Requirement

Every project must satisfy:

* All results reproducible from raw sources
* No hidden manual steps
* No opaque data dependencies

If a project cannot be reproduced from external inputs and committed logic, it violates convention.

---

## 9. Template Integrity

The template repository itself must:

* Contain no project-specific data
* Contain no domain-specific logic
* Contain only architectural scaffolding

---

## 10. Philosophy

The Collier Project pattern emphasizes:

* Structure before code
* Database as semantic authority
* Domain logic isolation
* Auditability
* Long-term maintainability

This is infrastructure, not experimentation.


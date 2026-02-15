# Collier Analytical Project Template

## Standardized architecture for database-first analytical systems.

Layers:
External → Ingest → Analytic → Domain → Application → Results

Raw external data and backup files are excluded from version control.
All outputs must be reproducible.

## What we are trying to accomplish:

### Enforce:
- Separation of concerns
- Reproducibility
- Database-first thinking
- Domain isolation
- Governance discipline

### While preventing:
- Backup dumps in repo
- Massive raw data commits
- Layer confusion
- Structural drift

### This Is the Core Idea:
- The template is not just about directories.
- It encodes:
-- A layered analytical systems philosophy.
-- That philosophy is what you want to reuse across projects.

# Celestial Bodies Database

A PostgreSQL relational database project built around galaxies, stars, planets, moons and black holes. The repository contains a complete `pg_dump` export plus a small set of reusable SQL queries.

## Schema

- `galaxy` — galaxy metadata and distance information.
- `star` — stars associated with galaxies.
- `planet` — planets associated with stars.
- `moon` — moons associated with planets.
- `blackhole` — black-hole records.

The dump includes primary keys, unique name constraints, sequences, foreign-key relationships and sample data.

## Restore locally

Create a PostgreSQL database, then load the dump:

```bash
createdb universe
psql -d universe -f universe.sql
```

If the dump is being restored as a superuser, note that it contains database ownership and `DROP DATABASE`/`CREATE DATABASE` statements from the original `pg_dump`. For a safer development workflow, remove those database-level statements and restore into an already-created database.

## Example queries

See `queries.sql` for relationship-focused examples covering galaxy → star → planet → moon traversal, counts, and orphan checks.

## What this demonstrates

This project is useful as a compact demonstration of relational modelling, primary/foreign keys, uniqueness constraints, sequences, joins and PostgreSQL dump/restore workflows.

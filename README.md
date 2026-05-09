# Hotel System - PostgreSQL Database

Group database project for the hotel system.

## Contents

- `entregables/estructura-base-datos/db-structure 1/`: executable PostgreSQL and Liquibase database structure.
- `docs/architecture/model-data/es/`: analysis source documents in Spanish.
- `docs/architecture/model-data/en/`: analysis source documents in English.
- `docs/entrega-base-datos/`: formal delivery documents aligned with the HUs.
- `.github/workflows/validate-changelog.yml`: automated Liquibase changelog validation.
- `.gitignore`: excludes local, temporary, and internal coordination files.

## Delivery Traceability

The official checklist for what must be uploaded is:

```text
docs/entrega-base-datos/que_subir_y_que_no_subir.md
```

The HU backlog is:

```text
docs/entrega-base-datos/Historias de usuario.md
```

Main mapping:

| Area | HU |
|---|---|
| Planning, tracking, responsibilities and board CSV | HU-02 |
| Domain analysis and model-data sources | HU-03 |
| ADR decisions | HU-04 |
| GitHub changelog validation workflow | HU-05 |
| Docker and Liquibase execution | HU-06 and HU-07 |
| DDL, DML, DCL and TCL scripts | HU-08 to HU-22 |
| Smoke test, permission test, load script, execution guide and load order | HU-23 |

## Liquibase Entry Point

```text
entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.yaml
```

The master changelog includes:

```text
01_ddl/changelog-master.yaml
02_dml/changelog-master.yaml
03_dcl/changelog-master.yaml
04_tcl/changelog-master.yaml
```

Table changelogs are grouped by domain:

```text
configuration/changelog.yaml
security/changelog.yaml
distribution/changelog.yaml
service_delivery/changelog.yaml
inventory/changelog.yaml
billing/changelog.yaml
notification/changelog.yaml
maintenance/changelog.yaml
```

## Branch Flow

Work should move through:

```text
dev -> qa -> main
```

No one should work directly on `main`.

## What Not To Upload

Local notes, temporary files, and private support material are excluded by `.gitignore`:

```text
_no_subir/
```

The `_no_subir/` folder keeps support material that is not part of the HU delivery, such as previous architecture notes, the planning landing, duplicate coordination docs, or auxiliary README files.

Formal project documents that must be uploaded belong in `docs/entrega-base-datos/`.

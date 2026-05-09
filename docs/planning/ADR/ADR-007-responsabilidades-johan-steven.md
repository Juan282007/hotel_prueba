# ADR-007 - Responsabilidades de JohanStevenRodriguezCharr

## Estado

Aceptada.

## Contexto

JohanStevenRodriguezCharr concentra el trabajo de datos y security inicial, y ademas ejecuta los merges a `qa` y `main` despues de la aprobacion correspondiente.

## Decision

JohanStevenRodriguezCharr es responsable de HU-15, HU-16, HU-17, HU-18 y HU-19.

| HU | Rama a `dev` | Archivos principales | Liquibase `author` |
|---|---|---|---|
| HU-15 | `feature/HU-15-inserts-configuration-security` | `02_dml/00_inserts/001_configuration.sql`, `02_dml/00_inserts/002_security.sql`, `02_dml/00_inserts/changelog.yaml` | `JohanStevenRodriguezCharr` |
| HU-16 | `feature/HU-16-inserts-operacion` | `02_dml/00_inserts/003_distribution.sql`, `02_dml/00_inserts/004_service_delivery.sql`, `02_dml/00_inserts/changelog.yaml` | `JohanStevenRodriguezCharr` |
| HU-17 | `feature/HU-17-inserts-administrativos` | `02_dml/00_inserts/005_inventory.sql`, `02_dml/00_inserts/006_billing.sql`, `02_dml/00_inserts/changelog.yaml` | `JohanStevenRodriguezCharr` |
| HU-18 | `feature/HU-18-inserts-comunicacion-maintenance` | `02_dml/00_inserts/007_notification.sql`, `02_dml/00_inserts/008_maintenance.sql`, `02_dml/00_inserts/changelog.yaml` | `JohanStevenRodriguezCharr` |
| HU-19 | `feature/HU-19-usuario-evaluacion` | `03_dcl/00_roles/001_roles.sql`, `03_dcl/00_roles/changelog.yaml` | `JohanStevenRodriguezCharr` |

Las carpetas DML complementarias `02_dml/01_updates/`, `02_dml/02_deletes/`, `02_dml/03_upserts/` y `02_dml/04_patches/` quedan asociadas a HU-15 a HU-18 porque alimentan el mismo bloque de datos y son incluidas desde `02_dml/changelog-master.yaml`.

## Flujo de PR

En `dev`, JohanStevenRodriguezCharr crea la rama exacta definida para cada HU, sube sus cambios y solicita revision a JhonCamiloSuazaSanchez. Despues de la aprobacion, el responsable de la HU puede hacer merge a `dev`.

En `qa`, JohanStevenRodriguezCharr crea la rama hija exacta con prefijo `qa/` desde `qa`, hace `git merge origin/dev`, la sube y abre PR con base `qa`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

En `main`, JohanStevenRodriguezCharr crea la rama hija exacta con prefijo `main/` desde `main`, hace `git merge origin/qa`, la sube y abre PR con base `main`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

## Consecuencias

JohanStevenRodriguezCharr puede hacer merge a `qa` y `main`, pero solo despues de que el PR tenga la aprobacion definida. En changelogs DML y roles, cada changeSet trabajado debe quedar con `author: JohanStevenRodriguezCharr`.

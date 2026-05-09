# ADR-005 - Responsabilidades de juanPabloGomezPerdomo

## Estado

Aceptada.

## Contexto

juanPabloGomezPerdomo tiene rol de QA del equipo, pero no puede aprobar sus propios PRs. Se define una excepcion para mantener la regla de revision cruzada.

## Decision

juanPabloGomezPerdomo es responsable de HU-04, HU-13, HU-20, HU-21 y HU-23.

| HU | Rama a `dev` | Archivos principales | Liquibase `author` |
|---|---|---|---|
| HU-04 | `feature/HU-04-adr` | `docs/entrega-base-datos/ADR/` | No aplica |
| HU-13 | `feature/HU-13-objetos-consulta` | `01_ddl/04_views/`, `01_ddl/05_materialized_views/`, `01_ddl/06_functions/` | `juanPabloGomezPerdomo` |
| HU-20 | `feature/HU-20-grants` | `03_dcl/01_grants/001_grants.sql`, `03_dcl/01_grants/changelog.yaml` | `juanPabloGomezPerdomo` |
| HU-21 | `feature/HU-21-rls-policies` | `03_dcl/02_policies/001_rls_policies.sql`, `03_dcl/02_policies/changelog.yaml` | `juanPabloGomezPerdomo` |
| HU-23 | `feature/HU-23-smoke-test` | `scripts/smoke-test.sql`, `scripts/ariel-ddl-permission-test.sql`, `scripts/load-postgres.ps1`, `guia_ejecucion_y_validacion.md`, `orden_carga.md`, `seguimientos.md` | No aplica |

## Flujo de PR

En `dev`, juanPabloGomezPerdomo crea la rama exacta definida para cada HU, sube sus cambios y solicita revision a JohanStevenRodriguezCharr. Despues de la aprobacion, el responsable de la HU puede hacer merge a `dev`.

En `qa`, juanPabloGomezPerdomo crea la rama hija exacta con prefijo `qa/` desde `qa`, hace `git merge origin/dev`, la sube y abre PR con base `qa`. Como juanPabloGomezPerdomo es el autor, aprueba JohanStevenRodriguezCharr y mergea JohanStevenRodriguezCharr.

En `main`, juanPabloGomezPerdomo crea la rama hija exacta con prefijo `main/` desde `main`, hace `git merge origin/qa`, la sube y abre PR con base `main`. Como juanPabloGomezPerdomo es el autor, aprueba JohanStevenRodriguezCharr y mergea JohanStevenRodriguezCharr.

## Consecuencias

juanPabloGomezPerdomo aprueba los PRs de `qa` y `main` del resto del equipo. Sus propios PRs de `qa` y `main` los aprueba JohanStevenRodriguezCharr.

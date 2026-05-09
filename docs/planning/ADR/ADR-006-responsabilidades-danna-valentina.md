# ADR-006 - Responsabilidades de DannaValentinaBarrios

## Estado

Aceptada.

## Contexto

DannaValentinaBarrios concentra el trabajo principal de DDL. La estructura de tablas queda separada por dominio y por entidad, con changelog por dominio.

## Decision

DannaValentinaBarrios es responsable de HU-08, HU-09, HU-10, HU-11, HU-12 y HU-14.

| HU | Rama a `dev` | Archivos principales | Liquibase `author` |
|---|---|---|---|
| HU-08 | `feature/HU-08-ddl-base` | `01_ddl/00_extensions/`, `01_ddl/01_schemas/`, `01_ddl/02_types/` | `DannaValentinaBarrios` |
| HU-09 | `feature/HU-09-tablas-configuration-security` | `01_ddl/03_tables/configuration/`, `01_ddl/03_tables/security/`, rollbacks espejo | `DannaValentinaBarrios` |
| HU-10 | `feature/HU-10-tablas-distribution-prestacion` | `01_ddl/03_tables/distribution/`, `01_ddl/03_tables/service_delivery/`, rollbacks espejo | `DannaValentinaBarrios` |
| HU-11 | `feature/HU-11-tablas-inventory-billing` | `01_ddl/03_tables/inventory/`, `01_ddl/03_tables/billing/`, rollbacks espejo | `DannaValentinaBarrios` |
| HU-12 | `feature/HU-12-tablas-notification-maintenance` | `01_ddl/03_tables/notification/`, `01_ddl/03_tables/maintenance/`, rollbacks espejo | `DannaValentinaBarrios` |
| HU-14 | `feature/HU-14-reglas-indices` | `01_ddl/07_procedures/`, `01_ddl/08_triggers/`, `01_ddl/09_indexes/` | `DannaValentinaBarrios` |

## Flujo de PR

En `dev`, DannaValentinaBarrios crea la rama exacta definida para cada HU, sube sus cambios y solicita revision a juanPabloGomezPerdomo. Despues de la aprobacion, el responsable de la HU puede hacer merge a `dev`.

En `qa`, DannaValentinaBarrios crea la rama hija exacta con prefijo `qa/` desde `qa`, hace `git merge origin/dev`, la sube y abre PR con base `qa`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

En `main`, DannaValentinaBarrios crea la rama hija exacta con prefijo `main/` desde `main`, hace `git merge origin/qa`, la sube y abre PR con base `main`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

## Consecuencias

Cada changeSet de DDL base, tablas, procedures, triggers e indexes trabajado por DannaValentinaBarrios debe quedar con `author: DannaValentinaBarrios`.

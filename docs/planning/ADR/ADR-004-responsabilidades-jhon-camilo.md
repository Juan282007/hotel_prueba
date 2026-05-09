# ADR-004 - Responsabilidades de JhonCamiloSuazaSanchez

## Estado

Aceptada.

## Contexto

El equipo necesita que cada integrante tenga claro que archivos sube, que ramas crea y quien aprueba sus PRs en `dev`, `qa` y `main`.

## Decision

JhonCamiloSuazaSanchez es responsable de HU-01, HU-02, HU-03, HU-05, HU-06, HU-07 y HU-22.

| HU | Rama a `dev` | Archivos principales | Liquibase `author` |
|---|---|---|---|
| HU-01 | `feature/HU-01-flujo-ramas` | `README.md`, `docs/`, `entregables/` | No aplica |
| HU-02 | `feature/HU-02-plan-seguimiento` | `Historias de usuario.md`, `plan_trabajo_inicial.md`, `seguimientos.md`, `tablero_responsabilidades.md`, `docs/entrega-base-datos/responsabilidades_individuales/`, `tablero_azure_trello_clickup.csv`, `que_subir_y_que_no_subir.md` | No aplica |
| HU-03 | `feature/HU-03-dominios-funcionales` | `docs/entrega-base-datos/analisis_dominios.md`, `docs/architecture/model-data/es/`, `docs/architecture/model-data/en/` | No aplica |
| HU-05 | `feature/HU-05-automatizacion` | `.github/workflows/validate-changelog.yml`, `.gitignore` | No aplica |
| HU-06 | `feature/HU-06-docker-postgres` | `entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml` | No aplica |
| HU-07 | `feature/HU-07-liquibase` | `liquibase.properties`, `changelog/changelog-master.yaml`, `changelog/changelog-master.sql` | No aplica |
| HU-22 | `feature/HU-22-tcl` | `04_tcl/changelog-master.yaml`, `04_tcl/00_transaction_blocks/`, `04_tcl/01_manual_recoveries/` | `JhonCamiloSuazaSanchez` |

## Flujo de PR

En `dev`, JhonCamiloSuazaSanchez crea la rama exacta definida para cada HU, sube sus cambios y solicita revision a DannaValentinaBarrios. Despues de la aprobacion, el responsable de la HU puede hacer merge a `dev`.

En `qa`, JhonCamiloSuazaSanchez crea la rama hija exacta con prefijo `qa/` desde `qa`, hace `git merge origin/dev`, la sube y abre PR con base `qa`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

En `main`, JhonCamiloSuazaSanchez crea la rama hija exacta con prefijo `main/` desde `main`, hace `git merge origin/qa`, la sube y abre PR con base `main`. Aprueba juanPabloGomezPerdomo y mergea JohanStevenRodriguezCharr.

## Consecuencias

JhonCamiloSuazaSanchez no aprueba sus propios PRs. En changelogs de TCL, cada changeSet trabajado debe quedar con `author: JhonCamiloSuazaSanchez`.

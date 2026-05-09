# Guia individual - JhonCamiloSuazaSanchez

## Regla rapida

Tus HUs son HU-01, HU-02, HU-03, HU-05, HU-06, HU-07 y HU-22. En `dev` te aprueba JohanStevenRodriguezChar. En `qa` y `main` aprueba JohanStevenRodriguezChar y hace merge JohanStevenRodriguezCharr.

Tambien apruebas en `dev` las HUs de JohanStevenRodriguezCharr: HU-15, HU-16, HU-17, HU-18 y HU-19.

Antes de crear cualquier rama, baja cambios de la rama padre. Si un companero ya hizo merge antes que tu, ese `git pull` trae sus cambios y evita conflictos.

## Ramas exactas

| HU | Titulo | Rama desde `dev` | Rama hija desde `qa` | Rama hija desde `main` |
|---|---|---|---|---|
| HU-01 | Definir flujo de ramas | `feature/HU-01-flujo-ramas` | `qa/HU-01-flujo-ramas` | `main/HU-01-flujo-ramas` |
| HU-02 | Consolidar plan y seguimiento | `feature/HU-02-plan-seguimiento` | `qa/HU-02-plan-seguimiento` | `main/HU-02-plan-seguimiento` |
| HU-03 | Confirmar dominios funcionales | `feature/HU-03-dominios-funcionales` | `qa/HU-03-dominios-funcionales` | `main/HU-03-dominios-funcionales` |
| HU-05 | Preparar automatizacion futura | `feature/HU-05-automatizacion` | `qa/HU-05-automatizacion` | `main/HU-05-automatizacion` |
| HU-06 | Levantar PostgreSQL con Docker | `feature/HU-06-docker-postgres` | `qa/HU-06-docker-postgres` | `main/HU-06-docker-postgres` |
| HU-07 | Configurar ejecucion Liquibase | `feature/HU-07-liquibase` | `qa/HU-07-liquibase` | `main/HU-07-liquibase` |
| HU-22 | Registrar bloques transaccionales | `feature/HU-22-tcl` | `qa/HU-22-tcl` | `main/HU-22-tcl` |

## Aprobaciones y merges

| Etapa | Rama que tu subes | Base del PR | Compare del PR | Aprueba | Hace merge |
|---|---|---|---|---|---|
| HU-01 a `dev` | `feature/HU-01-flujo-ramas` | `dev` | `feature/HU-01-flujo-ramas` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-01 a `qa` | `qa/HU-01-flujo-ramas` | `qa` | `qa/HU-01-flujo-ramas` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-01 a `main` | `main/HU-01-flujo-ramas` | `main` | `main/HU-01-flujo-ramas` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-02 a `dev` | `feature/HU-02-plan-seguimiento` | `dev` | `feature/HU-02-plan-seguimiento` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-02 a `qa` | `qa/HU-02-plan-seguimiento` | `qa` | `qa/HU-02-plan-seguimiento` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-02 a `main` | `main/HU-02-plan-seguimiento` | `main` | `main/HU-02-plan-seguimiento` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-03 a `dev` | `feature/HU-03-dominios-funcionales` | `dev` | `feature/HU-03-dominios-funcionales` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-03 a `qa` | `qa/HU-03-dominios-funcionales` | `qa` | `qa/HU-03-dominios-funcionales` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-03 a `main` | `main/HU-03-dominios-funcionales` | `main` | `main/HU-03-dominios-funcionales` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-05 a `dev` | `feature/HU-05-automatizacion` | `dev` | `feature/HU-05-automatizacion` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-05 a `qa` | `qa/HU-05-automatizacion` | `qa` | `qa/HU-05-automatizacion` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-05 a `main` | `main/HU-05-automatizacion` | `main` | `main/HU-05-automatizacion` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-06 a `dev` | `feature/HU-06-docker-postgres` | `dev` | `feature/HU-06-docker-postgres` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-06 a `qa` | `qa/HU-06-docker-postgres` | `qa` | `qa/HU-06-docker-postgres` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-06 a `main` | `main/HU-06-docker-postgres` | `main` | `main/HU-06-docker-postgres` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-07 a `dev` | `feature/HU-07-liquibase` | `dev` | `feature/HU-07-liquibase` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-07 a `qa` | `qa/HU-07-liquibase` | `qa` | `qa/HU-07-liquibase` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-07 a `main` | `main/HU-07-liquibase` | `main` | `main/HU-07-liquibase` | JohanStevenRodriguezChar | JohanStevenRodriguezCharr |
| HU-22 a `dev` | `feature/HU-22-tcl` | `dev` | `feature/HU-22-tcl` | JohanStevenRodriguezChar | JhonCamiloSuazaSanchez despues de aprobacion |
| HU-22 a `qa` | `qa/HU-22-tcl` | `qa` | `qa/HU-22-tcl` | juanPabloGomezPerdomo | JohanStevenRodriguezCharr |
| HU-22 a `main` | `main/HU-22-tcl` | `main` | `main/HU-22-tcl` | juanPabloGomezPerdomo | JohanStevenRodriguezCharr |

## Archivos que debes subir

### HU-01

```text
README.md
docs/
entregables/
```

Este `README.md` raiz lo subes tu en HU-01.

### HU-02

```text
docs/entrega-base-datos/Historias de usuario.md
docs/entrega-base-datos/plan_trabajo_inicial.md
docs/entrega-base-datos/seguimientos.md
docs/entrega-base-datos/tablero_responsabilidades.md
docs/entrega-base-datos/responsabilidades_individuales/
docs/entrega-base-datos/tablero_azure_trello_clickup.csv
docs/entrega-base-datos/que_subir_y_que_no_subir.md
```

### HU-03

```text
docs/entrega-base-datos/analisis_dominios.md
docs/architecture/model-data/es/
docs/architecture/model-data/en/
```

### HU-05

```text
.github/workflows/validate-changelog.yml
.gitignore
```

### HU-06

```text
entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml
```

### HU-07

```text
entregables/estructura-base-datos/db-structure 1/liquibase.properties
entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.sql
```

### HU-22

```text
entregables/estructura-base-datos/db-structure 1/04_tcl/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/04_tcl/00_transaction_blocks/001_safe_load.sql
entregables/estructura-base-datos/db-structure 1/04_tcl/00_transaction_blocks/changelog.yaml
entregables/estructura-base-datos/db-structure 1/04_tcl/01_manual_recoveries/001_refresh_materialized_views.sql
entregables/estructura-base-datos/db-structure 1/04_tcl/01_manual_recoveries/changelog.yaml
```

En los changelogs de HU-22 el `author` debe ser:

```yaml
author: JhonCamiloSuazaSanchez
```

## Comandos exactos por etapa

### Subir a dev

| HU | Comandos |
|---|---|
| HU-01 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-01-flujo-ramas`<br>`git add README.md docs/ entregables/`<br>`git commit -m "HU-01: definir flujo de ramas"`<br>`git push origin feature/HU-01-flujo-ramas` |
| HU-02 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-02-plan-seguimiento`<br>`git add "docs/entrega-base-datos/Historias de usuario.md" docs/entrega-base-datos/plan_trabajo_inicial.md docs/entrega-base-datos/seguimientos.md docs/entrega-base-datos/tablero_responsabilidades.md docs/entrega-base-datos/responsabilidades_individuales/ docs/entrega-base-datos/tablero_azure_trello_clickup.csv docs/entrega-base-datos/que_subir_y_que_no_subir.md`<br>`git commit -m "HU-02: consolidar plan y seguimiento"`<br>`git push origin feature/HU-02-plan-seguimiento` |
| HU-03 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-03-dominios-funcionales`<br>`git add docs/entrega-base-datos/analisis_dominios.md docs/architecture/model-data/es/ docs/architecture/model-data/en/`<br>`git commit -m "HU-03: confirmar dominios funcionales"`<br>`git push origin feature/HU-03-dominios-funcionales` |
| HU-05 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-05-automatizacion`<br>`git add .github/workflows/validate-changelog.yml .gitignore`<br>`git commit -m "HU-05: agregar automatizacion"`<br>`git push origin feature/HU-05-automatizacion` |
| HU-06 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-06-docker-postgres`<br>`git add "entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml"`<br>`git commit -m "HU-06: configurar postgres con docker"`<br>`git push origin feature/HU-06-docker-postgres` |
| HU-07 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-07-liquibase`<br>`git add "entregables/estructura-base-datos/db-structure 1/liquibase.properties" "entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.yaml" "entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.sql"`<br>`git commit -m "HU-07: configurar liquibase"`<br>`git push origin feature/HU-07-liquibase` |
| HU-22 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-22-tcl`<br>`git add "entregables/estructura-base-datos/db-structure 1/04_tcl/"`<br>`git commit -m "HU-22: registrar bloques transaccionales"`<br>`git push origin feature/HU-22-tcl` |

Despues de que el PR quede aprobado y mergeado a `dev`, baja cambios:

```bash
git checkout dev
git pull origin dev
```

### Subir a qa

| HU | Comandos |
|---|---|
| HU-01 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-01-flujo-ramas`<br>`git merge origin/dev`<br>`git push origin qa/HU-01-flujo-ramas` |
| HU-02 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-02-plan-seguimiento`<br>`git merge origin/dev`<br>`git push origin qa/HU-02-plan-seguimiento` |
| HU-03 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-03-dominios-funcionales`<br>`git merge origin/dev`<br>`git push origin qa/HU-03-dominios-funcionales` |
| HU-05 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-05-automatizacion`<br>`git merge origin/dev`<br>`git push origin qa/HU-05-automatizacion` |
| HU-06 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-06-docker-postgres`<br>`git merge origin/dev`<br>`git push origin qa/HU-06-docker-postgres` |
| HU-07 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-07-liquibase`<br>`git merge origin/dev`<br>`git push origin qa/HU-07-liquibase` |
| HU-22 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-22-tcl`<br>`git merge origin/dev`<br>`git push origin qa/HU-22-tcl` |

Despues de que JohanStevenRodriguezCharr haga merge a `qa`, baja cambios:

```bash
git checkout qa
git pull origin qa
```

### Subir a main

| HU | Comandos |
|---|---|
| HU-01 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-01-flujo-ramas`<br>`git merge origin/qa`<br>`git push origin main/HU-01-flujo-ramas` |
| HU-02 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-02-plan-seguimiento`<br>`git merge origin/qa`<br>`git push origin main/HU-02-plan-seguimiento` |
| HU-03 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-03-dominios-funcionales`<br>`git merge origin/qa`<br>`git push origin main/HU-03-dominios-funcionales` |
| HU-05 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-05-automatizacion`<br>`git merge origin/qa`<br>`git push origin main/HU-05-automatizacion` |
| HU-06 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-06-docker-postgres`<br>`git merge origin/qa`<br>`git push origin main/HU-06-docker-postgres` |
| HU-07 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-07-liquibase`<br>`git merge origin/qa`<br>`git push origin main/HU-07-liquibase` |
| HU-22 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-22-tcl`<br>`git merge origin/qa`<br>`git push origin main/HU-22-tcl` |

Despues de que JohanStevenRodriguezCharr haga merge a `main`, baja cambios:

```bash
git checkout main
git pull origin main
```

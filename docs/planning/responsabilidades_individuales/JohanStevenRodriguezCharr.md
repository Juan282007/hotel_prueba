# Guia individual - JohanStevenRodriguezCharr

## Regla rapida

Tus HUs son HU-15, HU-16, HU-17, HU-18 y HU-19. En `dev` te aprueba JhonCamiloSuazaSanchez. En `qa` y `main` aprueba JhonCamiloSuazaSanchez y haces merge tu, JohanStevenRodriguezCharr, despues de la aprobacion.

Tambien apruebas en `dev` las HUs de JhonCamiloSuazaSanchez: HU-04, HU-13, HU-20, HU-21 y HU-23. Apruebas tambien los PRs de JhonCamiloSuazaSanchez a `qa` y `main`, porque nadie puede aprobar su propio PR.

Ademas haces merge en `qa` y `main` de todos los PRs del equipo despues de que tengan aprobacion.

Antes de crear cualquier rama, baja cambios de la rama padre. Si un companero ya hizo merge antes que tu, ese `git pull` trae sus cambios y evita conflictos.

El nombre correcto en este proyecto es `JohanStevenRodriguezCharr`, sin `y` al final.

## Ramas exactas

| HU | Titulo | Rama desde `dev` | Rama hija desde `qa` | Rama hija desde `main` |
|---|---|---|---|---|
| HU-15 | Cargar datos de parametrizacion y seguridad | `feature/HU-15-inserts-parametrizacion-seguridad` | `qa/HU-15-inserts-parametrizacion-seguridad` | `main/HU-15-inserts-parametrizacion-seguridad` |
| HU-16 | Cargar datos de operacion hotelera | `feature/HU-16-inserts-operacion` | `qa/HU-16-inserts-operacion` | `main/HU-16-inserts-operacion` |
| HU-17 | Cargar datos administrativos | `feature/HU-17-inserts-administrativos` | `qa/HU-17-inserts-administrativos` | `main/HU-17-inserts-administrativos` |
| HU-18 | Cargar datos de comunicacion y mantenimiento | `feature/HU-18-inserts-comunicacion-mantenimiento` | `qa/HU-18-inserts-comunicacion-mantenimiento` | `main/HU-18-inserts-comunicacion-mantenimiento` |
| HU-19 | Configurar usuario de evaluacion | `feature/HU-19-usuario-evaluacion` | `qa/HU-19-usuario-evaluacion` | `main/HU-19-usuario-evaluacion` |

## Aprobaciones y merges

| Etapa | Rama que tu subes | Base del PR | Compare del PR | Aprueba | Hace merge |
|---|---|---|---|---|---|
| HU-15 a `dev` | `feature/HU-15-inserts-parametrizacion-seguridad` | `dev` | `feature/HU-15-inserts-parametrizacion-seguridad` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr despues de aprobacion |
| HU-15 a `qa` | `qa/HU-15-inserts-parametrizacion-seguridad` | `qa` | `qa/HU-15-inserts-parametrizacion-seguridad` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-15 a `main` | `main/HU-15-inserts-parametrizacion-seguridad` | `main` | `main/HU-15-inserts-parametrizacion-seguridad` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-16 a `dev` | `feature/HU-16-inserts-operacion` | `dev` | `feature/HU-16-inserts-operacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr despues de aprobacion |
| HU-16 a `qa` | `qa/HU-16-inserts-operacion` | `qa` | `qa/HU-16-inserts-operacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-16 a `main` | `main/HU-16-inserts-operacion` | `main` | `main/HU-16-inserts-operacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-17 a `dev` | `feature/HU-17-inserts-administrativos` | `dev` | `feature/HU-17-inserts-administrativos` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr despues de aprobacion |
| HU-17 a `qa` | `qa/HU-17-inserts-administrativos` | `qa` | `qa/HU-17-inserts-administrativos` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-17 a `main` | `main/HU-17-inserts-administrativos` | `main` | `main/HU-17-inserts-administrativos` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-18 a `dev` | `feature/HU-18-inserts-comunicacion-mantenimiento` | `dev` | `feature/HU-18-inserts-comunicacion-mantenimiento` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr despues de aprobacion |
| HU-18 a `qa` | `qa/HU-18-inserts-comunicacion-mantenimiento` | `qa` | `qa/HU-18-inserts-comunicacion-mantenimiento` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-18 a `main` | `main/HU-18-inserts-comunicacion-mantenimiento` | `main` | `main/HU-18-inserts-comunicacion-mantenimiento` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-19 a `dev` | `feature/HU-19-usuario-evaluacion` | `dev` | `feature/HU-19-usuario-evaluacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr despues de aprobacion |
| HU-19 a `qa` | `qa/HU-19-usuario-evaluacion` | `qa` | `qa/HU-19-usuario-evaluacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |
| HU-19 a `main` | `main/HU-19-usuario-evaluacion` | `main` | `main/HU-19-usuario-evaluacion` | JhonCamiloSuazaSanchez | JohanStevenRodriguezCharr |

## Archivos que debes subir

### HU-15

```text
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/001_configuration.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/002_security.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml
```

### HU-16

```text
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/003_distribution.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/004_service_delivery.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml
```

### HU-17

```text
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/005_inventory.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/006_billing.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml
```

### HU-18

```text
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/007_notification.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/008_maintenance.sql
entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml
```

### DML complementario HU-15 a HU-18

```text
entregables/estructura-base-datos/db-structure 1/02_dml/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/02_dml/01_updates/
entregables/estructura-base-datos/db-structure 1/02_dml/02_deletes/
entregables/estructura-base-datos/db-structure 1/02_dml/03_upserts/
entregables/estructura-base-datos/db-structure 1/02_dml/04_patches/
```

### HU-19

```text
entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/001_roles.sql
entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/changelog.yaml
```

En tus changelogs el `author` debe ser:

```yaml
author: JohanStevenRodriguezCharr
```

## Comandos exactos por etapa

### Subir a dev

| HU | Comandos |
|---|---|
| HU-15 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-15-inserts-parametrizacion-seguridad`<br>`git add "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/001_configuration.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/002_security.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml"`<br>`git commit -m "HU-15: cargar datos de parametrizacion y seguridad"`<br>`git push origin feature/HU-15-inserts-parametrizacion-seguridad` |
| HU-16 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-16-inserts-operacion`<br>`git add "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/003_distribution.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/004_service_delivery.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml"`<br>`git commit -m "HU-16: cargar datos de operacion hotelera"`<br>`git push origin feature/HU-16-inserts-operacion` |
| HU-17 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-17-inserts-administrativos`<br>`git add "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/005_inventory.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/006_billing.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml"`<br>`git commit -m "HU-17: cargar datos administrativos"`<br>`git push origin feature/HU-17-inserts-administrativos` |
| HU-18 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-18-inserts-comunicacion-mantenimiento`<br>`git add "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/007_notification.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/008_maintenance.sql" "entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/changelog.yaml"`<br>`git commit -m "HU-18: cargar datos de comunicacion y mantenimiento"`<br>`git push origin feature/HU-18-inserts-comunicacion-mantenimiento` |
| HU-19 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-19-usuario-evaluacion`<br>`git add "entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/001_roles.sql" "entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/changelog.yaml"`<br>`git commit -m "HU-19: configurar usuario de evaluacion"`<br>`git push origin feature/HU-19-usuario-evaluacion` |

Despues de que el PR quede aprobado y mergeado a `dev`, baja cambios:

```bash
git checkout dev
git pull origin dev
```

### Subir a qa

| HU | Comandos |
|---|---|
| HU-15 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-15-inserts-parametrizacion-seguridad`<br>`git merge origin/dev`<br>`git push origin qa/HU-15-inserts-parametrizacion-seguridad` |
| HU-16 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-16-inserts-operacion`<br>`git merge origin/dev`<br>`git push origin qa/HU-16-inserts-operacion` |
| HU-17 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-17-inserts-administrativos`<br>`git merge origin/dev`<br>`git push origin qa/HU-17-inserts-administrativos` |
| HU-18 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-18-inserts-comunicacion-mantenimiento`<br>`git merge origin/dev`<br>`git push origin qa/HU-18-inserts-comunicacion-mantenimiento` |
| HU-19 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-19-usuario-evaluacion`<br>`git merge origin/dev`<br>`git push origin qa/HU-19-usuario-evaluacion` |

Despues de que tu hagas merge a `qa`, baja cambios:

```bash
git checkout qa
git pull origin qa
```

### Subir a main

| HU | Comandos |
|---|---|
| HU-15 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-15-inserts-parametrizacion-seguridad`<br>`git merge origin/qa`<br>`git push origin main/HU-15-inserts-parametrizacion-seguridad` |
| HU-16 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-16-inserts-operacion`<br>`git merge origin/qa`<br>`git push origin main/HU-16-inserts-operacion` |
| HU-17 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-17-inserts-administrativos`<br>`git merge origin/qa`<br>`git push origin main/HU-17-inserts-administrativos` |
| HU-18 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-18-inserts-comunicacion-mantenimiento`<br>`git merge origin/qa`<br>`git push origin main/HU-18-inserts-comunicacion-mantenimiento` |
| HU-19 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-19-usuario-evaluacion`<br>`git merge origin/qa`<br>`git push origin main/HU-19-usuario-evaluacion` |

Despues de que tu hagas merge a `main`, baja cambios:

```bash
git checkout main
git pull origin main
```

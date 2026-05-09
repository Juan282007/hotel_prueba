# Guia individual - DannaValentinaBarrios

## Regla rapida

Tus HUs son HU-08, HU-09, HU-10, HU-11, HU-12 y HU-14. En `dev` te aprueba Juan Pablo Gomez Perdomo. En `qa` y `main` aprueba Juan Pablo Gomez Perdomo y hace merge Juan Pablo Gomez Perdomo.

Tambien apruebas en `dev` las HUs de Jhon Camilo Suaza Sanchez: HU-01, HU-02, HU-03, HU-05, HU-06, HU-07 y HU-22.

Antes de crear cualquier rama, baja cambios de la rama padre. Si un companero ya hizo merge antes que tu, ese `git pull` trae sus cambios y evita conflictos.

## Ramas exactas

| HU | Titulo | Rama desde `dev` | Rama hija desde `qa` | Rama hija desde `main` |
|---|---|---|---|---|
| HU-08 | Cargar DDL base | `feature/HU-08-ddl-base` | `qa/HU-08-ddl-base` | `main/HU-08-ddl-base` |
| HU-09 | Modelar parametrizacion y seguridad | `feature/HU-09-tablas-parametrizacion-seguridad` | `qa/HU-09-tablas-parametrizacion-seguridad` | `main/HU-09-tablas-parametrizacion-seguridad` |
| HU-10 | Modelar distribucion y prestacion | `feature/HU-10-tablas-distribucion-prestacion` | `qa/HU-10-tablas-distribucion-prestacion` | `main/HU-10-tablas-distribucion-prestacion` |
| HU-11 | Modelar inventario y facturacion | `feature/HU-11-tablas-inventario-facturacion` | `qa/HU-11-tablas-inventario-facturacion` | `main/HU-11-tablas-inventario-facturacion` |
| HU-12 | Modelar notificacion y mantenimiento | `feature/HU-12-tablas-notificacion-mantenimiento` | `qa/HU-12-tablas-notificacion-mantenimiento` | `main/HU-12-tablas-notificacion-mantenimiento` |
| HU-14 | Crear reglas e indices | `feature/HU-14-reglas-indices` | `qa/HU-14-reglas-indices` | `main/HU-14-reglas-indices` |

## Aprobaciones y merges

| Etapa | Rama que tu subes | Base del PR | Compare del PR | Aprueba | Hace merge |
|---|---|---|---|---|---|
| HU-08 a `dev` | `feature/HU-08-ddl-base` | `dev` | `feature/HU-08-ddl-base` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-08 a `qa` | `qa/HU-08-ddl-base` | `qa` | `qa/HU-08-ddl-base` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-08 a `main` | `main/HU-08-ddl-base` | `main` | `main/HU-08-ddl-base` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-09 a `dev` | `feature/HU-09-tablas-parametrizacion-seguridad` | `dev` | `feature/HU-09-tablas-parametrizacion-seguridad` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-09 a `qa` | `qa/HU-09-tablas-parametrizacion-seguridad` | `qa` | `qa/HU-09-tablas-parametrizacion-seguridad` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-09 a `main` | `main/HU-09-tablas-parametrizacion-seguridad` | `main` | `main/HU-09-tablas-parametrizacion-seguridad` | juanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-10 a `dev` | `feature/HU-10-tablas-distribucion-prestacion` | `dev` | `feature/HU-10-tablas-distribucion-prestacion` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-10 a `qa` | `qa/HU-10-tablas-distribucion-prestacion` | `qa` | `qa/HU-10-tablas-distribucion-prestacion` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-10 a `main` | `main/HU-10-tablas-distribucion-prestacion` | `main` | `main/HU-10-tablas-distribucion-prestacion` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-11 a `dev` | `feature/HU-11-tablas-inventario-facturacion` | `dev` | `feature/HU-11-tablas-inventario-facturacion` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-11 a `qa` | `qa/HU-11-tablas-inventario-facturacion` | `qa` | `qa/HU-11-tablas-inventario-facturacion` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-11 a `main` | `main/HU-11-tablas-inventario-facturacion` | `main` | `main/HU-11-tablas-inventario-facturacion` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-12 a `dev` | `feature/HU-12-tablas-notificacion-mantenimiento` | `dev` | `feature/HU-12-tablas-notificacion-mantenimiento` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-12 a `qa` | `qa/HU-12-tablas-notificacion-mantenimiento` | `qa` | `qa/HU-12-tablas-notificacion-mantenimiento` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-12 a `main` | `main/HU-12-tablas-notificacion-mantenimiento` | `main` | `main/HU-12-tablas-notificacion-mantenimiento` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-14 a `dev` | `feature/HU-14-reglas-indices` | `dev` | `feature/HU-14-reglas-indices` | JuanPabloGomezPerdomo | DannaValentinaBarrios despues de aprobacion |
| HU-14 a `qa` | `qa/HU-14-reglas-indices` | `qa` | `qa/HU-14-reglas-indices` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |
| HU-14 a `main` | `main/HU-14-reglas-indices` | `main` | `main/HU-14-reglas-indices` | JuanPabloGomezPerdomo | JuanPabloGomezPerdomo |

## Archivos que debes subir

### HU-08

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/00_extensions/
entregables/estructura-base-datos/db-structure 1/01_ddl/01_schemas/
entregables/estructura-base-datos/db-structure 1/01_ddl/02_types/
```

### HU-09

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog.yaml
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/configuration/
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/security/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/configuration/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/security/
```

El changelog de `configuration` debe tener una entrada por entidad: `001_customer.sql`, `002_person.sql`, `003_company.sql`, `004_day_type.sql`, `005_payment_method.sql`, `006_legal_information.sql`, `007_employee.sql` y `008_price.sql`.

### HU-10

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/distribution/
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/service_delivery/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/distribution/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/service_delivery/
```

El changelog de `distribution` es uno solo y debe listar, en orden, `001_branch.sql`, `002_room_type.sql`, `003_room_status.sql`, `004_room.sql`, `005_room_availability.sql`, `006_room_catalog.sql` y `007_fk_price_room_type.sql`.

### HU-11

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/inventory/
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/billing/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/inventory/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/billing/
```

### HU-12

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/notification/
entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/maintenance/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/notification/
entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/maintenance/
```

### HU-14

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/07_procedures/
entregables/estructura-base-datos/db-structure 1/01_ddl/08_triggers/
entregables/estructura-base-datos/db-structure 1/01_ddl/09_indexes/
```

En todos tus changelogs el `author` debe ser:

```yaml
author: DannaValentinaBarrios
```

## Comandos exactos por etapa

### Subir a dev

| HU | Comandos |
|---|---|
| HU-08 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-08-ddl-base`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/00_extensions/" "entregables/estructura-base-datos/db-structure 1/01_ddl/01_schemas/" "entregables/estructura-base-datos/db-structure 1/01_ddl/02_types/"`<br>`git commit -m "HU-08: cargar ddl base"`<br>`git push origin feature/HU-08-ddl-base` |
| HU-09 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-09-tablas-parametrizacion-seguridad`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog.yaml" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/configuration/" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/security/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/configuration/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/security/"`<br>`git commit -m "HU-09: modelar parametrizacion y seguridad"`<br>`git push origin feature/HU-09-tablas-parametrizacion-seguridad` |
| HU-10 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-10-tablas-distribucion-prestacion`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/distribution/" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/service_delivery/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/distribution/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/service_delivery/"`<br>`git commit -m "HU-10: modelar distribucion y prestacion"`<br>`git push origin feature/HU-10-tablas-distribucion-prestacion` |
| HU-11 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-11-tablas-inventario-facturacion`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/inventory/" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/billing/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/inventory/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/billing/"`<br>`git commit -m "HU-11: modelar inventario y facturacion"`<br>`git push origin feature/HU-11-tablas-inventario-facturacion` |
| HU-12 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-12-tablas-notificacion-mantenimiento`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/changelog-master.yaml" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/notification/" "entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/maintenance/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/notification/" "entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/maintenance/"`<br>`git commit -m "HU-12: modelar notificacion y mantenimiento"`<br>`git push origin feature/HU-12-tablas-notificacion-mantenimiento` |
| HU-14 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-14-reglas-indices`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/07_procedures/" "entregables/estructura-base-datos/db-structure 1/01_ddl/08_triggers/" "entregables/estructura-base-datos/db-structure 1/01_ddl/09_indexes/"`<br>`git commit -m "HU-14: crear reglas e indices"`<br>`git push origin feature/HU-14-reglas-indices` |

Despues de que el PR quede aprobado y mergeado a `dev`, baja cambios:

```bash
git checkout dev
git pull origin dev
```

### Subir a qa

| HU | Comandos |
|---|---|
| HU-08 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-08-ddl-base`<br>`git merge origin/dev`<br>`git push origin qa/HU-08-ddl-base` |
| HU-09 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-09-tablas-parametrizacion-seguridad`<br>`git merge origin/dev`<br>`git push origin qa/HU-09-tablas-parametrizacion-seguridad` |
| HU-10 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-10-tablas-distribucion-prestacion`<br>`git merge origin/dev`<br>`git push origin qa/HU-10-tablas-distribucion-prestacion` |
| HU-11 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-11-tablas-inventario-facturacion`<br>`git merge origin/dev`<br>`git push origin qa/HU-11-tablas-inventario-facturacion` |
| HU-12 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-12-tablas-notificacion-mantenimiento`<br>`git merge origin/dev`<br>`git push origin qa/HU-12-tablas-notificacion-mantenimiento` |
| HU-14 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-14-reglas-indices`<br>`git merge origin/dev`<br>`git push origin qa/HU-14-reglas-indices` |

Despues de que Juan Pablo Gomez Perdomo haga merge a `qa`, baja cambios:

```bash
git checkout qa
git pull origin qa
```

### Subir a main

| HU | Comandos |
|---|---|
| HU-08 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-08-ddl-base`<br>`git merge origin/qa`<br>`git push origin main/HU-08-ddl-base` |
| HU-09 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-09-tablas-parametrizacion-seguridad`<br>`git merge origin/qa`<br>`git push origin main/HU-09-tablas-parametrizacion-seguridad` |
| HU-10 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-10-tablas-distribucion-prestacion`<br>`git merge origin/qa`<br>`git push origin main/HU-10-tablas-distribucion-prestacion` |
| HU-11 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-11-tablas-inventario-facturacion`<br>`git merge origin/qa`<br>`git push origin main/HU-11-tablas-inventario-facturacion` |
| HU-12 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-12-tablas-notificacion-mantenimiento`<br>`git merge origin/qa`<br>`git push origin main/HU-12-tablas-notificacion-mantenimiento` |
| HU-14 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-14-reglas-indices`<br>`git merge origin/qa`<br>`git push origin main/HU-14-reglas-indices` |

Despues de que Juan Pablo Gomez Perdomo haga merge a `main`, baja cambios:

```bash
git checkout main
git pull origin main
```

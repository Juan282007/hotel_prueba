# Guia individual - juanPabloGomezPerdomo

## Regla rapida

Tus HUs son HU-04, HU-13, HU-20, HU-21 y HU-23. En `dev` te aprueba DannaValentinaBarrios. En `qa` y `main`, como tu eres el QA general pero nadie puede aprobar su propio PR, tus PRs los aprueba DannaValentinaBarrios y tambien los mergea DannaValentinaBarrios.

Ademas apruebas en `dev` las HUs de DannaValentinaBarrios: HU-08, HU-09, HU-10, HU-11, HU-12 y HU-14. Tambien apruebas en `qa` y `main` los PRs de DannaValentinaBarrios, DannaValentinaBarrios y DannaValentinaBarrios.

Antes de crear cualquier rama, baja cambios de la rama padre. Si un companero ya hizo merge antes que tu, ese `git pull` trae sus cambios y evita conflictos.

## Ramas exactas

| HU | Titulo | Rama desde `dev` | Rama hija desde `qa` | Rama hija desde `main` |
|---|---|---|---|---|
| HU-04 | Registrar decisiones ADR | `feature/HU-04-adr` | `qa/HU-04-adr` | `main/HU-04-adr` |
| HU-13 | Crear objetos de consulta | `feature/HU-13-objetos-consulta` | `qa/HU-13-objetos-consulta` | `main/HU-13-objetos-consulta` |
| HU-20 | Asignar permisos controlados | `feature/HU-20-grants` | `qa/HU-20-grants` | `main/HU-20-grants` |
| HU-21 | Ajustar policies RLS | `feature/HU-21-rls-policies` | `qa/HU-21-rls-policies` | `main/HU-21-rls-policies` |
| HU-23 | Cerrar con evidencia | `feature/HU-23-smoke-test` | `qa/HU-23-smoke-test` | `main/HU-23-smoke-test` |

## Aprobaciones y merges

| Etapa | Rama que tu subes | Base del PR | Compare del PR | Aprueba | Hace merge |
|---|---|---|---|---|---|
| HU-04 a `dev` | `feature/HU-04-adr` | `dev` | `feature/HU-04-adr` | DannaValentinaBarrios | juanPabloGomezPerdomo despues de aprobacion |
| HU-04 a `qa` | `qa/HU-04-adr` | `qa` | `qa/HU-04-adr` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-04 a `main` | `main/HU-04-adr` | `main` | `main/HU-04-adr` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-13 a `dev` | `feature/HU-13-objetos-consulta` | `dev` | `feature/HU-13-objetos-consulta` | DannaValentinaBarrios | juanPabloGomezPerdomo despues de aprobacion |
| HU-13 a `qa` | `qa/HU-13-objetos-consulta` | `qa` | `qa/HU-13-objetos-consulta` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-13 a `main` | `main/HU-13-objetos-consulta` | `main` | `main/HU-13-objetos-consulta` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-20 a `dev` | `feature/HU-20-grants` | `dev` | `feature/HU-20-grants` | DannaValentinaBarrios | juanPabloGomezPerdomo despues de aprobacion |
| HU-20 a `qa` | `qa/HU-20-grants` | `qa` | `qa/HU-20-grants` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-20 a `main` | `main/HU-20-grants` | `main` | `main/HU-20-grants` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-21 a `dev` | `feature/HU-21-rls-policies` | `dev` | `feature/HU-21-rls-policies` | DannaValentinaBarrios | juanPabloGomezPerdomo despues de aprobacion |
| HU-21 a `qa` | `qa/HU-21-rls-policies` | `qa` | `qa/HU-21-rls-policies` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-21 a `main` | `main/HU-21-rls-policies` | `main` | `main/HU-21-rls-policies` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-23 a `dev` | `feature/HU-23-smoke-test` | `dev` | `feature/HU-23-smoke-test` | DannaValentinaBarrios | juanPabloGomezPerdomo despues de aprobacion |
| HU-23 a `qa` | `qa/HU-23-smoke-test` | `qa` | `qa/HU-23-smoke-test` | DannaValentinaBarrios | DannaValentinaBarrios |
| HU-23 a `main` | `main/HU-23-smoke-test` | `main` | `main/HU-23-smoke-test` | DannaValentinaBarrios | DannaValentinaBarrios |

## Archivos que debes subir

### HU-04

```text
docs/entrega-base-datos/ADR/ADR-001-migracion-postgresql.md
docs/entrega-base-datos/ADR/ADR-002-identificadores-estados-auditoria-eliminacion.md
docs/entrega-base-datos/ADR/ADR-003-cambio-idioma-base-datos-ingles.md
docs/entrega-base-datos/ADR/ADR-004-responsabilidades-jhon-camilo.md
docs/entrega-base-datos/ADR/ADR-005-responsabilidades-juan-pablo.md
docs/entrega-base-datos/ADR/ADR-006-responsabilidades-danna-valentina.md
docs/entrega-base-datos/ADR/ADR-007-responsabilidades-johan-steven.md
docs/entrega-base-datos/ADR/ADR-008-separacion-tablas-por-dominio-entidad.md
docs/entrega-base-datos/ADR/ADR-009-plan-aplicacion-ingles-tecnico.md
```

### HU-13

```text
entregables/estructura-base-datos/db-structure 1/01_ddl/04_views/
entregables/estructura-base-datos/db-structure 1/01_ddl/05_materialized_views/
entregables/estructura-base-datos/db-structure 1/01_ddl/06_functions/
```

Los changelogs de HU-13 deben tener:

```yaml
author: juanPabloGomezPerdomo
```

### HU-20

```text
entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants/001_grants.sql
entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants/changelog.yaml
```

### HU-21

```text
entregables/estructura-base-datos/db-structure 1/03_dcl/02_policies/001_rls_policies.sql
entregables/estructura-base-datos/db-structure 1/03_dcl/02_policies/changelog.yaml
```

### HU-23

```text
entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql
entregables/estructura-base-datos/db-structure 1/scripts/ariel-ddl-permission-test.sql
entregables/estructura-base-datos/db-structure 1/scripts/load-postgres.ps1
docs/entrega-base-datos/guia_ejecucion_y_validacion.md
docs/entrega-base-datos/orden_carga.md
docs/entrega-base-datos/seguimientos.md
```

En HU-20 y HU-21 el `author` debe ser:

```yaml
author: juanPabloGomezPerdomo
```

## Comandos exactos por etapa

### Subir a dev

| HU | Comandos |
|---|---|
| HU-04 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-04-adr`<br>`git add docs/entrega-base-datos/ADR/`<br>`git commit -m "HU-04: registrar decisiones ADR"`<br>`git push origin feature/HU-04-adr` |
| HU-13 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-13-objetos-consulta`<br>`git add "entregables/estructura-base-datos/db-structure 1/01_ddl/04_views/" "entregables/estructura-base-datos/db-structure 1/01_ddl/05_materialized_views/" "entregables/estructura-base-datos/db-structure 1/01_ddl/06_functions/"`<br>`git commit -m "HU-13: crear objetos de consulta"`<br>`git push origin feature/HU-13-objetos-consulta` |
| HU-20 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-20-grants`<br>`git add "entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants/"`<br>`git commit -m "HU-20: asignar permisos controlados"`<br>`git push origin feature/HU-20-grants` |
| HU-21 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-21-rls-policies`<br>`git add "entregables/estructura-base-datos/db-structure 1/03_dcl/02_policies/"`<br>`git commit -m "HU-21: ajustar policies rls"`<br>`git push origin feature/HU-21-rls-policies` |
| HU-23 | `git checkout dev`<br>`git pull origin dev`<br>`git checkout -b feature/HU-23-smoke-test`<br>`git add "entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql" "entregables/estructura-base-datos/db-structure 1/scripts/ariel-ddl-permission-test.sql" "entregables/estructura-base-datos/db-structure 1/scripts/load-postgres.ps1" docs/entrega-base-datos/guia_ejecucion_y_validacion.md docs/entrega-base-datos/orden_carga.md docs/entrega-base-datos/seguimientos.md`<br>`git commit -m "HU-23: agregar smoke test"`<br>`git push origin feature/HU-23-smoke-test` |

Despues de que el PR quede aprobado y mergeado a `dev`, baja cambios:

```bash
git checkout dev
git pull origin dev
```

### Subir a qa

| HU | Comandos |
|---|---|
| HU-04 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-04-adr`<br>`git merge origin/dev`<br>`git push origin qa/HU-04-adr` |
| HU-13 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-13-objetos-consulta`<br>`git merge origin/dev`<br>`git push origin qa/HU-13-objetos-consulta` |
| HU-20 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-20-grants`<br>`git merge origin/dev`<br>`git push origin qa/HU-20-grants` |
| HU-21 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-21-rls-policies`<br>`git merge origin/dev`<br>`git push origin qa/HU-21-rls-policies` |
| HU-23 | `git checkout qa`<br>`git pull origin qa`<br>`git checkout -b qa/HU-23-smoke-test`<br>`git merge origin/dev`<br>`git push origin qa/HU-23-smoke-test` |

Despues de que DannaValentinaBarrios haga merge a `qa`, baja cambios:

```bash
git checkout qa
git pull origin qa
```

### Subir a main

| HU | Comandos |
|---|---|
| HU-04 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-04-adr`<br>`git merge origin/qa`<br>`git push origin main/HU-04-adr` |
| HU-13 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-13-objetos-consulta`<br>`git merge origin/qa`<br>`git push origin main/HU-13-objetos-consulta` |
| HU-20 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-20-grants`<br>`git merge origin/qa`<br>`git push origin main/HU-20-grants` |
| HU-21 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-21-rls-policies`<br>`git merge origin/qa`<br>`git push origin main/HU-21-rls-policies` |
| HU-23 | `git checkout main`<br>`git pull origin main`<br>`git checkout -b main/HU-23-smoke-test`<br>`git merge origin/qa`<br>`git push origin main/HU-23-smoke-test` |

Despues de que DannaValentinaBarrios haga merge a `main`, baja cambios:

```bash
git checkout main
git pull origin main
```

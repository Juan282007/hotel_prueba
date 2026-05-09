# Orden de carga

## Orden logico

Las rutas de esta seccion se leen desde `entregables/estructura-base-datos/db-structure 1/`.

1. `01_ddl/00_extensions`
2. `01_ddl/01_schemas`
3. `01_ddl/02_types`
4. `01_ddl/03_tables`
5. `01_ddl/06_functions`
6. `01_ddl/07_procedures`
7. `01_ddl/08_triggers`
8. `01_ddl/04_views`
9. `01_ddl/05_materialized_views`
10. `01_ddl/09_indexes`
11. `02_dml`
12. `03_dcl`
13. `04_tcl`

## Changelogs disponibles

Las rutas de la tabla tambien son relativas a `entregables/estructura-base-datos/db-structure 1/`.

| Uso | Archivo |
|-----|---------|
| Ejecucion completa con Liquibase | `changelog/changelog-master.yaml` |
| Ejecucion completa con psql | `changelog/changelog-master.sql` |
| DDL | `01_ddl/changelog-master.yaml` |
| DML | `02_dml/changelog-master.yaml` |
| DCL | `03_dcl/changelog-master.yaml` |
| TCL | `04_tcl/changelog-master.yaml` |

## Scripts de apoyo y validacion

| Uso | Archivo |
|-----|---------|
| Carga local alternativa con psql | `scripts/load-postgres.ps1` |
| Validacion final de conteos y rol | `scripts/smoke-test.sql` |
| Prueba auxiliar de permisos de `ariel5253` | `scripts/ariel-ddl-permission-test.sql` |

## Ejecucion recomendada con Docker

Desde `entregables/estructura-base-datos/db-structure 1/docker`:

```bash
docker compose up postgres liquibase-watch
```

Ese comando levanta PostgreSQL, espera el healthcheck y deja Liquibase revisando el changelog por intervalos.

Para ejecutar Liquibase una sola vez:

```bash
docker compose run --rm liquibase-cli update
```

Para validar despues de la carga:

```bash
docker compose exec -e PGPASSWORD=ariel5253 postgres psql -h localhost -U ariel5253 -d hotel_system -f /scripts/smoke-test.sql
```

Para detener el ambiente:

```bash
docker compose down
```

Para borrar tambien los datos del volumen:

```bash
docker compose down -v
```

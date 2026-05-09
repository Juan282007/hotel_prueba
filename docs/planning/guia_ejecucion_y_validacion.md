# Guia de ejecucion y validacion

## Objetivo

Validar que el ambiente PostgreSQL quede estable con DDL, DML, DCL, TCL y rollbacks organizados.

## Opcion recomendada: Docker Compose + Liquibase

1. Abrir una terminal en:

```bash
entregables/estructura-base-datos/db-structure 1/docker
```

2. Levantar PostgreSQL y el watcher de Liquibase:

```bash
docker compose up postgres liquibase-watch
```

Si se quiere ejecutar Liquibase una sola vez:

```bash
docker compose run --rm liquibase-cli update
```

3. Ejecutar smoke test:

```bash
docker compose exec -e PGPASSWORD=ariel5253 postgres psql -h localhost -U ariel5253 -d hotel_system -f /scripts/smoke-test.sql
```

4. Validar permisos DDL/DML del usuario de evaluacion:

```bash
docker compose exec -e PGPASSWORD=abcd1234 postgres psql -h localhost -U postgres -d hotel_system -f /scripts/ariel-ddl-permission-test.sql
```

5. Validar login PostgreSQL de Ariel:

```bash
docker compose exec -e PGPASSWORD=ariel5253 postgres psql -h localhost -U ariel5253 -d hotel_system -c "SELECT current_user;"
```

6. Detener el ambiente:

```bash
docker compose down
```

## Configuracion Docker

| Elemento | Valor |
|----------|-------|
| Base de datos | `hotel_system` |
| Usuario administrator Docker | `postgres` |
| Password administrator Docker | `abcd1234` |
| Puerto local | `5438` |
| Servicio PostgreSQL | `postgres` |
| Servicio Liquibase automatico | `liquibase-watch` |
| Servicio Liquibase manual | `liquibase-cli` |
| Archivo properties | `liquibase.properties` |

## Opcion alternativa: psql local

Ejecutar estos comandos desde `entregables/estructura-base-datos/db-structure 1/`.

Si se tiene `psql` instalado en el equipo:

```bash
createdb -U postgres -h localhost -p 5438 hotel_system
```

```bash
psql -h localhost -p 5438 -U postgres -d hotel_system -f changelog/changelog-master.sql
```

Tambien se puede usar el script:

```powershell
.\scripts\load-postgres.ps1
```

## Validaciones minimas

```sql
SELECT COUNT(*) AS tablas_creadas
FROM information_schema.tables
WHERE table_schema IN (
  'configuration',
  'distribution',
  'service_delivery',
  'billing',
  'inventory',
  'notification',
  'security',
  'maintenance'
);

SELECT COUNT(*) AS room_statuses FROM distribution.room_status;
SELECT COUNT(*) AS room_types FROM distribution.room_type;
SELECT COUNT(*) AS modules FROM security.module;
SELECT COUNT(*) AS app_user_ariel FROM security.app_user WHERE username = 'ariel5253';

SELECT COUNT(*) AS rol_ariel_restringido
FROM pg_roles
WHERE rolname = 'ariel5253'
  AND rolcanlogin
  AND NOT rolsuper
  AND NOT rolcreatedb
  AND NOT rolcreaterole;

SELECT CASE WHEN pg_has_role('ariel5253', 'ddl_dml_evaluator', 'member') THEN 1 ELSE 0 END AS rol_ariel_evaluador;
```

## Resultado esperado

| Validacion | Valor esperado |
|------------|----------------|
| Schemas creados | 8 |
| Tablas creadas | 46 |
| `distribution.room_status` | 6 |
| `distribution.room_type` | 3 |
| `security.module` | 8 |
| Usuario `ariel5253` | 1 |
| Rol `ariel5253` restringido | 1 |
| Rol `ariel5253` con `ddl_dml_evaluator` | 1 |

## Cierre de main estable

Antes de cerrar la entrega:

- Confirmar que Liquibase termina sin errores.
- Confirmar que `entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql` retorna los valores esperados.
- Confirmar que el usuario `ariel5253` puede autenticarse.
- Registrar evidencia en `seguimientos.md`.
- No dejar archivos temporales ni scripts duplicados.

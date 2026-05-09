# Seguimientos del proyecto

## Corte actual

| Aspecto              | Estado     | Evidencia                                                                                                                                          |
| -------------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dominios oficiales   | Completado | La base conserva 8 dominios: configuration, distribution, service_delivery, billing, inventory, notification, security y maintenance. |
| Estructura DDL       | Completado | DDL separado en extensions, schemas, types, tables, views, materialized views, functions, procedures, triggers e indexes.                          |
| Estructura DML       | Completado | Inserts separados por dominio y operaciones adicionales en updates, deletes, upserts y patches.                                                    |
| Security DCL        | Completado | Roles, grants y policies separados. `ariel5253` queda limitado al rol `ddl_dml_evaluator`.                                                       |
| TCL y rollbacks      | Completado | TCL separado y `05_rollbacks` organizado como espejo de DDL, DML, DCL y TCL.                                                                     |
| Changelogs Liquibase | Completado | Changelog maestro global y maestros por bloque DDL, DML, DCL y TCL.                                                                                |
| Ambiente Docker      | Preparado  | `entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml` levanta PostgreSQL, Liquibase automatico y Liquibase manual.         |

## Decisiones registradas

- La base se trabaja en PostgreSQL.
- No se crea schema tecnico adicional.
- Configuration queda como un solo dominio.
- Notification y maintenance quedan como dominios separados.
- Cada view, materialized view, function, procedure y trigger vive en archivo propio.
- La conversion a ingles tecnico queda planificada en ADR-009 para evitar cambios parciales que rompan referencias.

## Seguimiento por epic

| Epic | Responsable guia | Avance |
| ---- | ---------------- | ------ |
| Gobierno del trabajo y decisiones | JhonCamilo / juanPablo | Documentacion base, ADR y dominios oficiales consolidados. |
| Ambiente ejecutable | JhonCamilo / Danna | Docker, PostgreSQL, Liquibase automatico y Liquibase manual preparados. |
| Modelo fisico por dominios | Danna / juanPablo | DDL organizado por dominios y objetos avanzados separados por archivo. |
| Datos, security y transacciones | JohanSteven / juanPablo / JhonCamilo | DML, DCL, RLS, TCL y rollbacks organizados. |
| Cierre y evidencia | juanPablo | Pendiente de ejecucion real en Docker o ambiente local con PostgreSQL/Liquibase. |

## Pendiente de validacion

- Ejecutar `docker compose up postgres liquibase-watch` desde `entregables/estructura-base-datos/db-structure 1/docker`.
- Ejecutar `entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql` contra la base `hotel_system` usando `ariel5253`.
- Validar autenticacion con usuario `ariel5253`.
- Registrar resultado de ejecucion en este documento cuando se tenga la evidencia.

## Evidencia esperada

| Validacion            | Resultado esperado                                                |
| --------------------- | ----------------------------------------------------------------- |
| Schemas creados       | 8                                                                 |
| Tablas creadas        | 46                                                                |
| Estados de habitacion | 6                                                                 |
| Tipos de habitacion   | 3                                                                 |
| Modulos de security  | 8                                                                 |
| Usuario `ariel5253` | 1 registro en `security.app_user` y login PostgreSQL disponible |
| Rol `ariel5253`     | Login restringido y miembro de `ddl_dml_evaluator`              |

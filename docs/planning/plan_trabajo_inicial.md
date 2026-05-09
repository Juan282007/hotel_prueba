# Plan de trabajo inicial

**Proyecto:** Sistema de gestion hotelera  
**Meta:** entregar una base PostgreSQL con migraciones Liquibase, datos semilla, security controlada y evidencia de ejecucion.

## Enfoque de trabajo

| Epic | HU | Resultado esperado | Responsable guia |
| ---- | -- | ------------------ | ---------------- |
| Gobierno del trabajo y decisiones | HU-01 a HU-05 | Ramas, plan, seguimiento, dominios y ADR. | JhonCamilo / juanPablo |
| Ambiente ejecutable | HU-06 a HU-08 | Docker, PostgreSQL, Liquibase y DDL base. | JhonCamilo / Danna |
| Modelo fisico por dominios | HU-09 a HU-14 | Tablas y objetos avanzados por dominio. | Danna / juanPablo |
| Datos, security y transacciones | HU-15 a HU-22 | DML, DCL, RLS, TCL y rollbacks. | JohanSteven / juanPablo / JhonCamilo |
| Cierre y evidencia | HU-23 | Smoke test, guias y validacion final. | juanPablo |

## Criterios de cierre

- La estructura conserva los 8 dominios oficiales.
- Docker expone PostgreSQL en `localhost:5438`.
- Liquibase ejecuta `changelog/changelog-master.yaml`.
- Cada view, materialized view, function, procedure y trigger esta en archivo propio.
- `ariel5253` autentica con password `ariel5253`.
- `ariel5253` solo hereda `ddl_dml_evaluator` y no puede crear bases ni roles.
- `scripts/smoke-test.sql` valida conteos y permisos principales.

## Cronograma corto

| Dia | Foco | Salida |
| --- | ---- | ------ |
| 1 | Gobierno y alcance | Documentos base y ADR iniciales. |
| 2 | Ambiente y DDL base | Compose, Liquibase, schemas y types. |
| 3 | Modelo fisico | Tablas, views, functions, procedures, triggers e indices. |
| 4 | Datos y security | Inserts, roles, grants, policies y TCL. |
| 5 | Evidencia | Smoke test, guias y seguimiento actualizado. |

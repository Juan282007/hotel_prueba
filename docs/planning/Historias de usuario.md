# Historias de usuario - Entrega de base de datos

Este backlog organiza el trabajo desde la necesidad de la entrega: construir una base PostgreSQL ejecutable, trazable por Liquibase y verificable por el instructor con el usuario `ariel5253`.

## Lectura del backlog

| Campo | Uso |
| ----- | --- |
| ID | Consecutivo de seguimiento para tablero y commits. |
| Necesidad | Lo que debe quedar resuelto para la entrega. |
| Entregable | Archivo, carpeta o evidencia esperada. |
| Aceptacion | Condicion minima para marcar la HU como terminada. |

Cuando una HU nombra una carpeta, tambien quedan cubiertos los archivos internos necesarios para esa HU, como scripts SQL, `changelog.yaml`, rollbacks asociados y documentos de apoyo que no sean temporales.

## Epic A - Gobierno del trabajo y decisiones

| ID | Necesidad | Entregable | Aceptacion |
| -- | --------- | ---------- | ---------- |
| HU-01 | Como equipo, necesitamos crear el repositorio y el flujo de ramas para trabajar sin mezclar cambios. | Ramas `main`, `qa` y `dev`; reglas de subida por feature. | El repositorio queda creado y cada integrante sabe en que rama trabajar. |
| HU-02 | Como equipo, necesitamos una ruta de trabajo visible para saber que esta listo y que falta revisar. | `docs/entrega-base-datos/Historias de usuario.md`, `docs/entrega-base-datos/plan_trabajo_inicial.md`, `docs/entrega-base-datos/seguimientos.md`, `docs/entrega-base-datos/tablero_responsabilidades.md`, `docs/entrega-base-datos/responsabilidades_individuales/`, `docs/entrega-base-datos/tablero_azure_trello_clickup.csv` y `docs/entrega-base-datos/que_subir_y_que_no_subir.md`. | El plan tiene responsables, estado, guias de subida, tablero importable y evidencia de avance. |
| HU-03 | Como analistas, necesitamos cerrar los dominios funcionales antes de crear schemas y tablas. | `docs/entrega-base-datos/analisis_dominios.md`, `docs/architecture/model-data/es/` y `docs/architecture/model-data/en/` como fuente y anexo de referencia. | La documentacion conserva exactamente 8 dominios oficiales. |
| HU-04 | Como equipo tecnico, necesitamos registrar decisiones para que la entrega tenga sustento. | Carpeta `docs/entrega-base-datos/ADR/` con decisiones de PostgreSQL, auditoria e idioma tecnico. | Cada ADR explica el problema, la decision tomada y su impacto. |
| HU-05 | Como equipo, necesitamos dejar preparada una base de automatizacion aunque la prueba principal sea local. | `.github/workflows/validate-changelog.yml` y `.gitignore`. | Queda documentado su uso para validar changelog y evitar archivos locales o sensibles. |

## Epic B - Ambiente ejecutable

| ID | Necesidad | Entregable | Aceptacion |
| -- | --------- | ---------- | ---------- |
| HU-06 | Como developeres, necesitamos levantar PostgreSQL sin instalar todo manualmente. | `entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml`. | `postgres` publica la base `hotel_system` en `localhost:5438`. |
| HU-07 | Como equipo, necesitamos aplicar cambios de base de datos de forma ordenada y repetible. | `entregables/estructura-base-datos/db-structure 1/liquibase.properties`, `entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.yaml` y `entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.sql`. | Liquibase ejecuta el changelog maestro contra PostgreSQL y existe alternativa con `psql`. |
| HU-08 | Como responsables de DDL, necesitamos una base inicial con extensiones, schemas y tipos de dominio bien separados. | `entregables/estructura-base-datos/db-structure 1/01_ddl/00_extensions`, `entregables/estructura-base-datos/db-structure 1/01_ddl/01_schemas`, `entregables/estructura-base-datos/db-structure 1/01_ddl/02_types`. | Los archivos se cargan desde changelog y tienen rollback asociado. |

## Epic C - Modelo fisico por dominios

| ID | Necesidad | Entregable | Aceptacion |
| -- | --------- | ---------- | ---------- |
| HU-09 | Como usuarios del sistema, necesitamos persistir configuration y security. | Tablas en `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/configuration/` y `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/security/`. | Las tablas tienen identificadores, auditoria y relaciones principales. |
| HU-10 | Como operacion hotelera, necesitamos registrar sedes, habitaciones, reservas y estadias. | Tablas en `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/distribution/` y `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/service_delivery/`. | Las relaciones permiten consultar disponibilidad y ciclo de reserva. |
| HU-11 | Como administracion, necesitamos registrar productos, servicios, ventas y billing. | Tablas en `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/inventory/` y `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/billing/`. | Las tablas soportan facturas, pagos parciales y movimientos de inventory. |
| HU-12 | Como operacion, necesitamos gestionar mensajes, promociones y maintenance. | Tablas en `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/notification/` y `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/maintenance/`. | Ambos dominios quedan separados y con datos trazables. |
| HU-13 | Como equipo de consulta, necesitamos objetos para reportes y calculos frecuentes. | `entregables/estructura-base-datos/db-structure 1/01_ddl/04_views/`, `entregables/estructura-base-datos/db-structure 1/01_ddl/05_materialized_views/` y `entregables/estructura-base-datos/db-structure 1/01_ddl/06_functions/`. | Cada objeto avanzado vive en archivo propio y es llamado desde changelog. |
| HU-14 | Como equipo tecnico, necesitamos reglas de negocio cercanas a la base. | `entregables/estructura-base-datos/db-structure 1/01_ddl/07_procedures/`, `entregables/estructura-base-datos/db-structure 1/01_ddl/08_triggers/` e `entregables/estructura-base-datos/db-structure 1/01_ddl/09_indexes/`. | Los triggers/procedures validan reglas y los indices apoyan consultas esperadas. |

## Epic D - Datos, security y control transaccional

| ID | Necesidad | Entregable | Aceptacion |
| -- | --------- | ---------- | ---------- |
| HU-15 | Como QA, necesitamos datos base de configuration y security para iniciar pruebas. | Inserts en `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/001_configuration.sql` y `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/002_security.sql`. | Existe el usuario funcional `ariel5253` en datos semilla. |
| HU-16 | Como QA, necesitamos datos operativos para distribution y prestacion de servicio. | Inserts en `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/003_distribution.sql` y `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/004_service_delivery.sql`. | La carga permite probar disponibilidad, reservas y estadias. |
| HU-17 | Como QA, necesitamos datos de inventory y billing. | Inserts en `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/005_inventory.sql` y `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/006_billing.sql`. | La carga permite consultar productos, ventas, prefacturas, facturas y pagos. |
| HU-18 | Como QA, necesitamos datos para notification y maintenance. | Inserts en `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/007_notification.sql` y `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/008_maintenance.sql`. | La carga permite validar alertas, promociones y actividades de maintenance. |
| HU-19 | Como instructor, debo poder autenticarme con `ariel5253` y password `ariel5253` sin permisos administrativos. | `entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/001_roles.sql`. | `ariel5253` no es superusuario, no crea bases, no crea roles y hereda solo `ddl_dml_evaluator`. |
| HU-20 | Como equipo, necesitamos permisos claros para lectura, carga y validacion. | `entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants/001_grants.sql`. | Los grants permiten DDL/DML controlado al rol de evaluacion y restringen `PUBLIC`. |
| HU-21 | Como equipo, necesitamos que RLS no bloquee la validacion del instructor. | `entregables/estructura-base-datos/db-structure 1/03_dcl/02_policies/001_rls_policies.sql`. | Las tablas con row level security tienen policies para el rol de evaluacion. |
| HU-22 | Como equipo, necesitamos bloques transaccionales para operaciones sensibles. | `entregables/estructura-base-datos/db-structure 1/04_tcl/`. | Los scripts TCL quedan referenciados por changelog y documentados con rollback o nota de recuperacion. |

## Epic E - Cierre y evidencia

| ID | Necesidad | Entregable | Aceptacion |
| -- | --------- | ---------- | ---------- |
| HU-23 | Como equipo, necesitamos demostrar que la base se ejecuta y que la documentacion coincide con el entregable. | `entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql`, `entregables/estructura-base-datos/db-structure 1/scripts/ariel-ddl-permission-test.sql`, `entregables/estructura-base-datos/db-structure 1/scripts/load-postgres.ps1`, `docs/entrega-base-datos/guia_ejecucion_y_validacion.md`, `docs/entrega-base-datos/orden_carga.md` y `docs/entrega-base-datos/seguimientos.md`. | El smoke test retorna conteos esperados, las pruebas auxiliares validan permisos y la guia coincide con la ejecucion real. |

## Dominios oficiales

| Dominio funcional | Schema |
| ----------------- | ------ |
| Configuration | `configuration` |
| Distribution | `distribution` |
| Service delivery | `service_delivery` |
| Billing | `billing` |
| Inventory | `inventory` |
| Notification | `notification` |
| Security | `security` |
| Maintenance | `maintenance` |

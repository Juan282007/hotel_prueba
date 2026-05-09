# Que se Sube y Que no se Sube

Este documento separa los entregables reales del proyecto de los archivos locales o de apoyo. Sirve para que el repositorio quede limpio y para que nadie suba contrasenas, datos temporales o archivos que no hacen parte de la entrega.

## Si se debe subir

| Archivo o carpeta | Quien lo sube | HU | Por que se sube |
|---|---|---|---|
| `README.md` | JhonCamiloSuazaSanchez | HU-01 | Es la entrada del repositorio y explica la estructura base. |
| `docs/entrega-base-datos/Historias de usuario.md` | JhonCamiloSuazaSanchez | HU-02 | Es el backlog oficial usado para validar que cada archivo tenga respaldo en una HU. |
| `docs/entrega-base-datos/plan_trabajo_inicial.md` | JhonCamiloSuazaSanchez | HU-02 | Es evidencia de planeacion. |
| `docs/entrega-base-datos/seguimientos.md` | JhonCamiloSuazaSanchez / juanPabloGomezPerdomo | HU-02 y HU-23 | Es evidencia de seguimiento y cierre. |
| `docs/entrega-base-datos/tablero_responsabilidades.md` | JhonCamiloSuazaSanchez | HU-02 | Define responsables, ramas, aprobaciones y flujo. |
| `docs/entrega-base-datos/responsabilidades_individuales/` | JhonCamiloSuazaSanchez | HU-02 | Son guias por integrante para ejecutar las HUs sin confundir rutas, ramas o aprobadores. |
| `docs/entrega-base-datos/tablero_azure_trello_clickup.csv` | JhonCamiloSuazaSanchez | HU-02 | Permite importar o revisar el tablero de HUs en herramientas de planeacion. |
| `docs/entrega-base-datos/que_subir_y_que_no_subir.md` | JhonCamiloSuazaSanchez | HU-02 | Deja la regla de limpieza del repositorio. |
| `docs/entrega-base-datos/analisis_dominios.md` | JhonCamiloSuazaSanchez | HU-03 | Sustenta los 8 dominios oficiales. |
| `docs/architecture/model-data/es/` | JhonCamiloSuazaSanchez | HU-03 | Queda como fuente de analisis en espanol y respaldo del modelado funcional. |
| `docs/architecture/model-data/en/` | JhonCamiloSuazaSanchez | HU-03 | Queda como fuente de referencia en ingles para trazabilidad del analisis. |
| `docs/entrega-base-datos/ADR/` | juanPabloGomezPerdomo | HU-04 | Registra decisiones tecnicas del proyecto. |
| `.github/workflows/validate-changelog.yml` | JhonCamiloSuazaSanchez | HU-05 | Automatiza la validacion de changelogs. |
| `.gitignore` | JhonCamiloSuazaSanchez | HU-05 | Evita subir archivos sensibles o temporales. |
| `entregables/estructura-base-datos/db-structure 1/docker/docker-compose.yml` | JhonCamiloSuazaSanchez | HU-06 | Levanta PostgreSQL local. |
| `entregables/estructura-base-datos/db-structure 1/liquibase.properties`, `entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.yaml` y `entregables/estructura-base-datos/db-structure 1/changelog/changelog-master.sql` | JhonCamiloSuazaSanchez | HU-07 | Configuran la ejecucion con Liquibase y la alternativa con `psql`. |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/00_extensions`, `entregables/estructura-base-datos/db-structure 1/01_ddl/01_schemas`, `entregables/estructura-base-datos/db-structure 1/01_ddl/02_types` | DannaValentinaBarrios | HU-08 | DDL base. |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/` y `entregables/estructura-base-datos/db-structure 1/05_rollbacks/01_ddl/03_tables/` | DannaValentinaBarrios | HU-09 a HU-12 | Tablas separadas por dominio y rollback espejo. |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/04_views`, `entregables/estructura-base-datos/db-structure 1/01_ddl/05_materialized_views`, `entregables/estructura-base-datos/db-structure 1/01_ddl/06_functions` | juanPabloGomezPerdomo | HU-13 | Objetos de consulta. |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/07_procedures`, `entregables/estructura-base-datos/db-structure 1/01_ddl/08_triggers`, `entregables/estructura-base-datos/db-structure 1/01_ddl/09_indexes` | DannaValentinaBarrios | HU-14 | Reglas, automatismos e indices. |
| `entregables/estructura-base-datos/db-structure 1/02_dml/changelog-master.yaml` y `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/` | JohanStevenRodriguezCharr | HU-15 a HU-18 | Datos de prueba, datos base y changelog DML maestro. |
| `entregables/estructura-base-datos/db-structure 1/02_dml/01_updates/`, `02_dml/02_deletes/`, `02_dml/03_upserts/` y `02_dml/04_patches/` | JohanStevenRodriguezCharr | HU-15 a HU-18 | Operaciones DML complementarias referenciadas por el changelog maestro. |
| `entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/` | JohanStevenRodriguezCharr | HU-19 | Roles y usuario de evaluacion. |
| `entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants`, `entregables/estructura-base-datos/db-structure 1/03_dcl/02_policies` | juanPabloGomezPerdomo | HU-20 y HU-21 | Permisos y RLS. |
| `entregables/estructura-base-datos/db-structure 1/04_tcl/` | JhonCamiloSuazaSanchez | HU-22 | Bloques transaccionales y recuperacion. |
| `entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql`, `entregables/estructura-base-datos/db-structure 1/scripts/ariel-ddl-permission-test.sql` y `entregables/estructura-base-datos/db-structure 1/scripts/load-postgres.ps1` | juanPabloGomezPerdomo | HU-23 | Evidencia final de validacion, prueba auxiliar de permisos y carga local alternativa. |
| `docs/entrega-base-datos/orden_carga.md` | juanPabloGomezPerdomo | HU-23 | Guia el orden de ejecucion para validar la base. |
| `docs/entrega-base-datos/guia_ejecucion_y_validacion.md` | juanPabloGomezPerdomo | HU-23 | Documenta como ejecutar Docker, Liquibase, psql y smoke test. |

## Mapa rapido de documentos de entrega

Esta tabla sirve para revisar rapidamente si los documentos principales se suben y en que HU quedan respaldados.

| Archivo | Se sube | HU |
|---|---|---|
| `docs/entrega-base-datos/analisis_dominios.md` | Si | HU-03 |
| `docs/entrega-base-datos/guia_ejecucion_y_validacion.md` | Si | HU-23 |
| `docs/entrega-base-datos/Historias de usuario.md` | Si | HU-02 |
| `docs/entrega-base-datos/orden_carga.md` | Si | HU-23 |
| `docs/entrega-base-datos/plan_trabajo_inicial.md` | Si | HU-02 |
| `docs/entrega-base-datos/que_subir_y_que_no_subir.md` | Si | HU-02 |
| `docs/entrega-base-datos/seguimientos.md` | Si | HU-02 y HU-23 |
| `docs/entrega-base-datos/tablero_azure_trello_clickup.csv` | Si | HU-02 |
| `docs/entrega-base-datos/tablero_responsabilidades.md` | Si | HU-02 |
| `docs/entrega-base-datos/ADR/ADR-001-migracion-postgresql.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-002-identificadores-estados-auditoria-eliminacion.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-003-cambio-idioma-base-datos-ingles.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-004-responsabilidades-jhon-camilo.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-005-responsabilidades-juan-pablo.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-006-responsabilidades-danna-valentina.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-007-responsabilidades-johan-steven.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-008-separacion-tablas-por-dominio-entidad.md` | Si | HU-04 |
| `docs/entrega-base-datos/ADR/ADR-009-plan-aplicacion-ingles-tecnico.md` | Si | HU-04 |
| `.github/workflows/validate-changelog.yml` | Si | HU-05 |

## No se debe subir

| Archivo o carpeta | Por que no se sube |
|---|---|
| `.env` | Puede contener contrasenas reales. |
| `*.log` | Son archivos temporales de ejecucion. |
| Backups o dumps de base de datos | Pesan mucho y pueden contener datos sensibles. |
| Carpetas de volumen de Docker | Son datos locales generados por PostgreSQL. |
| Capturas o imagenes no pedidas | No hacen parte del entregable tecnico. |
| Archivos personales fuera de `docs/entrega-base-datos/` | Son notas de guia individual, no evidencia formal. |
| Archivos generados por el editor o sistema operativo | No aportan a la entrega y ensucian el repo. |
| `_no_subir/docs/planning/` | Es una landing/tablero de apoyo, no el tablero formal de HU-02. |
| `_no_subir/docs/entrega-base-datos/planning.md` | Duplica planeacion; el entregable formal es `plan_trabajo_inicial.md`. |
| `_no_subir/docs/entrega-base-datos/roles_equipo.md` | Duplica responsables ya cubiertos por plan, tablero y guias individuales. |
| `_no_subir/docs/entrega-base-datos/dor_dod.md` | Es criterio interno de apoyo, no entregable nombrado por las HU. |
| `_no_subir/entregables/estructura-base-datos/db-structure 1/changelog/README.md` | Es documentacion auxiliar; los entregables ejecutables son los changelogs YAML/SQL. |

## Guia interna vs entrega formal

Las guias individuales definidas por HU-02 se suben en `docs/entrega-base-datos/responsabilidades_individuales/`. Los ADRs se suben en `docs/entrega-base-datos/ADR/`. El tablero oficial y el CSV se suben en `docs/entrega-base-datos/`.

Si el profesor pide una entrega mas limpia, se presenta como evidencia principal el contenido de `entregables/` y los documentos oficiales de `docs/entrega-base-datos/`, dejando las guias individuales como apoyo de coordinacion.

La carpeta `_no_subir/` no es fuente de entrega. Si algun archivo debe subir por una HU, debe estar copiado o movido a su ruta formal antes de hacer `git add`.

## Casos que generan duda

### `planning.md`

`docs/entrega-base-datos/planning.md` puede existir como apoyo interno, pero no hace falta subirlo si ya existen:

- `docs/entrega-base-datos/plan_trabajo_inicial.md`
- `docs/entrega-base-datos/Historias de usuario.md`
- `docs/entrega-base-datos/tablero_responsabilidades.md`
- `docs/entrega-base-datos/seguimientos.md`

Por eso quedo movido a `_no_subir/docs/entrega-base-datos/planning.md`.

### Carpetas `es/` y `en`

`docs/architecture/model-data/es/` y `docs/architecture/model-data/en/` si se suben cuando el docente las pide como fuente del analisis. En este ajuste quedan asociadas a HU-03 junto con `docs/entrega-base-datos/analisis_dominios.md`.

### Que significa "estructura"

Cuando una HU habla de estructura, se refiere a la parte del proyecto que esa HU construye o deja lista. No significa que una sola persona suba todo el proyecto completo.

- HU-01: estructura del repositorio y flujo de ramas.
- HU-06 a HU-22: estructura tecnica de base de datos, Docker, Liquibase, DDL, DML, DCL y TCL.

## Momento en que se sube cada carpeta

| Carpeta o archivo | Se sube en | Responsable principal |
|---|---|---|
| `docs/entrega-base-datos/responsabilidades_individuales/` | HU-02 | JhonCamiloSuazaSanchez |
| `docs/architecture/model-data/es/` y `docs/architecture/model-data/en/` | HU-03 | JhonCamiloSuazaSanchez |
| `docs/entrega-base-datos/ADR/` | HU-04 | juanPabloGomezPerdomo |
| `entregables/estructura-base-datos/db-structure 1/docker/` | HU-06 | JhonCamiloSuazaSanchez |
| `entregables/estructura-base-datos/db-structure 1/changelog/`, `liquibase.properties` y `changelog/changelog-master.sql` | HU-07 | JhonCamiloSuazaSanchez |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/00_extensions` a `01_ddl/02_types` | HU-08 | DannaValentinaBarrios |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/` | HU-09 a HU-12 | DannaValentinaBarrios |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/04_views` a `01_ddl/06_functions` | HU-13 | juanPabloGomezPerdomo |
| `entregables/estructura-base-datos/db-structure 1/01_ddl/07_procedures` a `01_ddl/09_indexes` | HU-14 | DannaValentinaBarrios |
| `entregables/estructura-base-datos/db-structure 1/02_dml/00_inserts/` y DML complementario `01_updates/` a `04_patches/` | HU-15 a HU-18 | JohanStevenRodriguezCharr |
| `entregables/estructura-base-datos/db-structure 1/03_dcl/00_roles/` | HU-19 | JohanStevenRodriguezCharr |
| `entregables/estructura-base-datos/db-structure 1/03_dcl/01_grants` y `03_dcl/02_policies` | HU-20 y HU-21 | juanPabloGomezPerdomo |
| `entregables/estructura-base-datos/db-structure 1/04_tcl/` | HU-22 | JhonCamiloSuazaSanchez |
| `entregables/estructura-base-datos/db-structure 1/scripts/smoke-test.sql`, `entregables/estructura-base-datos/db-structure 1/scripts/ariel-ddl-permission-test.sql`, `entregables/estructura-base-datos/db-structure 1/scripts/load-postgres.ps1`, `orden_carga.md`, `guia_ejecucion_y_validacion.md`, `seguimientos.md` | HU-23 | juanPabloGomezPerdomo |

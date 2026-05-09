# ADR-009 - Plan de aplicacion de ingles tecnico

## Estado

Aprobado.

## Contexto

La base de datos se estandarizo en ingles tecnico para que los objetos SQL, changelogs, rollbacks, Docker, Liquibase y validaciones usen una misma convencion.

La documentacion original tenia nombres en espanol como `configuration`, `service_delivery`, `billing` y `hotel_system`. Mantener esos nombres en rutas tecnicas podia causar errores al ejecutar Liquibase o al revisar las HU.

## Decision

Usar nombres tecnicos en ingles para la base de datos y para las rutas ejecutables:

| Concepto anterior | Nombre tecnico vigente |
|---|---|
| `hotel_system` | `hotel_system` |
| `configuration` | `configuration` |
| `distribution` | `distribution` |
| `service_delivery` | `service_delivery` |
| `billing` | `billing` |
| `inventory` | `inventory` |
| `notification` | `notification` |
| `security` | `security` |
| `maintenance` | `maintenance` |

Los documentos formales de entrega deben apuntar a las rutas reales en ingles. Las notas internas o copias de apoyo pueden mantenerse en `_no_subir/`, pero no son la fuente principal para subir al repositorio.

## Consecuencias

- Liquibase ejecuta una sola estructura coherente.
- GitHub Actions valida el changelog principal sin rutas en espanol rotas.
- Los integrantes usan rutas reales al preparar cada HU.
- `ariel5253` se valida contra la base `hotel_system`.

## Criterio de cierre

La entrega se considera alineada cuando:

- `changelog/changelog-master.yaml` valida correctamente.
- No hay referencias rotas en `file:` ni `path:` de los changelogs.
- Los documentos de `docs/entrega-base-datos/` apuntan a rutas existentes o a rutas planeadas de HU de forma clara.
- `_no_subir/` conserva solamente instrucciones internas, respaldos o notas que no sean la unica copia de un entregable formal.

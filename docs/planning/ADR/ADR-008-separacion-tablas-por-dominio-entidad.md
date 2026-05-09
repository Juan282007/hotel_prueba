# ADR-008 - Separacion de tablas por dominio y entidad

## Estado

Aceptada.

## Contexto

La estructura anterior agrupaba todas las tablas de cada dominio en un solo archivo, por ejemplo `001_configuration.sql` o `002_security.sql`. Para facilitar revision, trazabilidad y autoria por changeSet, el equipo necesita una estructura mas granular.

## Decision

Las tablas quedan separadas en carpetas por dominio dentro de `01_ddl/03_tables/`. Cada entidad vive en su propio archivo SQL y cada dominio tiene un `changelog.yaml`.

Estructura definida:

```text
01_ddl/03_tables/
  changelog-master.yaml
  configuration/
    changelog.yaml
    001_customer.sql
    ...
  security/
    changelog.yaml
    001_role.sql
    ...
  distribution/
    changelog.yaml
    001_branch.sql
    ...
```

Los rollbacks quedan en estructura espejo:

```text
05_rollbacks/01_ddl/03_tables/<dominio>/<archivo>.rollback.sql
```

`01_ddl/changelog-master.yaml` incluye `03_tables/changelog-master.yaml`, y ese master incluye los 8 changelogs por dominio.

## Consecuencias

- La revision por HU queda mas clara porque cada entidad tiene archivo propio.
- DannaValentinaBarrios conserva el `author` de los changeSets de tablas.
- El orden de carga se controla desde los changelogs por dominio.
- Las constraints cruzadas se separan cuando una tabla depende de otra creada despues, como `distribution/007_fk_price_room_type.sql`.


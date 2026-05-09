\set ON_ERROR_STOP on

BEGIN;

SET ROLE ariel5253;

CREATE TABLE configuration.ariel_ddl_table_test (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(80) NOT NULL
);

INSERT INTO configuration.ariel_ddl_table_test (name) VALUES ('permission test');
UPDATE configuration.ariel_ddl_table_test SET name = 'permission test updated' WHERE id = 1;
DELETE FROM configuration.ariel_ddl_table_test WHERE id = 1;

CREATE INDEX ariel_ddl_table_test_name_idx
ON configuration.ariel_ddl_table_test (name);

CREATE VIEW configuration.ariel_ddl_view_test AS
SELECT id, name
FROM configuration.ariel_ddl_table_test;

CREATE MATERIALIZED VIEW configuration.ariel_ddl_mv_test AS
SELECT id, name
FROM configuration.ariel_ddl_table_test;

CREATE FUNCTION configuration.ariel_ddl_fn_test()
RETURNS integer
LANGUAGE sql
AS $$
  SELECT 1;
$$;

CREATE PROCEDURE configuration.ariel_ddl_proc_test()
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM 1;
END;
$$;

CREATE FUNCTION configuration.ariel_ddl_trigger_fn_test()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN NEW;
END;
$$;

CREATE TRIGGER ariel_ddl_trigger_test
BEFORE INSERT ON configuration.ariel_ddl_table_test
FOR EACH ROW
EXECUTE FUNCTION configuration.ariel_ddl_trigger_fn_test();

CREATE TRIGGER ariel_existing_table_trigger_test
BEFORE INSERT ON service_delivery.room_reservation
FOR EACH ROW
EXECUTE FUNCTION configuration.ariel_ddl_trigger_fn_test();

DO $$
BEGIN
  BEGIN
    EXECUTE 'ALTER TABLE service_delivery.room_reservation ADD COLUMN ariel_should_not_alter_existing integer';
    RAISE EXCEPTION 'ariel5253 unexpectedly altered an existing project table';
  EXCEPTION
    WHEN insufficient_privilege THEN
      RAISE NOTICE 'expected: ariel5253 cannot alter existing project tables he does not own';
  END;
END;
$$;

RESET ROLE;

ROLLBACK;

SELECT 'ariel_can_create_tables' AS check_name, 1 AS value;
SELECT 'ariel_can_create_indexes_on_own_tables' AS check_name, 1 AS value;
SELECT 'ariel_can_create_views' AS check_name, 1 AS value;
SELECT 'ariel_can_create_materialized_views' AS check_name, 1 AS value;
SELECT 'ariel_can_create_functions' AS check_name, 1 AS value;
SELECT 'ariel_can_create_procedures' AS check_name, 1 AS value;
SELECT 'ariel_can_create_triggers_on_existing_tables' AS check_name, 1 AS value;
SELECT 'ariel_cannot_alter_existing_project_tables' AS check_name, 1 AS value;

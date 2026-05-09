SELECT 'tables_created' AS check_name, COUNT(*) AS value
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

SELECT 'schemas_created' AS check_name, COUNT(*) AS value
FROM information_schema.schemata
WHERE schema_name IN (
  'configuration',
  'distribution',
  'service_delivery',
  'billing',
  'inventory',
  'notification',
  'security',
  'maintenance'
);

SELECT 'room_statuses' AS check_name, COUNT(*) AS value FROM distribution.room_status;
SELECT 'room_types' AS check_name, COUNT(*) AS value FROM distribution.room_type;
SELECT 'modules' AS check_name, COUNT(*) AS value FROM security.module;
SELECT 'app_user_ariel' AS check_name, COUNT(*) AS value FROM security.app_user WHERE username = 'ariel5253';

SELECT 'role_ariel_restricted' AS check_name, COUNT(*) AS value
FROM pg_roles
WHERE rolname = 'ariel5253'
  AND rolcanlogin
  AND NOT rolsuper
  AND NOT rolcreatedb
  AND NOT rolcreaterole;

SELECT 'role_ariel_evaluator' AS check_name,
  CASE WHEN pg_has_role('ariel5253', 'ddl_dml_evaluator', 'member') THEN 1 ELSE 0 END AS value;

SELECT 'ariel_can_dml' AS check_name,
  CASE WHEN has_table_privilege('ariel5253', 'service_delivery.room_reservation', 'INSERT')
    AND has_table_privilege('ariel5253', 'service_delivery.room_reservation', 'UPDATE')
    AND has_table_privilege('ariel5253', 'service_delivery.room_reservation', 'DELETE')
  THEN 1 ELSE 0 END AS value;

SELECT 'ariel_can_create_ddl_objects' AS check_name,
  CASE WHEN has_schema_privilege('ariel5253', 'configuration', 'CREATE') THEN 1 ELSE 0 END AS value;

SELECT 'ariel_can_create_triggers' AS check_name,
  CASE WHEN has_table_privilege('ariel5253', 'service_delivery.room_reservation', 'TRIGGER') THEN 1 ELSE 0 END AS value;

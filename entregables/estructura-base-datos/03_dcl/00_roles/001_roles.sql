DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'administrator') THEN
    CREATE ROLE administrator NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'developer') THEN
    CREATE ROLE developer NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'qa') THEN
    CREATE ROLE qa NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'ddl_dml_evaluator') THEN
    CREATE ROLE ddl_dml_evaluator NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'ariel5253') THEN
    CREATE ROLE ariel5253 LOGIN PASSWORD 'ariel5253';
  ELSE
    ALTER ROLE ariel5253 WITH LOGIN PASSWORD 'ariel5253';
  END IF;
END $$;

ALTER ROLE ariel5253 WITH
  LOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  INHERIT
  PASSWORD 'ariel5253';

ALTER ROLE ariel5253 SET search_path TO configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance, public;

REVOKE administrator FROM ariel5253;
REVOKE developer FROM ariel5253;
REVOKE qa FROM ariel5253;
GRANT ddl_dml_evaluator TO ariel5253;

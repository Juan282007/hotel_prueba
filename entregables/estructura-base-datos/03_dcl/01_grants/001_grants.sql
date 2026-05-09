REVOKE CONNECT ON DATABASE hotel_system FROM PUBLIC;
REVOKE CREATE ON DATABASE hotel_system FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM PUBLIC;

GRANT CONNECT ON DATABASE hotel_system TO administrator, developer, qa, ddl_dml_evaluator, ariel5253;
GRANT CREATE ON DATABASE hotel_system TO administrator, ddl_dml_evaluator;

GRANT USAGE ON SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO administrator, developer, qa, ddl_dml_evaluator;
GRANT CREATE ON SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO administrator, ddl_dml_evaluator;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO administrator;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO administrator;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security TO administrator;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO developer;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO developer;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security TO developer;

GRANT SELECT ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO qa;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security TO qa;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO ddl_dml_evaluator;
GRANT TRIGGER ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO ddl_dml_evaluator;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance TO ddl_dml_evaluator;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security TO ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT ALL PRIVILEGES ON TABLES TO administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT ALL PRIVILEGES ON SEQUENCES TO administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT SELECT ON TABLES TO qa;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT TRIGGER ON TABLES TO ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
GRANT USAGE, SELECT ON SEQUENCES TO ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security
GRANT EXECUTE ON FUNCTIONS TO ddl_dml_evaluator;

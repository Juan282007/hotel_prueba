REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance FROM administrator, developer, qa, ddl_dml_evaluator;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance FROM administrator, developer, qa, ddl_dml_evaluator;
REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security FROM administrator, developer, qa, ddl_dml_evaluator;
REVOKE TRIGGER ON ALL TABLES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance FROM ddl_dml_evaluator;
REVOKE CREATE ON SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance FROM administrator, ddl_dml_evaluator;
REVOKE USAGE ON SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance FROM administrator, developer, qa, ddl_dml_evaluator;
REVOKE CREATE ON DATABASE hotel_system FROM administrator, ddl_dml_evaluator;
REVOKE CONNECT ON DATABASE hotel_system FROM administrator, developer, qa, ddl_dml_evaluator, ariel5253;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE ALL PRIVILEGES ON TABLES FROM administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE ALL PRIVILEGES ON SEQUENCES FROM administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE SELECT ON TABLES FROM qa;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE SELECT, INSERT, UPDATE, DELETE ON TABLES FROM ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE TRIGGER ON TABLES FROM ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, distribution, service_delivery, billing, inventory, notification, security, maintenance
REVOKE USAGE, SELECT ON SEQUENCES FROM ddl_dml_evaluator;

ALTER DEFAULT PRIVILEGES IN SCHEMA configuration, service_delivery, billing, inventory, distribution, maintenance, security
REVOKE EXECUTE ON FUNCTIONS FROM ddl_dml_evaluator;

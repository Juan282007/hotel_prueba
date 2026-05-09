INSERT INTO security.role (name, description)
VALUES
  ('ADMINISTRATOR', 'General administrative access'),
  ('FRONT_DESK', 'Reservation, check-in, and check-out management'),
  ('MAINTENANCE', 'Operational maintenance management'),
  ('INVENTORY', 'Product, service, and supplier management')
ON CONFLICT (name) DO UPDATE
SET description = EXCLUDED.description;

INSERT INTO security.permission (name, description, action)
VALUES
  ('MANAGE_RESERVATION', 'Create, update, and view reservations', 'WRITE'),
  ('MANAGE_INVOICE', 'Issue and view invoices', 'WRITE'),
  ('MANAGE_INVENTORY', 'Manage products, services, and availability', 'WRITE'),
  ('MANAGE_MAINTENANCE', 'Manage room maintenance', 'WRITE'),
  ('VIEW_DASHBOARD', 'View operational information', 'READ')
ON CONFLICT (name, action) DO UPDATE
SET description = EXCLUDED.description;

INSERT INTO security.module (name, description, base_path)
VALUES
  ('CONFIGURATION', 'Base configuration for the hotel business', '/configuration'),
  ('DISTRIBUTION', 'Physical and commercial hotel structure', '/distribution'),
  ('SERVICE_DELIVERY', 'Reservations, availability, check-in, stays, and check-out', '/service-delivery'),
  ('BILLING', 'Pre-invoices, payments, invoices, and purchase details', '/billing'),
  ('INVENTORY', 'Products, services, suppliers, and availability', '/inventory'),
  ('NOTIFICATION', 'Promotions, alerts, terms, and loyalty', '/notification'),
  ('SECURITY', 'Users, roles, permissions, modules and screens', '/security'),
  ('MAINTENANCE', 'Maintenance and operational room availability', '/maintenance')
ON CONFLICT (name) DO UPDATE
SET description = EXCLUDED.description,
    base_path = EXCLUDED.base_path;

INSERT INTO security.app_user (person_id, username, password_hash)
SELECT p.id, 'ariel5253', crypt('ariel5253', gen_salt('bf'))
FROM configuration.person p
WHERE p.document_number = '52530001'
ON CONFLICT (username) DO UPDATE
SET password_hash = EXCLUDED.password_hash,
    locked = false,
    status = 'ACTIVE';

INSERT INTO security.app_user_role (app_user_id, role_id)
SELECT u.id, r.id
FROM security.app_user u
JOIN security.role r ON r.name = 'ADMINISTRATOR'
WHERE u.username = 'ariel5253'
ON CONFLICT (app_user_id, role_id) DO NOTHING;

INSERT INTO security.role_permission (role_id, permission_id)
SELECT r.id, p.id
FROM security.role r
CROSS JOIN security.permission p
WHERE r.name = 'ADMINISTRATOR'
ON CONFLICT (role_id, permission_id) DO NOTHING;


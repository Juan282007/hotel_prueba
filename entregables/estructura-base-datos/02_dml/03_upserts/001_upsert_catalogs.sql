INSERT INTO security.permission (name, description, action)
VALUES ('VIEW_RESERVATION', 'View reservations and availability', 'READ')
ON CONFLICT (name, action) DO UPDATE
SET description = EXCLUDED.description;

INSERT INTO inventory.service (name, description, sale_price, available)
VALUES ('Parking', 'Parking service per night', 15000, true)
ON CONFLICT (name) DO UPDATE
SET description = EXCLUDED.description,
    sale_price = EXCLUDED.sale_price,
    available = EXCLUDED.available;


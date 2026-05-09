INSERT INTO inventory.supplier (name, tax_id, phone, email, address)
VALUES ('Demo Supplier', '800000000-1', '3003334455', 'supplier@demo.local', 'Industrial area')
ON CONFLICT (tax_id) DO UPDATE
SET name = EXCLUDED.name,
    phone = EXCLUDED.phone,
    email = EXCLUDED.email,
    address = EXCLUDED.address;

INSERT INTO inventory.product (supplier_id, name, description, sale_price, current_stock, minimum_stock)
SELECT p.id, 'Mineral water', '600ml water bottle', 5000, 30, 5
FROM inventory.supplier p
WHERE p.tax_id = '800000000-1'
ON CONFLICT (name) DO UPDATE
SET supplier_id = EXCLUDED.supplier_id,
    description = EXCLUDED.description,
    sale_price = EXCLUDED.sale_price,
    current_stock = EXCLUDED.current_stock,
    minimum_stock = EXCLUDED.minimum_stock;

INSERT INTO inventory.service (name, description, sale_price, available)
VALUES
  ('Laundry', 'Laundry service per item', 12000, true),
  ('Breakfast', 'Additional breakfast per person', 18000, true)
ON CONFLICT (name) DO UPDATE
SET description = EXCLUDED.description,
    sale_price = EXCLUDED.sale_price,
    available = EXCLUDED.available;

INSERT INTO inventory.inventory_availability (product_id, available_quantity, available, note)
SELECT p.id, p.current_stock, true, 'Initial availability'
FROM inventory.product p
WHERE p.name = 'Mineral water'
  AND NOT EXISTS (
    SELECT 1
    FROM inventory.inventory_availability di
    WHERE di.product_id = p.id
  );


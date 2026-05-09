DELETE FROM inventory.inventory_availability;
DELETE FROM inventory.service WHERE name IN ('Laundry', 'Breakfast', 'Parking');
DELETE FROM inventory.product WHERE name = 'Mineral water';
DELETE FROM inventory.supplier WHERE tax_id = '800000000-1';

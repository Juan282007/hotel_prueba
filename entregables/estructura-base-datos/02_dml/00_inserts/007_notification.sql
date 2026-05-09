INSERT INTO notification.terms_condition (title, content, version, effective_date, mandatory)
VALUES ('Base reservation terms', 'Initial terms pending legal approval.', 'v1.0.0', DATE '2026-01-01', true)
ON CONFLICT (version) DO UPDATE
SET content = EXCLUDED.content,
    effective_date = EXCLUDED.effective_date,
    mandatory = EXCLUDED.mandatory;

INSERT INTO notification.customer_loyalty (customer_id, level, points, last_interaction_at, note)
SELECT c.id, 'BASIC', 0, now(), 'Customer created as reference data'
FROM configuration.customer c
WHERE c.document_number = '100000001'
ON CONFLICT (customer_id) DO UPDATE
SET level = EXCLUDED.level,
    points = EXCLUDED.points,
    last_interaction_at = EXCLUDED.last_interaction_at,
    note = EXCLUDED.note;

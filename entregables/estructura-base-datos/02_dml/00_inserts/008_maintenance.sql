INSERT INTO maintenance.maintenance_dashboard (
  branch_id,
  total_rooms,
  available_rooms,
  occupied_rooms,
  maintenance_rooms
)
SELECT
  s.id,
  COUNT(h.id),
  COUNT(*) FILTER (WHERE eh.name = 'AVAILABLE'),
  COUNT(*) FILTER (WHERE eh.name = 'OCCUPIED'),
  COUNT(*) FILTER (WHERE eh.name = 'MAINTENANCE')
FROM distribution.branch s
LEFT JOIN distribution.room h ON h.branch_id = s.id
LEFT JOIN distribution.room_status eh ON eh.id = h.room_status_id
WHERE NOT EXISTS (
  SELECT 1
  FROM maintenance.maintenance_dashboard dm
  WHERE dm.branch_id = s.id
)
GROUP BY s.id;

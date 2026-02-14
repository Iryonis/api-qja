-- Test data for easy testing

-- Insert accompaniments
INSERT INTO items (name, category_id, weight) VALUES
  ('Rice', 6, 8),
  ('Fries', 6, 9),
  ('Béchamel sauce', 6, 6),
  ('Green salad', 6, 7),
  ('Croutons', 6, 5),
  ('Vinaigrette', 6, 4),
  ('Pasta', 6, 8),
  ('Roasted vegetables', 6, 7)
ON CONFLICT DO NOTHING;

-- Insert dishes
INSERT INTO items (name, category_id, weight, last_date) VALUES
  ('Veal blanquette', 2, 7, '2026-02-10'),
  ('Coq au vin', 3, 8, '2026-02-12'),
  ('Mixed salad', 1, 6, '2026-02-13'),
  ('Apple tart', 5, 5, '2026-02-08'),
  ('Ratatouille', 2, 4, '2026-02-05'),
  ('Beef rib', 4, 9, '2026-01-20'),
  ('Omelette', 2, 3, '2026-02-11'),
  ('Strawberry tart', 5, 8, '2026-01-15')
ON CONFLICT DO NOTHING;

-- Create item <-> accompaniment pairings
-- Veal blanquette (id 11) + Rice (id 1) + Fries (id 2) + Béchamel sauce (id 3)
INSERT INTO item_pairings (item_id, accompaniment_id) VALUES
  (11, 1),
  (11, 2),
  (11, 3)
ON CONFLICT DO NOTHING;

-- Coq au vin (id 12) + Pasta (id 7) + Béchamel sauce (id 3)
INSERT INTO item_pairings (item_id, accompaniment_id) VALUES
  (12, 7),
  (12, 3)
ON CONFLICT DO NOTHING;

-- Mixed salad (id 13) + Vinaigrette (id 6) + Croutons (id 5)
INSERT INTO item_pairings (item_id, accompaniment_id) VALUES
  (13, 6),
  (13, 5)
ON CONFLICT DO NOTHING;

-- Ratatouille (id 15) + Pasta (id 7)
INSERT INTO item_pairings (item_id, accompaniment_id) VALUES
  (15, 7)
ON CONFLICT DO NOTHING;

-- Beef rib (id 16) + Fries (id 2) + Green salad (id 4)
INSERT INTO item_pairings (item_id, accompaniment_id) VALUES
  (16, 2),
  (16, 4)
ON CONFLICT DO NOTHING;

-- Add seasons
-- Veal blanquette: September to December
INSERT INTO seasons (item_id, month) VALUES
  (11, 9), (11, 10), (11, 11), (11, 12)
ON CONFLICT DO NOTHING;

-- Coq au vin: October to March
INSERT INTO seasons (item_id, month) VALUES
  (12, 10), (12, 11), (12, 12), (12, 1), (12, 2), (12, 3)
ON CONFLICT DO NOTHING;

-- Mixed salad: May to September
INSERT INTO seasons (item_id, month) VALUES
  (13, 5), (13, 6), (13, 7), (13, 8), (13, 9)
ON CONFLICT DO NOTHING;

-- Ratatouille: June to September
INSERT INTO seasons (item_id, month) VALUES
  (15, 6), (15, 7), (15, 8), (15, 9)
ON CONFLICT DO NOTHING;

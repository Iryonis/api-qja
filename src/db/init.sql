-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Create items table (dishes + accompaniments)
CREATE TABLE IF NOT EXISTS items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL REFERENCES categories(id) ON DELETE RESTRICT,
  weight FLOAT NOT NULL DEFAULT 5 CHECK (weight >= 0 AND weight <= 10),
  last_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create item_pairings table (link dish <-> accompaniment)
CREATE TABLE IF NOT EXISTS item_pairings (
  id SERIAL PRIMARY KEY,
  item_id INT NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  accompaniment_id INT REFERENCES items(id) ON DELETE CASCADE,
  UNIQUE(item_id, accompaniment_id)
);

-- Create seasons table (optional)
CREATE TABLE IF NOT EXISTS seasons (
  id SERIAL PRIMARY KEY,
  item_id INT NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  month INT NOT NULL CHECK (month >= 1 AND month <= 12),
  UNIQUE(item_id, month)
);

-- Insert fixed categories
INSERT INTO categories (name) VALUES
  ('Starter'),
  ('Dish'),
  ('Weekend Dish'),
  ('Special Dish'),
  ('Dessert'),
  ('Accompaniment')
ON CONFLICT (name) DO NOTHING;

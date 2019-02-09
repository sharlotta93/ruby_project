DROP TABLE products;
DROP TABLE categories;
DROP TABLE suppliers;


CREATE TABLE categories(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  payment_method VARCHAR(255)
);

CREATE TABLE products(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  unit INT,
  min_units_required INT,
  buying_cost FLOAT(20),
  selling_price FLOAT(20),
  description TEXT,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE,
  supplier_id INT8 REFERENCES suppliers(id) ON DELETE CASCADE
);

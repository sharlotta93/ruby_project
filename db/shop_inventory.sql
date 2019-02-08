DROP TABLE products;
DROP TABLE categories;
DROP TABLE suppliers;


CREATE TABLE categories(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE products(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  unit VARCHAR(255),
  min_units_required INT,
  buying_cost INT,
  selling_cost INT,
  description TEXT,
  category_id INT8 REFERENCES categories(id),
  supplier_id INT8 REFERENCES suppliers(id)
);

-- SQL-команды для создания таблиц
CREATE TABLE customers (
  customer_id VARCHAR(50) NOT NULL PRIMARY KEY,
  company_name VARCHAR(100) NOT NULL,
  contact_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  title VARCHAR(100),
  birth_date DATE,
  notes TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
	customer_id VARCHAR(50) REFERENCES customers(customer_id),
	employee_id INT REFERENCES employees(employee_id),
    order_date DATE NOT NULL,
    ship_city VARCHAR(50) NOT NULL
);

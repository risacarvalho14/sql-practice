-- Setup script: creates and populates practice tables
-- Run this once against a new database (e.g. practice.db)
CREATE DATABASE practice;
GO
USE practice;
GO
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- ========== EMPLOYEES (for joins, window functions) ==========
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    salary INTEGER NOT NULL,
    manager_id INTEGER
);

INSERT INTO employees (id, name, department, salary, manager_id) VALUES
(1, 'Sarah Chen', 'Engineering', 95000, NULL),
(2, 'Mike Ross', 'Engineering', 105000, 1),
(3, 'Priya Patel', 'Engineering', 88000, 1),
(4, 'Tom Nguyen', 'Sales', 72000, NULL),
(5, 'Lisa Wong', 'Sales', 80000, 4),
(6, 'James Kim', 'Sales', 65000, 4),
(7, 'Anna Silva', 'Marketing', 70000, NULL),
(8, 'Carlos Diaz', 'Marketing', 75000, 7),
(9, 'Emma Brown', 'Marketing', 68000, 7),
(10, 'David Lee', 'Engineering', 110000, 1);

-- ========== PRODUCTS (for aggregations, subqueries) ==========
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL
);

INSERT INTO products (id, name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 25),
(3, 'Keyboard', 'Electronics', 45),
(4, 'Desk Chair', 'Furniture', 180),
(5, 'Standing Desk', 'Furniture', 350),
(6, 'Bookshelf', 'Furniture', 120),
(7, 'Notebook', 'Stationery', 3),
(8, 'Pen Set', 'Stationery', 8),
(9, 'Monitor', 'Electronics', 300.5),
(10, 'Desk Lamp', 'Furniture', 40);

-- ========== CUSTOMERS (for joins) ==========
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

INSERT INTO customers (id, name, city) VALUES
(1, 'Alice Johnson', 'Toronto'),
(2, 'Ben Carter', 'Vancouver'),
(3, 'Chloe Martin', 'Toronto'),
(4, 'Daniel Wu', 'Calgary'),
(5, 'Elena Rossi', 'Toronto');
-- Note: customer 5 (Elena) has never placed an order — used for question 2

-- ========== ORDERS (for joins, aggregations, window functions) ==========
CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    order_date VARCHAR(100) NOT NULL,   -- format: 'YYYY-MM-DD'
    amount FLOAT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO orders (id, customer_id, product_id, order_date, amount) VALUES
(1, 1, 1, '2025-01-05', 1200),
(2, 1, 2, '2025-02-10', 25),
(3, 2, 4, '2025-01-15', 180),
(4, 3, 9, '2025-03-01', 300),
(5, 1, 3, '2025-03-20', 45),
(6, 4, 5, '2025-02-25', 350),
(7, 2, 7, '2025-04-05', 3),
(8, 3, 1, '2025-04-10', 1200),
(9, 1, 9, '2025-05-01', 300),
(10, 4, 8, '2025-05-15', 8),
(11, 1, 4, '2025-06-01', 180),
(12, 3, 6, '2025-06-10', 120);
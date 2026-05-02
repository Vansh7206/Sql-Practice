CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- Departments
INSERT INTO departments VALUES
(1, 'Engineering', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'HR', 'Pune'),
(4, 'Marketing', 'Mumbai'),
(5, 'Operations', 'Bangalore');

-- Employees
INSERT INTO employees VALUES
(1,  'Vansh',   'Mumbai', 1,  95000,  '2021-03-15'),
(2,  'Raj',     'Delhi',  2,  82000,  '2019-07-01'),
(3,  'Priya',   'Mumbai', 1,  110000, '2018-11-20'),
(4,  'Amit',    'Pune',   3,  60000,  '2022-01-10'),
(5,  'Sara',    'Delhi',  2,  75000,  '2020-05-18'),
(6,  'Karan',   'Mumbai', 4,  68000,  '2023-02-28'),
(7,  'Neha',    'Pune',   3,  55000,  '2021-09-05'),
(8,  'Rohan',   'Mumbai', 1,  120000, '2017-04-12'),
(9,  'Meera',   'Delhi',  2,  90000,  '2019-12-01'),
(10, 'Arjun',   'Pune',   NULL, NULL, '2023-06-15'),
(11, 'Divya',   'Mumbai', 4,  72000,  '2020-08-22'),
(12, 'Suresh',  'Pune',   3,  58000,  '2022-11-30');

-- Customers
INSERT INTO customers VALUES
(1, 'Ananya',  'ananya@gmail.com',   'Mumbai', '2021-03-10'),
(2, 'Bharat',  'bharat@yahoo.com',   'Delhi',  '2020-07-22'),
(3, 'Charu',   'charu@gmail.com',    'Pune',   '2022-01-15'),
(4, 'Deepak',  'deepak@gmail.com',   'Mumbai', '2019-11-05'),
(5, 'Esha',    'esha@outlook.com',   'Delhi',  '2023-04-18'),
(6, 'Farhan',  'farhan@gmail.com',   'Pune',   '2021-09-30'),
(7, 'Gauri',   'gauri@gmail.com',    'Mumbai', '2018-06-14'),
(8, 'Harsh',   'harsh@yahoo.com',    'Delhi',  '2022-12-01'),
(9, 'Isha',    'isha@gmail.com',     'Pune',   '2020-03-27'),
(10,'Jay',     'jay@gmail.com',      'Mumbai', '2023-08-09');

-- Products
INSERT INTO products VALUES
(1,  'Office Chair',     'Furniture',    8500),
(2,  'Standing Desk',    'Furniture',    22000),
(3,  'Laptop',           'Electronics',  75000),
(4,  'Mechanical Keyboard', 'Electronics', 4500),
(5,  'Monitor',          'Electronics',  18000),
(6,  'Notebook Pack',    'Stationery',   350),
(7,  'Pen Set',          'Stationery',   150),
(8,  'Whiteboard',       'Furniture',    3200),
(9,  'Webcam',           'Electronics',  2800),
(10, 'Sticky Notes',     'Stationery',   120),
(11, 'Gaming Chair',     'Furniture',    15000),
(12, 'USB Hub',          'Electronics',  1200);

-- Orders
INSERT INTO orders VALUES
(1,  1,  '2023-02-14', 'Delivered'),
(2,  2,  '2023-05-20', 'Delivered'),
(3,  3,  '2023-08-11', 'Cancelled'),
(4,  4,  '2023-11-03', 'Delivered'),
(5,  1,  '2024-01-25', 'Pending'),
(6,  5,  '2024-02-18', 'Delivered'),
(7,  6,  '2024-03-07', 'Shipped'),
(8,  2,  '2024-04-15', 'Delivered'),
(9,  7,  '2024-05-22', 'Pending'),
(10, 3,  '2024-06-30', 'Delivered'),
(11, 8,  '2024-07-14', 'Cancelled'),
(12, 4,  '2024-08-09', 'Delivered'),
(13, 9,  '2024-09-01', 'Shipped'),
(14, 1,  '2024-10-17', 'Delivered');

-- Order Items
INSERT INTO order_items VALUES
(1,  1,  3,  1,  75000),
(2,  1,  4,  2,  4500),
(3,  2,  1,  2,  8500),
(4,  3,  6,  5,  350),
(5,  4,  2,  1,  22000),
(6,  5,  5,  1,  18000),
(7,  6,  9,  3,  2800),
(8,  7,  7,  10, 150),
(9,  8,  11, 1,  15000),
(10, 9,  8,  1,  3200),
(11, 10, 12, 4,  1200),
(12, 11, 10, 20, 120),
(13, 12, 3,  1,  75000),
(14, 13, 4,  1,  4500),
(15, 14, 5,  2,  18000);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 75000, 10),
(2, 'Phone', 'Electronics', 30000, 25),
(3, 'Shirt', 'Clothing', 1500, 100),
(4, 'Jeans', 'Clothing', 2500, 60),
(5, 'Headphones', 'Electronics', 5000, 40),
(6, 'Notebook', 'Stationery', 200, 200),
(7, 'Pen', 'Stationery', 50, 500),
(8, 'Shoes', 'Clothing', 3500, 30);

INSERT INTO customers VALUES
(1, 'Vansh', 'Mumbai', 20),
(2, 'Raj', 'Delhi', 25),
(3, 'Priya', 'Mumbai', 22),
(4, 'Amit', 'Pune', 30),
(5, 'Sara', 'Delhi', 28),
(6, 'Karan', 'Mumbai', 35),
(7, 'Neha', 'Pune', 24);

INSERT INTO orders VALUES
(1, 1, 1, 1, '2024-01-15'),
(2, 1, 3, 2, '2024-01-20'),
(3, 2, 2, 1, '2024-02-01'),
(4, 3, 5, 2, '2024-02-15'),
(5, 4, 4, 3, '2024-03-01'),
(6, 5, 6, 5, '2024-03-10'),
(7, 1, 2, 1, '2024-03-15'),
(8, 6, 8, 1, '2024-04-01'),
(9, 3, 3, 3, '2024-04-10'),
(10, 2, 7, 10, '2024-04-15'),
(11, 7, 1, 1, '2024-04-20'),
(12, 4, 5, 1, '2024-05-01');
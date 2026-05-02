--BASICS — 10 Questions:

--Show all products with price greater than 2000.
SELECT PRODUCT_NAME FROM PRODUCTS WHERE PRICE > 2000;

--Show all customers from Mumbai.
SELECT name FROM CUSTOMERS WHERE CITY = 'Mumbai';

--Show product name and price of all Electronics, sorted by price descending.
SELECT PRODUCT_NAME,PRICE FROM PRODUCTS
WHERE CATEGORY = 'Electronics'
ORDER BY PRICE DESC;

--Show all orders placed in March 2024.
SELECT * FROM ORDERS
WHERE ORDER_DATE IN ('01-03-2024','31-03-2024');

--Show all products where stock is less than 50.
SELECT PRODUCT_NAME FROM PRODUCTS
WHERE STOCK < 50;

--Show customer names and cities, sorted alphabetically by name.
SELECT NAME,CITY FROM CUSTOMERS
ORDER BY NAME;

--Show all products whose name starts with the letter 'S'.
SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'S%';

--Show all orders where quantity is between 2 and 5.
SELECT * FROM ORDERS
WHERE QUANTITY BETWEEN 2 AND 5;

--Show unique cities where customers live.
SELECT DISTINCT(CITY) FROM CUSTOMERS
GROUP BY CITY;

--Show all products where category is either Clothing or Stationery.
SELECT * FROM PRODUCTS
WHERE CATEGORY IN ('Clothing','Stationery');

--AGGREGATIONS — 10 Questions:

--Count total number of orders.
SELECT COUNT(*) FROM ORDERS;

--Find the average price of all products.
SELECT AVG(PRICE) FROM PRODUCTS;

--Find the total stock available across all products.
SELECT SUM(STOCK) FROM PRODUCTS;

--Show the number of products in each category.
SELECT CATEGORY,COUNT(*) FROM PRODUCTS
GROUP BY CATEGORY;

--Find the most expensive product in each category.
SELECT CATEGORY,MAX(PRICE) FROM PRODUCTS
GROUP BY CATEGORY;

--Show total quantity ordered per product.
SELECT PRODUCT_ID,COUNT(*) FROM PRODUCTS
GROUP BY PRODUCT_ID;

--Find categories where average price is above 5000.
SELECT CATEGORY, AVG(PRICE)
FROM PRODUCTS
GROUP BY CATEGORY
HAVING AVG(PRICE) > 5000;

--Show the total number of customers per city.
SELECT CITY,COUNT(*) FROM CUSTOMERS
GROUP BY CITY;

--Find the month with the highest number of orders.
SELECT EXTRACT(MONTH FROM order_date) AS order_month, COUNT(*) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY total_orders DESC
LIMIT 1;

--Show products that have been ordered more than 3 times total quantity wise.
SELECT PRODUCT_ID FROM ORDERS
GROUP BY PRODUCT_ID
HAVING SUM(QUANTITY) > 3;

--JOINS + SUBQUERIES — 10 Questions:

--Show customer names and the products they ordered.
SELECT C.NAME,P.PRODUCT_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN PRODUCTS P
ON O.PRODUCT_ID = P.PRODUCT_ID;

--Show all customers even if they haven't placed any orders.
SELECT c.name, p.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN products p ON o.product_id = p.product_id;

--Show product names and total revenue generated per product. (revenue = price × quantity)
SELECT P.PRODUCT_NAME,SUM(P.PRICE * O.QUANTITY) AS REVENUE
FROM PRODUCTS P
LEFT JOIN ORDERS O
ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_ID;

--Show names of customers who ordered Electronics.
SELECT C.NAME FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN PRODUCTS P
ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE P.CATEGORY = 'Electronics';

--Show products that have never been ordered.
SELECT P.PRODUCT_NAME 
FROM PRODUCTS P
LEFT JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.PRODUCT_ID IS NULL;

--Show names of customers who spent more than the average order value.
SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING SUM(p.price * o.quantity) > (
    SELECT AVG(p2.price * o2.quantity)
    FROM orders o2
    JOIN products p2 ON o2.product_id = p2.product_id
);

--Show the most expensive product ordered by each customer.
SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING SUM(p.price * o.quantity) > (
    SELECT AVG(p2.price * o2.quantity)
    FROM orders o2
    JOIN products p2 ON o2.product_id = p2.product_id
);

--Show customer names who ordered the same product as Vansh.
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.product_id IN (
    SELECT product_id FROM orders
    WHERE customer_id = (
        SELECT customer_id FROM customers WHERE name = 'Vansh'
    )
)
AND c.name != 'Vansh';

--Show products whose price is above the average price of their own category.
SELECT product_name, price
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

--Show customers who have placed more than 2 orders.
SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 2;
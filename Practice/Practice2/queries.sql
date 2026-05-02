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
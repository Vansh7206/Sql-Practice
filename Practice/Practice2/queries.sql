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
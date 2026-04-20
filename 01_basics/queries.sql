-- Q1: Select all customers from Mumbai
SELECT * FROM CUSTOMERS
WHERE CITY = 'Mumbai';

-- Q2: Get name and age of customers older than 25
SELECT NAME, AGE
FROM CUSTOMERS
WHERE AGE > 25;

-- Q3: Find customers who signed up in 2023
SELECT * FROM CUSTOMERS
WHERE SIGNUP_DATE >= '2023-01-01';

-- Q4: Get all customers sorted by age descending
SELECT * FROM CUSTOMERS
ORDER BY AGE DESC;

-- Q5: Find customers whose name starts with 'A'
SELECT * FROM CUSTOMERS
WHERE NAME LIKE'A%';

-- Q6: Get distinct cities from the customers table
SELECT DISTINCT(CITY) FROM CUSTOMERS;

-- Q7: Count total number of customers
SELECT COUNT(*) FROM CUSTOMERS;

-- Q8: Get the 5 youngest customers
SELECT * FROM CUSTOMERS
ORDER BY AGE LIMIT 5;

-- Q9: Find all orders with amount greater than 20000
SELECT * FROM ORDERS
WHERE AMOUNT > 20000;

-- Q10: Get orders that are not 'Delivered'
SELECT * FROM ORDERS
WHERE STATUS != 'Cancelled';
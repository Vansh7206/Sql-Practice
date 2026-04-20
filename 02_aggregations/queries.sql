-- Q1: Total revenue from all delivered orders
SELECT SUM(AMOUNT) AS TOTAL_REVENUE
FROM ORDERS 
WHERE STATUS = 'Delivered';

-- Q2: Average order amount per city (join needed)
SELECT C.CITY,AVG(O.AMOUNT)
FROM CUSTOMERS C
jOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CITY;

-- Q3: Count of orders per status
SELECT STATUS, COUNT(*)
FROM ORDERS
GROUP BY STATUS;

-- Q4: Maximum and minimum order amount
SELECT MAX(AMOUNT) AS MAX_AMT, MIN(AMOUNT) AS MIN_AMT
FROM ORDERS;

-- Q5: Total amount spent by each customer
SELECT CUSTOMER_ID, SUM(AMOUNT)
FROM ORDERS
GROUP BY CUSTOMER_ID;

-- Q6: Which city has the most customers?
SELECT CITY,COUNT(CITY) AS COUNTING
FROM CUSTOMERS
GROUP BY CITY
ORDER BY COUNTING DESC limit 1;

-- Q7: Average age of customers per city
SELECT CITY,AVG(AGE)
FROM CUSTOMERS
GROUP BY CITY;

-- -- Q8: How many orders were placed each month?
SELECT EXTRACT(MONTH FROM order_date) AS month, COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY month;

-- Q9: Customers who have placed more than 2 orders
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

-- Q10: Top 5 customers by total spend
SELECT CUSTOMER_ID,SUM(AMOUNT) AS TOTAL
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY TOTAL DESC LIMIT 5;


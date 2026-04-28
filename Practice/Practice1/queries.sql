-- Q1. Get all employees who work in Mumbai.
SELECT * FROM EMPLOYEES
WHERE CITY = 'Mumbai';

-- Q2. List all employees ordered by salary from highest to lowest.
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

-- Q3. Show the top 5 highest paid employees (just their name and salary).
SELECT NAME,SALARY FROM EMPLOYEES
ORDER BY SALARY DESC LIMIT 5;

-- Q4. Find all products that have "Chair" in their name.
SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Chair%';

-- Q5. Get all orders that were placed in 2023.
SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-01-01' AND '2024-01-01';

-- Q6. List all customers whose email ends with @gmail.com.
SELECT * FROM CUSTOMERS
WHERE EMAIL LIKE '%@gmail.com';

-- Q7. Find all employees who were hired before 2020.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE < '2020-01-01';

-- Q8. Show all products where price is between 2000 and 25000.
SELECT * FROM PRODUCTS
WHERE PRICE BETWEEN 2000 AND 25000;

-- Q9. Get all employees where salary is NULL.
SELECT * FROM EMPLOYEES
WHERE SALARY IS NULL;

-- Q10. List all employees from Mumbai OR Pune, ordered by name alphabetically.
SELECT * FROM EMPLOYEES
WHERE CITY IN ('Mumbai','Pune');

-- Q11. Count the total number of employees in each department. Show dept_id and count.
SELECT DEPT_ID,COUNT(*) FROM EMPLOYEES
GROUP BY DEPT_ID;

-- Q12. Find the average salary per department. Round to 2 decimal places.
SELECT DEPT_ID,ROUND(AVG(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPT_ID;

-- Q13. What is the total revenue generated from all order_items? (quantity × unit_price)
SELECT SUM(QUANTITY * UNIT_PRICE) AS REVENUE
FROM ORDER_ITEMS;

-- Q14. Find the number of orders each customer has placed. Show customer_id and order count.
SELECT CUSTOMER_ID, COUNT(*)
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY CUSTOMER_ID;  --For better readability

-- Q15. Which product categories have more than 2 products?
SELECT CATEGORY, COUNT(*) 
FROM PRODUCTS
GROUP BY CATEGORY
HAVING COUNT(*) > 2;

-- Q16. Find the maximum and minimum salary across all employees.
SELECT MAX(SALARY) AS MAX_SAL, MIN(SALARY) AS MIN_SAL
FROM EMPLOYEES;

-- Q17. How many orders have status = 'Delivered' vs others? Group by status.
SELECT STATUS,COUNT(*)
FROM ORDERS
GROUP BY STATUS;

-- Q18. Find all departments where the average salary is greater than 70000.
SELECT DEPT_ID, ROUND(AVG(SALARY), 2)
FROM EMPLOYEES
GROUP BY DEPT_ID
HAVING AVG(SALARY) > 70000;

-- Q19. What is the total quantity sold per product? (from order_items) Show product_id and total quantity.
SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM ORDER_ITEMS
GROUP BY PRODUCT_ID;

--Q20. Count how many customers signed up each year.
SELECT EXTRACT(YEAR FROM SIGNUP_DATE) AS SIGNUP_YEAR, COUNT(*)
FROM CUSTOMERS
GROUP BY EXTRACT(YEAR FROM SIGNUP_DATE);

-- Q21. Show each employee's name along with their department name. (INNER JOIN)
SELECT E.NAME, D.DEPT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID;

--Q22. List all employees including those who don't belong to any department. Show dept_name as NULL where missing. (LEFT JOIN)
SELECT E.NAME, D.DEPT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPT_ID = D.DEPT_ID;

-- Q23. Show all departments including those with no employees. (RIGHT JOIN or LEFT JOIN flipped)
SELECT D.DEPT_NAME, E.NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPT_ID = E.DEPT_ID;

-- Q24. Get each order along with the customer's name who placed it.
SELECT O.ORDER_ID, C.NAME
FROM ORDERS O
LEFT JOIN CUSTOMERS C 
ON O.CUSTOMER_ID = C.CUSTOMER_ID;

--Q25. Show all customers and their orders — include customers who have never placed an order.
SELECT C.NAME, O.ORDER_ID, O.ORDER_DATE, O.STATUS
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--Q26. For each order item, show the product name, quantity, and unit price.
SELECT P.PRODUCT_NAME,O.QUANTITY,O.UNIT_PRICE
FROM PRODUCTS P
JOIN ORDER_ITEMS O
ON P.PRODUCT_ID = O.PRODUCT_ID;

--Q27. Get each employee's name, department name, and city — only for employees in the Engineering or Finance department.
SELECT E.NAME,D.DEPT_NAME,E.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D 
ON E.DEPT_ID = D.DEPT_ID
where D.DEPT_NAME IN ('Engineering','Finance');

--Q28. List all orders with customer name and order status — only for 'Delivered' orders.
SELECT C.NAME,O.STATUS
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.STATUS = 'Delivered';

--Q29. Show product name and total revenue per product (quantity × unit_price from order_items). (JOIN + GROUP BY)
SELECT P.PRODUCT_NAME,SUM(O.QUANTITY * O.UNIT_PRICE) AS REV
FROM PRODUCTS P
JOIN ORDER_ITEMS O
ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_NAME;

--Q30. Full picture: For each customer, show their name, total number of orders, and total amount spent. Include customers with 0 orders too.
SELECT C.NAME, COUNT(O.ORDER_ID), SUM(OI.QUANTITY * OI.UNIT_PRICE)
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
GROUP BY C.NAME;
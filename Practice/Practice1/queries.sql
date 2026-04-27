-- Q1. Get all employees who work in Mumbai.
SELECT * FROM EMPLOYEES
WHERE CITY LIKE 'Mumbai';

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
SELECT * FROM PRODUCTS
HAVING COUNT(CATEGORY) > 2;

-- Q16. Find the maximum and minimum salary across all employees.
SELECT MAX(SALARY) AS MAX_SAL, MIN(SALARY) AS MIN_SAL
FROM EMPLOYEES;

-- Q17. How many orders have status = 'Delivered' vs others? Group by status.
SELECT STATUS,COUNT(*)
FROM ORDERS
GROUP BY STATUS;

-- Q18. Find all departments where the average salary is greater than 70000.
SELECT * FROM EMPLOYEES
HAVING SALARY > AVG(SALARY)
GROUP BY DEPT_ID;

-- Q19. What is the total quantity sold per product? (from order_items) Show product_id and total quantity.
SELECT PRODUCT_ID,COUNT(*)
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
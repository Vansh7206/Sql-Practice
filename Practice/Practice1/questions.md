🟢 BASICS (Q1–Q10) — SELECT, WHERE, ORDER BY, LIMIT, LIKE
Q1. Get all employees who work in Mumbai.
Q2. List all employees ordered by salary from highest to lowest.
Q3. Show the top 5 highest paid employees (just their name and salary).
Q4. Find all products that have "Chair" in their name.
Q5. Get all orders that were placed in 2023.
Q6. List all customers whose email ends with @gmail.com.
Q7. Find all employees who were hired before 2020.
Q8. Show all products where price is between 2000 and 25000.
Q9. Get all employees where salary is NULL.
Q10. List all employees from Mumbai OR Pune, ordered by name alphabetically.

🟡 AGGREGATIONS (Q11–Q20) — SUM, AVG, COUNT, GROUP BY, HAVING
Q11. Count the total number of employees in each department. Show dept_id and count.
Q12. Find the average salary per department. Round to 2 decimal places.
Q13. What is the total revenue generated from all order_items? (quantity × unit_price)
Q14. Find the number of orders each customer has placed. Show customer_id and order count.
Q15. Which product categories have more than 2 products?
Q16. Find the maximum and minimum salary across all employees.
Q17. How many orders have status = 'Delivered' vs others? Group by status.
Q18. Find all departments where the average salary is greater than 70000.
Q19. What is the total quantity sold per product? (from order_items) Show product_id and total quantity.
Q20. Count how many customers signed up each year.

🔴 JOINS (Q21–Q30) — INNER, LEFT, RIGHT, FULL JOIN
Q21. Show each employee's name along with their department name. (INNER JOIN)
Q22. List all employees including those who don't belong to any department. Show dept_name as NULL where missing. (LEFT JOIN)
Q23. Show all departments including those with no employees. (RIGHT JOIN or LEFT JOIN flipped)
Q24. Get each order along with the customer's name who placed it.
Q25. Show all customers and their orders — include customers who have never placed an order.
Q26. For each order item, show the product name, quantity, and unit price.
Q27. Get each employee's name, department name, and city — only for employees in the Engineering or Finance department.
Q28. List all orders with customer name and order status — only for 'Delivered' orders.
Q29. Show product name and total revenue per product (quantity × unit_price from order_items). (JOIN + GROUP BY)
Q30. Full picture: For each customer, show their name, total number of orders, and total amount spent. Include customers with 0 orders too.
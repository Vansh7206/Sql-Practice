--Q1. Find employees who earn more than the average salary.
SELECT NAME,SALARY FROM EMPLOYEES2 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES2);

--Q2. Find employees who work in the same department as 'Neha Singh'.
SELECT NAME FROM EMPLOYEES2 WHERE DEPT_ID = (SELECT DEPT_ID FROM EMPLOYEES2 WHERE NAME = 'Neha Singh') AND NAME != 'Neha Singh';

--Q3. Find employees who work in departments with budget over 400000.
SELECT NAME FROM EMPLOYEES2 WHERE DEPT_ID IN (SELECT DEPT_ID FROM DEPARTMENTS2 WHERE BUDGET > 400000);

--Q4. Find the highest paid employee in each department using subquery in FROM.
SELECT e.name, e.salary, e.dept_id
FROM employees2 e
JOIN (SELECT dept_id, MAX(salary) AS max_sal FROM employees2 GROUP BY dept_id) AS dept_max
ON e.dept_id = dept_max.dept_id AND e.salary = dept_max.max_sal;

-- Q5. Find employees who earn more than the average salary of their own department.SELECT name, salary, dept_id
SELECT name, salary, dept_id
FROM employees2 e1
WHERE salary > (SELECT AVG(salary)FROM employees2 e2 WHERE e2.dept_id = e1.dept_id);
# SQL Correlated Subqueries

> Source: https://www.geeksforgeeks.org/sql/sql-correlated-subqueries/

A correlated subquery is a subquery that depends on values from the outer query and is executed once for each row processed by the outer query. The following steps explain the working of a correlated subquery
- Get a row from the outer query.
- Execute the subquery using values from that row.
- Use the result in the outer query.
Syntax:
SELECT column1, column2, ...
FROM table1 t1
WHERE column1 operator
(SELECT column
FROM table2
WHERE expr1 = t1.expr2);
Correlated Subquery Examples
Consider the following two tables for the examples below:
1. Fetching Data Based on Row-Specific Conditions
Correlated subqueries are often used when you need to filter data based on a condition that involves comparing values from the outer query.
Query:
SELECT last_name, salary, department_id
FROM employees AS outer
WHERE salary > (
SELECT AVG(salary)
FROM employees
WHERE department_id = outer.department_id
);
Output:
- Uses a subquery to calculate the department’s average salary for comparison.
2. Using Correlated Subqueries with UPDATE
Correlated subqueries can also be used with UPDATE statements to modify data based on related information from another table.
Query:
UPDATE employees
SET salary = ROUND(
(SELECT AVG(salary)
FROM employees
WHERE department_id = employees.department_id), 2
)
WHERE department_id = 101;
Output:
- Uses a subquery to calculate the average salary for each department and rounds it to two decimal places.
3. Using Correlated Subqueries with DELETE
We can use a correlated subquery within a DELETE statement to remove rows from one table based on conditions in another table.
Query:
DELETE FROM employees
WHERE employee_id IN (
SELECT employee_id
FROM employees
WHERE department_id = 101
);
Output:
- Uses a subquery to select the employee_ids of employees in department 101.
4. Using EXISTS with Correlated Subqueries
The EXISTS operator is often used in correlated subqueries to test if a subquery returns any rows. It returns TRUE if the subquery has at least one row.
Query:
SELECT e.employee_id, e.last_name, e.job_id, e.department_id
FROM employees e
WHERE EXISTS (
SELECT 1
FROM employees sub
WHERE sub.manager_id = e.employee_id
);
Output:
- Uses a subquery to check if any employee has manager_id matching the outer employee’s employee_id.
5. Using NOT EXISTS with Correlated Subqueries
The NOT EXISTS operator is used to check if a subquery does not return any rows. This is useful for finding records that do not match specific criteria.
Query:
SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (
SELECT 1
FROM employees e
WHERE e.department_id = d.department_id
);
Output:
- Uses a subquery to check for the absence of matching employees in each department.
Nested vs. Correlated Subqueries
| Nested (Non-Correlated) Subquery | Correlated Subquery | 
|---|---|
| Executes once before the outer query. | Executes for each row of the outer query. | 
| Independent of the outer query. | Dependent on values from the outer query. | 
| Usually more efficient for large datasets. | Can be slower as it runs multiple times. | 
| Example: WHERE col IN (SELECT col FROM table2) | Example: WHERE col > (SELECT AVG(col) FROM table 2 WHERE table2.id = outer.id) |

# SQL HAVING Clause

> Source: https://www.geeksforgeeks.org/sql/sql-having-clause-with-examples/

The SQL HAVING clause filters the results of grouped data after using the GROUP BY clause. It is used with aggregate functions such as SUM(), COUNT() or AVG() to display only those groups that meet specific conditions.
Example: First, we will create a demo SQL database and table, on which we will use the HAVING Clause command.
Query:
SELECT department, COUNT(emp_id) AS employee_Count
FROM employee
GROUP BY department
HAVING COUNT(emp_id) > 1;
Output:
Syntax
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
Note: When HAVING is used without GROUP BY, the entire table is treated as a single group. This works only with aggregate functions.
Examples of HAVING Clause
First, we create the employee table and insert sample data to demonstrate the HAVING clause.
Example 1: Filter Total salary
In this example, we calculate the total salary of all employee and display it only if it meets the specified condition.
Query:
SELECT SUM(salary) AS total_salary
FROM employee
GROUP BY (SELECT 1)
HAVING SUM(salary) >= 250000;
Output:
- SUM(salary) adds up salaries of all employee.
- GROUP BY (SELECT 1) treats the entire table as one single group.
- HAVING SUM(salary) >= 250000 filters the result and shows it only when the condition is met.
Note: GROUP BY (SELECT 1) is database-specific and may not work in all SQL databases. So alternatively, you can omit GROUP BY and use HAVING directly with aggregate functions.
Example 2: Filter Average salary
In this example, we calculate the average salary of all employee and display it only if the average exceeds 55,000.
Query:
SELECT department, AVG(salary) AS average_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 55000;
Output:
- GROUP BY department calculates average salary per department.
- AVG(salary) finds the department-wise average.
- HAVING AVG(salary) > 55000 shows only departments whose average salary exceeds 55,000.
Example 3: Filter Maximum salary
In this example, we find the highest salary among employee and display it only if it exceeds 70,000.
Query:
SELECT MAX(salary) AS max_salary
FROM employee
HAVING MAX(salary) > 70000;
Output:
Example 4: Filter Minimum Experience
In this example, we find the least experienced employee and display it only if their experience is less than 3 years.
Query:
SELECT MIN(experience) AS min_experience
FROM employee
HAVING MIN(experience) < 3;
Output:
Example 5: Multiple Conditions
In this example, we calculate both the total and average salary of employee and display the results only if the total salary is at least 250,000 and the average salary exceeds 55,000.
Query:
SELECT SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM employee
HAVING SUM(salary) >= 250000 AND AVG(salary) > 55000;
Output:

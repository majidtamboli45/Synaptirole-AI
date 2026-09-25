# Common Table Expression (CTE)

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-cte/

A Common Table Expression (CTE) is a temporary result set defined using the WITH clause. It simplifies complex queries by breaking them into smaller, readable and reusable parts. A CTE exists only for the duration of the query in which it is defined.
- Improve query readability and maintainability.
- Reuse intermediate query results.
- Organize multiple query operations efficiently.
Syntax
WITH cte_name [(column1, column2, ...)] AS (
query
)
SELECT *
FROM cte_name;
Where:
- WITH: Defines a Common Table Expression.
- cte_name: The name of the temporary result set.
- AS: Associates the CTE name with a query.
- Main Query: Uses the CTE like a regular table.
Example Table
Example 1: Basic CTE
The following query creates a CTE to retrieve employees from the HR department.
Query:
WITH hr_employees AS (
SELECT EmployeeName,
Salary
FROM Employees
WHERE Department = 'HR'
)
SELECT *
FROM hr_employees;
Output:
Example 2: CTE with Aggregation
The following query calculates the average salary for each department.
Query:
WITH department_salary AS (
SELECT Department,
AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department
)
SELECT *
FROM department_salary;
Output:
Example 3: Multiple CTEs
The following query uses two CTEs to calculate the highest and lowest employee salaries.
Query:
WITH max_salary AS (
SELECT MAX(Salary) AS HighestSalary
FROM Employees
),
min_salary AS (
SELECT MIN(Salary) AS LowestSalary
FROM Employees
)
SELECT
(SELECT HighestSalary FROM max_salary) AS HighestSalary,
(SELECT LowestSalary FROM min_salary) AS LowestSalary;
Output:
Advantages of CTEs
- Improve the readability of complex SQL queries.
- Make queries easier to maintain and debug.
- Support recursive queries for hierarchical data.
- Work effectively with aggregate and window functions.

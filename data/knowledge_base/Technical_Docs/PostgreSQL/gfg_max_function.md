# MAX() Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-max-function/

The MAX() function in PostgreSQL returns the highest value from a column. It can be used with numeric, date, and text data types. MAX() ignores NULL values.
- Retrieve the latest date or maximum text value.
- Use with GROUP BY to find the maximum value for each group.
Syntax
SELECT MAX(column_name)
FROM table_name;
Examples
Here, we demonstrate the usage of the PostgreSQL MAX() function using a single sample table named Employees. Consider the following Employees table for all the examples below:
Example 1: Find the Maximum Salary
Query:
SELECT MAX(Salary) AS HighestSalary
FROM Employees;
Output:
- The MAX() function returns the highest salary from the Employees table.
Example 2: Find the Maximum Salary in Each Department
Query:
SELECT Department, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department;
Output:
- The GROUP BY clause groups employees by department, and MAX() returns the highest salary in each department.

# MySQL MAX() Function

> Source: https://www.geeksforgeeks.org/mysql/mysql-max-function/

The MySQL MAX() function returns the highest value from a specified column in a table. It is commonly used to quickly identify the largest value within a dataset, especially in numeric or date columns.
- Returns the maximum value from numeric, date, or comparable data types.
- Can be combined with WHERE to filter results before finding the maximum value.
- Works with GROUP BY to find the highest value within each group.
Syntax:
MAX(expression)
- expression: It is used to specify the column or expression whose maximum value is to be returned.
- Returns a single value representing the maximum.
Working with the MySQL MAX() Function
The following examples show how the MAX() function works with different columns and conditions. First, we will create a demo table on which the MAX() function will be applied:
Example 1: Returning the Maximum Salary
In this example, this query retrieves the highest salary from the salary column in the employees table.
Query:
SELECT MAX(salary) AS max_salary
FROM employees;
Output:
- MAX(salary) finds the highest value from the salary column.
- AS max_salary assigns a readable alias to the result.
Example 2: Returning the Most Recent Hire Date
In this example, this query retrieves the most recent hire date from the hire_date column as latest_hire.
Query:
SELECT MAX(hire_date) AS latest_hire
FROM employees;
Output:
- MAX(hire_date) returns the latest (most recent) date.
- Useful for identifying the newest record in a dataset.
Example 3: Returning Maximum Salary for Employees Hired After 2021
In this example, this query retrieves the highest salary for employees hired after January 1, 2021.
Query:
SELECT MAX(salary) AS max_salary
FROM employees
WHERE hire_date > '2021-01-01';
Output:
- WHERE filters records to include only employees hired after 2021.
- MAX(salary) then finds the highest salary within the filtered data.

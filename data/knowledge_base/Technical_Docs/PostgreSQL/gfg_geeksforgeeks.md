# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-select/

SELECT statement is the primary command used to query data in PostgreSQL. It enables users to retrieve records from one or more tables, apply filtering conditions, sort and group results, limit returned rows, and generate summary information using aggregate functions. As the foundation of data retrieval in PostgreSQL, it plays a central role in database querying and analysis.
Example:
SELECT * FROM employees;
Syntax:
SELECT column1, column2, ...
FROM table_name
[WHERE condition]
[GROUP BY column_name]
[ORDER BY column_name]
[LIMIT number];
Examples
Prerequisites: Assume the following table is available:
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary NUMERIC
);
| id | name | age | department | salary | 
|---|---|---|---|---|
| 1 | Alice | 30 | HR | 60000 | 
| 2 | Bob | 25 | IT | 75000 | 
| 3 | Charlie | 35 | Finance | 80000 | 
| 4 | David | 40 | IT | 95000 | 
| 5 | Eva | 29 | HR | 50000 | 
Example 1: Selecting All Columns
To retrieve all columns from the employees table, you can use the * wildcard:
SELECT * FROM employees;
Output:
| id | name | age | department | salary | 
|---|---|---|---|---|
| 1 | Alice | 30 | HR | 60000 | 
| 2 | Bob | 25 | IT | 75000 | 
| 3 | Charlie | 35 | Finance | 80000 | 
| 4 | David | 40 | IT | 95000 | 
| 5 | Eva | 29 | HR | 50000 | 
Explanation:
- * selects all columns from the table.
- Every row in the employees table is returned.
- Useful for exploring data, but selecting only required columns is generally recommended.
Example 2: Selecting Specific Columns
If we only want to retrieve specific columns, you can list them explicitly:
SELECT name, salary FROM employees;
Output:
| name | salary | 
|---|---|
| Alice | 60000 | 
| Bob | 75000 | 
| Charlie | 80000 | 
| David | 95000 | 
| Eva | 50000 | 
Example 3: Using the WHERE Clause
To filter results based on specific conditions, we can use the WHERE clause. For example, to retrieve employees in the IT department:
SELECT * FROM employees WHERE department = 'IT';
Output:
| id | name | age | department | salary | 
|---|---|---|---|---|
| 2 | Bob | 25 | IT | 75000 | 
| 4 | David | 40 | IT | 95000 | 
Example 4: Using the ORDER BY Clause
We can sort the results using the ORDER BY clause. For example, to retrieve employees sorted by salary in descending order:
SELECT * FROM employees ORDER BY salary DESC;
Output:
| id | name | age | department | salary | 
|---|---|---|---|---|
| 4 | David | 40 | IT | 95000 | 
| 3 | Charlie | 35 | Finance | 80000 | 
| 2 | Bob | 25 | IT | 75000 | 
| 1 | Alice | 30 | HR | 60000 | 
| 5 | Eva | 29 | HR | 50000 | 
Example 5: Using the LIMIT Clause
To limit the number of rows returned, use the LIMIT clause. For instance, to retrieve only the top 3 highest-paid employees:
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;
Output:
| id | name | age | department | salary | 
|---|---|---|---|---|
| 4 | David | 40 | IT | 95000 | 
| 3 | Charlie | 35 | Finance | 80000 | 
| 2 | Bob | 25 | IT | 75000 | 
Example 6: Using GROUP BY
The GROUP BY clause groups rows that have the same values in specified columns into summary rows. For example, to find the average salary by department:
SELECT department, AVG(salary) AS average_salary 
FROM employees 
GROUP BY department;
Output:
| department | average_salary | 
|---|---|
| HR | 55000 | 
| IT | 85000 | 
| Finance | 80000 | 
Example 7: Using DISTINCT
The DISTINCT keyword removes duplicate values from the result set and returns only unique records for the specified column(s).
SELECT DISTINCT department
FROM employees;
Output:
| department | 
|---|
| HR | 
| IT | 
| Finance | 
Example 8: Using Column Aliases
Column aliases rename columns in the query output, making the results more readable and easier to understand.
SELECT
    name AS employee_name,
    salary AS annual_salary
FROM employees;
Output:
| employee_name | annual_salary | 
|---|---|
| Alice | 60000 | 
| Bob | 75000 | 
Example 9: Using AND
The AND operator combines multiple conditions in a WHERE clause and returns only the rows that satisfy all specified conditions.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 80000;
Output:
| id | name | age | department | salary | 
|---|---|---|---|---|
| 4 | David | 40 | IT | 95000 | 
Note: The performance of a SELECT query depends on factors such as table size, indexes, filtering conditions, and sorting operations. Proper indexing can significantly improve query execution time.
Improving SELECT Query Performance
- Avoid using SELECT * in production queries.
- Retrieve only the columns required.
- Use aliases to improve readability.
- Filter unnecessary rows using WHERE.
- Use LIMIT when working with large datasets.
- Add indexes to frequently filtered columns.

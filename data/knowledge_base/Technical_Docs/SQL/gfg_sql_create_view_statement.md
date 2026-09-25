# SQL CREATE VIEW Statement

> Source: https://www.geeksforgeeks.org/sql/sql-create-view-statement/

The SQL CREATE VIEW statement creates a virtual table based on a SELECT query. It does not store data itself but displays data from one or more tables when accessed.
Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
- CREATE VIEW view_name: Creates a new view.
- AS: Defines the query for the view.
- SELECT column1, column2...: Specifies the columns to include.
- FROM table_name: Specifies the source table(s).
- WHERE condition (optional): Filters the data shown in the view.
Examples of CREATE VIEW Statement
The CREATE VIEW statement creates a virtual table based on a query result. It simplifies complex queries and helps control access to data.
Example 1: Creating a Simple View
Consider the products table with columns product_id, product_name and price. The following view displays only the products whose price is greater than $100.
Query:
CREATE VIEW expensive_products AS
SELECT product_id, product_name, price
FROM products
WHERE price > 100;
Output:
Example 2: Creating a Joined View
Assume there are two tables, employees and departments. The following view combines data from both tables to display each employee's details along with their department name.
Query:
CREATE VIEW employee_department_info AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
Employees table:
Departments table:
Query:
CREATE VIEW employee_department_info AS
SELECT
e.employee_id,
e.first_name,
e.last_name,
d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
Output:
- A view named employee_department_info is created.
- It displays employee_id, first_name, last_name and department_name.
- An INNER JOIN is used between the employees and departments tables on department_id.

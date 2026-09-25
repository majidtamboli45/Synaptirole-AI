# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/mysql/mysql-view/

A VIEW in MySQL is a virtual table based on the result of a SQL query. It does not usually store the data separately; instead, it displays data from one or more existing tables.
- Simplifies complex SQL queries.
- Provides a customized way to display data.
- Can combine data from multiple tables.
- Helps restrict access to specific columns or rows.
Syntax
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
Example
Consider an employees table:
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees
VALUES
(101, 'John', 'HR', 40000),
(102, 'Emily', 'IT', 55000),
(103, 'Michael', 'HR', 45000);
Create a view to display only HR employees:
CREATE VIEW hr_employees AS
SELECT employee_id, employee_name, salary
FROM employees
WHERE department = 'HR';
To view the data:
SELECT * FROM hr_employees;
Output:
Modify a VIEW
Use CREATE OR REPLACE VIEW to modify an existing view:
CREATE OR REPLACE VIEW hr_employees AS
SELECT employee_id, employee_name, salary
FROM employees
WHERE department = 'HR' AND salary > 40000;
Output:
Drop a VIEW
To remove a view:
DROP VIEW hr_employees;
Output:
This removes the view without deleting the original employees table.

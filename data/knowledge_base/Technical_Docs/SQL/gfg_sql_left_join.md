# SQL LEFT JOIN

> Source: https://www.geeksforgeeks.org/sql/sql-left-join/

In SQL, the LEFT JOIN (also called LEFT OUTER JOIN) retrieves all records from the left table and only the matching records from the right table. If no match is found, NULL values are returned for the right table columns.
Syntax
SELECT column_name(s) 
FROM tableA
LEFT JOIN tableB ON tableA.column_name = tableB.column_name;
- SELECT column_name(s): Specifies the columns to retrieve from the tables.
- FROM table: Defines the left table from which all rows will be returned.
- LEFT JOIN table: Joins the right table with the left table.
- ON tableA.column_name = tableB.column_name: Specifies the matching condition between both tables
Examples of SQL LEFT JOIN
First, we will create a demo SQL database and tables. Consider two tables: employee and department.
employee Table:
department Table:
Example 1: Performing a LEFT JOIN
To perform left-join on employee and department Tables we will use the following SQL query:
Query:
SELECT e.emp_id,
e.name,
department.department_name,
d.department_head,
d.location
FROM employee AS e
LEFT JOIN department AS d
ON e.department_id = d.department_id;
Output:
- All employee (left table) are included.
- Since each employee is assigned a department, we see matching details from the right table.
- If an employee had no department assigned, the department columns would show NULL
Example 2: SQL LEFT JOIN with WHERE Clause
In this example, the WHERE clause filters the results to display only employee whose department location is 'London'. departments without employee will not appear in the output.
Query:
SELECT e.emp_id,
e.name,
d.department_name,
d.department_head,
d.location
FROM employee AS e
LEFT JOIN department AS d
ON e.department_id = d.department_id
WHERE d.location = 'London';
Output:
Example 3: SQL LEFT JOIN as Aliases
In this example, aliases e and d are used for the tables to make the query shorter, simpler and easier to read.
Query:
SELECT e.emp_id,
e.name,
d.department_name,
d.department_head,
d.location
FROM employee AS e
LEFT JOIN department AS d
ON e.department_id = d.department_id
WHERE d.location = 'London';
Output:

# MySQL Outer Join

> Source: https://www.geeksforgeeks.org/mysql/mysql-outer-join/

MySQL provides the JOIN clause to combine rows from two or more tables based on a related column between them. It is useful for retrieving related data from multiple tables efficiently.
- It combines data from multiple tables using a common column.
- It helps in retrieving related information without multiple queries.
- It maintains data consistency by preserving relationships between tables.
- It supports normalized database design by linking separate tables.
Types of Outer Joins in MySQL
MySQL supports the following types of Outer Joins:
- LEFT JOIN (or LEFT OUTER JOIN): Shows all records from the left table along with matching records from the right table. If no match is found, the columns from the right table contain NULL values.
- RIGHT JOIN (or RIGHT OUTER JOIN): Shows all records from the right table along with matching records from the left table. If no match is found, the columns from the left table contain NULL values.
LEFT JOIN
The LEFT JOIN, also called LEFT OUTER JOIN, is used to show all rows from the left table along with the matching rows from the right table. If no matches are detected, the right table will return a result of NULL.
Syntax:
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
Example:
Consider two tables, employees and departments:
employees:
departments:
To retrieve all employees along with their department names, using a LEFT JOIN:
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;
Result:
RIGHT JOIN
The RIGHT JOIN, also referred to as RIGHT OUTER JOIN, is used to display all entries from the right table along with any corresponding rows from the left table. If there are no matches, the left table will output NULL.
Syntax:
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
Example
Using the same employees and departments tables, to retrieve all departments along with their employees:
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;
Result:
Practical Applications of Outer Joins
Outer Joins are used to include both matching and non-matching records from tables, ensuring complete data retrieval for analysis
- Reporting and Analysis: Helps generate complete reports by including all categories, even those without related data.
- Data Cleaning: Useful for identifying missing or unmatched records for validation and correction.
- Business Logic: Displays all items (such as products or employees), including those with or without related information.

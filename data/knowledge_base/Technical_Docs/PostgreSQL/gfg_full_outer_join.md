# FULL OUTER JOIN

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-full-outer-join/

The PostgreSQL FULL OUTER JOIN combines rows from two tables based on a common column.
- Returns all records from both tables.
- Displays NULL for unmatched rows.
- Combines matching records into a single result.
Syntax
SELECT table1.column1, table1.column2, table2.column1, ...FROM table1FULL OUTER JOIN table2ON table1.matching_column = table2.matching_column;
Where:
- table1: The left table whose all rows are returned.
- table2: The right table that provides matching rows.
- matching_column: The common column used to join the tables.
Example
Firstly, create the Employees and Projects tables and insert the following records.
Employees Table
Projects Table
Example: FULL OUTER JOIN Query
The following query returns all employees and all projects, including unmatched records from both tables.
SELECT    e.EmployeeName,    p.ProjectNameFROM Employees eFULL OUTER JOIN Projects pON e.EmployeeID = p.EmployeeID;
Output:
Example: FULL OUTER JOIN with WHERE Clause
The following query returns only the unmatched employees and projects using the WHERE clause.
SELECT    e.EmployeeName,    p.ProjectNameFROM Employees eFULL OUTER JOIN Projects pON e.EmployeeID = p.EmployeeIDWHERE e.EmployeeID IS NULL   OR p.EmployeeID IS NULL;
Output:

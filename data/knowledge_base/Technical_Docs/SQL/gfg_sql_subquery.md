# SQL Subquery

> Source: https://www.geeksforgeeks.org/sql/sql-subquery/

A subquery in SQL is a query nested inside another SQL query. It allows complex filtering, aggregation and data manipulation by using the result of one query inside another. They are an essential tool when we need to perform operations like:
- Apply aggregate functions like SUM, COUNT or AVG dynamically.
- Update data using values from other tables.
- Delete rows based on conditions returned by another query.
Example: Create a demo SQL database and tables, on which we use the SQL Subqueries.
Query:
SELECT * FROM Students
WHERE Score > ( SELECT AVG(Score) FROM Students );
Output:
- The subquery calculates the average score of all students.
- The main query returns only the students whose score is higher than that average.
Syntax:
SELECT column_name
FROM table_name
WHERE column_name operator
(SELECT column_name
FROM table_name
WHERE condition);
Note: Subqueries do not have a single fixed syntax, as they can be used in different clauses like SELECT, WHERE, FROM and HAVING
SQL Clauses for Subqueries
Clauses that can be used with subqueries are:
- Filters rows in the outer query based on the results returned by the WHERE clause.
- Treats the subquery as a temporary (derived) table that can be queried like a normal table using the FROM clause.
- Filters grouped or aggregated results using values produced by the HAVING clause.
Types of Subqueries
Consider the following two tables for examples:
Single-Row Subquery
A single-row subquery is a subquery that returns only one value.
- Returns exactly one row as the result.
- Commonly used with comparison operators such as =, >, <
Example:
SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
Output:
- Finds the highest salary in the Employees table.
- Returns the employee(s) whose salary matches that maximum value.
Multi-Row Subquery
A multi-row subquery is a subquery that returns more than one value.
- Returns multiple rows as the result.
- Requires operators that can handle multiple values, such as IN, ANY or ALL
Example:
SELECT * FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');
Output:
- Identifies all departments located in New York.
- Returns the employees who belong to any of those departments.
Correlated Subquery
A correlated subquery is a subquery that depends on the outer query for its values.
- A dependent subquery: it references columns from the outer query.
- Executed once for each row of the outer query, making it slower for large datasets.
Example:
SELECT e.Name, e.Salary
FROM Employees e
WHERE e.Salary > (SELECT AVG(Salary)
FROM Employees
WHERE DepartmentID = e.DepartmentID);
Output:
- Calculates the average salary within each employee's department.
- Returns employees whose salary is higher than their department’s average.
Examples of Using SQL Subqueries
Consider the following two tables:
Example 1: Fetching Data Using Subquery in WHERE Clause
This example uses a subquery in the WHERE clause. The inner query finds roll numbers of students in Section 'A' and the outer query displays their details from the Student table.
Query:
SELECT NAME, LOCATION, PHONE_NUMBER 
FROM Student_Info
WHERE ROLL_NO IN (
SELECT ROLL_NO
FROM Student_Section
WHERE SECTION = 'A'
);
Output:
Example 2: Using Subquery with DELETE
In this example, a subquery is used with DELETE to remove rows from the Student table. The subquery automatically finds the records that match the given condition.
Query:
DELETE FROM Student_Info
WHERE ROLL_NO IN (
SELECT ROLL_NO FROM (
SELECT ROLL_NO FROM Student_Info WHERE ROLL_NO <= 101 OR ROLL_NO = 201
) AS temp
);
Output:
Example 3: Using Subquery with UPDATE
This example uses a subquery with UPDATE to change student names to "Geeks" for records that match the location returned by the subquery.
Query:
UPDATE Student_Info
SET NAME = 'Geeks'
WHERE LOCATION IN (
SELECT LOCATION
FROM Student_Info
WHERE LOCATION IN ('London', 'Berlin')
);
Output:
Example 4: Simple Subquery in the FROM Clause
This example uses a subquery in the FROM clause as a temporary table to retrieve students whose location starts with 'T' and display their names and phone numbers.
Query:
SELECT NAME, PHONE_NUMBER
FROM (
SELECT NAME, PHONE_NUMBER, LOCATION
FROM Student_Info
WHERE LOCATION LIKE 'T%'
) AS subquery_table;
Output:
Example 5: Subquery with JOIN
This example uses a subquery with JOIN. The subquery retrieves roll numbers of students in Section 'A' and the join returns their names, locations and section details.
Query:
SELECT s.NAME, s.LOCATION, ns.SECTION
FROM Student_Info s
INNER JOIN (
SELECT ROLL_NO, SECTION
FROM Student_Section
WHERE SECTION = 'A'
) ns
ON s.ROLL_NO = ns.ROLL_NO;
Output:

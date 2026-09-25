# IS NULL operator

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-is-null-operator/

The IS NULL operator in PostgreSQL is used to find rows where a column contains a NULL value. A NULL value represents missing, unknown, or undefined data. It is different from an empty string ('') or the number 0.
- Used with the WHERE clause to filter NULL values.
- Commonly used to identify missing or incomplete data.
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE column_name IS NULL;
Where:
- column_name: The column to check for NULL values.
Examples
Suppose the Employees table contains the following data:
Example 1: Retrieve Employees with NULL Email
The following query retrieves employees whose email is missing.
SELECT *
FROM Employees
WHERE Email IS NULL;
Output:
Example 2: Example 2: Count Employees with NULL Department
The following query counts the number of employees whose email address is NULL.
SELECT COUNT(*) AS NullEmails
FROM Employees
WHERE Email IS NULL;
Output:
Example 3: Retrieve Employees with NULL Email from the IT Department
The following query retrieves employees in the IT department whose email address is missing.
SELECT EmployeeName,
Department
FROM Employees
WHERE Department = 'IT'
AND Email IS NULL;
Output:

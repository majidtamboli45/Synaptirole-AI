# SQL Cheat Sheet ( Basic to Advanced)

> Source: https://www.geeksforgeeks.org/sql/sql-cheat-sheet/

This SQL Cheat Sheet is your quick-reference guide for working with relational databases. It helps you recall key commands, logic, and query patterns to manage, manipulate, and control data efficiently.
- Create, alter, and drop tables.
- Insert, update, delete, and retrieve data.
- Manage user permissions and access.
Create a Database in SQL
Explore this section to get hands on all the cheat sheet that help you in order to create a database in SQL.
1. CREATE DATABASE
CREATE DATABASE company;
This command creates a new database named "company."
2. USE
USE company;
This command selects the database named "company" for further operations.
3. ALTER DATABASE
ALTER DATABASE company;
This command Modify database attributes named "company".
4. DROP DATABASE
DROP DATABASE company;
This command Deletes the database named "company".
Creating Data in SQL
Here in this SQL cheat sheet we have listed down all the cheat sheet that help to create, insert, alter data in table.
5. CREATE
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2)
);
This command creates a table named "employees" with columns for employee ID, first name, last name, department, and salary. The employee_id column is set as the primary key.
6. INSERT INTO
INSERT INTO employees (employee_id, first_name, last_name, department, salary)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00),
(2, 'Jane', 'Smith', 'IT', 60000.00),
(3, 'Alice', 'Johnson', 'Finance', 55000.00),
(4, 'Bob', 'Williams', 'IT', 62000.00),
(5, 'Emily', 'Brown', 'HR', 48000.00);
This command inserts sample data into the "employees" table with values for employee ID, first name, last name, department, and salary.
7. ALTER TABLE
ALTER TABLE employees
ADD COLUMN new_column INT;
This command adds a new column named "new_column" of integer type to the existing "employees" table.
8. DROP TABLE
DROP TABLE employees;
This command deletes the entire "employees" table along with all its data.
Reading/Querying Data in SQL
Explore this section to get the cheat sheet on how to use select, distinct and other querying data in SQL.
9. SELECT
SELECT * FROM employees;
This query will retrieve all columns from the employees table.
10. DISTINCT
SELECT DISTINCT department FROM employees;
This query will return unique department names from the employees table.
11. WHERE
SELECT * FROM employees WHERE salary > 55000.00;
This query will return employees whose salary is greater than 55000.00.
12. LIMIT
SELECT * FROM employees LIMIT 3;
This query will limit the result set to the first 3 rows.
13. OFFSET
SELECT * FROM employees LIMIT 10000 OFFSET 2;
This query retrieves all rows from the "employees" table, skipping the first 2 rows and limiting the result to 10,000 rows.
14. FETCH
SELECT * FROM employees FETCH FIRST 3 ROWS ONLY;
This query will fetch the first 3 rows from the result set.
15. CASE
SELECT 
first_name,
last_name,
CASE
WHEN salary > 55000 THEN 'High'
WHEN salary > 50000 THEN 'Medium'
ELSE 'Low'
END AS salary_category
FROM employees;
This query will categorize employees based on their salary into 'High', 'Medium', or 'Low'.
Updating/Manipulating Data in SQL
Get a cheat sheet on how to update or manipulate data in SQL by exploring this section.
16. UPDATE
UPDATE employees
SET salary = 55000.00
WHERE employee_id = 1;
This query will update the salary of the employee with employee_id 1 to 55000.00.
Deleting Data in SQL
17. DELETE
DELETE FROM employees
WHERE employee_id = 5;
This query will delete the record of the employee with employee_id 5 from the employees table.
Filtering Data in SQL
18. WHERE
SELECT * FROM employees
WHERE department = 'IT';
This query will retrieve all employees who work in the IT department.
19. LIKE
SELECT * FROM employees
WHERE first_name LIKE 'J%';
This query will retrieve all employees whose first name starts with 'J'.
20. IN
SELECT * FROM employees
WHERE department IN ('HR', 'Finance');
This query will retrieve all employees who work in the HR or Finance departments.
21. BETWEEN
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;
This query will retrieve all employees whose salary is between 50000 and 60000.
22. IS NULL
SELECT * FROM employees
WHERE department IS NULL;
This query will retrieve all employees where the department is not assigned (NULL).
23. ORDER BY
SELECT * FROM employees
ORDER BY salary DESC;
This query will retrieve all employees sorted by salary in descending order.
SQL Operator
Here in this section we have added a cheat sheet for SQL Operators. So, explore and learn how to use AND, OR, NOT and others oprtators.
24. AND
SELECT * FROM employees
WHERE department = 'IT' AND salary > 60000;
This query will retrieve employees who work in the IT department and have a salary greater than 60000.
25. OR
SELECT * FROM employees
WHERE department = 'HR' OR department = 'Finance';
This query will retrieve employees who work in either the HR or Finance department.
26. NOT
SELECT * FROM employees
WHERE NOT department = 'IT';
This query will retrieve employees who do not work in the IT department.
27. LIKE
SELECT * FROM employees
WHERE first_name LIKE 'J%';
This query will retrieve employees whose first name starts with 'J'.
28. IN
SELECT * FROM employees
WHERE department IN ('HR', 'Finance');
This query will retrieve employees who work in the HR or Finance departments.
29. BETWEEN
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;
This query will retrieve employees whose salary is between 50000 and 60000.
30. IS NULL
SELECT * FROM employees
WHERE department IS NULL;
This query will retrieve employees where the department is not assigned (NULL).
31. ORDER BY
SELECT * FROM employees
ORDER BY salary DESC;
This query will retrieve all employees sorted by salary in descending order.
32. GROUP BY
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
This query will group employees by department and count the number of employees in each department.
Aggregation Data in SQL
Get an hands in aggregation data in SQL. Here you will find cheat sheet for how to count numbers, sum of numbers and more.
33. COUNT
SELECT COUNT(*) FROM employees;
This query will count the total number of employees.
34. SUM
SELECT SUM(salary) FROM employees;
This query will calculate the total salary of all employees.
35. AVG
SELECT AVG(salary) FROM employees;
This query will calculate the average salary of all employees.
36. MIN
SELECT MIN(salary) FROM employees;
This query will find the minimum salary among all employees.
37. MAX
SELECT MAX(salary) FROM employees;
This query will find the maximum salary among all employees.
38. GROUP BY
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
This query will group employees by department and count the number of employees in each department.
39. HAVING
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;
This query will calculate the average salary for each department and return only those departments where the average salary is greater than 55000.
Constraints in SQL
Constraints in SQL act as data quality guardrails, enforcing rules to ensure accuracy, consistency, and integrity within your database tables.
40. PRIMARY KEY
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);
employee_id is designated as the primary key, ensuring that each employee record has a unique identifier.
41. FOREIGN KEY
CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50)
);
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
department_id column in the employees table is a foreign key that references the department_id column in the departments table, establishing a relationship between the two tables.
42. UNIQUE
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
email VARCHAR(100) UNIQUE
);
email column must contain unique values for each employee.
43. NOT NULL
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL
);
first_name and last_name columns must have values and cannot be NULL.
44. CHECK
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
age INT CHECK (age >= 18)
);
age column must have a value of 18 or greater due to the CHECK constraint.
Joins in SQL
Explore different join types to seamlessly merge data from multiple tables in your SQL queries.
45. INNER JOIN
SELECT * FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;
This query will retrieve records from both the employees and departments tables where there is a match on the department_id column.
46. LEFT JOIN
SELECT * FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;
This query will retrieve all records from the employees table and only the matching records from the departments table.
47. RIGHT JOIN
SELECT * FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;
This query will retrieve all records from the departments table and only the matching records from the employees table.
48. FULL OUTER JOIN
SELECT * FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.department_id;
This query will retrieve all records from both the employees and departments tables, including unmatched records.
49. CROSS JOIN
SELECT * FROM employees
CROSS JOIN departments;
This query will retrieve all possible combinations of records from the employees and departments tables.
50. SELF JOIN
SELECT e1.first_name, e2.first_name
FROM employees e1, employees e2
WHERE e1.employee_id = e2.manager_id;
In this example, the employees table is joined to itself to find employees and their respective managers based on the manager_id column.
SQL Functions
In this section we have compiled SQL cheat sheet for SQL functions. It is used for common tasks like aggregation, filtering, date/time manipulation, and more!
51. Scalar Functions
SELECT UPPER(first_name) AS upper_case_name FROM employees;
This query uses the UPPER() scalar function to convert the first_name column values to uppercase.
52. Aggregate Functions
SELECT AVG(salary) AS average_salary FROM employees;
This query uses the AVG() aggregate function to calculate the average salary of all employees.
53. String Functions
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
This query uses the CONCAT() string function to concatenate the first_name and last_name columns into a single column called full_name.
SELECT SUBSTR(first_name, 1, 3) AS short_name FROM employees;
This query uses the SUBSTR() function to extract the first three characters of the first_name column for each employee. The result is displayed in a new column called short_name.
SELECT INSERT(full_name, 6, 0, 'Amazing ') AS modified_name 
FROM (SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees) AS employee_names;
This query first concatenates the first_name and last_name columns into a single column called full_name. Then, it uses the INSERT() function to insert the string 'Amazing ' at the 6th position of the full_name column for each employee. The modified names are displayed in a new column called modified_name.
54. Date and Time Functions
SELECT CURRENT_DATE AS current_date FROM dual;
This query uses the CURRENT_DATE date function to retrieve the current date.
55. Mathematical Functions
SELECT SQRT(25) AS square_root FROM dual;
This query uses the SQRT() mathematical function to calculate the square root of 25.
Subqueries in SQL
This SQL cheat sheet explains how to nest queries for powerful data filtering and manipulation within a single statement.
56. Single-row Subquery
SELECT first_name, last_name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
In this example, the subquery (SELECT MAX(salary) FROM employees) returns a single row containing the maximum salary, and it's used to filter employees who have the maximum salary.
57. Multiple-row Subquery: Returns Multiple Rows of Result
SELECT department_name
FROM departments
WHERE department_id IN (SELECT department_id FROM employees);
In this example, the subquery (SELECT department_id FROM employees) returns multiple rows containing department IDs, and it's used to filter department names based on those IDs.
58. Correlated Subquery
SELECT first_name, last_name
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);
In this example, the subquery (SELECT AVG(salary) FROM employees WHERE department = e.department) is correlated with the outer query by referencing the department column from the outer query. It calculates the average salary for each department and is used to filter employees whose salary is greater than the average salary of their respective department.
59. Nested Subquery
SELECT first_name, last_name
FROM employees
WHERE department_id IN (
SELECT department_id
FROM departments
WHERE department_name = 'IT'
);
In this example, the subquery (SELECT department_id FROM departments WHERE department_name = 'IT') is nested within the outer query. It retrieves the department ID for the IT department, which is then used in the outer query to filter employees belonging to the IT department.
Views in SQL
Here in this SQL cheat sheet unveils how to create virtual tables based on existing data for streamlined access.
60. CREATE VIEW
CREATE VIEW high_paid_employees AS
SELECT *
FROM employees
WHERE salary > 60000;
This query creates a views named high_paid_employees that contains all employees with a salary greater than 60000.
61. DROP VIEW
DROP VIEW IF EXISTS high_paid_employees;
This query drops the high_paid_employees view if it exists.
Indexes in SQL
Speed up your SQL queries with our Indexes Cheat Sheet! Learn how to create and optimize indexes to dramatically improve database performance.
62. CREATE INDEX
CREATE INDEX idx_department ON employees (department);
This query creates an index named idx_department on the department column of the employees table.
63. DROP INDEX: Remove an Index
DROP INDEX IF EXISTS idx_department;
This query drops the idx_department index if it exists.
Transactions in SQL
Learn how to manage groups of database operations as a single unit for reliable data updates.
64. BEGIN TRANSACTION
BEGIN TRANSACTION;
This statement starts a new transaction.
65. COMMIT
COMMIT;
This statement saves all changes made during the current transaction.
66. ROLLBACK
ROLLBACK;
This statement undoes all changes made during the current transaction.
Advanced Mixed Data in SQL
In the last we have complied all the imprtant queries under the one advanced SQL cheat sheet.
67. Stored Procedures
CREATE PROCEDURE get_employee_count()
BEGIN
SELECT COUNT(*) FROM employees;
END;
This query creates a stored procedure named get_employee_count that returns the count of employees.
68. Triggers
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
SET NEW.creation_date = NOW();
END;
This query creates a trigger named before_employee_insert that sets the creation_date column to the current date and time before inserting a new employee record.
69. User-defined Functions (UDFs)
CREATE FUNCTION calculate_bonus(salary DECIMAL) RETURNS DECIMAL
BEGIN
RETURN salary * 0.1; -- 10% bonus
END;
This query creates a user-defined function named calculate_bonus that calculates the bonus based on the salary.
70. Common Table Expressions (CTEs)
WITH high_paid_employees AS (
SELECT * FROM employees WHERE salary > 60000
)
SELECT * FROM high_paid_employees;
This query uses a common table expression named high_paid_employees to retrieve all employees with a salary greater than 60000.

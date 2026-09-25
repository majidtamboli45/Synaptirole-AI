# MySQL  Questions

> Source: https://www.geeksforgeeks.org/mysql/mysql-interview-questions/

MySQL is an open-source relational database management system (RDBMS) that uses SQL (Structured Query Language) to store, manage and retrieve data efficiently. It is widely used for web applications, enterprise software and data-driven systems due to its speed, reliability and ease of use. MySQL enables users to:
- Define database structures (creating databases, tables, indexes, constraints and views)
- Manipulate data (inserting, updating, deleting and modifying records)
- Query data (retrieving and filtering data using SQL statements)
- Optimize performance (using indexes, query optimization and storage engines)
MySQL Basic Interview Questions
1. How to create a database in MySQL?
To create a database in MySQL, we can use the CREATE DATABASE statement followed by the name we want to give to our database. For example:
CREATE DATABASE mydatabase;
2. What are the different data types available in MySQL?
MySQL supports the following categories of data types:
- Numeric: INT, DECIMAL, FLOAT, DOUBLE, etc.
- Character/String: CHAR, VARCHAR, TEXT, etc.
- Date and Time: DATE, TIME, TIMESTAMP, etc.
- JSON: JSON (stores JSON documents)
3. How do you add a user in MySQL?
You can add a user by using the CREATE USER command and specifying the necessary credentials. For example:
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
4. Explain the differences between SQL and MySQL?
- SQL is a language; MySQL is a software system.
- SQL defines how to interact with data; MySQL provides the environment to store and manage data.
- SQL is used across various RDBMS; MySQL is a specific RDBMS that uses SQL.
For more Details refer this article: SQL vs. MySQL
5. What is the MySQL server's default port?
The default port for MySQL server is 3306. This is the port number used by MySQL to communicate with clients and other services by default, unless it is configured to use a different port in the MySQL configuration file (my.cnf or my.ini).
6. How does MySQL differ from other Relational Database Management Systems (RDBMS)?
MySQL is an open-source Relational Database Management System (RDBMS) that uses SQL to manage data. It is known for its speed, ease of use and reliability. Here’s how MySQL differs from other RDBMSs:
- Open Source: MySQL is free to use, while some RDBMSs require commercial licenses.
- High Performance: It is optimized for fast performance, especially for web applications.
- Multiple Storage Engines: Supports storage engines like InnoDB and MyISAM for different use cases.
- Easy to Use: Simple to install, learn and manage compared to many other RDBMSs.
- Cross-Platform: Runs on Windows, Linux and macOS.
7. What are the different storage engines available in MySQL?
There are several storage engines in MySQL and the table types depend on which storage engine is used. The common storage engines are:
- InnoDB (default in MySQL for transactional data)
- MyISAM (older, non-transactional storage engine)
- MEMORY (stores data in memory)
- CSV (stores data in CSV files)
- ARCHIVE (used for storing large amounts of data, read-only)
8. What are the differences between CHAR and VARCHAR data types in MySQL?
| CHAR | VARCHAR | 
|---|---|
| Stores fixed-length strings. | Stores variable-length strings. | 
| Pads extra spaces if the value is shorter than the defined length. | Stores only the actual characters entered. | 
| Can store up to 255 characters. | Can store up to 65,535 bytes (subject to row size limits). | 
9. What is the Difference between CHAR_LENGTH and LENGTH?
| LENGTH() | CHAR_LENGTH() | 
|---|---|
| Returns the number of bytes in a string. | Returns the number of characters in a string. | 
| Counts the total bytes used to store the string. | Counts each character regardless of its byte size. | 
| May return a larger value for multi-byte characters. | Returns the actual character count. | 
Example:
SELECT LENGTH('Hello');       -- Returns 5 (1 byte per character in ASCII)
SELECT CHAR_LENGTH('Hello');  -- Returns 5 (5 characters)
10. What do you understand by % and _ in the like statement?
In the LIKE statement, the % and _ symbols are used for pattern matching:
- % : Represents zero or more characters. It matches any sequence of characters, including an empty sequence.
- _ : Represents exactly one character. It matches any single character.
Example:
SELECT * FROM Employees WHERE Name LIKE 'J%n';  
SELECT * FROM Employees WHERE Name LIKE 'J_n';  11. What is the maximum number of columns allowed in a MySQL index?
A MySQL index can contain a maximum of 16 columns (for InnoDB). This is known as a composite index, where multiple columns are combined into a single index to improve query performance.
Example:
CREATE INDEX idx_employee
ON Employees (FirstName, LastName);
12. What is a foreign key and how would you use it in databases?
A foreign key is a column (or set of columns) in one table that refers to the primary key of another table. It is used to establish a relationship between tables and maintain referential integrity by preventing invalid data.
Example:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
- This example ensures that every CustomerID in the Orders table exists in the Customers table.
13. Explain the main difference between FLOAT and DOUBLE?
| FLOAT | DOUBLE | 
|---|---|
| Uses 4 bytes of storage. | Uses 8 bytes of storage. | 
| Provides approximately 7 decimal digits of precision. | Provides approximately 15 decimal digits of precision. | 
| Suitable for values that require less precision. | Suitable for values that require higher precision. | 
Example:
CREATE TABLE example (
    float_value FLOAT,
    double_value DOUBLE
);
14. Explain the differences between BLOB and TEXT.
| BLOB | TEXT | 
|---|---|
| Stores binary data. | Stores text data. | 
| Used for images, audio, videos and other binary files. | Used for storing large amounts of text, such as articles, descriptions and comments. | 
| Binary data is not associated with a character set. | Text data is stored using a character set and collation. | 
15. Explain the difference between AVING and WHERE clause in MySQL.
| WHERE | HAVING | 
|---|---|
| Filters rows before grouping. | Filters groups after grouping. | 
| Used before the GROUP BY clause. | Used after the GROUP BY clause. | 
| Cannot use aggregate functions directly. | Can use aggregate functions such as COUNT(), SUM() and AVG(). | 
16. Explain REGEXP.
REGEXP (Regular Expression) is used in MySQL to perform pattern matching with string values. It allows you to use regular expressions for string searches within a query. The pattern can match anywhere in the string and is case-insensitive by default.
Syntax:
SELECT * FROM table_name WHERE column_name REGEXP 'pattern';
17. How can we add a column in MySQL?
We can add a new column to an existing table using the ALTER TABLE statement along with the ADD COLUMN clause.
Syntax:
ALTER TABLE table_name
ADD COLUMN column_name data_type [FIRST | AFTER existing_column];
Example:
ALTER TABLE Employees
ADD COLUMN Salary DECIMAL(10,2);
18. How to delete columns in MySQL?
We can remove columns in MySQL by using ALTER TABLE statement.
Syntax:
ALTER TABLE table_name 
DROP COLUMN column1, column2....; 
Example:
ALTER TABLE Employees
DROP COLUMN Email;
19. How to delete a table in MySQL?
We can delete a table using the DROP TABLE statement. This statement deletes the table along with all its data.
Syntax:
DROP TABLE table_name;
Example:
DROP TABLE Employee;
20. What is a default constraint in MySQL? How do you set a default value for a column?
A DEFAULT constraint is used to assign a default value to a column when no value is provided during data insertion.
Syntax:
CREATE TABLE table_name (
    column_name data_type DEFAULT default_value
);
Example:
CREATE TABLE Employees (
    EmployeeID INT,
    Status VARCHAR(20) DEFAULT 'Active'
);
21. What is a temporary table in SQL?
A temporary table is a table that stores data temporarily during a database session. It is automatically deleted when the session ends or when it is explicitly dropped.
Syntax:
CREATE TEMPORARY TABLE table_name (
    column1 data_type,
    column2 data_type
);
Example:
CREATE TEMPORARY TABLE TempEmployees (
    EmployeeID INT,
    EmployeeName VARCHAR(50)
);
22. How does NOW() differ from CURRENT_DATE()?
The NOW() function returns the current date and time, including hours, minutes and seconds, whereas CURRENT_DATE() returns only the current date.
Syntax:
SELECT NOW();
SELECT CURRENT_DATE();
23. What is the use of the DISTINCT keyword in MySQL?
The DISTINCT keyword is used to remove duplicate rows from the result set and return only unique values. It is used with the SELECT statement.
Syntax:
SELECT DISTINCT column1, column2
FROM table_name;
Example:
SELECT DISTINCT Department
FROM Employees;
24. What is a subquery in MySQL? Explain with an example.
A subquery is a query nested inside another SQL query. It is used to retrieve data that is used by the outer query.
Example:
SELECT EmployeeName
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
- The above query returns the names of employees whose salary is greater than the average salary of all employees.
25. How to create a table in MySQL?
To create a table in MySQL, the CREATE TABLE statement is used. Here's the syntax:
Syntax:
CREATE TABLE Employee (
    Employee_ID INT,
    Employee_Name VARCHAR(128),
    Employee_Salary DECIMAL(10,2),
    Designation VARCHAR(50)
);
26. How to insert data into a MySQL table?
We can insert data into a table using the INSERT INTO statement.
Syntax:
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
Example:
INSERT INTO Employee (Employee_ID, Employee_Name, Employee_Salary, Designation)
VALUES (101, 'John', 50000, 'HR'); 
MySQL Intermediate Interview Questions
27. Write a statement to find duplicate rows in the MySQL table?
Duplicate rows can be found using the GROUP BY clause along with the HAVING clause.
Syntax:
SELECT column1, column2
FROM table_name
GROUP BY column1, column2
HAVING COUNT(*) > 1;
Example:
SELECT Name, Category
FROM Product
GROUP BY Name, Category
HAVING COUNT(*) > 1;
- GROUP BY groups rows with the same values.
- COUNT(*) counts the number of rows in each group.
- HAVING COUNT(*) > 1 returns only those groups that have duplicate records.
28. How would you use string functions in SQL to manage text?
String functions in SQL are used to manipulate and format text data. They perform operations such as converting text to uppercase or lowercase, combining strings, extracting part of a string, replacing text and removing extra spaces.
Example:
SELECT UPPER(Name), LOWER(Name)
FROM Employees;
29. How would you update a specific row in a database with SQL?
We can update a specific row in a database using the UPDATE statement along with the WHERE clause.
Syntax:
UPDATE table_name
SET column_name = value
WHERE condition;
Example:
UPDATE Employees
SET Salary = 50000
WHERE EmployeeID = 101;
30. What are the different types of joins in MySQL?
A JOIN is used to combine rows from two or more tables based on a related column.
- INNER JOIN: Returns matching records from both tables.
- LEFT JOIN: Returns all records from the left table and matching records from the right table.
- RIGHT JOIN: Returns all records from the right table and matching records from the left table.
- FULL JOIN: Returns all records from both tables. (Not supported directly in MySQL; can be achieved using LEFT JOIN + RIGHT JOIN with UNION.)
31. What is a Primary Key? How do you drop a primary Key in MySQL?
A Primary Key is a column or combination of columns that uniquely identifies each row in a table. It cannot contain NULL values and must be unique.
Syntax:
ALTER TABLE table_name
DROP PRIMARY KEY;
32. What is a Heap (MEMORY) Table in MySQL?
A MEMORY table is a storage engine that stores table data in memory instead of on disk, providing very fast data access. It is mainly used for temporary or frequently accessed data. MEMORY tables do not support BLOB or TEXT columns and lose their data when the MySQL server is restarted.
33. What is the difference between the Primary Key and the Candidate Key?
| Primary Key | Candidate Key | 
|---|---|
| Uniquely identifies each row in a table. | A column or set of columns that can uniquely identify each row in a table. | 
| Only one primary key is allowed per table. | A table can have multiple candidate keys. | 
| Cannot contain NULL values. | Candidate keys also cannot contain NULL values. | 
| Selected from the candidate keys. | One candidate key is chosen as the primary key. | 
34. What is the difference between DELETE and TRUNCATE in MySQL?
| DELETE | TRUNCATE | 
|---|---|
| Deletes selected rows using a WHERE clause. | Deletes all rows from a table. | 
| DML (Data Manipulation Language). | DDL (Data Definition Language). | 
| Can be rolled back (with transactions). | Removes all rows and is generally faster than DELETE. | 
35. What is InnoDB?
InnoDB is the default storage engine in MySQL. It supports ACID transactions, row-level locking, foreign keys and crash recovery.
36. What is the difference between UNION and UNION ALL in MySQL?
| UNION | UNION ALL | 
|---|---|
| Removes duplicate rows. | Keeps duplicate rows. | 
| Slower because duplicates are removed. | Faster because duplicates are not removed. | 
37. What is a TIMESTAMP in MySQL?
A TIMESTAMP is a MySQL data type that stores both the date and time. It can automatically record the current date and time when a row is inserted or updated.
38. What is the use of ENUM in MySQL?
ENUM is a string data type that allows a column to store only one value from a predefined list of values.
Example:
CREATE TABLE Size (
    Name ENUM('Small', 'Medium', 'Large')
);
39. What is an Index in MySQL?
An Index is a database object that improves the speed of data retrieval from a table. It helps MySQL search records faster.
Syntax:
CREATE INDEX index_name
ON table_name(column_name);
40. What is a View? How to create a View in MySQL?
A View is a virtual table created from one or more tables using a SQL query. It does not store data itself but displays data from the underlying tables.
Syntax:
CREATE VIEW view_name AS
SELECT columns
FROM table_name
WHERE condition;
41. What is a Stored Function in MySQL?
A Stored Function is a database object that accepts input parameters, performs operations and returns a single value. It can be used inside SQL statements such as SELECT, WHERE and ORDER BY.
Syntax:
CREATE FUNCTION function_name(parameters)
RETURNS data_type
BEGIN
    -- SQL statements
    RETURN value;
END;
42. What is a Cursor in MySQL?
A Cursor is a database object used to retrieve and process query results one row at a time. It is mainly used inside stored procedures when row-by-row processing is required.
Example:
DECLARE
    emp_name VARCHAR(100);
    emp_cursor CURSOR FOR
        SELECT EmployeeName
        FROM Employees;
43. What are Transactions in MySQL?
A Transaction is a group of SQL statements executed as a single unit of work. If one statement fails, the transaction can be rolled back. Common transaction commands:
- START TRANSACTION: Begins a new transaction.
- COMMIT: Saves all the changes made during the transaction permanently.
- ROLLBACK: Undoes all changes made during the transaction if an error occurs.
44. What are the ACID Properties?
ACID properties ensure reliable database transactions.
- Atomicity: Either all operations succeed or none of them are applied.
- Consistency: Database remains valid.
- Isolation: Transactions do not interfere with each other.
- Durability: Committed changes are permanent.
45. What is Normalization?
Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity by dividing data into related tables.
Normal Forms:
- First Normal Form (1NF): Eliminates repeating groups by ensuring each column contains atomic values.
- Second Normal Form (2NF): Eliminates partial dependencies by ensuring non-key attributes depend on the entire primary key.
- Third Normal Form (3NF): Eliminates transitive dependencies so that non-key attributes depend only on the primary key.
46. What is a Composite Index in MySQL?
A Composite Index is an index created on two or more columns of a table. It improves query performance when the indexed columns are frequently used together in WHERE, ORDER BY or JOIN clauses.
Syntax:
CREATE INDEX index_name
ON table_name (column1, column2);
Example:
CREATE INDEX idx_name_department
ON Employees (EmployeeName, Department);
47. What is the difference between Clustered and Non-Clustered Index?
- Clustered Index: Stores the table data in the same order as the index. A table can have only one clustered index.
- Non-Clustered Index: Stores the index separately from the table data. A table can have multiple non-clustered indexes.
Note: In InnoDB, the table is organized by the primary key, which acts as the clustered index.
48. What is a Trigger in MySQL?
A Trigger is a database object that automatically executes a set of SQL statements when a specified event (INSERT, UPDATE or DELETE) occurs on a table.
Syntax:
CREATE TRIGGER trigger_name
BEFORE INSERT
ON table_name
FOR EACH ROW
BEGIN
    -- SQL statements
END;
Example:
CREATE TRIGGER before_employee_insert
BEFORE INSERT
ON Employees
FOR EACH ROW
SET NEW.CreatedAt = NOW();
49. What are Common Table Expressions (CTEs)?
A CTE (Common Table Expression) is a temporary named result set created using the WITH clause. It improves query readability and simplifies complex SQL queries.
Syntax:
WITH EmployeeCTE AS (
    SELECT *
    FROM Employee
)
SELECT *
FROM EmployeeCTE;
50. What are Window Functions in MySQL?
Window Functions perform calculations across a set of rows without grouping them.
- ROW_NUMBER(): Assigns a unique sequential number to each row within the result set.
- RANK(): Assigns a rank to each row. If two rows have the same value, they receive the same rank and the next rank is skipped.
- DENSE_RANK(): Similar to RANK(), but it does not skip rank numbers after ties.
- LAG(): Returns the value from the previous row in the result set.
- LEAD(): Returns the value from the next row in the result set.
To learn MySQL from scratch, refer to this article - MySQL Tutorial

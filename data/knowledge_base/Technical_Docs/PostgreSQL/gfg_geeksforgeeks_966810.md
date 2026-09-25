# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-insert/

The INSERT statement in PostgreSQL is used to add one or more new rows to a table. It allows you to insert values into all columns or only selected columns. PostgreSQL also supports inserting multiple rows in a single statement.
Syntax
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
Where:
- table_name: The name of the table where the data will be inserted.
- column1, column2, ...: The columns that will receive the values.
- value1, value2, ...: The values to be inserted into the corresponding columns.
Examples
Firstly, create an Employee table and insert some records into it.
CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
Age INT,
Salary NUMERIC(10,2)
);
Example 1: Insert a Single Row
The following query inserts a single record into the Employee table.
Query:
INSERT INTO Employee (EmployeeID, EmployeeName, Age, Salary)
VALUES (101, 'John', 28, 50000);
Output:
Example 2: Insert Multiple Rows
The following query inserts multiple records into the Employee table using a single INSERT statement.
Query:
INSERT INTO Employee (EmployeeID, EmployeeName, Age, Salary)
VALUES
(102, 'Emma', 32, 65000),
(103, 'David', 29, 55000),
(104, 'Sophia', 35, 70000);
Output:
Example 3: Insert Values into Selected Columns
The following query inserts values only into the specified columns.
Query:
INSERT INTO Employee (EmployeeID, EmployeeName)
VALUES (105, 'Michael');
Output:
Troubleshooting INSERT Statement Issues
- Duplicate primary key: Ensure the primary key value is unique.
- Column count mismatch: The number of values must match the specified columns.
- Data type mismatch: Insert values that are compatible with the column data types.
- NOT NULL constraint violation: Provide values for columns defined with the NOT NULL constraint.

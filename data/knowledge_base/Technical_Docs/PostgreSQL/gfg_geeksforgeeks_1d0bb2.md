# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-create-table/

The CREATE TABLE statement in PostgreSQL is used to create a new table in a database by defining its structure.
- Defines column names and their data types.
- Supports constraints to maintain data integrity
- Organizes data in a structured format for storing records.
Syntax
CREATE TABLE table_name (
    column1 data_type [constraint],
    column2 data_type [constraint],
    ...
    columnN data_type [constraint]
);
Where:
- table_name: The name of the table to be created.
- column1, column2, ... : The names of the table columns.
- data_type: Specifies the type of data each column can store.
- constraint (optional): Defines rules such as PRIMARY KEY, NOT NULL, UNIQUE, CHECK, or DEFAULT.
Example: Create an Employee Table
Firstly, creates an Employee table with columns for employee details, including a primary key, a NOT NULL constraint, a CHECK constraint, and a default joining date.
Query:
CREATE TABLE Employee ( EmployeeID INT PRIMARY KEY,    
FirstName VARCHAR(50) NOT NULL,    
LastName VARCHAR(50) NOT NULL,    
Department VARCHAR(50),   
 Salary NUMERIC(10,2) CHECK (Salary >= 0),   
 JoiningDate DATE DEFAULT CURRENT_DATE);
Output:
Inserting Data into the Employee Table
After creating the table, use the INSERT INTO statement to add records.
Query:
INSERT INTO Employee (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(101, 'John', 'Smith', 'HR', 45000.00),
(102, 'Emma', 'Johnson', 'Finance', 55000.00),
(103, 'Liam', 'Brown', 'IT', 68000.00)
,(104, 'Olivia', 'Davis', 'Marketing', 52000.00),
(105, 'Noah', 'Wilson', 'Sales', 48000.00);
Output:
Creating a Table from an Existing Table
PostgreSQL allows you to create a new table from an existing table using the CREATE TABLE AS statement. This copies the selected columns and their data into a new table.
Syntax:
CREATE TABLE new_table_name ASSELECT column1, column2, ...FROM existing_tableWHERE condition;
Example: Create a Backup of the Employee Table
The following query creates a new table named EmployeeBackup containing all records from the existing Employee table.
Query:
CREATE TABLE EmployeeBackup AS
SELECT *
FROM Employee;
Output:

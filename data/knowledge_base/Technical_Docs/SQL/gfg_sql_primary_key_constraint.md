# SQL PRIMARY KEY Constraint

> Source: https://www.geeksforgeeks.org/sql/primary-key-constraint-in-sql/

The PRIMARY KEY constraint in SQL uniquely identifies each record in a table and ensures strong data integrity. It prevents duplicate and NULL values, making it essential for reliable relational database design.
- Ensures all values are unique.
- Does not allow NULL values.
- Only one primary key per table (can be composite).
- Automatically creates a unique index for faster searches.
Query:
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50)
);
-- Insert data into employees table
INSERT INTO employees (emp_id, emp_name, department)
VALUES
(101, 'Bob', 'Sales'),
(102, 'Lucas', 'HR');
Output:
- EmpID is the primary key, so it must be unique and cannot be NULL.
- If you try inserting duplicate or NULL EmpID values, the database will throw an error.
Query:
-- Duplicate primary key value (EmpID = 101 already exists)
INSERT INTO Employees VALUES (101, 'Alice', 'IT');
-- NULL not allowed in primary key column
INSERT INTO Employees VALUES (NULL, 'Emma', 'Finance');
Error:
- First query fails because the primary key value 101 is duplicated.
- Second query fails because the primary key cannot be NULL.
Syntax
SQL primary key syntax with CREATE TABLE statement is:
CREATE TABLE table_name (
column1 data_type,
column2 data_type,
. . . . ,
PRIMARY KEY (column1, column2)
);
SQL primary key syntax with ALTER TABLE statement is:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
PRIMARY KEY (column1, column2, . . . . , Column_n);
Types of PRIMARY KEYS
There are two types of primary keys:
- Simple Primary Key: A primary key that consists of a single column.
- Composite Primary Key: A primary key that consists of multiple columns.
Examples
Let's look at some examples of the PRIMARY KEY Constraint in SQL, and understand it's working.
1. Create PRIMARY KEY in SQL
In this example, we will create primary key in a new table using CREATE TABLE statement.
Query
CREATE TABLE persons (
person_id INT PRIMARY KEY,
last_name VARCHAR(255),
first_name VARCHAR(255),
age INT
);
INSERT INTO persons
VALUES
(1, 'Johnson', 'Emily', 25),
(2, 'Walker', 'James', 30);
Output:
- person_id is the primary key, so it must be unique.
- Two valid rows are inserted with unique IDs.
2. Verify SQL Primary key creation
To verify if the primary key has been successfully created, we will try adding duplicate and null values in primary key column, and SQL should return an error.
Query
-- Duplicate primary key value (person_id = 1 already exists)
INSERT INTO persons
VALUES (1, 'Brown', 'Olivia', 27);
-- NULL is not allowed in the primary key column
INSERT INTO persons
VALUES (NULL, 'Miller', 'Ethan', 32);
Error:
- First query fails because person_id = 1 is already used, and primary keys must be unique.
- Second query fails because primary keys cannot be NULL.
3. Add PRIMARY KEY to a Existing Table
In this example, we will add primary key to a already existing table using ALTER TABLE command.
Query:
ALTER TABLE person
ADD CONSTRAINT PK_Person PRIMARY KEY (person_id);
- Adds a primary key to the table, ensuring person_id is unique and cannot be NULL.
- Assigns the name PK_Person to the constraint for easy identification.
Query:
INSERT INTO person VALUES (1, 'Williams', 'Sophia', 24);
INSERT INTO person VALUES (NULL, 'Davis', 'Liam', 29);
Error:
- The first insert fails because person_id = 1 is already in the table, violating the uniqueness rule.
- The second insert fails because primary keys cannot be NULL.
Benefits of Using Primary Keys
Primary keys uniquely identify each record in a table and help maintain data integrity.
- Speeds up data retrieval because a primary key automatically creates an index.
- Supports reliable table relationships through foreign keys.
- Prevents duplicate or NULL values, keeping the data consistent and clean.

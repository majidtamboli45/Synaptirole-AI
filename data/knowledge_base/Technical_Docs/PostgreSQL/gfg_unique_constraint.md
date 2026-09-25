# UNIQUE Constraint

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-unique-constraint/

The UNIQUE constraint in PostgreSQL ensures that all values in a column or a group of columns are unique across the table. Unlike a PRIMARY KEY, a table can have multiple UNIQUE constraints and a UNIQUE column can contain NULL values (unless it is also defined as NOT NULL).
- Prevent duplicate values in one or more columns.
- Maintain data uniqueness and consistency.
- Create unique constraints during table creation or using ALTER TABLE.
- Allow NULL values unless restricted by the NOT NULL constraint.
Syntax
Create a UNIQUE constraint using the CREATE TABLE statement is:
CREATE TABLE table_name (
    column1 data_type,
    column2 data_type,
    CONSTRAINT constraint_name UNIQUE (column_name)
);
Add a UNIQUE constraint:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
UNIQUE (column_name);
Examples
Firstly, create a Customers table and insert some records.
Example 1: Create a UNIQUE Constraint During Table Creation
The following query creates a Users table with a UNIQUE constraint on the Username column.
Query:
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    City VARCHAR(50)
);
INSERT INTO Users VALUES
(1, 'james01', 'New York'),
(2, 'emily02', 'Chicago');
Output:
| UserID | Username | City | 
|---|---|---|
| 1 | james01 | New York | 
| 2 | emily02 | Chicago | 
Explanation:
- The Username column is defined as UNIQUE.
- Since both usernames are different, the records are inserted successfully.
Example 2: Verify the UNIQUE Constraint
The following query attempts to insert a duplicate username.
Query:
INSERT INTO Users
VALUES
(3, 'james01', 'Boston');
Output:
ERROR: duplicate key value violates unique constraint "users_username_key"
DETAIL: Key (username)=(james01) already exists.
Explanation:
- The username james01 already exists.
- PostgreSQL rejects the insert because it violates the UNIQUE constraint.
Example 3: Add a UNIQUE Constraint to an Existing Table
Firstly, create a Suppliers table.
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    Email VARCHAR(100)
);
Add a UNIQUE constraint to the Email column.
Query:
ALTER TABLE Suppliers
ADD CONSTRAINT uq_supplier_email
UNIQUE (Email);
Output:
ALTER TABLE
Explanation:
- The ALTER TABLE statement adds a UNIQUE constraint to the Email column.
- PostgreSQL now prevents duplicate email addresses.
Example 4: Insert Duplicate Data After Adding the UNIQUE Constraint
Query:
INSERT INTO Suppliers VALUES
(101, 'ABC Traders', 'contact@abc.com');
INSERT INTO Suppliers VALUES
(102, 'XYZ Supplies', 'contact@abc.com');
Output:
ERROR: duplicate key value violates unique constraint "uq_supplier_email"
DETAIL: Key (email)=(contact@abc.com) already exists.
- The email address contact@abc.com already exists.
- PostgreSQL rejects the second insert because it violates the UNIQUE constraint.

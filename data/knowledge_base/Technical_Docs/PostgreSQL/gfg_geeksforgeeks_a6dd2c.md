# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-primary-key/

The PRIMARY KEY constraint in PostgreSQL uniquely identifies each record in a table. Every table can have only one primary key, which can consist of one or more columns.
- Prevent duplicate values in the primary key column.
- Disallow NULL values in the primary key.
- Improve query performance by automatically creating a unique index.
Syntax
PRIMARY KEY Syntax During Table Creation
CREATE TABLE table_name (
    column1 data_type,
    column2 data_type,
    PRIMARY KEY (column1)
);
PRIMARY KEY Syntax Using ALTER TABLE
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
PRIMARY KEY (column_name);
Types of Primary Key
There are two types of primary keys:
- Simple Primary Key: A primary key that consists of a single column.
- Composite Primary Key: A primary key that consists of two or more columns.
Examples
Firstly, create a 'Customers' table and insert some records.
Example 1: Create a PRIMARY KEY During Table Creation
The following query creates a Customers table with CustomerID as the primary key.
Query:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);
INSERT INTO Customers VALUES
(1, 'James Carter', 'New York'),
(2, 'Emily Johnson', 'Chicago');
Output:
Example 2: Verify the PRIMARY KEY Constraint
The following queries attempt to insert duplicate and NULL values into the primary key column.
Query:
INSERT INTO Customers
VALUES (1, 'Michael Brown', 'Dallas');
INSERT INTO Customers
VALUES (NULL, 'Sophia Davis', 'Boston');
Output:
- The first query fails because CustomerID = 1 already exists.
- The second query fails because the primary key column does not allow NULL values.
Example 3: Add a PRIMARY KEY to an Existing Table
Firstly, create a table without a primary key.
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE
);
Now, add a primary key to the OrderID column.
Query:
ALTER TABLE Orders
ADD CONSTRAINT PK_Orders
PRIMARY KEY (OrderID);
Output:
- The ALTER TABLE statement adds a primary key to the existing table.
- OrderID must now contain unique and non-NULL values.
Query:
INSERT INTO Orders
VALUES (1, 'Daniel Moore', '2026-07-20');
INSERT INTO Orders
VALUES (1, 'Emma Wilson', '2026-07-21');
INSERT INTO Orders
VALUES (NULL, 'Olivia Miller', '2026-07-22');
Output:
- The second insert fails because OrderID = 1 already exists.
- The third insert fails because the primary key column cannot contain NULL values.
Example 2: Create a Table with a Composite PRIMARY KEY
The following query creates a StudentCourses table with a composite primary key consisting of StudentID and CourseID.
Query:
CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);
INSERT INTO StudentCourses VALUES
(101, 1, '2026-01-10'),
(101, 2, '2026-01-15'),
(102, 1, '2026-01-18'),
(103, 3, '2026-01-20');
Output:
Benefits of Using PRIMARY KEY
The PRIMARY KEY constraint uniquely identifies each row in a PostgreSQL table and helps maintain data integrity.
- Automatically creates a unique index for faster data retrieval.
- Prevents duplicate and NULL values.
- Helps establish relationships between tables using foreign keys.
- Improves the consistency and reliability of database records.

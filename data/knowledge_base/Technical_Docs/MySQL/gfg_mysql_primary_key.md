# MySQL Primary Key

> Source: https://www.geeksforgeeks.org/mysql/mysql-primary-key/

MySQL provides the PRIMARY KEY constraint to uniquely identify each record in a table. It ensures that the key column contains only unique and non-NULL values.
- Uniquely identifies each row in a table.
- Does not allow duplicate or NULL values.
- Can be defined on one or multiple columns (composite key).
- Can be used with the AUTO_INCREMENT attribute on integer columns to automatically generate unique values.
Example:
CREATE TABLE students (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT
);
-- Insert data into students table
INSERT INTO students (id, name, age)
VALUES
(1, 'John', 20),
(2, 'Emily', 19),
(3, 'Michael', 21),
(4, 'Sophia', 18),
(5, 'James', 22);
Output:
INSERT INTO students (id, name, age) VALUES (3, 'Amanda', 20);
Output:
Types of Primary key
In MySQL, a primary key uniquely identifies each record in a table. Based on structure and usage, the main types are:
- Simple Primary Key: A primary key that uses a single column to uniquely identify each record.
- Composite Primary Key: A primary key that uses two or more columns together to uniquely identify each record.
How to Add Primary Key in MySQL Table
There are two ways in MySQL to create primary key in a table:
- Using CREATE TABLE Statement
- Using ALTER TABLE Statement
We can either create a primary key while create the table or add primary key after table creation. Let's look at both these methods with examples:
Syntax:
CREATE TABLE table_name (
column1 datatype,
column2 datatype,
PRIMARY KEY (column1)
);
//Composite Primary key
CREATE TABLE table_name (
column1 datatype,
column2 datatype,
column3 datatype,
PRIMARY KEY (column1, column2)
);
Example
Query to create a table and add primary key using CREATE TABLE statement:
CREATE TABLE GeeksForGeeks(
Id INT,
Name varchar(20),
PRIMARY KEY(Id)
);
Output:
Using PRIMARY KEY on ALTER TABLE
You can add a primary key in an already existing table by using the ALTER TABLE statement. If the table has already one primary key then you can't add another by using the ALTER TABLE statement.
Syntax:
ALTER TABLE table_name ADD PRIMARY KEY (column_name);
Example:
Query to add primary key by using ALTER TABLE statement:
ALTER TABLE Students ADD PRIMARY KEY(Name);
Output:
Drop Primary Key
To drop/remove a primary key from a table you can use the ALTER TABLE statement.
Syntax:
ALTER TABLE table_name DROP PRIMARY KEY;
Example:
Query to drop primary key by using ALTER TABLE statement:
ALTER TABLE GeeksForGeeks DROP PRIMARY KEY;
Output:
For a quick comparison, see the differences between Primary Key and Unique Key.

# MySQL DEFAULT Constraint

> Source: https://www.geeksforgeeks.org/mysql/mysql-default-constraint/

MySQL provides the DEFAULT constraint to assign a predefined value to a column when no value is specified during insertion.
- Assigns a default value when no value is provided.
- Automatically fills missing values with the defined default.
- Helps maintain data consistency.
- Requires a default value to be defined for the column.
How to Use DEFAULT CONSTRAINT
To add a DEFAULT constraint to a MySQL table, there are two methods available.
- Using CREATE TABLE Statement
- Using ALTER TABLE Statement
We can use these methods depending on whether we are creating a new table or updating a existing table.
Using DEFAULT Constraint on CREATE TABLE
We can add a DEFAULT constraint while creating a table in MySQL.
Syntax
CREATE TABLE table_name (
column1 data_type DEFAULT default_value,
column2 data_type DEFAULT default_value, ... );
Example
CREATE TABLE customers (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) DEFAULT 'example@domain.com',
city VARCHAR(50) DEFAULT 'Unknown'
);
Add DEFAULT Constraint with ALTER TABLE Statement
We can add DEFAULT Constraint to a already existing table using ALTER TABLE Statement.
Syntax
ALTER TABLE table_name 
ALTER column_name
SET DEFAULT default_value;
Example
ALTER TABLE customers 
ALTER city
SET DEFAULT 'New York';
DEFAULT Constraint Example
Let's create a MySQL table "blog_posts"
CREATE TABLE blog_posts (
post_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
content TEXT NOT NULL,
published_date DATE DEFAULT CURRENT_DATE
);
Output:
Insert new values into this table:
INSERT INTO blog_posts (title, content) 
VALUES ('My First Blog Post', 'Hello, world! This is my inaugural post.');
Output:
The published_date column is automatically assigned the current date because no value was provided during insertion.

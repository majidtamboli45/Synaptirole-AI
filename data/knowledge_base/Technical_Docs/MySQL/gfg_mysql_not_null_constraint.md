# MySQL NOT NULL Constraint

> Source: https://www.geeksforgeeks.org/mysql/mysql-not-null-constraint/

MySQL provides the NOT NULL constraint to ensure that a column cannot store NULL values. It helps maintain data accuracy and reliability by enforcing mandatory values in specific columns.
- It prevents NULL values from being inserted into a column.
- It ensures every row has a valid value for the column.
- It improves data accuracy and reliability.
Syntax:
CREATE TABLE table_name ( 
column_name datatype NOT NULL
);
- CREATE TABLE: Used to create a new table in the database.
- table_name: Name of the table to be created.
- column_name: Name of the column in the table.
- datatype: Specifies the type of data (e.g., INT, VARCHAR).
- NOT NULL: Ensures the column cannot contain NULL (empty) values.
We can add a NOT NULL constraint to an existing column using the ALTER TABLE statement
Syntax:
ALTER TABLE table_name
MODIFY COLUMN column_name data_type(size) NOT NULL;
- This command modifies the existing column.
- It sets the column to NOT NULL, preventing NULL values.
- Commonly used in MySQL to enforce data integrity.
Example:
Let’s create a users table without a NOT NULL constraint.
CREATE TABLE users (
user_id INT PRIMARY KEY,
username VARCHAR(50),
email VARCHAR(100),
age INT NOT NULL
);
INSERT INTO users (user_id, username, email, age) VALUES
(1, 'john_doe', 'john.doe@gmail.com', 30),
(3, 'robert264', 'robert.johnson@yahoo.com', 35);
Query :
INSERT INTO users (user_id, username, email, age) VALUES
(3, 'emma_w', 'emma.williams@gmail.com',NULL);
Output:
- The insert fails because email has a NULL value.
- A NOT NULL column requires a valid value, so NULL is not allowed.
- Therefore, the query is rejected due to violation of the NOT NULL constraint.
Adding a NOT NULL Constraint to an Existing Column
Use the ALTER TABLE command to modify the column and set it as NOT NULL. This ensures the column cannot contain NULL values and helps maintain data consistency.
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) NOT NULL;
- Modifies the email column to make it NOT NULL.
- Prevents insertion of NULL values in the email column.
- Ensures data consistency by requiring every row to have an email.
Query:
INSERT INTO users (user_id, username, email, age) VALUES 
(5, 'bob_miller',NULL, 25);
Output:
- Insert fails because email is NULL.
- The NOT NULL constraint does not allow NULL values.

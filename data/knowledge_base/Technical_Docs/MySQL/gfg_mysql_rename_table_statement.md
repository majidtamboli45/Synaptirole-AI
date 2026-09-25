# MySQL RENAME TABLE Statement

> Source: https://www.geeksforgeeks.org/mysql/mysql-rename-table-statement/

The MySQL RENAME TABLE statement is used to change the name of an existing table in a database. It helps keep the database organized by updating table names without affecting the stored data.
- Allows renaming one or multiple tables in a single command.
- Useful for restructuring or improving table naming while keeping existing data intact.
Syntax:
RENAME TABLE old_table_name TO new_table_name [, ...];
- old_table_name: The current name of the table.
- new_table_name: The new name you want to assign to the table.
Working with RENAME TABLE
The RENAME TABLE statement in MySQL is used to change the name of an existing table without affecting its stored data.
- It helps maintain a clear and organized database structure.
- MySQL also allows renaming multiple tables in a single command using this statement.
1. Renaming a Single Table
In this example, we create a table, insert some data, and then rename the table.
Query:
-- Create a table and insert data
CREATE TABLE old_table (
id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO old_table (id, name) VALUES (1, 'John'), (2, 'Alice'), (3, 'Bob');
-- Rename the table 'old_table' to 'new_table'
RENAME TABLE old_table TO new_table;
-- Check if the table is renamed
SELECT * FROM new_table;
Output:
- The RENAME TABLE statement changes the table name from old_table to new_table.
- The SELECT query confirms that the table has been successfully renamed and still contains the original data (John, Alice, and Bob).
2. Renaming Multiple Tables
MySQL also allows renaming multiple tables within a single statement.
Query:
-- Create two tables
CREATE TABLE old_table1 (
id INT PRIMARY KEY,
name VARCHAR(50)
);
CREATE TABLE old_table2 (
id INT PRIMARY KEY,
description TEXT
);
-- Insert data into both tables
INSERT INTO old_table1 (id, name) VALUES (1, 'John'), (2, 'Alice');
INSERT INTO old_table2 (id, description) VALUES (1, 'Description 1'), (2, 'Description 2');
-- Rename both tables simultaneously
RENAME TABLE old_table1 TO new_table1, old_table2 TO new_table2;
-- Check if tables are renamed
SELECT * FROM new_table1;
SELECT * FROM new_table2;
Output:
Output:
After renaming 'old_table1' to 'new_table1' and 'old_table2' to 'new_table2', the SELECT statements verify the renaming:
- new_table1: Displays rows with IDs 1 and 2, showing names 'John' and 'Alice'.
- new_table2: Displays rows with IDs 1 and 2, showing descriptions 'Description 1' and 'Description 2'.
3. Renaming a Table Using ALTER TABLE
Another way to rename a table in MySQL is by using the ALTER TABLE statement.
Query:
-- Create a table and insert data
CREATE TABLE old_table (
id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO old_table (id, name) VALUES (1, 'John'), (2, 'Alice');
-- Rename the table using ALTER TABLE
ALTER TABLE old_table RENAME TO new_table;
-- Check if the table is renamed
SELECT * FROM new_table;
Output:
- The ALTER TABLE ... RENAME TO command changes the table name from old_table to new_table.
- The SELECT query verifies that the renamed table still contains the existing records.
4. Renaming a Temporary Table
In MySQL, temporary tables store temporary data that exists only during the current session. These tables can also be renamed.
Query:
-- Create a temporary table
CREATE TEMPORARY TABLE temp_table (
id INT PRIMARY KEY,
name VARCHAR(50)
);
-- Insert data into the temporary table
INSERT INTO temp_table(id,name) VALUES (1,'John'),(2,'Alice');
-- Rename the temporary table
ALTER TABLE temp_table RENAME TO new_temp_table;
-- Check if the temporary table is renamed
SELECT * FROM new_temp_table;
Output:
The temporary table temp_table is renamed to new_temp_table using ALTER TABLE. The data stored in the table remains unchanged.

# Truncate All Tables in MySQL

> Source: https://www.geeksforgeeks.org/mysql/truncate-all-tables-in-mysql/

MySQL provides the TRUNCATE statement to remove all records from a table quickly while keeping the table structure intact. It is a Data Definition Language (DDL) operation used for efficient data removal.
- It deletes all data from a table in a single operation.
-  It is faster than DELETE as it does not scan individual rows.
- It resets the table for reuse by deallocating data pages.
- It does not remove the table structure (schema remains intact).
Syntax:
TRUNCATE TABLE TABLE_NAME;
- TRUNCATE TABLE: Keyword used to delete all data from a table
- table_name: Name of the table whose data will be removed
Steps for Truncate All Tables in Mysql:
Step 1: Now we will create a table called student having 4 columns, 1) id 2) roll_no 3) name 4) city
Query:
CREATE TABLE STUDENT (ID VARCHAR2(20), 
ROLL_NO INT, NAME VARCHAR2(50),
CITY VARCHAR2(50));
Step 2: To insert 4 rows in the table, execute the following query:
Query:
INSERT INTO STUDENT (student_id, roll_no, name, city)
VALUES 
('S111', 1, 'John', 'New York'),
('S121', 2, 'Michael', 'Los Angeles'),
('S131', 3, 'David', 'Chicago'),
('S141', 4, 'Emily', 'Houston');
Output:
Step 3: To flush all the data from a table, we will use the truncate command:
Query:
TRUNCATE TABLE STUDENT;
Output:
Step 4: All the rows (data) have been deleted in a single go. But the table structure prevails and that can be checked using following command:
Query:
exec sp_columns STUDENT;
Output:

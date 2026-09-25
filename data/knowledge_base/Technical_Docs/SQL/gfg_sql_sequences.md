# SQL SEQUENCES

> Source: https://www.geeksforgeeks.org/sql/sql-sequences/

SQL sequences are used to generate unique numbers automatically for things like primary keys and IDs. They help keep data organized and consistent in a database.
- Customized using START, INCREMENT, MIN and MAX.
- Sequence values are not reused, even after rollback.
Working
When creating a sequence, we set the start value, increment and limits. It can also restart (cycle) when it reaches the maximum.
Syntax
CREATE SEQUENCE sequence_name
START WITH initial_value
INCREMENT BY increment_value
MINVALUE min_value
MAXVALUE max_value
CYCLE | NOCYCLE;
Example 1: Creating a Sequence in Ascending Order
CREATE SEQUENCE sequence_1
start with 1
increment by 1
minvalue 0
maxvalue 100
cycle;
- The query creates a sequence named sequence_1.
- It starts from 1 and increases by 1 up to 100.
- After reaching 100, it restarts from 1.
Example 2: Creating a Sequence in Descending Order
CREATE SEQUENCE sequence_2
start with 100
increment by -1
min value 1
max value 100
cycle;
- The query creates a sequence named sequence_2.
- It starts from 100 and decreases by 1 each time.
- The values stay between 1 and 100.
Using SQL Sequences in Database Operations
A sequence can be used across multiple tables to generate unique values automatically, ensuring consistency and uniqueness.
Example: Using a Sequence to Insert Values
Create a students table and use a sequence to automatically generate unique student IDs using the NEXTVAL function.
Query:
CREATE TABLE students (
id INTEGER,
name CHAR(20)
);
INSERT INTO students (id, name)
VALUES
(1, 'James'),
(2, 'Michael');
Output
Cache Management in SQL Sequences
CACHE stores sequence values in memory to improve performance and reduce disk access.
Example: With CACHE 15, sequence values are pre allocated in memory. Unused values may be skipped after a restart. Use NOCACHE to avoid gaps, but it is slower.
Creating a Sequence with Cache
CREATE SEQUENCE sequence_3START WITH 1INCREMENT BY 1CACHE 10;
Features of SQL Sequences
The functionality of SQL sequences is defined by the following features:
- Order Control: They can produce numbers in ascending or descending order.
- Reusable: One sequence can be used for multiple tables.
- Independent: Sequences are not linked to any specific table.
- Efficient: They save time and reduce the need for manual ID generation.

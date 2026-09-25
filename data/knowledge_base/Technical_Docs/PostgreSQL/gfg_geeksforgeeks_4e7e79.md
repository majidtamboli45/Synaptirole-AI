# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-copy-a-table/

This article will focus on copying an existing table to a new table in PostgreSQL. This might come in handy while creating new tables that would either have the same data or data of the same table with certain operations performed on them.
Ways to Copy a Table
We will discuss the following 3 cases to copy a table in PostgreSQL:
Table of Content
1. Copy Table with the Same Structure and Data
To copy a table with all its structure and data, use the following query.
Syntax:
CREATE TABLE new_table AS TABLE old_table;
Example:
Let's add a table with columns 'id', 'first_name', 'last_name', and email to the database:
 TABLE students(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR,
   last_name VARCHAR,
   email VARCHAR UNIQUE
);
INSERT INTO students(first_name, last_name, email)
VALUES('Virender', 'Sehwag', 'virender.sehwag@gfg.com'),
    ('Hardik', 'Pandiya', 'hardik.Pandiya@gfg.com');
SELECT * FROM students;
If everything works fine, the output will as below:
Now copy the students table to a new table named copy_students table.
CREATE TABLE copy_students AS TABLE students;
The above query will create a new table named 'copy_students' with the same structure and data as the students table.
Now check the data of the copy_students table:
SELECT * FROM copy_students;
Output:
2. Copy Table with the Same Structure and No Data
WITH NO DATA clause is used to copy a table structure without the data using the below query.
Syntax:
CREATE TABLE new_table AS TABLE old_table WITH NO DATA;
Example:
Let's use the students table that we created before:
CREATE TABLE without_data_students AS TABLE students WITH NO DATA;
Execute the above query to get the table without_data_students with the same structure as students with no data.
SELECT * FROM without_data_students;
Output:
3. Copy Table with the Same Structure and Partial Data
The below query can be used to copy a table according to a specified condition.
Syntax:
CREATE TABLE new_table AS TABLE old_table WHERE condition;
Example:
Let's insert some more rows into the students table:
INSERT INTO students(first_name, last_name, email)
VALUES('Shreyas', 'Iyer', 'shreyas.iyer@gfg.com'),
    ('Rishabh', 'Pant', 'rishabh.pant@gfg.com');
Now the students table will have the following data:
SELECT * FROM students;
Now the students table will look like this:
Let's create a table 'copy_partial_students' with id 1 and 3 only:
CREATE TABLE copy_partial_students AS 
SELECT * FROM students 
WHERE id IN (1, 3);
Instead of *, you can also define the column names that you want to copy. The result table columns will have the names and data types as same as the output columns of the SELECT clause.
Now check the data of the copy_partial_students table:
SELECT * FROM copy_partial_students;
Output:

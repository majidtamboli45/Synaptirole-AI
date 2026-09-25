# MySQL COMPOSITE KEY

> Source: https://www.geeksforgeeks.org/mysql/mysql-composite-key/

A composite key uniquely identifies records using a combination of two or more columns.
- Combines two or more columns to uniquely identify each record.
- Ensures uniqueness based on the combined values.
- Can be defined as a PRIMARY KEY or UNIQUE constraint.
Types of Composite Key
In MySQL, composite keys can be defined based on how they are used:
- Composite Primary Key: Uses two or more columns together as the primary key.
- Composite Unique Key: Uses two or more columns together to enforce uniqueness.
How to Add Composite Key in MySQL Table
There are two ways to create a composite key in MySQL:
- Using CREATE TABLE Statement
- Using ALTER TABLE Statement
Syntax
CREATE TABLE table_name (    column1 datatype,    column2 datatype,    column3 datatype,    PRIMARY KEY (column1, column2));
Example
The following query creates a table with employee_id and department_id as a composite primary key:
CREATE TABLE enrollments (
student_id INT,
course_id INT,
course_name VARCHAR(50),
PRIMARY KEY (student_id, course_id)
);
Insert Records
INSERT INTO enrollments (student_id, course_id, course_name)
VALUES
(101, 1, 'Mathematics'),
(101, 2, 'Physics'),
(102, 1, 'Mathematics'),
(103, 3, 'Computer Science');
Output:
Using Composite Key with ALTER TABLE
A composite key can also be added to an existing table using the ALTER TABLE statement.
Syntax
ALTER TABLE table_nameADD PRIMARY KEY (column1, column2);
Example
The enrollments table already contains student_id and course_id. We can add a composite primary key using:
ALTER TABLE enrollmentsADD PRIMARY KEY (student_id, course_id);
Here, student_id and course_id together uniquely identify each enrollment.
Verify the Composite Key
DESCRIBE enrollments;
Output:
Drop Composite Key
Syntax
ALTER TABLE table_nameDROP PRIMARY KEY;
Example
ALTER TABLE enrollmentsDROP PRIMARY KEY;
This removes the composite primary key from the enrollments table.

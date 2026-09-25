# MySQL UPDATE JOIN

> Source: https://www.geeksforgeeks.org/mysql/mysql-update-join/

A widely used open-source relational database management system that allows you to efficiently store, organize, and retrieve data. Developed by Oracle, My SQL is widely used for building and managing databases that handle interactive websites and applications. We'll discuss the syntax, and demonstrate how this dynamic duo can efficiently modify data across interconnected tables. Whether you're a database administrator or a developer, understanding the UPDATE JOIN operation in MySQL will enhance your ability to manage and manipulate data effectively.
MySQL UPDATE JOIN
The update query in MySQL is a Data Manipulation Language (DML) statement, that performs the modification of a table's data. It allows us to update values in one table depending on the values in another table that are connected by a join condition or you can say that It is used to change the values in one or more columns of a single row or multiple rows.
Joins are often used to query rows from a table that have or may not have matching rows in another table. UPDATE with JOIN clause is used in MySQL to update data in one table using another table and Join condition.
UPDATE JOIN can also be used with different joins like INNER JOIN, LEFT JOIN, RIGHT JOIN, etc. It can also be used to update multiple columns of a table by adding additional SET clauses to the statement. The SET clause is used to change the values of the column specified in the WHERE clause.
Syntax:
UPDATE table1
JOIN table2 ON table1.column_name = table2.column_name
SET table1.column_to_update = new_value
WHERE condition;
This MySQL UPDATE JOIN statement is used to modify data in the first table (table1) based on values from the second table (table2) that satisfy a specified condition. It employs a JOIN clause, linking the tables on a common column (column_name), and the SET clause is utilized to update the specified column (column_to_update) in table1 with a new value (new_value).The WHERE clause is used to specify any additional condition that is needed to be applied as per the question.
How does UPDATE JOIN Work?
- The table that has to be updated will be followed by the UPDATE keyword.
- Use JOIN with the second table and choose the appropriate type (INNER, LEFT, etc.)
- Specify the ON clause to define the condition for combining tables.
- then the SET keyword can be used to specify the column you want to update in the first table, along with the new value that you want to set.
- and in last the WHERE keyword is used to add extra conditions for updating, if needed.
- This methodology ensures a systematic and precise update of data across interconnected tables.
Examples of UPDATE JOIN
In this Article, we’re going to look at some examples of MysQL Update joins to help you understand the topics better.
Example1: Updating Based on Matching Columns
-- create table Courses
CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(50)
);
-- create table Students
CREATE TABLE students (
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
course_id INT,
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- create table Grades
CREATE TABLE grades (
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
grade INT,
FOREIGN KEY (student_id) REFERENCES students(student_id)
);
-- Inserting sample data into Courses
INSERT INTO courses (course_id, course_name)
VALUES (1, 'Math'), (2, 'History'), (3, 'Science');
-- Inserting sample data into Students
INSERT INTO students (student_id, student_name, course_id)
VALUES (1, 'Alice', 1), (2, 'Bob', 2), (3, 'Charlie', 3);
-- Inserting sample data into Grades
INSERT INTO grades (student_id, student_name, grade)
VALUES (1, 'Alice', 90), (2, 'Bob', 85), (3, 'Charlie', 92);
-- Updating grades for students in the 'Science' course
UPDATE students
JOIN courses ON students.course_id = courses.course_id
JOIN grades ON students.student_id = grades.student_id
SET grades.grade = grades.grade + 5
WHERE courses.course_name = 'Science';
In this example:
- We have courses, students, and grades tables.
- The UPDATE JOIN statement is used to increase the grades by 5 for students in the Science course. 
- The specified conditions in the JOIN and WHERE clauses ensure the update is applied to the correct students.
Output:
| student_id | student_name | grade | 
|---|---|---|
| 1 | Alice | 90 | 
| 2 | Bob | 85 | 
| 3 | Charlie | 97 | 
In this, the grade for the student Charlie in the Science course has been updated from 92 to 97, reflecting the increase of 5 specified in the UPDATE query.
Grades for other students remain unchanged.
Exampke2: UPDATE With INNER JOIN
-- Creating sample tables
CREATE TABLE students (
studentid INT PRIMARY KEY,
studentname VARCHAR(50),
age INT
);
CREATE TABLE age_increase (
studentid INT PRIMARY KEY,
age_increase_amount INT
);
-- Inserting sample data
INSERT INTO students VALUES
(1, 'Tina', 20),
(2, 'Isha', 22),
(3, 'Rahul', 21);
INSERT INTO age_increase VALUES
(1, 2),
(3, 1);
-- Update query with INNER JOIN
UPDATE students
INNER JOIN age_increase ON students.studentid = age_increase.studentid
SET students.age = students.age + age_increase.age_increase_amount;
In this example:
- We have a students table with student names and ages.
- We have an age_increase table with student IDs and the amount by which their ages should be increased.
- We're using an INNER JOIN to update ages based on the predefined increase for each student.
Output:
| studentid | studentname | age | 
|---|---|---|
| 1 | Tina | 22 | 
| 2 | Isha | 22 | 
| 3 | Rahul | 22 | 
In this, the ages of students in the students table have been updated based on the predefined increase from the age_increase table.
The INNER JOIN ensures that only matching records are updated.
Example3: UPDATE With LEFT JOIN
CREATE TABLE orders (
order_id INT PRIMARY KEY,
status VARCHAR(20),
customer_id INT
);
CREATE TABLE customers (
id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO orders VALUES
(123, 'pending', 1),
(456, 'processing', NULL);
INSERT INTO customers VALUES
(1, 'Alia'),
(2, 'Bob');
UPDATE orders
LEFT JOIN customers ON orders.customer_id = customers.id
SET orders.status = 'inactive'
WHERE customers.id IS NULL;
In this example:
-  SQL script, tables for orders and customers are created with sample data. 
- The UPDATE statement then uses a LEFT JOIN to set the status of orders without a matching customer in the customers table to inactive.
Output:
| order_id | status | customer_id | 
|---|---|---|
| 456 | inactive | NULL | 
In this, the status of the order with order_id 456 has been changed to inactive because it didn't have a corresponding customer (where customer_id is NULL).
Conclusion
MySQL UPDATE with JOIN allows you to update a table based on data from another table or tables. You can join multiple tables using the JOIN keyword and use the SET clause to specify the columns to update and the values to set.
There are various types of join, such as INNER JOIN, LEFT JOIN, and RIGHT JOIN,each with a specific set of use cases making it easy to update data based on the relationships between the tables and It's a versatile and essential feature for keeping your database content accurate and well-connected.

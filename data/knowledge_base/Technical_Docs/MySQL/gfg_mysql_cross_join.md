# MySQL CROSS JOIN

> Source: https://www.geeksforgeeks.org/mysql/mysql-cross-join/

MySQL is an open-source relational database management system that uses Structured Query Language (SQL) to manipulate databases. It stores data in a table format. It provides various statements to perform Create, Read, Update, and Delete operations on a database table. Among these operations, MySQL also provides the CROSS JOIN statement to combine rows from different tables.
In this article, we will learn about the concept of CROSS JOIN in MySQL, exploring its applications through examples of both simple and complex CROSS JOIN operations.
MySQL CROSS JOIN
A CROSS JOIN, also known as a Cartesian Join, is a type of join that returns the Cartesian product of the two joined tables. This means that each row from the first table is combined with every row from the second table. If the first table has m rows and the second table has n rows, the result set will have m×n rows.
Syntax:
SELECT column1, column2, ..., columnN
FROM table1
CROSS JOIN table2;
In this syntax,
- Table 1 and Table 2 are the names of the tables.
- column1, column2, ..., columnN are the names of the columns you want to retrieve from the combined tables. You can use* to select all columns from both tables.
Examples of CROSS JOIN
Example 1: Simple CROSS JOIN
In this example, there a two tables of customers and orders, including the customer_id as a foreign key. The CROSS JOIN combines every row from the customers table with every row from the orders table.
First, we will create customers and orders tables by using the following query:
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
Then, we will add some records in both of these tables by using the following query:
-- Insert data into the customers table
INSERT INTO customers VALUES (1, 'Customer A');
INSERT INTO customers VALUES (2, 'Customer B');
INSERT INTO customers VALUES (3, 'Customer C');
-- Insert data into the orders table
INSERT INTO orders VALUES (101, '2024-01-01', 1);
INSERT INTO orders VALUES (102, '2024-01-02', 2);
INSERT INTO orders VALUES (103, '2024-01-03', 3);
Now, we will use the following query to perform the CROSS JOIN operation:
SELECT * FROM customers
CROSS JOIN orders;
Output:
Example 3: LEFT JOIN with WHERE Clause
In this example, we will use a LEFT JOIN to combine data from the customers and orders tables. The LEFT JOIN will return all rows from the customers table and the matched rows from the orders table. If no match is found, the result is NULL on the side of the orders table. We will also add a WHERE clause to filter the results.
Step 1: Use Existing Tables
We will use the existing customers and orders tables created in Example 1.
Step 2: Insert Additional Records
Let's add an additional record to the customers table to demonstrate the LEFT JOIN with unmatched data:
-- Insert additional data into the customers table
INSERT INTO customers VALUES (4, 'Customer D');
Now, we will use the following query to perform the LEFT JOIN operation and filter the results to show only orders placed in January 2024:
SELECT customers.customer_id, customers.customer_name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_date BETWEEN '2024-01-01' AND '2024-01-31';
Output:
customer_id | customer_name | order_id | order_date
------------|---------------|----------|------------
1 | Customer A | 101 | 2024-01-01
2 | Customer B | 102 | 2024-01-02
3 | Customer C | 103 | 2024-01-03
Example 2: Complex CROSS JOIN
In this example, there a three tables students, courses, and grades. The CROSS JOIN combines every row from the three tables and returns all possible combinations of a student, course, and grade.
First, we will create students, courses, the and grades tables by using the following query:
CREATE TABLE students (
student_id INT PRIMARY KEY,
student_name VARCHAR(50)
);
CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(50)
);
CREATE TABLE grades (
grade_id INT PRIMARY KEY,
grade_name VARCHAR(2)
);
Then, we will add some records in all of this table by using the following query:
-- Insert data into the students table
INSERT INTO students VALUES (1, 'Student A');
INSERT INTO students VALUES (2, 'Student B');
-- Insert data into the courses table
INSERT INTO courses VALUES (101, 'Math');
INSERT INTO courses VALUES (102, 'Science');
-- Insert data into the grades table
INSERT INTO grades VALUES (1, 'A');
INSERT INTO grades VALUES (2, 'B');
Now, we will use the following query to perform the CROSS JOIN operation:
SELECT * FROM students
CROSS JOIN courses
CROSS JOIN grades;
represents
Output:
Conclusion
MySQL CROSS JOIN statement helps us to get a Cartesian product of two or more tables. It combines each row of one table with each row of another table and returns a new table with all possible combinations. However, it should be carefully used because it can lead to large result sets and potential performance issues. Users should apply CROSS JOIN selectively, taking into account the specific requirements of their queries and the potential impact on performance.

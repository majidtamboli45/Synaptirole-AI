# SQL LIMIT Clause

> Source: https://www.geeksforgeeks.org/sql/sql-limit-clause/

The SQL LIMIT clause is used to control the number of records returned by a query. It helps you retrieve only a specific portion of data instead of the entire result set, which is especially useful when working with large databases.
Example: First, we will create a demo SQL database and table, on which we will use the LIMIT Clause command.
Query:
SELECT * 
FROM employees
LIMIT 2;
Output:
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition
ORDER BY column
LIMIT [offset,] row_count;
- offset: number of rows to skip before returning the result set.
- row_count: number of rows to return in the result set.
Example 1: Basic LIMIT Usage
Let's look at some examples of the LIMIT clause in SQL to understand it's working.
student Table:
Query:
SELECT * FROM student 
LIMIT 3;
Output:
Example 2: LIMIT with ORDER BY Clause
In this example, we will use the LIMIT clause with ORDER BY clause to retrieve the top 3 students sorted by their age.
Query:
SELECT * FROM student
ORDER BY age DESC
LIMIT 3;
Output:
- Sorts students by their grades in descending order.
- Restricts the output to only the top 3 students.
- Quickly retrieves the highest-performing records without complex conditions.
SQL LIMIT with OFFSET
The OFFSET clause skips a specified number of rows before displaying the result. It is used with the ORDER BY clause.
Syntax
SELECT * FROM table_name ORDER BY column_name LIMIT X OFFSET Y; OR
SELECT * FROM table_name ORDER BY column_name LIMIT Y,X; - X: Number of rows to return.
- Y: Number of rows to skip.
Example: Skipping First 2 Rows & Fetching 2 Rows
Imagine we have a list of students, but we want to skip the first 2 rows and fetch the next 2 students based on their age.
Query:
SELECT * 
FROM student
ORDER BY age
LIMIT 2 OFFSET 2;
Output:
Using LIMIT to Get the nth Highest or Lowest Value
Now we will look for LIMIT use in finding highest or lowestvalue we need to retrieve the rows with the nth highest or lowest value. In that situation, we can use the subsequent LIMIT clause to obtain the desired outcome.
Syntax
SELECT column_list  
FROM table_name
ORDER BY expression [ASC | DESC]
LIMIT n-1, 1;
Example: Fetching the 3rd Highest Age
We want to find the third-highest age from your student table. We can do this using LIMIT along with ORDER BY.
Query:
SELECT age FROM student  
ORDER BY DESC age
LIMIT 2, 1;
Output:
- Orders records in descending order (highest age first).
- Skips 2 records (LIMIT 2) and retrieves the next one (LIMIT 2,1).
Using LIMIT with WHERE Clause
The WHERE clause can also be used with LIMIT. It produces the rows that matched the condition after checking the specified condition in the table.
Example: Fetching a Limited Set of students Based on ID
We want to find the youngest student with an ID less than 4.
Query:
SELECT age
FROM student
WHERE id<4
ORDER BY age
LIMIT 2, 1;
Output:
- Filters students with an ID less than 4 and sorts them by age.
- Skips the first result and retrieves the second youngest student.
Restrictions on the LIMIT clause
There are several limitations of SQL LIMIT. The following situations do not allow the LIMIT clause to be used:
- The LIMIT clause cannot be used when defining a view.
- It is not allowed in nested SELECT statements, except when used inside subqueries in the FROM clause (table expressions).
- LIMIT cannot be used in embedded SELECT statements that act as expressions in singleton SELECTs within SPL routines.

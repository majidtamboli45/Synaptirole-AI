# MySQL ORDER BY Clause

> Source: https://www.geeksforgeeks.org/mysql/mysql-order-by-clause/

MySQL provides the ORDER BY clause to sort the result set based on one or more columns. It is useful for organizing data in ascending or descending order for better analysis and readability.
-  It sorts data in ascending (ASC ) or descending (DESC ) order.
- It works on one or more columns to organize results.
- It sorts data in ascending order by default.
- It helps in presenting data in a meaningful and structured way.
Syntax:
SELECT column1, column2, ...
FROM table
ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...;
- ASC (default): Sorts the result set in ascending order.
- DESC: Sorts the result set in descending order.
Demo MySQL Database
We will use the following table for our ORDER BY clause examples. To create and use this table on your system, execute the following MySQL queries:
Working with ORDER BY Clause
Now let's look at some examples of the ORDER BY clause, and understand its workings in different scenarios.
Example 1: ORDER BY CLAUSE Using ASC/DESC Attribute
We can use the ASC attribute to sort in ascending order and the DESC attribute to sort in descending order. These are both very useful attributes of the ORDER BY clause.
- Using ASC Attribute
CASE 1: Let's sort the displayed data in the table in ascending order for the "courses enrolled" column, but for this time we are going to use the ASC keyword along with the ORDER BY clause.
Query:
SELECT * from 
geeksforgeeks ORDER BY courses_enrolled ASC;
Output:
- Using DESC Attribute
CASE 2: Let's sort the displayed data with respect to the courses enrolled column but this time we are displaying the data in descending order.
Query
SELECT * FROM 
geeksforgeeks ORDER BY courses_enrolled DESC;
Output:
Example 2: ORDER BY CLAUSE With Multiple Columns
In this example, we will implement the ORDER BY clause on multiple columns in a single query, and for better understanding, we will first add some data with duplicate ranks to the table.
Query:
INSERT INTO geeksforgeeks(user_id,name,rank,courses_enrolled,questions_solved)
VALUES('vaibhav455','Vaibhav',05,08,110);
INSERT INTO geeksforgeeks(user_id,name,rank,courses_enrolled,questions_solved)
VALUES('karan565','Karan',05,07,100);
Now let's implement our query of the ORDER BY clause in multiple columns
Query:
SELECT * FROM geeksforgeeks
ORDER BY rank, name desc;
Output:
- Data is first sorted by the rank column in ascending order, giving it the highest priority.
- If multiple rows have the same rank, they are then sorted by the name column in descending order.
Example 3: ORDER BY CLAUSE With NULL VALUES
To implement this example, we will update the rank column to NULL for the users with IDs 'ayush105' and 'harsh05' using the UPDATE statement.
Query:
UPDATE geeksforgeeks
SET rank = NULL
WHERE user_id = 'ayush105' or user_id = 'harsh05';
Now let's display our table values in ascending order with respect to the rank column.
Query:
SELECT * 
from geeksforgeeks ORDER BY rank;
Output:

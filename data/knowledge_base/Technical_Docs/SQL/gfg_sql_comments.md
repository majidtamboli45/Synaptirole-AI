# SQL Comments

> Source: https://www.geeksforgeeks.org/sql/sql-comments/

SQL comments are written inside SQL code to help developers understand what the code is doing. They are not executed by the database and are used to explain queries, give additional information or make the code easier to read and maintain.
- Help in explaining the purpose of SQL statements.
- Make the code more readable and easier to maintain.
- Allow developers to temporarily disable parts of a query for testing or debugging.
Types of SQL Comments
SQL comments are used to explain SQL code or temporarily disable SQL statements. These are different types of commenting methods in SQL, each with its unique use. Let's discuss these SQL comments in detail below:
- Single-line comments
- Multi-line comments
- In-line comments
1. SQL Single Line Comments
Single-line comments are used for short explanations in SQL and start with --. Everything after -- on that line is treated as a comment.
Syntax:
-- single line comment
Query:
SELECT * FROM Students;  -- This gets all student records
The comment explains that the query retrieves all records from the Students table.
2. SQL Multi-Line Comments
Multi-line comments are used for longer notes or multiple lines of SQL code. They are enclosed between /* and */.
Syntax:
/* multi line comment
another comment */
Query:
SELECT * 
FROM orders
WHERE YEAR(order_date) = 2022;
/* This query retrieves all orders
that were placed in the year 2022 */
The multi-line comment explains that the query retrieves all orders placed in the year 2022 from the orders table.
3. SQL In-Line Comments
In-line comments are used to add brief notes within an SQL statement. They are enclosed between /* and */.
Syntax:
SELECT * FROM Customers; /* Fetching all customer records */
Query:
SELECT 
customer_name, -- Name of the customer
order_date -- Date when the order was placed
FROM orders;
In-line comments explain what customer_name and order_date mean. They make the code easier to understand for others.

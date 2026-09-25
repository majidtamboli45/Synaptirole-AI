# MySQL RIGHT JOIN

> Source: https://www.geeksforgeeks.org/mysql/mysql-right-join/

MySQL provides the RIGHT JOIN to return all rows from the right table and matching rows from the left table.
- Returns all records from the right table.
- Returns matching records from the left table.
- Shows NULL for unmatched left-table records.
- Helps identify unmatched records between tables.
Syntax
Following is the syntax for Right join in MYSQL:
SELECT columns
FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;
Example
Consider the following two tables: orders and customer.
Order Table:
Customer Table:
Use the following RIGHT JOIN query:
SELECT Orders.order_id,
Orders.product,
Customers.customer_name
FROM Orders
RIGHT JOIN Customers
ON Orders.customer_id = Customers.customer_id;
Output:
- The query returns all customers from the right table and their matching orders. Since Olivia and Daniel have no matching orders, their order details are shown as NULL.
RIGHT JOIN with WHERE Clause
To find customers who have no orders:
SELECT Orders.order_id,
Orders.product,
Customers.customer_name
FROM Orders
RIGHT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Customers.customer_id > 2;
Output:
- The WHERE clause filters the customers whose customer_id is greater than 2.
- Michael has a matching order, while Olivia and Daniel do not.
- Since Olivia and Daniel have no matching orders, their order details are shown as NULL.

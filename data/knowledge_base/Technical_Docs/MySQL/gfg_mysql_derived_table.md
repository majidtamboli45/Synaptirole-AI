# MySQL Derived Table

> Source: https://www.geeksforgeeks.org/mysql/mysql-derived-table/

A Derived Table in MySQL is a temporary table created from a subquery within a query. It is used to simplify complex queries and can be treated like a regular table.
- It is created using a subquery in the FROM clause.
- It helps in breaking complex queries into simpler parts.
- It is useful for data analysis and intermediate results.
Syntax:
SELECT ...... FROM (SUBQUERY) [AS] table_name  WHERE Conditions;
- SUBQUERY: Inner query that creates a temporary table.
- table_name: Alias given to the derived table.
- condition: Used to filter results from the derived table.
Example of Derived Tables
The following examples demonstrate how derived tables are used in MySQL to simplify queries.
Example 1: Average Age of Customers in the USA
Suppose we have a Customer table whose data is shown below:
Now, execute the below statement to understand how we can use a subquery to form a derived table.
SELECT AVG(age) 
FROM (
    SELECT first_name, age 
    FROM Customers 
    WHERE country = 'USA'
) AS temp;
Here the subquery in bold creates a derived table with the Conditions in it. The derived table is shown below:
The outer query executes on the derived table and calculates the average age from it, producing the final result.
Output:
- A subquery creates a derived table with first names and ages of customers from the USA.
- The outer query calculates the average age from this derived table, making analysis easier.
Example 2: Total Amount of Eligible Orders
For a Better Understanding of Derived Tables Let's have another example of Table Order which is shown below:
Now to create a table derived from Order table we will execute a query with a subquery.
SELECT SUM(amount)
FROM 
(SELECT order_id,item,amount,customer_id FROM Orders
where amount between 270 and 700) 
where amount>=250;
Output:
The sum of all the amount in derived table with amount greater than 250 i.e., OUTPUT of our SQL Query will be
Output:
Restrictions for Derived Table in MySQL
- MySQL does not allow correlated subqueries inside derived tables.
- A derived table works independently within a query.
- Outer references are not allowed in a derived table.

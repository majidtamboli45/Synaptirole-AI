# SQL SELECT Query

> Source: https://www.geeksforgeeks.org/sql/sql-select-query/

The SQL SELECT statement is used to retrieve data from one or more tables and display it in a structured format of rows and columns.
- Fetches all columns using * or specific columns by name.
- Filters and sorts data using WHERE and ORDER BY.
- Supports grouping, aggregation and table relationships using GROUP BY, HAVING and JOIN.
Example: First, we create a demo SQL table, on which we use the SELECT query.
Query:
SELECT customers_id, first_name
FROM customers;
Output:
Syntax
SELECT column1,column2.... 
FROM table_name;
- column1, column2: columns you want to retrieve.
- table_name: name of the table you're querying.
Working
The SELECT statement is used to retrieve and display data from one or more tables in a structured and readable format.
Example 1: Select Specific Columns
In this example, we will demonstrate how to retrieve specific columns from the customerss table. Here we will fetch only first_name and last_name for each record.
Query:
SELECT first_name, last_name 
FROM customers;
Output:
Example 2: Select All Columns
In this example, we will fetch all the fields from table customerss:
Query:
 SELECT * FROM customers;
Output:
Example 3: SELECT Statement with WHERE Clause
Suppose we want to see table values with specific conditions then WHERE Clause is used with select statement. In this example, filter customers who are 21 years old.
Query:
SELECT first_name
FROM customers
WHERE age = 21;
Output:
Example 4: SELECT with GROUP BY Clause
In this example, we will use SELECT statement with GROUP BY Clause to group rows and perform aggregation. Here, we will count the number of customers from each country.
Query:
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;
Output:
Example 5: SELECT with DISTINCT Clause
In this example, we will use DISTINCT keyword to return only unique values from a column. Here, we will fetch unique countries from the customers table.
Query:
SELECT DISTINCT country
FROM customers;
Output:
Example 6: SELECT Statement with HAVING Clause
The HAVING clause is used to filter results after applying GROUP BY. In this example, we will find countries that have 2 or more customers in the customers table.
Query:
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(*) >= 2;
Output:
Example 7: SELECT Statement with ORDER BY clause
In this example, we will use SELECT Statement with ORDER BY clause. Here, Sort results by Age in descending order.
Query:
SELECT *
FROM customers
ORDER BY age DESC;
Output:
Example 8: SELECT Statement with LIMIT clause
In this example, we will use SELECT Statement with LIMIT clause
Query:
SELECT * FROM customers
LIMIT 3;
Output:

# COUNT() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/count-function-in-mysql/

The COUNT() function in MySQL is an aggregate function used to count rows or values in a result set. It helps analyze how many records meet specific conditions in a query.
- Counts total rows or non-NULL values based on the column or condition used.
- Can be applied to entire tables, specific columns, or filtered results using WHERE.
- Commonly used with GROUP BY to count records within each group.
- Accepts a single expression and ignores NULL values while counting.
Syntax:
COUNT(expression)
expression: This can be a column name, *, or an expression
Working with the COUNT() Function
This section shows how COUNT() works using a sample table. It demonstrates counting total, non-NULL, and unique values. First, we will create a demo table on which the COUNT() function will be applied:
Example 1: COUNT(*) Function
This example counts the total number of rows in the sales table. It includes all rows regardless of NULL values.
Query:
SELECT COUNT(*) AS TotalRows 
FROM sales;
Output:
- Counts all rows in the table without considering NULL values.
- Returns the total number of records present in the table.
Example 2: COUNT(expression) Function
This example counts the number of rows where the quantity column is not NULL. Only valid values are considered.
Query:
SELECT COUNT(quantity) AS NonNullQuantities 
FROM sales;
Output:
- Counts only non-NULL values in the quantity column.
- Ignores rows where quantity contains NULL.
Example 3: COUNT(DISTINCT expression) Function
This example counts the number of unique product names in the sales table. Duplicate values are counted only once.
Query:
SELECT COUNT(DISTINCT product_name) AS UniqueProducts 
FROM sales;
Output:
- Counts only distinct (unique) values in the product_name column.
- Ignores duplicate entries like repeated "Laptop" values.

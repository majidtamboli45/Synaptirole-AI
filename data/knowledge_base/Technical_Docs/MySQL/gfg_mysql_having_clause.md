# MySQL HAVING Clause

> Source: https://www.geeksforgeeks.org/mysql/mysql-having-clause/

MySQL provides the HAVING clause to filter grouped data based on aggregate conditions. It is useful for applying conditions on results obtained after using the GROUP BY clause.
- It filters grouped data after aggregation is performed.
-  It is used with the GROUP BY clause.
- It allows conditions on aggregate functions like SUM, COUNT, AVG, etc.
- It works similarly to the WHERE clause but is applied after grouping.
Syntax:
SELECT column1, column2, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column1, column2
HAVING AGGREGATE_FUNCTION(column_name) condition;
Where:
- column1, column2 : Columns to include in the result.
- table_name : The table from which to retrieve data.
- AGGREGATE_FUNCTION(column_name) : An aggregate function applied to a column.
- condition : The condition to filter the aggregated results.
Demo MySQL Database
To understand the HAVING clause, we will create a sample table and use it to demonstrate how grouping and filtering work together.
Examples of MySQL HAVING Clause
Example 1: Filtering Groups by Count
In this example we will the find products that have been sold more than once.
Query:
SELECT product, COUNT(*)
FROM sales
GROUP BY product
HAVING COUNT(*) > 1;
Output:
Example 2: Filtering Groups by Sum
Here we will find products with a total quantity sold greater than 10
Query:
SELECT product, SUM(quantity)
FROM sales
GROUP BY product
HAVING SUM(quantity) > 10;
Output:

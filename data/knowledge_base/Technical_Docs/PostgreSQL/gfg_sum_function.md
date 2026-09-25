# SUM() Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-sum-function/

The SUM() function in PostgreSQL returns the total of all non-NULL values in a numeric column. It is commonly used to calculate totals for numeric data.
- Calculate the total value of a numeric column.
- Find the sum of values for specific groups using GROUP BY.
- Generate summary reports from numeric data.
Syntax
SELECT SUM(column_name)
FROM table_name;
- SUM(): Calculates the total of all non-NULL values in the specified numeric column.
- column_name: The numeric column whose values are added.
- table_name: The table from which the values are retrieved.
Examples
Firstly, create a Sales table and insert some records.
Example 1: Find the Total Sales Amount
Query:
SELECT SUM(Amount) AS TotalSales
FROM Sales;
Output:
- The SUM() function returns the total sales amount from the Sales table.
Example 2: Find the Total Sales by Category
Query:
SELECT Category, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY Category;
Output:
- The GROUP BY clause groups the records by category and SUM() returns the total sales amount for each category.

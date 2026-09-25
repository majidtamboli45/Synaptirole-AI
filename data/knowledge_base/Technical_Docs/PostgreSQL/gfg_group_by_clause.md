# GROUP BY clause

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-group-by-clause/

PostgreSQL GROUP BY clause divides rows into categories based on one or more column values, making it easier to calculate summary information for each category.
- Creates separate result sets for each category.
- Works with aggregate functions like COUNT(), SUM(), AVG(), MIN() and MAX().
Syntax
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
Where:
- GROUP BY: Groups rows with the same values into a single group.
- aggregate_function(): Performs calculations such as COUNT(), SUM(), AVG(), MIN() or MAX() on each group.
Examples
Consider the following Sales table for the examples below:
Example 1: Group Rows Without an Aggregate Function
Query:
SELECT Region
FROM Sales
GROUP BY Region
ORDER BY Region;
Output:
GROUP BY clause groups rows by the Region column and returns one row for each unique region.
Example 2: Calculate Total Sales for Each Region
Query:
SELECT Region,
SUM(Amount) AS TotalSales
FROM Sales
GROUP BY Region
ORDER BY TotalSales DESC;
Output:
GROUP BY clause groups the rows by Region and the SUM() function calculates the total sales amount for each region.
Example 3: Count the Number of Sales by Each Salesperson
Query:
SELECT SalesPerson,
COUNT(*) AS TotalSales
FROM Sales
GROUP BY SalesPerson
ORDER BY SalesPerson;
Output:
COUNT() function counts the number of sales made by each salesperson after grouping the rows by SalesPerson.
Example 4: Group by Multiple Columns
Query:
SELECT Region,
SalesPerson,
SUM(Amount) AS TotalSales
FROM Sales
GROUP BY Region, SalesPerson
ORDER BY Region;
Output:
- GROUP BY clause groups rows based on both Region and SalesPerson.
- SUM() calculates the total sales for each group.

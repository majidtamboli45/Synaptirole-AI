# SUM() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/sum-function-in-mysql/

The SUM() function in MySQL is an aggregate function used to calculate the total sum of values in a numeric column. It helps generate overall totals for better data analysis.
- Calculates the sum of values in a numeric column.
- Accepts a single expression and returns one result.
- Ignores NULL values and supports WHERE and GROUP BY.
Syntax:
SUM(expression)
expression: A specified expression which can either be a field or a given formula.
Working with the SUM() Function
This section demonstrates how the MySQL SUM() function works in different scenarios. First, we will create a demo table on which the SUM() function will be applied:
Example 1: Finding Total Quantity Sold
This example calculates the total quantity of all products present in the table. It shows the basic usage of the SUM() function.
Query:
SELECT SUM(quantity) AS total_quantity 
FROM sales;
Output:
- Adds all quantity values: 10 + 5 + 7 + 3 + 2.
- Returns a single aggregated result (27).
Example 2: SUM() with WHERE Clause
This example calculates the total quantity for a specific product using a condition. It filters rows before applying SUM().
Query:
SELECT SUM(quantity) AS total_laptop_quantity
FROM sales
WHERE product_name = 'Laptop';
Output:
- Filters rows where product_name = 'Laptop' before summing.
- Adds only selected values (10 + 7) to return 17.
Example 3: SUM() with GROUP BY Clause
This example calculates the total quantity for each product separately. It groups rows and applies SUM() on each group.
Query:
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name;
Output:
- Groups rows by product_name before applying SUM().
- Calculates separate totals for each product group.
Example 4: SUM() with HAVING Clause
This example filters grouped results based on total quantity. It is used after GROUP BY to apply conditions on aggregated values.
Query:
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
HAVING SUM(quantity) > 10;
Output:
- Applies condition after grouping using HAVING clause.
- Returns only groups where total quantity is greater than 10.
Example 5: SUM() with DISTINCT Clause
This example calculates the sum of only unique values in the column. Duplicate values are ignored before summing.
Query:
SELECT SUM(DISTINCT quantity) AS total_distinct_quantity
FROM sales;
Output:
- Considers only distinct quantity values before summing.
- Adds distinct values (10, 5, 7, 3, 2) to return 27.

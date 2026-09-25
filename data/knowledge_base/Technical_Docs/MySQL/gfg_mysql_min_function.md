# MySQL MIN() Function

> Source: https://www.geeksforgeeks.org/mysql/mysql-min-function/

The MySQL MIN() function is used to retrieve the smallest value from a specified column in a table. It helps quickly identify the minimum value without manually scanning all records.
- Returns the lowest value from numeric, date, or comparable data types.
- Simplifies data analysis by eliminating the need for manual searching.
- Can be used with clauses like WHERE and GROUP BY for filtered or grouped results.
Syntax:
SELECT MIN(column_name)
FROM table_name
WHERE condition;
- column_name: The column from which you want to retrieve the minimum value.
- table_name: The name of the table containing the column.
- condition: This is an optional part. You can put conditions here to filter rows before finding the minimum value.
Working with the MySQL MIN() Function
The MIN() function is used to find the smallest value in a column, helping quickly analyze minimum data from a dataset. First, we will create a demo table on which the MIN() function will be applied:
Example 1: Using the MIN() Function
This example shows how to retrieve the smallest value from a column using the MIN() function.
Query:
SELECT MIN(product_id) 
FROM sales;
Output:
- The MIN(product_id) function returns the smallest product ID from the table.
- It scans all rows and provides a single minimum value as the result.
Example 2: Using MIN() with Conditions
This example demonstrates how to filter records using WHERE before finding the minimum value.
Query:
SELECT MIN(amount) AS minimum_amount
FROM sales
WHERE amount > 150;
Output:
- The WHERE amount > 150 condition filters only those records where amount is greater than 150.
- The MIN(amount) function then returns the smallest value from the filtered dataset.
Example 3: Using MIN() with GROUP BY
This example shows how to find the minimum value for each group using the GROUP BY clause.
Query:
SELECT product_id, MIN(amount) AS minimum_amount
FROM sales
GROUP BY product_id;
Output:
- The GROUP BY product_id groups records based on each product.
- The MIN(amount) function finds the smallest amount within each group.

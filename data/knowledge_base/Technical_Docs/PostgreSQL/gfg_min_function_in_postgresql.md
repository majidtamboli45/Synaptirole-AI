# MIN() Function in PostgreSQL

> Source: https://www.geeksforgeeks.org/postgresql/min-function-in-postgresql/

MIN() function in PostgreSQL is an aggregate function that returns the smallest value from a set of values in a column. It can be used with numeric, date and text data types and is commonly used with the GROUP BY clause.
- Find the smallest value in a column.
- Retrieve the earliest date from a dataset.
- Determine the minimum value for each group.
- Summarize data using aggregate queries.
Syntax
SELECT MIN(column_name)FROM table_name;
Where:
- MIN(): Returns the smallest value from a column.
- column_name: The column whose minimum value is returned.
- GROUP BY: Groups rows before calculating the minimum value (optional).
Working
Example 1: Find the Minimum Price
The following query returns the lowest product price.
Query:
SELECT MIN(Price) AS MinimumPriceFROM Products;
Output:
- MIN() function returns the smallest value in the Price column.
Example 2: Find the Minimum Price in Each Category
The following query returns the lowest product price for each category.
Query:
SELECT    Category,    MIN(Price) AS MinimumPriceFROM ProductsGROUP BY Category;
Output:
- GROUP BY clause divides the rows by category and MIN() returns the lowest price for each group.
Example 3: Find the Alphabetically First Product
The following query returns the alphabetically first product name.
Query:
SELECT MIN(ProductName) AS FirstProductFROM Products;
Output:
- MIN() function can also be used with text columns, where it returns the first value in alphabetical order.

# UPPER Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-upper-function/

The UPPER() function in PostgreSQL converts all lowercase letters in a string to uppercase.
- Standardize string values.
- Perform case-insensitive searches.
- Format text consistently.
Syntax
UPPER(string)
Where:
- string: The text or column value to convert to uppercase.
Example Table
Consider the following Products table for the examples below:
Example 1: Convert Product Names to Uppercase
The following query converts the product names to uppercase.
Query:
SELECT
UPPER(ProductName) AS UpperProductName
FROM
Products
ORDER BY
ProductName;
Output:
Example 2: Convert Brand Names to Uppercase
The following query converts the brand names to uppercase.
Query:
SELECT
UPPER(Brand) AS UpperBrand
FROM
Products
ORDER BY
Brand;
Output:
Example 3: Using UPPER() in the WHERE Clause
The following query retrieves products whose brand is Dell by comparing the uppercase value.
Query:
SELECT
ProductName,
Brand
FROM
Products
WHERE
UPPER(Brand) = 'DELL';
Output:

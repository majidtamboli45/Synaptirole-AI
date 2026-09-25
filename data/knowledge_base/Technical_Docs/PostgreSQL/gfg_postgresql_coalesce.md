# PostgreSQL COALESCE

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-coalesce/

The PostgreSQL COALESCE() function is used to handle NULL values by evaluating multiple expressions and returning the first available non-NULL value. It helps produce more meaningful query results and simplifies working with nullable data in PostgreSQL.
- Improve the readability and maintainability of SQL queries.
- Work efficiently with nullable columns in database tables.
Syntax
COALESCE(expression1, expression2, ..., expressionN)
Where:
- expression1: The first expression to be evaluated. If it is not NULL, the COALESCE() function returns its value immediately.
- expression2, expression3, ...: Additional expressions that are evaluated only if the preceding expressions are NULL.
- expressionN: The last expression in the list. It is returned only if all the previous expressions are NULL.
Working with the COALESCE() Function
Firstly, create a Sales table and insert some records.
Example 1: Calculate the Final Bill Without COALESCE()
The following query calculates the final bill without using the COALESCE() function.
Query:
SELECT ProductName,
Amount - Discount AS FinalBill
FROM Sales;
Output:
- Since the Discount value for Coffee is NULL, the calculation also returns NULL.
Example 2: Replace NULL Values Using COALESCE()
The following query replaces the NULL discount with 0 before performing the calculation.
Query:
SELECT ProductName,
Amount - COALESCE(Discount, 0) AS FinalBill
FROM Sales;
Output:
- The COALESCE() function replaces the NULL discount with 0. As a result, PostgreSQL correctly calculates the final bill for Coffee as 500.
Example 3: Using COALESCE() with CASE Expression
The following query achieves the same result using the CASE expression.
Query:
SELECT ProductName,
Amount -
CASE
WHEN Discount IS NULL THEN 0
ELSE Discount
END AS FinalBill
FROM Sales;
Output:
- The CASE expression checks whether the Discount value is NULL. If it is, 0 is used; otherwise, the original discount is used.
- Both CASE and COALESCE() produce the same result, but COALESCE() is shorter and easier to read.

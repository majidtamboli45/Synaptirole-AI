# ROW_NUMBER Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-row_number-function/

The PostgreSQL ROW_NUMBER() function assigns a unique sequential number to each row within a result set based on the specified sorting order. It is commonly used for ranking, pagination and identifying duplicate rows.
- Assigns a unique row number to each row.
- Supports ranking, pagination and duplicate row identification.
Syntax
SELECT
ROW_NUMBER() OVER (
[PARTITION BY column_name]
ORDER BY column_name
)
FROM table_name;
Where:
- ROW_NUMBER(): Assigns a unique sequential number to each row.
- OVER: Defines the window on which the function operates.
- PARTITION BY: Divides rows into groups before numbering (optional).
- ORDER BY: Specifies the order in which row numbers are assigned.
Example Table
Consider the following Orders table for the examples below:
Example 1: Assign Row Numbers
Query:
SELECT OrderID,
CustomerName,
OrderAmount,
ROW_NUMBER() OVER (ORDER BY OrderAmount DESC) AS RowNum
FROM Orders;
Output:
- ROW_NUMBER() function assigns a unique number to each employee based on salary in descending order.
Example 2: Assign Row Numbers Within Each Department
Query:
SELECT CustomerName,
City,
OrderAmount,
ROW_NUMBER() OVER (
PARTITION BY City
ORDER BY OrderAmount DESC
) AS RowNum
FROM Orders;
Output:
- PARTITION BY clause resets the row numbering for each department.
- ORDER BY clause assigns row numbers based on salary within each department.

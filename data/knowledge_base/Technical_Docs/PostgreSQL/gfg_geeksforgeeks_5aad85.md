# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-all-operator/

The ALL operator in PostgreSQL is used to compare a value with a set of values returned by a subquery or an array. The condition evaluates to TRUE only if the comparison is true for every value in the set.
- Supports comparison operators such as =, >, <, >=, <= and <>.
- Commonly used with subqueries.
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE expression comparison_operator ALL (
subquery
);
Where:
- expression: The value to compare.
- comparison_operator: Operators such as =, >, <, >=, <= or <>.
- ALL: Returns TRUE only if all comparisons are true.
- subquery: Returns a single-column result set.
Examples
Firstly, consider the following Products and Orders tables.
Products Table:
Orders Table:
Example 1: Basic Use with an Array
This query returns orders whose OrderAmount is greater than every value in the specified array.
SELECT *
FROM Orders
WHERE OrderAmount > ALL (ARRAY[2000, 10000]);
Output:
Example 2: Use with a Subquery
This query returns customers whose order amount is greater than the price of every product.
SELECT CustomerName
FROM Orders
WHERE OrderAmount > ALL (
SELECT Price
FROM Products
);
Output:
Example 3: Use with NOT ALL
This query retrieves orders whose amount is not greater than the price of every product.
SELECT *
FROM Orders
WHERE NOT (
OrderAmount <> ALL (
SELECT Price
FROM Products
)
);
Output:
Example 4: Combining Conditions
This query returns customers whose order amount is greater than the price of every product and whose OrderID is greater than 102.
SELECT CustomerName, OrderAmount
FROM Orders
WHERE OrderAmount >= ALL (
SELECT Price
FROM Products
)
AND OrderID > 102;
Output:

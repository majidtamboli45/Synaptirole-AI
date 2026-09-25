# HAVING clause

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-having-clause/

The HAVING clause in PostgreSQL filters grouped records after the GROUP BY clause is applied. It is used to filter groups based on aggregate conditions.
- Filters grouped records based on aggregate conditions.
- Supports aggregate functions such as COUNT(), SUM(), AVG(), MIN() and MAX().
Syntax
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING aggregate_function(column2) condition;
Where:
- column1: The column used to group the records.
- aggregate_function(): An aggregate function such as COUNT(), SUM(), AVG(), MIN() or MAX().
- table_name: The name of the table.
- GROUP BY: Groups rows with the same values.
- HAVING: Filters the grouped results based on the specified condition.
Examples
Firstly, create a Sales table and insert some records into it.
CREATE TABLE Sales (    SaleID INT PRIMARY KEY,    SalesPerson VARCHAR(50),    Product VARCHAR(50),    Amount DECIMAL(10,2));INSERT INTO Sales (SaleID, SalesPerson, Product, Amount)VALUES(1, 'John', 'Laptop', 800.00),(2, 'Emma', 'Phone', 600.00),(3, 'John', 'Monitor', 300.00),(4, 'Michael', 'Laptop', 900.00),(5, 'Emma', 'Tablet', 500.00),(6, 'John', 'Keyboard', 100.00);
Example 1: HAVING with COUNT()
The following query displays salespersons who have made more than one sale.
Query:
SELECT SalesPerson, COUNT(*) AS TotalSales
FROM Sales
GROUP BY SalesPerson
HAVING COUNT(*) > 1;
Output:
Example 2: HAVING with SUM()
The following query displays salespersons whose total sales amount is greater than 1000.
Query:
SELECT SalesPerson, SUM(Amount) AS TotalAmount
FROM Sales
GROUP BY SalesPerson
HAVING SUM(Amount) > 1000;
Output:
Example 3: HAVING with AVG()
The following query displays salespersons whose average sales amount is greater than 500.
Query:
SELECT SalesPerson, AVG(Amount) AS AverageAmount
FROM Sales
GROUP BY SalesPerson
HAVING AVG(Amount) > 500;
Output:
Example 4: HAVING with WHERE
The following query filters sales greater than 300 before grouping and then displays salespersons whose total sales amount exceeds 800.
Query:
SELECT SalesPerson, SUM(Amount) AS TotalAmount
FROM Sales
WHERE Amount > 300
GROUP BY SalesPerson
HAVING SUM(Amount) > 800;
Output:
Example 5: HAVING with Multiple Conditions
The following query displays salespersons who have made at least two sales and whose total sales amount exceeds 1000.
Query:
SELECT SalesPerson,
COUNT(*) AS TotalSales,
SUM(Amount) AS TotalAmount
FROM Sales
GROUP BY SalesPerson
HAVING COUNT(*) >= 2
AND SUM(Amount) > 1000;
Output:
To know the difference between Having and Where Clause refer to this - Having vs Where Clause in SQL

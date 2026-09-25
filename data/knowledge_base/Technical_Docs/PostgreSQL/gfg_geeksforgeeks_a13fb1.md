# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-left-join/

The LEFT JOIN in PostgreSQL returns all rows from the left table and the matching rows from the right table. If no matching row exists in the right table, the result contains NULL values for the right table columns. The LEFT JOIN helps in:
- Returning all records from the left table.
- Retrieving matching records from the right table.
- Displaying NULL values when no matching record exists.
- Finding records with or without related data.
Syntax
SELECT table1.column1, table1.column2, table2.column1, ...FROM table1LEFT JOIN table2ON table1.matching_column = table2.matching_column;
Example
Firstly, create the Customers and Orders tables and insert some records.
Customers Table
| CustomerID | CustomerName | City | 
|---|---|---|
| 101 | James Carter | New York | 
| 102 | Emily Johnson | Chicago | 
| 103 | Michael Brown | Dallas | 
| 104 | Sophia Davis | Boston | 
Orders Table
| OrderID | ProductName | CustomerID | 
|---|---|---|
| 1 | Laptop | 101 | 
| 2 | Keyboard | 102 | 
| 3 | Mouse | 101 | 
The following query returns all customers along with their orders. Customers without any orders are also included in the result.
Query:
SELECT    c.CustomerName,    o.ProductNameFROM Customers cLEFT JOIN Orders oON c.CustomerID = o.CustomerID;
Output:
| CustomerName | ProductName | 
|---|---|
| James Carter | Laptop | 
| James Carter | Mouse | 
| Emily Johnson | Keyboard | 
| Michael Brown | NULL | 
| Sophia Davis | NULL | 
Example: LEFT JOIN with WHERE Clause
The following query retrieves customers who have not placed any orders.
Query:
SELECT    c.CustomerName,    o.ProductNameFROM Customers cLEFT JOIN Orders oON c.CustomerID = o.CustomerIDWHERE o.OrderID IS NULL;
Output:
| CustomerName | ProductName | 
|---|---|
| Michael Brown | NULL | 
| Sophia Davis | NULL | 
- The LEFT JOIN returns all records from the Customers table.
- Matching rows from the Orders table are included.
- The WHERE o.OrderID IS NULL condition filters customers who do not have any matching orders.

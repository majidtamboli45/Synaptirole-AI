# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-delete/

The DELETE statement in PostgreSQL is used to remove one or more rows from a table. The WHERE clause specifies which rows should be deleted. If the WHERE clause is omitted, all rows in the table are deleted, while the table structure remains unchanged.
Syntax
DELETE FROM table_name
WHERE condition;
Where:
- table_name: The name of the table from which rows will be deleted.
- WHERE: Specifies the condition used to select the rows to be deleted.
Note: If you omit the WHERE clause, PostgreSQL deletes all rows from the table. The table itself, along with its columns, indexes and constraints, remains intact.
Working with the DELETE Statement
Firstly, create a Customers table and insert some records into it.
Example 1: Delete a Single Row
The following query deletes the customer whose CustomerID is 2.
Query:
DELETE FROM Customers
WHERE CustomerID = 2;
SELECT * FROM Customers;
Output:
Example 2: Delete Multiple Rows
The following query deletes all customers with a Gold membership.
Query:
DELETE FROM Customers
WHERE Membership = 'Gold';
SELECT * FROM Customers;
Output:
Example 3: Delete All Rows
The following query deletes all records from the Customers table.
Query:
DELETE FROM Customers;
SELECT * FROM Customers;
Output:

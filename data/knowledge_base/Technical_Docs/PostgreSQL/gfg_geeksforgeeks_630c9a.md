# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-self-join/

The SELF JOIN in PostgreSQL is a regular join where a table is joined with itself. It is commonly used when rows within the same table are related to each other, such as employees and their managers or products and their parent products. The SELF JOIN helps in:
- Joining a table with itself.
- Retrieving related records from the same table.
- Comparing rows within a single table.
- Representing hierarchical relationships such as employees and managers.
Syntax
SELECT
t1.column1,
t2.column1
FROM table_name t1
JOIN table_name t2
ON t1.common_column = t2.common_column;
Where:
- t1, t2: Aliases used to represent two instances of the same table.
- common_column: The column used to relate rows within the same table.
Note: A SELF JOIN requires table aliases because PostgreSQL treats both references as separate instances of the same table.
Example
Firstly, create the Employees table and insert some records.
The following query displays each employee along with their manager.
Query:
SELECT
e.EmployeeName AS Employee,
m.EmployeeName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;
Output:
- The Employees table is joined with itself using the aliases e and m.
- The alias e represents employees, while m represents managers.
- Employees without a manager display NULL in the Manager column.
Example: SELF JOIN with WHERE Clause
The following query retrieves employees managed by John Smith.
Query:
SELECT
e.EmployeeName AS Employee,
m.EmployeeName AS Manager
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
WHERE m.EmployeeName = 'John Smith';
Output:
- The SELF JOIN matches employees with their managers.
- The WHERE clause filters only those employees whose manager is John Smith.
- The result displays all employees reporting directly to John Smith.

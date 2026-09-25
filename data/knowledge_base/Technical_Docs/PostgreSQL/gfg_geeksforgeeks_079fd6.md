# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-drop-schema/

The DROP SCHEMA statement in PostgreSQL is used to remove an existing schema from a database. A schema can only be dropped if it is empty unless the CASCADE option is used, which removes the schema along with all the objects it contains. The DROP SCHEMA statement allows users to:
- Remove an existing schema from a database.
- Delete an empty schema using the default behavior.
- Remove a schema and all dependent objects using CASCADE.
- Prevent accidental deletion of dependent objects using RESTRICT.
Syntax
Drop an Empty Schema
DROP SCHEMA schema_name;
Drop a Schema with All Objects
DROP SCHEMA schema_name CASCADE;
Drop a Schema Only If It Is Empty
DROP SCHEMA schema_name RESTRICT;
Where:
- schema_name: The name of the schema to be removed.
- CASCADE: Removes the schema and all objects contained within it.
- RESTRICT: Prevents the schema from being dropped if it contains any database objects.
Examples
Firstly, create a schema named sales and create a table inside it.
Query:
CREATE SCHEMA sales;
CREATE TABLE sales.Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);
INSERT INTO sales.Customers VALUES
(101, 'James Carter', 'New York'),
(102, 'Emily Johnson', 'Chicago');
Example 1: Drop an Empty Schema
The following query removes an empty schema named hr.
Query:
CREATE SCHEMA hr;
DROP SCHEMA hr;
Output:
CREATE SCHEMA
DROP SCHEMA
- The hr schema is empty.
- PostgreSQL removes the schema successfully.
Example 2: Drop a Non-Empty Schema
The following query attempts to remove the sales schema, which contains the Customers table.
Query:
DROP SCHEMA sales;
Output:
ERROR: cannot drop schema sales because other objects depend on it
DETAIL: table sales.customers depends on schema sales.
HINT: Use DROP ... CASCADE to drop the dependent objects too.
- The sales schema contains the Customers table.
- PostgreSQL prevents the schema from being dropped because dependent objects exist.
Example 3: Drop a Schema Using CASCADE
The following query removes the sales schema along with all the objects it contains.
Query:
DROP SCHEMA sales CASCADE;
Output:
NOTICE: drop cascades to table sales.customers
DROP SCHEMA
Explanation:
- The CASCADE option removes the schema and all dependent objects.
- The Customers table is automatically deleted along with the schema.
Example 4: Drop a Schema Using RESTRICT
The following query attempts to remove a schema using the RESTRICT option.
Query:
DROP SCHEMA sales RESTRICT;
Output:
ERROR: cannot drop schema sales because other objects depend on it
DETAIL: table sales.customers depends on schema sales.
- The RESTRICT option prevents the schema from being dropped if it contains any objects.
- The schema remains unchanged until all dependent objects are removed.

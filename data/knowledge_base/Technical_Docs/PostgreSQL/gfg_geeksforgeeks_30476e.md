# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-alter-schema/

The ALTER SCHEMA statement in PostgreSQL is used to modify the properties of an existing schema. It allows you to rename a schema or change its owner without affecting the objects stored within it. The ALTER SCHEMA statement allows users to:
- Rename an existing schema.
- Change the ownership of a schema.
- Manage schema properties without affecting its objects.
- Simplify database administration and maintenance.
Syntax
Rename a Schema
ALTER SCHEMA old_schema_name
RENAME TO new_schema_name;
Change Schema Owner
ALTER SCHEMA schema_name
OWNER TO new_owner;
- old_schema_name: The current name of the schema.
- new_schema_name: The new name assigned to the schema.
- schema_name: The schema whose owner is being changed.
- new_owner: The database role that will own the schema.
Note: To rename or change the owner of a schema, you must have the required privileges.
Examples
Firstly, create a schema named sales.
Query:
CREATE SCHEMA sales;
Output:
CREATE SCHEMA
Example 1: Rename a Schema
The following query renames the sales schema to store.
Query:
ALTER SCHEMA sales
RENAME TO store;
Output:
ALTER SCHEMA
Explanation:
- The ALTER SCHEMA statement changes the schema name from sales to store.
- All objects inside the schema remain unchanged.
Example 2: Verify the Renamed Schema
The following query lists all schemas in the current database.
Query:
SELECT schema_name
FROM information_schema.schemata;
Output:
| schema_name | 
|---|
| public | 
| store | 
| information_schema | 
| pg_catalog | 
Explanation:
- The query retrieves all available schemas.
- The renamed schema appears as store.
Example 3: Change the Schema Owner
The following query changes the owner of the store schema to the postgres role.
Query:
ALTER SCHEMA store
OWNER TO postgres;
Output:
ALTER SCHEMA
- The ownership of the store schema is transferred to the postgres user.
- The new owner can manage the schema and its objects.
Example 4: Create a Table in the Renamed Schema
The following query creates a table inside the renamed store schema.
Query:
CREATE TABLE store.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);
INSERT INTO store.Products VALUES
(101, 'Laptop'),
(102, 'Keyboard');
Output:
| ProductID | ProductName | 
|---|---|
| 101 | Laptop | 
| 102 | Keyboard | 
- The table is successfully created inside the renamed store schema.
- Renaming a schema does not affect its ability to store database objects.

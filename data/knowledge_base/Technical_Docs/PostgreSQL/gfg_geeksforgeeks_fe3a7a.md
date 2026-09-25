# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-drop-role/

The DROP ROLE statement in PostgreSQL is used to remove an existing role from the database. Before dropping a role, it must not own any database objects or have any privileges assigned. If the role owns objects, ownership must be transferred or the objects must be removed first.
- Delete roles that are no longer required.
- Manage database security by removing unused roles.
- Maintain an organized role structure.
Syntax
Drop a Role
DROP ROLE role_name;
Drop a Role Only If It Exists
DROP ROLE IF EXISTS role_name;
Where:
- role_name: The name of the role to be removed.
- IF EXISTS: Prevents an error if the specified role does not exist.
Examples
Firstly, create a role named developer.
Query:
CREATE ROLE developer
LOGIN
PASSWORD 'Dev@123';
Output:
Example 1: Drop a Role
The following query removes the developer role.
Query:
DROP ROLE developer;
Output:
DROP ROLE
Explanation:
- The DROP ROLE statement removes the developer role from the database.
- The role is deleted because it does not own any database objects.
Example 2: Drop a Role Using IF EXISTS
The following query removes the manager role only if it exists.
Query:
DROP ROLE IF EXISTS manager;
Output:
- The IF EXISTS clause prevents an error when the specified role is not found.
- PostgreSQL displays a notice and continues execution.
Example 3: Drop a Role That Owns Database Objects
Firstly, create a role and assign ownership of a table to it.
Query:
CREATE ROLE analyst LOGIN PASSWORD 'Analyst@123';
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    ReportName VARCHAR(50)
);
ALTER TABLE Reports OWNER TO analyst;
Now, attempt to drop the role.
Query:
DROP ROLE analyst;
Output:
- The analyst role owns the Reports table.
- PostgreSQL prevents the role from being dropped until ownership is transferred or the table is removed.
Example 4: Transfer Ownership and Drop the Role
Transfer ownership of the table to another role and then remove the role.
Query:
ALTER TABLE Reports
OWNER TO postgres;
DROP ROLE analyst;
Output:
- The ownership of the Reports table is transferred to the postgres role.
- Since the analyst role no longer owns any objects, PostgreSQL successfully removes it.

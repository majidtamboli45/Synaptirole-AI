# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-create-role/

The CREATE ROLE statement in PostgreSQL is used to create a new database role. A role can represent a database user or a group of users and is used to manage authentication, permissions and database access. The CREATE ROLE statement allows users to:
- Create a new database role.
- Assign login privileges to a role.
- Manage database access and permissions.
- Simplify user and privilege management.
Syntax
Create a Basic Role
CREATE ROLE role_name;
Create a Role with Login Privilege
CREATE ROLE role_name
LOGIN
PASSWORD 'password';
Where:
- role_name: The name of the role to be created.
- LOGIN: Allows the role to log in to the PostgreSQL server.
- PASSWORD: Sets the password for the role.
Note: A role without the LOGIN attribute cannot connect to the PostgreSQL database.
Examples
Example 1: Create a Basic Role
The following query creates a role named developer.
Query:
CREATE ROLE developer;
Output:
CREATE ROLE
Explanation:
- The CREATE ROLE statement creates a new role named developer.
- Since the LOGIN option is not specified, the role cannot log in to the database.
Example 2: Create a Role with LOGIN
The following query creates a role named analyst with login privileges.
Query:
CREATE ROLE analyst
LOGIN
PASSWORD 'Analyst@123';
Output:
CREATE ROLE
Explanation:
- The LOGIN attribute allows the role to connect to the database.
- The password is used for authentication during login.
Example 3: Create a Role with Additional Privileges
The following query creates a role with the ability to create databases.
Query:
CREATE ROLE manager
LOGIN
PASSWORD 'Manager@123'
CREATEDB;
Output:
CREATE ROLE
Explanation:
- The CREATEDB attribute allows the role to create new databases.
- The role can also log in because of the LOGIN attribute.
Example 4: Verify the Created Roles
The following query displays all roles in the PostgreSQL server.
Query:
SELECT rolname
FROM pg_roles;
Output:
| rolname | 
|---|
| postgres | 
| developer | 
| analyst | 
| manager | 
- The pg_roles system catalog stores information about all PostgreSQL roles.
- The query lists the names of all available roles.

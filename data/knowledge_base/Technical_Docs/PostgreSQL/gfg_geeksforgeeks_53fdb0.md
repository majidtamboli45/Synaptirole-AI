# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-alter-role/

The ALTER ROLE statement in PostgreSQL is used to modify the properties of an existing role. It allows you to change a role's password, rename the role, assign or revoke privileges and update login attributes without recreating the role. The ALTER ROLE statement allows users to:
- Rename an existing role.
- Change the password of a role.
- Modify login and privilege attributes.
- Manage database roles efficiently.
Syntax
Rename a Role
ALTER ROLE role_name
RENAME TO new_role_name;
Change a Role Password
ALTER ROLE role_name
PASSWORD 'new_password';
Modify Role Attributes
ALTER ROLE role_name
WITH attribute;
Where:
- role_name: The name of the existing role.
- new_role_name: The new name assigned to the role.
- new_password: The new password for the role.
- attribute: A role attribute such as LOGIN, NOLOGIN, CREATEDB, NOCREATEDB, CREATEROLE or SUPERUSER.
Examples
Firstly, create a role named developer.
Query:
CREATE ROLE developer
LOGIN
PASSWORD 'Dev@123';
Output:
CREATE ROLE
Example 1: Rename a Role
The following query renames the developer role to developer_team.
Query:
ALTER ROLE developer
RENAME TO developer_team;
Output:
ALTER ROLE
Explanation:
- The ALTER ROLE statement changes the role name from developer to developer_team.
- The role retains all its existing privileges and attributes.
Example 2: Change the Password of a Role
The following query changes the password of the developer_team role.
Query:
ALTER ROLE developer_team
PASSWORD 'Dev@456';
Output:
ALTER ROLE
- The PASSWORD clause updates the login password for the role.
- The new password is used for future logins.
Example 3: Grant the CREATEDB Attribute
The following query allows the developer_team role to create databases.
Query:
ALTER ROLE developer_team
CREATEDB;
Output:
ALTER ROLE
- The CREATEDB attribute grants permission to create new databases.
- Existing privileges of the role remain unchanged.
Example 4: Disable Login for a Role
The following query removes the login privilege from the developer_team role.
Query:
ALTER ROLE developer_team
NOLOGIN;
Output:
ALTER ROLE
- The NOLOGIN attribute prevents the role from connecting to the PostgreSQL server.
- The role can still be used for privilege management.
Example 5: Verify the Updated Role
The following query displays the role name and login privilege.
Query:
SELECT
    rolname,
    rolcanlogin
FROM pg_roles
WHERE rolname = 'developer_team';
Output:
| rolname | rolcanlogin | 
|---|---|
| developer_team | false | 
- The pg_roles system catalog stores information about PostgreSQL roles.
- The rolcanlogin column shows whether the role has login permission.

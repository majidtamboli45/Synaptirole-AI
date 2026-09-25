# Role Membership

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-role-membership/

The PostgreSQL Role Membership feature allows one role to become a member of another role, enabling it to inherit the privileges assigned to the parent role. It simplifies privilege management by allowing permissions to be assigned to roles instead of individual users.
- Inherits privileges from the parent role.
- Simplifies permission management by assigning privileges through roles.
Syntax
Grant Role Membership
GRANT parent_role
TO member_role;
Remove Role Membership
REVOKE parent_role
FROM member_role;
Where:
- parent_role: The role whose privileges are granted.
- member_role: The role that becomes a member of the parent role.
Examples
Firstly, create two roles.
Query:
CREATE ROLE manager;
CREATE ROLE employee
LOGIN
PASSWORD 'Employee@123';
Example 1: Grant Role Membership
The following query makes the employee role a member of the manager role.
Query:
GRANT manager
TO employee;
Output:
- The employee role becomes a member of the manager role.
- The employee role inherits the privileges assigned to the manager role.
Example 2: Verify Role Membership
The following query displays the role memberships in the PostgreSQL database.
Query:
SELECT
    pg_get_userbyid(roleid) AS parent_role,
    pg_get_userbyid(member) AS member_role
FROM pg_auth_members;
Output:
- The pg_auth_members system catalog stores information about role memberships.
- The output shows that the employee role is a member of the manager role.
Example 3: Remove Role Membership
The following query removes the employee role from the manager role.
Query:
REVOKE manager
FROM employee;
Output:
- The employee role is no longer a member of the manager role.
- It no longer inherits privileges from the manager role.
Example 4: Verify Role Membership After Revoking
The following query checks whether the employee role is still a member of the manager role.
Query:
SELECT
    pg_get_userbyid(roleid) AS parent_role,
    pg_get_userbyid(member) AS member_role
FROM pg_auth_members
WHERE pg_get_userbyid(member) = 'employee';
Output:
- The query returns no rows because the role membership has been removed.
- The employee role no longer inherits any privileges from the manager role.

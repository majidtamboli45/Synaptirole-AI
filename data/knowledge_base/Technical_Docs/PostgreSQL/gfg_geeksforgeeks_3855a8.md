# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-revoke/

The PostgreSQL REVOKE command removes previously granted privileges from users or roles on database objects (such as tables, schemas, databases and functions). It helps maintain database security by ensuring users have only the permissions they need.
- Removes previously granted privileges from users or roles.
- Restricts access to database objects, improving security.
Syntax
Revoke Specific Privileges
REVOKE privilege [, ...]
ON TABLE table_name
FROM role_name;
Revoke All Privileges
REVOKE ALL PRIVILEGES
ON TABLE table_name
FROM role_name;
Where:
- privilege: The privilege to remove, such as SELECT, INSERT, UPDATE or DELETE.
- table_name: The table from which privileges are revoked.
- role_name: The user or role whose privileges are removed.
Examples
Firstly, create a role and a table.
Query:
CREATE ROLE analyst
LOGIN
PASSWORD 'Analyst@123';
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50)
);
INSERT INTO Employees VALUES
(101, 'James Carter', 'Sales'),
(102, 'Emily Johnson', 'Finance');
GRANT SELECT, INSERT, UPDATE
ON Employees
TO analyst;
Example 1: Revoke SELECT Privilege
The following query removes the SELECT privilege from the analyst role.
Query:
REVOKE SELECT
ON Employees
FROM analyst;
Output:
- The role can no longer retrieve data from the Employees table.
Example 2: Revoke Multiple Privileges
The following query removes both INSERT and UPDATE privileges.
Query:
REVOKE INSERT, UPDATE
ON Employees
FROM analyst;
Output:
- The analyst role can no longer insert or update records in the Employees table.
Example 3: Revoke All Privileges
The following query removes all privileges on the Employees table.
Query:
REVOKE ALL PRIVILEGES
ON Employees
FROM analyst;
Output:
- All privileges previously granted on the Employees table are removed from the analyst role.
- The role can no longer perform operations on the table unless new privileges are granted.
Example 4: Verify Revoked Privileges
The following query displays the privileges currently granted on the Employees table.
Query:
SELECT
    grantee,
    privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'employees'
AND grantee = 'analyst';
Output:
- The query checks the privileges assigned to the analyst role.
- Since all privileges have been revoked, no rows are returned.

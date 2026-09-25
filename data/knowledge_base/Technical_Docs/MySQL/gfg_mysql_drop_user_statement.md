# MySQL DROP USER Statement

> Source: https://www.geeksforgeeks.org/mysql/mysql-drop-user/

Managing user accounts in MySQL is important for maintaining database security and controlling access to the server. The DROP USER statement allows administrators to remove user accounts that are no longer required.
- The DROP USER statement is used to delete an existing user account from the MySQL server.
- When a user account is removed, all privileges assigned to that user are automatically revoked.
- After the user is dropped, they can no longer log in or access the MySQL database server.
Syntax:
DROP USER 'username'@'host';
- 'username': The name of the user you want to delete.
- 'host': The hostname or IP address from which the user is allowed to connect. Use '%' to indicate any host.
Working with MySQL DROP USER Statement
The following examples demonstrate how the DROP USER statement works in MySQL and how it can be used to delete single or multiple user accounts from the MySQL server. Suppose there are 4 users in the MySQL database server as listed below:
A single DROP USER statement can be used to delete one or multiple user accounts.
Example 1: Dropping a Single User Using the DROP USER Statement
To delete a single user account, such as gfguser1, the following query is executed:
Query:
DROP USER 'gfguser1'@'localhost';
Output:
This command removes the gfguser1 account from the MySQL server, and the user will no longer be able to log in or access the database.
Example 2: Dropping Multiple Users Using the DROP USER Statement
Multiple user accounts can be deleted simultaneously using a single DROP USER statement. For example, to remove both gfguser1 and gfguser2:
Query:
DROP USER 'gfguser1'@'localhost' , 'gfguser2'@'localhost';
Output:
This query drops both users in one step, revoking their access to the MySQL server.
Note: If a DROP USER command is executed while the user session is active, the account is removed only after the session ends, and the user cannot log in again.

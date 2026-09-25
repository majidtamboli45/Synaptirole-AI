# Change User Password in MySQL

> Source: https://www.geeksforgeeks.org/mysql/mysql-change-user-password/

Changing user passwords in MySQL is important for maintaining database security and controlling user access. MySQL provides multiple ways to update a user's password based on permissions and requirements.
- Passwords can be changed using the SET PASSWORD and ALTER USER statements.
- It can also be updated by modifying the user table using the UPDATE statement.
The password of a MySQL user account can be changed using different SQL statements. MySQL provides multiple methods depending on the permissions and access level of the user.
1. Changing MySQL User Password Using SET PASSWORD Statement
To change a user's password using the SET PASSWORD statement, the account must have at least UPDATE privilege. The user account must be specified in the 'user'@'host' format.
Syntax:
SET PASSWORD FOR 'username'@'host' = 'newpassword';
Query:
To change the password for the user account 'gfguser1' connecting from 'localhost' to 'newpass'.
SET PASSWORD FOR 'gfguser1'@'localhost' = 'newpass';
2. Changing MySQL User Password Using ALTER USER Statement
Another way to change a user's password is by using the ALTER USER statement along with the IDENTIFIED BY clause.
Syntax:
ALTER USER 'username'@'host' IDENTIFIED BY 'newpassword';
Query:
To change the password for the user account 'gfguser1' connecting from 'localhost' to 'newpass'.
ALTER USER 'gfguser1'@'localhost' IDENTIFIED BY 'newpass';
3. Changing MySQL User Password Using UPDATE Statement
The password can also be changed using the UPDATE statement by modifying the mysql.user table.
After updating the table, the FLUSH PRIVILEGES statement must be executed to reload the privilege tables.
Syntax:
UPDATE mysql.user
SET authentication_string = PASSWORD('newpassword')
WHERE User = 'username' AND Host = 'host';
FLUSH PRIVILEGES;
Query:
To change the password for the user account 'gfguser1' connecting from 'localhost' to 'newpass'.
UPDATE mysql.user
SET authentication_string = PASSWORD('newpass')
WHERE User = 'gfguser1' AND Host = 'localhost';
FLUSH PRIVILEGES;

# MySQL CREATE USER Statement

> Source: https://www.geeksforgeeks.org/mysql/mysql-create-user-statement/

The CREATE USER statement in MySQL is used to create new user accounts that can access the MySQL database server. It allows database administrators to define login credentials and control who can connect to the database.
- The CREATE USER command creates a new database account with a username and password for authentication.
- MySQL identifies users using the format username@host, which specifies the user and the host from which they can connect.
- For example, a user connecting from the local machine may have an account like admin@localhost.
- User account details are stored in the user grant table of the MySQL database, which manages authentication and access control.
Syntax:
CREATE USER user_account IDENTIFIED BY password;
- user_account: It is the name that the user wants to give to the database account. The user_account should be in the format 'username'@'hostname'.
- password: It is the password used to assign to the user_account. The password is specified in the IDENTIFIED BY clause.
Working with MySQL CREATE USER Statement
The following examples demonstrate how the CREATE USER statement works in MySQL and how it is used to create and manage database user accounts.
Example 1: Create Single User
In this example, a new user "gfguser1" is created that can connect to the MySQL database server from localhost with the password "abcd".
Query:
CREATE USER 'gfguser1'@'localhost' IDENTIFIED BY 'abcd';
Note: The CREATE USER statement only creates a new user, it does not grant any permissions to the user.
Example 2: Create Multiple User
In this example, multiple users are created who can connect to the MySQL database server from localhost.
Query:
CREATE USER
'gfguser2'@'localhost' IDENTIFIED BY 'efgh',
'gfguser3'@'localhost' IDENTIFIED BY 'uvxy';
The above code creates two new users with usernames "gfguser2" and "gfguser3", with passwords "efgh" and "uvxy" respectively.
Example 3: Allowing a User Account to Connect from Any Host
To allow a user account to connect from any host, the percentage (%) wildcard is used in the following way.
Query:
CREATE USER 'gfguser1'@'%'
IDENTIFIED BY 'abcd';
To allow the user account to connect to the database server from any subdomain of "mysqltutorial.org", the percentage wildcard (%) can be used as follows:
Query:
CREATE USER 'gfguser'@'%.mysqltutorial.org'
IDENTIFIED BY 'abcd';
View Permissions of an User Account
The SHOW GRANTS statement is used to view the permissions of a user account.
Syntax:
SHOW GRANTS FOR user-account;
Query:
SHOW GRANTS FOR gfguser1@localhost;
Output:
The *.* in the output denotes that the "gfguser1" user account can only login to the database server and has no other privileges.

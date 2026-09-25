# Show Databases

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-show-databases/

The SHOW DATABASES command is used to retrieve and display all databases accessible to the current user in a DBMS. It simplifies database management by avoiding direct queries on system tables.
- Lists all databases that the current user has permission to access.
- Command is simple and widely supported across many SQL-based systems.
- Quickly view and manage available databases without complex queries.
Syntax
SHOW DATABASES;
Methods to List All Databases in PostgreSQL
The following methods can be used to list all databases in PostgreSQL.
Method 1: Using the pSQL Command
To list all databases present on the current PostgreSQL server, use one of the following pSQL meta-commands.
Syntax
\l
or
\l+
This is the standard structure used in technical documentation like GeeksforGeeks.
Now use the below command to list all databases using a superuser such as postgres:
\l
Output:
Alternatively one can use the below command:
\l+
Output:
Method 2: Using the SELECT Statement
To list all databases by querying the pg_database system catalog using the SELECT statement.
Syntax:
SELECT datname FROM pg_database;
Example:
Execute the following query to retrieve the names of all databases available on the PostgreSQL server:
SELECT datname FROM pg_database;
Output:

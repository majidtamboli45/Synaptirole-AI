# PostgreSQL ALTER DATABASE

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-alter-database/

PostgreSQL ALTER DATABASE command modifies the properties of an existing database, such as its name, owner, configuration settings or connection limits. It helps administrators manage and update database settings without recreating the database.
- Modifies database properties and settings.
- Supports administrative tasks such as renaming databases and changing ownership.
Syntax
Rename a Database
ALTER DATABASE database_name
RENAME TO new_database_name;
Change the Database Owner
ALTER DATABASE database_name
OWNER TO new_owner;
Change the Default Tablespace
ALTER DATABASE database_name
SET TABLESPACE tablespace_name;
Set a Configuration Parameter
ALTER DATABASE database_name
SET parameter = value;
Reset a Configuration Parameter
ALTER DATABASE database_name
RESET parameter;
Set the Connection Limit
 ALTER DATABASE database_name
CONNECTION LIMIT limit;
Example
Before modifying a database, create a sample database named my_test_db using the following command:
Query:
CREATE DATABASE my_test_db;
After creating the database, we can use the ALTER DATABASE statement to modify its properties, such as renaming the database, changing its owner or configuring database settings.
Example 1: Rename the Database
Use the following ALTER DATABASE statement to rename the database from my_test_db to my_renamed_db.
Query:
ALTER DATABASE my_test_db
RENAME TO my_renamed_db;
Example 2: Change the Owner of the Database
Use the following ALTER DATABASE statement to change the owner of the my_renamed_db database to geeks.
Query:
ALTER DATABASE my_renamed_db
OWNER TO geeks;
If the geeks role does not exist, create it using the following statement.
Query:
CREATE ROLE geeks
VALID UNTIL 'infinity';
Example 3: Change the Default Tablespace
Use the following statement to change the default tablespace of my_renamed_db.
Query:
ALTER DATABASE my_renamed_db
SET TABLESPACE geeks_default;
If the geeks_default tablespace does not exist, create it using the following statement.
Query:
CREATE TABLESPACE geeks_default
OWNER geeks
LOCATION E'C:\\pgdata\\geeks';
Example 4: Change a Configuration Parameter
Use the following statement to set the escape_string_warning configuration parameter to off for my_renamed_db.
Query:
ALTER DATABASE my_renamed_db
SET escape_string_warning TO off;
The statement sets the escape_string_warning configuration parameter to off for the my_renamed_db database.
Example 5: Reset a Configuration Parameter
Use the following statement to reset the escape_string_warning configuration parameter for my_renamed_db.
Query:
ALTER DATABASE my_renamed_db
RESET escape_string_warning;
- The statement resets the escape_string_warning configuration parameter to its default value for the my_renamed_db database.
Example 6: Set the Connection Limit
Use the following statement to set the maximum number of connections for my_renamed_db.
Query:
ALTER DATABASE my_renamed_db
CONNECTION LIMIT 100;
- The statement limits the my_renamed_db database to a maximum of 100 concurrent connections.

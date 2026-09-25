# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-show-tables/

In PostgreSQL, viewing tables is an essential task for managing and organizing our database. Although PostgreSQL does not support the SHOW TABLES command like MySQL, it offers alternative commands like \dt in the psql tool, which helps users list all tables within a specific database
In this article, we will explain various methods for showing tables in PostgreSQL in detail, including psql, pg_catalog schema, and the information_schema. Each method includes syntax, examples, and outputs, along with tips for managing our PostgreSQL databases efficiently.
How to Show Tables in PostgreSQL?
To show tables in PostgreSQL, we can use the \dt command in the psql terminal. Alternatively, we can query the pg_catalog or information_schema to list all tables with more detailed information.
Method 1: Using PSQL Shell
The 'psql' shell is a powerful command-line tool for interacting with PostgreSQL databases. One of the simplest ways to list all tables in a database is by using the '\dt' command.
Syntax:
\dt
Example
In this example, we will query for the list of all tables in the sample database, ie, dvdrental.
First, log in to the sample database using the below command:
\c dvdrental
Now use the below command to list the tables of the same.
\dt
Output
Explanation:
The output will display all tables in the dvdrental database, including their schemas, names, and types.
Key Points
- Filtering Tables: We can filter tables by schema or name using additional parameters. For example, to list tables in a specific schema, use '\dt schema_name.*' .
- Detailed View: Use the '\d+' command to get more detailed information about tables, including table size, description, and additional attributes.
Method 2: Using pg_catalog schema
This method allows for more complex filtering and querying capabilities. Another way to show tables in PostgreSQL is to use the SELECT statement to query data from the PostgreSQL catalog as follows.
Syntax:
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
schemaname != 'information_schema';
Example
In this example, we will query for the list of all tables in the sample database, ie, dvdrental.
First, log in to the sample database using the below command:
\c dvdrental
Now run the below command to list the tables in the database.
Query:
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
schemaname != 'information_schema';
Output
Explanation:
The output will display detailed information about each table, including schema name, table name, table owner, and table type.
Key Points
- Custom Filtering: Modify the WHERE clause to filter tables based on specific criteria, such as table name patterns or specific owners.
- Joining with Other Catalogs: We can join pg_tables with other system catalogs like 'pg_class' and 'pg_namespace' to retrieve more detailed metadata about the tables.
Method 3: Using Information Schema
The 'information_schema' is a standard SQL schema that provides metadata about the database objects. It can be used to list all tables in a PostgreSQL database.
Syntax:
SELECT table_name
FROM information_schema.tables
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');
Example
In this example, we will query for the list of all tables in the sample database, ie, dvdrental.
First, log in to the sample database using the below command:
\c dvdrental
Now run the below command to list the tables in the database.
Query:
SELECT table_name
FROM information_schema.tables
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');
Output
The output will display the names of all tables in the dvdrental database, excluding those in the 'pg_catalog' and 'information_schema' schemas.
Key points
- Filtering by Table Type: You can add conditions to filter by table type (e.g., BASE TABLE orVIEW ).
- Ordering Results: Use the ORDER BY clause to sort the results by table name, schema, or any other column.
Conclusion
In conclusion, showing tables in PostgreSQL can be achieved using multiple methods, depending on the level of detail and flexibility we require. The psql shell commands such as \dt provide a simple and quick way to list tables, while querying pg_catalog and information_schema offer more advanced options for filtering and joining metadata. These tools ensure us to have full control over managing and exploring our PostgreSQL database structures.

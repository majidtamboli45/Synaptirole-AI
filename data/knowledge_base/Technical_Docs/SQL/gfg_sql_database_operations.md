# SQL Database Operations

> Source: https://www.geeksforgeeks.org/sql/sql-database/

SQL databases or relational databases are widely used for storing, managing and organizing structured data in a tabular format. These databases store data in tables consisting of rows and columns. SQL is the standard programming language used to interact with these databases. It enables users to create, update, retrieve and manage data effectively.
Why Do SQL Databases Exist?
- Efficient Data Handling: SQL databases are designed to store, retrieve and manipulate structured data effectively.
- Reliability: They ensure data consistency and integrity, making them ideal for high priority applications.
- Complex Relationships: SQL databases can model complex data relationships, essential for transactional and enterprise systems.
- Transaction Support: They provide reliable transaction processing, ensuring consistency even under high-demand scenarios.
- Scalability: SQL databases efficiently scale to handle growing data volumes while maintaining performance.
- ACID Compliance: SQL databases guarantee data accuracy and reliability through ACID properties (Atomicity, Consistency, Isolation, Durability).
- Universal Adoption: As the standard for relational data, SQL databases are widely used across industries, from business to government.
How SQL Databases Work
SQL databases work using a client-server system. The database server stores all the data, while the client interacts with the server by sending queries to retrieve or update the data.
- Data Storage: Data is stored in tables, each containing rows and columns. Each column defines a specific attribute, and each row represents a unique entity or record.
- Query Processing: When a user submits a query, the database server processes it by parsing the SQL command, optimizing the query for performance, and executing it to retrieve or manipulate the data.
- Data Retrieval: SQL queries can retrieve specific data using SELECT statements and filter results usingWHERE clauses. The server returns the queried data in a structured format for use by applications.
SQL Database Management
It explains the key processes involved in creating, selecting, renaming and dropping SQL databases. Understanding these commands is essential for managing your databases effectively.
1. CREATE Database
The CREATE DATABASE command is used to initialize a new database. It creates an empty database that acts as a container for your tables and other database objects. It allows you to organize and manage data easily.
Example:
CREATE DATABASE test_db;
2. SELECT Database
The USE or SELECT DATABASE command allows you to select a specific database for the current session. Once selected, the database becomes the active database, and all subsequent queries will be executed on it. This command is essential when working with multiple databases.
USE test_db;
3. RENAME Database
The RENAME DATABASE command can be used where you need to rename an existing database. All databases does not support this command, it can be useful when we need to update the name of a database to show its content.
RENAME DATABASE test_db TO new_test_db;
4. DROP Database
The DROP DATABASE command is used to permanently delete a database, along with all its tables, data and objects. This action is irreversible, so it should be used carefully. It is helpful when you no longer need a database and want to free up system resources.
DROP DATABASE test_db;
Difference Between SQL and NoSQL Databases
Below you will find the key differences between SQL and NoSQL databases:
| Feature | SQL Databases | NoSQL Databases | 
|---|---|---|
| Data Structure | Tables with rows and columns. | Key-value pairs, documents, columns, graphs. | 
| Schema | Fixed schema. | Flexible schema. | 
| Data Integrity | ACID compliance for consistency. | Eventual consistency. | 
| Scalability | Vertically scalable. | Horizontally scalable. | 
| Query Language | Uses SQL for queries. | Various query languages (e.g., MongoDB, Cassandra). | 
| Transactions | Supports ACID transactions. | Limited transaction support. | 
| Use Cases | Best for structured data and complex queries. | Ideal for unstructured data and scalability. | 
| Examples | MySQL, PostgreSQL, SQL Server. | MongoDB, Cassandra, Redis. | 
| Relationships | Supports complex joins and relationships. | Limited relationship support. | 
| Flexibility | Less flexible. | Highly flexible. | 
Conclusion
SQL databases are used for managing structured data in many applications. They provide various benefits such as data consistency, optimized performance, scalibility and minimum redundancy. SQL Databases are ideal for handling complex queries and transactional systems.

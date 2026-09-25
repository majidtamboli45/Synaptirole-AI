# Introduction to PostgreSQL

> Source: https://www.geeksforgeeks.org/postgresql/introduction-to-postgresql/

PostgreSQL is an open-source relational database management system (RDBMS) that stores and manages data in structured tables using SQL.
- Designed to manage structured data with high reliability and consistency.
- Supports advanced SQL features, transactions, indexes, and stored procedures.
- Handles relational, JSON, array, and custom data types efficiently.
- Used by banking, e-commerce, healthcare, and enterprise applications to manage large volumes of data securely.
Datatypes of PostgreSQL
The table below lists some commonly used PostgreSQL data types and their purposes.
| Category | Data Types | Description | 
|---|---|---|
| Numeric Types | INTEGER ,BIGINT ,DECIMAL | Store numeric values | 
| Character Types | VARCHAR ,TEXT | Store text and strings | 
| Date and Time Types | DATE ,TIMESTAMP | Store date and time values | 
| Boolean Type | BOOLEAN | Store TRUE ,FALSE , orNULL | 
| JSON Types | JSON ,JSONB | Store JSON documents | 
Basic SQL Operations in PostgreSQL
After installing PostgreSQL, you can use the psql shell or a SQL editor to perform basic database operations.
1. Create a Table
Creates a new table to store data.
CREATE TABLE products (product_id INT PRIMARY KEY, product_name VARCHAR(100), price NUMERIC);
2. Insert Data
Adds a new record to the table.
INSERT INTO products (product_id,product_name, price)VALUES (1,'Laptop', 999.99);
3. Query Data
Retrieves records from the table.
SELECT * FROM products;
Output:
Working PostgreSQL
- Stores data in tables using a row-based structure.
- Uses a relational model to manage and organize data.
- Records transactions in write-ahead logs (WAL) for durability and recovery.
- Employs Multi-Version Concurrency Control (MVCC) to handle concurrent transactions.
- Ensures data consistency, reliability and high performance.
Why Choose PostgreSQL over Other SQL Databases
- Open Source and Free: PostgreSQL is completely free to use and has a strong developer community.
- Advanced SQL Support: Supports complex queries, joins, subqueries, views, stored procedures and triggers.
- ACID Compliance: Ensures reliable and secure transactions with data integrity.
- JSON Support: Can store and query JSON data efficiently, making it suitable for modern applications.
- Extensible: Users can create custom functions, data types and extensions.
- High Performance: Optimized for handling large datasets and complex workloads.
- Multi-Language Support: Works with popular programming languages such as Python, Java, C/C++, C#, Node.js, Go, Ruby, Perl and Tcl.
Applications
- Enterprise Applications: Used in large business systems requiring reliability and data integrity.
- Data Analytics and Warehousing: Stores and processes large volumes of data for analysis.
- Financial Systems: Supports banking and financial applications with strong transaction management.
- Geographic Information Systems (GIS): Handles spatial and location-based data using PostGIS.
- Web Applications: Powers dynamic websites and web services.

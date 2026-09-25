# Row oriented vs Column oriented data stores in DBMS

> Source: https://www.geeksforgeeks.org/dbms/difference-between-row-oriented-and-column-oriented-data-stores-in-dbms/

Databases are essential for storing, managing, and retrieving data in modern applications. The performance and efficiency of a database system largely depend on how the data is organized and stored. Two primary strategies exist in relational database management systems (RDBMS):
1. Row-Oriented Database
Data is stored and retrieved row by row, meaning all attributes of a row are stored together in the same physical block.
- Optimized for retrieving entire rows of data.
- Commonly used in traditional RDBMS systems for Online Transaction Processing (OLTP) workloads.
Example
| ID | Name | Age | Department | 
|---|---|---|---|
| 1 | John | 35 | IT | 
| 2 | Jane | 28 | HR | 
| 3 | Bob | 42 | Finance | 
Each row represents a distinct entity, and no two rows are identical, ensuring uniqueness in the table.
Query Behavior
- Retrieving a row fetches all its attributes, even if some are not needed.
- May reduce performance for queries that only need specific columns.
Advantages
- Effective for OLTP: Optimized for frequent inserts, updates, and deletes.
- Full Row Retrieval: Efficient when querying all attributes of a single row.
- Easy to Understand and Use: Familiar to users of traditional relational databases.
Disadvantages
- Inefficient for Analytics: Queries needing only some columns are slower.
- Higher Storage Requirements: Less opportunity for columnar compression.
- Scaling Limitations: Performance may degrade as data size grows.
2. Column-Oriented Database
Data is stored column by column rather than row by row.
- Optimized for retrieving specific columns of data.
- Commonly used in Online Analytical Processing (OLAP) systems and data warehouses.
Example
| Column: ID | 1 | 2 | 3 | 
|---|---|---|---|
| Column: Name | John | Jane | Bob | 
| Column: Age | 35 | 28 | 42 | 
| Column: Department | IT | HR | Finance | 
Query Behavior
- Only the columns needed for the query are read.
- Supports columnar compression, reducing storage and improving performance.
- Retrieving full rows is more complex as data is spread across multiple columns.
Advantages
- Optimized for OLAP: Ideal for analytical queries on large datasets.
- Faster Queries on Selected Columns: Only relevant data is scanned.
- Storage Efficiency: Columnar compression reduces space requirements.
Disadvantages
- Complex Full Row Retrieval: Combining multiple columns may require more processing.
- Less Suitable for OLTP: Frequent inserts, updates, or deletes are less efficient.
- Query Complexity: May require specialized query languages or optimization techniques.
Row-Oriented Database vs Column-Oriented Database
| Feature | Row-Oriented Database | Column-Oriented Database | 
|---|---|---|
| Data Storage | Row by row | Column by column | 
| Optimized For | OLTP (transactions) | OLAP (analytics) | 
| Example | Relational Database (MySQL, PostgreSQL) | HBase, Cassandra, Amazon Redshift | 
| Query Performance | Fast for retrieving full rows | Fast for queries on specific columns | 
| Storage Efficiency | Less efficient, less compression | High compression, storage-efficient | 
| Scaling | Traditional scaling; may become slower as data grows | Designed for horizontal scaling and partitioning | 
| Full Row Retrieval | Simple | More complex | 
| Schema | Fixed Schema | Flexible/Schema-less (like HBase) | 
| Table Type | Thin tables | Wide, sparsely populated tables | 
Choosing the Right Database: If your system performs many transactions, choose a row-oriented database, but If your system performs analytics or needs to read specific columns from large datasets, choose a column-oriented database.

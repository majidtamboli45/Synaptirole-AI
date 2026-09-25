# Difference between RDBMS and MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/difference-between-rdbms-and-mongodb/

RDBMS and MongoDB are widely used database systems that differ in their data models and scalability approaches.
- RDBMS follows a relational, table-based structure.
- MongoDB uses a document-based NoSQL model.
- RDBMS emphasizes fixed schemas and relationships.
- MongoDB offers flexible schemas and horizontal scalability.
MongoDB
MongoDB is an open-source, document-oriented NoSQL database designed for scalable and high-volume data storage in modern applications.
- Stores data in BSON (Binary JSON) format.
- Uses a document-based, non-relational data model.
- Supports schema-less and flexible data structures.
- Scales horizontally to handle large data volumes.
- Well-suited for distributed and modern applications.
Features of MongoDB
Here are some features of MongoDB listed below:
- Multiple Servers: MongoDB can be configured to run across multiple servers to ensure high availability and fault tolerance.
- Schema-flexible Database: It allows data to be stored without requiring a predefined schema, making it highly flexible.
- Indexing: Any field within a document can be indexed, improving query performance.
- Rich Object Model: MongoDB supports a rich object model with advanced features for handling complex data.
- High Scalability: MongoDB offers horizontal scaling, allowing for seamless growth as data and traffic increase.
- Distributed Database: It can be distributed across multiple machines to handle large datasets and provide data redundancy.
RDBMS
RDBMS (Relational Database Management System) is a traditional database system that stores data in structured tables with fixed schemas, ensuring strong consistency, integrity, and security.
- Stores data in tables with rows and columns.
- Enforces a strict, predefined schema.
- Supports complex relationships between data.
- Provides strong consistency and data integrity.
- Common examples include MySQL, PostgreSQL, and Oracle.
- Ideal for applications with structured data and transactional requirements.
Features of RDBMS
- Data Security: RDBMS provides a high level of data security and integrity.
- Data Integrity: It ensures that data is accurate and consistent through constraints and normalization.
- ACID Compliance: RDBMS systems ensure data integrity through ACID properties—Atomicity, Consistency, Isolation, and Durability.
- Fixed Schema: RDBMS systems require a fixed schema, meaning that the structure of the data must be defined upfront.
- Scalability: Typically, RDBMS is vertically scalable by upgrading server resources, but it may struggle with horizontal scalability.
- Query Language: Uses SQL, a standard and powerful language for querying relational data.
Trade-Off Between RDBMS and MongoDB
- The trade-off between RDBMS and MongoDB lies in their strengths and limitations when it comes to performance and functionality.
- RDBMS excels in handling structured data with complex relationships, ensuring data integrity and supporting powerful SQL queries.
- MongoDB provides high performance, scalability, and flexibility, making it ideal for modern, data-intensive applications.
The following graph compares both systems on these parameters:
RDBMS Vs MongoDB
Here is a detailed comparison of RDBMS and MongoDB based on various features:
| RDBMS | MongoDB | 
|---|---|
| Relational database | Non-relational, document-oriented database | 
| Stores data in tables with rows and columns | Stores data in flexible JSON-like documents (BSON) | 
| Fixed, predefined schema | Schema-less, dynamic schema | 
| Vertically scalable (increase resources like CPU/RAM) | Horizontally scalable (add more servers to handle increased load) | 
| Strong focus on ACID properties | Supports ACID (limited/multi-document in newer versions) | 
| Supports complex joins | Supports joins using $lookup (less powerful than SQL joins) | 
| Row-based data storage | Document-based data storage | 
| Slower for large, distributed datasets | Faster for large-scale, distributed data handling | 
| High level of information security | Provides strong security features | 
| Uses SQL for querying | Uses JSON-like query language | 
| Less flexible for schema changes | Highly flexible for evolving data models | 
| Limited indexing options | Extensive indexing on any field in the document | 
| Suitable for structured data with well-defined relationships | Best for handling unstructured or semi-structured data | 
| Backup and recovery options are manual | Automated backup and recovery options available | 
| Can be deployed on-premises or cloud | Cloud-native and supports multi-cloud deployment | 
| Ideal for transactional applications | Ideal for high scalability and big data applications |

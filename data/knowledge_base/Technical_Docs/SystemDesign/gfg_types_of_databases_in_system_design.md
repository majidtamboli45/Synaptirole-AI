# Types of Databases in System Design

> Source: https://www.geeksforgeeks.org/system-design/types-of-databases-in-system-design

Databases are essential components of a system because they store, organize, and manage application data. The type of database chosen directly impacts system performance, scalability, and reliability.
- Databases efficiently store and manage large amounts of data while directly impacting system performance, scalability, consistency, and availability.
- Choosing the right database improves system speed, reliability, and overall user experience.
Example: An e-commerce platform may use a relational database for handling transactions and a NoSQL database to manage large volumes of product or user activity data efficiently.
Types of Databases in System Design
Most common types of databases in system design are:
1. Relational Databases (RDBMS)
Relational databases in system design are structured storage systems that organize data into tables, each with predefined columns and rows. They ensure data integrity and facilitate efficient querying through Structured Query Language (SQL).
- The relational model supports relationships between tables using primary keys (unique identifiers) and foreign keys (references to primary keys in other tables), enabling complex data retrieval and manipulation.
- This model is widely used in applications requiring structured data storage and ACID (Atomicity, Consistency, Isolation, Durability) properties, crucial for transactional reliability.
Some of today’s well-known types include MySQL, PostgreSQL, Oracle and Microsoft SQL Server.
2. NoSQL Databases
NoSQL databases handle large volumes of unstructured or semi-structured data with high scalability and flexibility. They support distributed systems and are ideal for modern, high-performance applications.
- Flexible schema: Store diverse data formats without strict structure.
- High scalability: Designed for distributed and large-scale systems.
They are divided into several types:
- Document Databases: Store data as documents of JSON or BSON. Examples: MongoDB, CouchDB.
- Key-Value Stores: Record data in a storage system where each chunk of data follows the format key-value. Examples: Redis, DynamoDB.
- Column-Family Stores: Prolific storage of data in the columns instead of the rows which is more appropriate in wide-column store cases. Examples: Cassandra, HBase.
- Graph Databases: Most suitable for information that is in relations and networks, Store data as nodes, edges, and properties. Examples: Neo4j, ArangoDB.
3. NewSQL Databases
NewSQL databases combine the benefits of traditional relational databases (ACID transactions and strong consistency) with the scalability and performance of NoSQL systems. They emerged to overcome the limitations of traditional databases in handling modern big data and distributed computing needs.
- NewSQL databases retain the relational data model but introduce innovations in distributed architecture, concurrency control mechanisms, and scalability techniques.
- They are designed to support massive scalability through shared-nothing architectures, sharding (horizontal partitioning of data), and distributed transaction management.
- Unlike NoSQL databases, NewSQL systems maintain ACID compliance across distributed transactions, ensuring data consistency and reliability.
Some of the systems that can be classified under it include Google Spanner, CockroachDB, and NuoDB.
4. Time-Series Databases
Time series databases are specialized databases optimized for storing and querying time-stamped data points or measurements. They excel at handling large volumes of sequential data generated over time, such as sensor data, financial market data, IoT telemetry, and log data from applications or systems.
- Time-stamped Data: Data points are indexed and organized based on timestamps, allowing efficient insertion and retrieval of data in chronological order.
- Optimized Storage: Time series databases typically employ specialized storage structures and compression techniques to efficiently store and manage sequential data, minimizing storage footprint while maintaining fast query performance.
- Time-based Queries: They support time-centric queries, such as retrieving data points within a specific time range, aggregating data over intervals (e.g., hourly, daily), and performing time series analytics (e.g., calculating moving averages, detecting trends).
Examples include: InfluxDB, TimescaleDB.
5. Object-Oriented Databases
Object-oriented databases (OODBs) are databases that store data in the form of objects, akin to object-oriented programming concepts. Unlike relational databases that store data in tables, OODBs directly store complex data structures as objects, along with their attributes and methods.
- Objects: Data is represented as objects, which encapsulate both data (attributes or fields) and behaviors (methods or procedures). Objects can have complex structures and relationships, mirroring real-world entities more closely than relational databases.
- Inheritance and Polymorphism: OODBs support inheritance, allowing objects to inherit attributes and behaviors from other objects (classes). Polymorphism enables objects of different classes to be treated uniformly through interfaces or shared behaviors.
Examples include: ObjectDB, db4o.
Comparison of Different Databases
Below is the comparison for different databases:
| Database Type | Performance | Scalability | Consistency | Availability | 
|---|---|---|---|---|
| Relational (RDBMS) | High performance for complex queries | Vertical scaling (limited horizontal) | Strong consistency (ACID) | High availability with clustering | 
| NoSQL Document | High performance for read/write operations | High horizontal scalability | Eventual consistency (tunable) | High availability | 
| NoSQL Key-Value | Extremely fast for simple read/write | High horizontal scalability | Eventual consistency | High availability | 
| NoSQL Column-Family | High performance for large datasets | High horizontal scalability | Tunable consistency | High availability | 
| NoSQL Graph | High performance for relationship queries | Scales well with relationships | Strong consistency | High availability | 
| NewSQL | High performance with ACID properties | High horizontal scalability | Strong consistency (ACID) | High availability with clustering | 
| Time-Series | Optimized for time-series data queries | High horizontal scalability | Tunable consistency | High availability | 
| Object-Oriented | High performance for object manipulation | Moderate scalability | Strong consistency (depends on implementation) | Moderate availability | 
Database Selection Based on Application Needs
Below are the different databases and some scenarios with example of when to choose this database:
1. Relational Databases (RDBMS)
Used for applications that require structured data, strong consistency, and complex queries.
- Scenario: An e-commerce platform that needs complicated queries, business transactions, and strong consistency.
- Example: Managing orders, customers, and inventory using PostgreSQL.
2. NoSQL Document Databases
Designed to store semi-structured or flexible data in document formats like JSON.
- Scenario: A CMS where flexible schema requirements are needed.
- Example: Storing articles, blog posts, and user-generated content using MongoDB.
3. NoSQL Key-Value Stores
Optimized for fast read and write operations using simple key–value pairs.
- Scenario: Session storage in a web application where frequent read and write operations are required.
- Example: Caching user sessions and configuration data using Redis.
4. NoSQL Column-Family Stores
Suitable for handling large volumes of distributed data and real-time analytics.
- Scenario: A high-speed analytics system that processes large-scale data.
- Example: Using Cassandra to store and process results of user activity sessions.
5. NoSQL Graph Databases
Specialized databases designed to manage highly connected data and relationships.
- Scenario: A social network application where relationships between users are important.
- Example: Managing user connections and relationships using Neo4j.
6. NewSQL Databases
Provide the scalability of NoSQL systems while maintaining the ACID guarantees of traditional relational databases.
- Scenario: A global financial system requiring strict consistency and scalability.
- Example: Using Google Spanner to manage financial transactions across multiple regions.
7. Time-Series Databases
Optimized for storing and analyzing time-based data generated continuously.
- Scenario: Systems that collect large amounts of sensor or monitoring data over time.
- Example: Storing and analyzing temperature and humidity data using InfluxDB.
8. Object-Oriented Databases
Designed to store complex objects directly, aligning with object-oriented programming models.
- Scenario: A CAD application that manages large engineering objects and their relationships.
- Example: Using ObjectDB to store and manage engineering designs and models.

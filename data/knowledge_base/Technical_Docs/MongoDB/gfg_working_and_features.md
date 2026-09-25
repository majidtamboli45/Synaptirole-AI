# Working and Features

> Source: https://www.geeksforgeeks.org/mongodb/what-is-mongodb-working-and-features/

MongoDB works as a NoSQL, document-oriented database that stores data in a flexible, JSON-like format called BSON (Binary JSON). Instead of rows and columns (like SQL), it uses collections and documents:
- Database: A container for collections (similar to schema in SQL).
- Collection: A group of documents (similar to a table).
- Document: A record stored in JSON-like key-value pairs
Hence the database, collection, and documents are related to each other as shown below:
1. Basic Architecture of MongoDB
MongoDB's database structure consists of the following components:
| Component | Equivalent in RDBMS | Description | 
|---|---|---|
| Database | Database | Stores multiple collections. | 
| Collection | Table | Groups related documents. | 
| Document | Row | A BSON object containing key-value pairs. | 
| Field | Column | Stores data attributes within documents. | 
2. Storage Format: BSON (Binary JSON)
MongoDB uses BSON, an extended version of JSON, which supports additional data types like binary data, dates, and nested arrays, improving query efficiency and storage performance.
3. Data Storage and Querying
- Data is stored in collections of documents, making it highly flexible.
- MongoDB supports powerful indexing and real-time queries, ensuring faster read/write operations.
- Developers can store, retrieve, and update data using MongoDB Query Language (MQL), which is similar to JSON queries.
4. Schema Flexibility
MongoDB allows schema-less data storage, meaning:
- Collections can store documents with different structures.
- Fields are not predefined, allowing dynamic updates.
- Suitable for applications where data structures frequently change.
5. Data Relationships in MongoDB
Unlike SQL databases that rely on foreign keys and JOIN operations, MongoDB supports:
- Embedded Documents – Store related data in a single document (reducing the need for joins).
- Reference Documents – Use unique identifiers to establish relationships between documents.
6. Scalability: Horizontal vs. Vertical Scaling
MongoDB is designed for horizontal scaling, meaning it can:
- Distribute data across multiple servers using sharding.
- Support automatic load balancing and replication for high availability.
- Handle big data and distributed workloads efficiently.
For example: we have a database named GeeksforGeeks. Inside this database, we have two collections and in these collections we have two documents. And in these documents we store our data in the form of fields. As shown in the below image: 
 
Features of MongoDB
MongoDB offers a wide range of features that make it a preferred choice for modern applications.
1. Schema-less Database
Unlike traditional relational databases, MongoDB collections:
- Allow different structures within the same collection.
- Do not require fixed column definitions.
- Enable easy updates and modifications.
2. Document Oriented
In MongoDB, all the data stored in the documents instead of tables like in RDBMS. In these documents, the data is stored in fields(key-value pair) instead of rows and columns which make the data much more flexible in comparison to RDBMS. And each document contains its unique object id.
3. Indexing
In MongoDB database, every field in the documents is indexed with primary and secondary indices this makes easier and takes less time to get or search data from the pool of the data. If the data is not indexed, then database search each document with the specified query which takes lots of time and not so efficient.
4. Scalability
MongoDB provides horizontal scalability with the help of sharding. Sharding means to distribute data on multiple servers, here a large amount of data is partitioned into data chunks using the shard key, and these data chunks are evenly distributed across shards that reside across many physical servers. It will also add new machines to a running database.
5. Replication
MongoDB provides high availability and redundancy with the help of replication, it creates multiple copies of the data and sends these copies to a different server so that if one server fails, then the data is retrieved from another server.
6. Aggregation
It allows to perform operations on the grouped data and get a single result or computed result. It is similar to the SQL GROUPBY clause. It provides three different aggregations i.e, aggregation pipeline, map-reduce function, and single-purpose aggregation methods.
7. High Performance
The performance of MongoDB is very high and data persistence as compared to another database due to its features like scalability, indexing, replication, etc.
Uses of MongoDB
MongoDB is a popular NoSQL database known for its flexibility, scalability, and performance. It is widely used in various applications across different industries. Here are some common uses of MongoDB:
1. Content Management Systems (CMS):
MongoDB's flexible schema and powerful query capabilities make it an ideal choice for content management systems. It can efficiently handle diverse content types and structures, enabling dynamic and scalable content management solutions.
2. E-commerce Platforms
E-commerce platforms benefit from MongoDB's ability to store and retrieve large amounts of product data quickly. Its flexible schema supports dynamic product catalogs, user profiles, shopping carts, and transaction histories.
3. Real-Time Analytics
MongoDB is well-suited for real-time analytics applications due to its high-performance data ingestion and querying capabilities. It can handle large volumes of data in real-time, making it ideal for monitoring, fraud detection, and personalized recommendations.
4. Internet of Things (IoT)
IoT applications generate vast amounts of data from sensors and devices. MongoDB's scalability and flexible data model allow it to efficiently store and process this data, enabling real-time analysis and decision-making for IoT systems.
6. Gaming Applications
Gaming applications generate complex data structures, such as player profiles, scores, achievements, and game states. MongoDB's document-based model allows for efficient storage and retrieval of this data, supporting high-performance gaming experiences.
7. Log Management and Analysis
Organizations use MongoDB to store and analyze log data from various sources. Its ability to handle large volumes of unstructured data makes it ideal for logging, monitoring, and troubleshooting applications and infrastructure.
9. Customer Relationship Management (CRM)
CRM systems use MongoDB to manage customer data, interactions, and sales pipelines. Its ability to handle complex relationships and unstructured data enables more personalized and effective customer engagement strategies.
10. Social Networks
Social networking applications require a database that can handle complex relationships, user-generated content, and real-time interactions. MongoDB's flexibility and scalability make it an excellent choice for building social networks and community platforms.
11. Big Data Applications
MongoDB is used in big data applications for its ability to store and process large volumes of diverse data types. It integrates well with big data technologies like Hadoop and Spark, enabling advanced data analytics and processing.
12. Healthcare Systems
Healthcare applications use MongoDB to manage patient records, clinical data, and medical images. Its flexible schema allows for the efficient storage of complex healthcare data, supporting better patient care and data analysis.
MongoDB Vs RDBMS
Some major differences between MongoDB and the RDBMS are as follows:
| MongoDB | RDBMS | 
|---|---|
| It is a non-relational and document-oriented database. | It is a relational database. | 
| It is suitable for hierarchical data storage. | It is not suitable for hierarchical data storage. | 
| It has a dynamic schema. | It has a predefined schema. | 
| It centers around the CAP theorem (Consistency, Availability, and Partition tolerance). | It centers around ACID properties (Atomicity, Consistency, Isolation, and Durability). | 
| In terms of performance, it is much faster than RDBMS. | In terms of performance, it is slower than MongoDB. |

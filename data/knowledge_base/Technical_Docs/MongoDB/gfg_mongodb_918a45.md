# MongoDB Introduction

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-an-introduction/

MongoDB is a popular document-oriented NoSQL database that stores data in a flexible BSON format, enabling fast and efficient storage and retrieval. It is available under the SSPL, which is not recognized as an open-source license by the Open Source Initiative due to commercial use restrictions.
A simple MongoDB document Structure:
{
"_id": 1,
"title": "Geeksforgeeks",
"author": "John Smith",
"url": "https://www.geeksforgeeks.org/",
"tags": ["NoSQL", "Database", "Tutorial"],
"published": true,
"views": 1500
}
- _id: Unique identifier for the document.
- title, author, url: Basic fields storing strings.
- tags: An array of strings.
- published: A Boolean value.
- views: A number representing views or count.
Working of MongoDB
In a MongoDB sharded cluster, the components work together as follows:
- Client Application: The application sends requests to MongoDB to read or write data.
- Query Router (mongos): The query router receives the client request and determines which shard should handle it.
- Config Servers: Store metadata about the cluster, including which data resides on which shard.
- Shards: Data is horizontally distributed across replica sets, with the primary handling writes and secondaries providing replication and reads.
- Primary Node: Handles all write operations.
- Secondary Nodes: Replicate data from the primary for high availability and read operations.
CRUD Operations
MongoDB provides several basic operations to manage and manipulate data efficiently:
- Create (Insert): Add new documents to a collection.
- Read (Find): Retrieve documents from a collection based on query criteria.
- Update: Modify existing documents in a collection.
- Delete: Remove documents from a collection.
Features of the MongoDB database
MongoDB offers several key features that make it efficient and scalable:
- Document Oriented: Stores all related data together in a single, flexible document rather than multiple tables.
- Indexing: Enables fast queries by avoiding full collection scans, crucial for handling large data efficiently.
- Scalability: Uses sharding to distribute data across multiple servers; easily add new machines to expand.
- Replication and High Availability: Stores multiple data copies on different servers for redundancy and fault tolerance.
- Aggregation: Processes and summarizes data (like SQL GROUP BY) using operations such as sum, avg, min, and max.
Real-World Applications of MongoDB
MongoDB powers a wide range of modern applications:
- Websites & Apps: Platforms like e-commerce sites use MongoDB to store product catalogs, user profiles, and order histories.
- Real-Time Analytics: Companies analyze user activity or sales trends on the fly, such as tracking popular products during a sale.
- Content Management & Personalization: Apps manage dynamic content and personalize recommendations, like suggesting movies based on viewing history.
- Big Data & IoT: MongoDB handles large volumes of unstructured data from sensors, logs, or social media feeds for processing and insights.
Language Support by MongoDB
MongoDB offers official drivers for many popular programming languages, enabling easy integration and database operations.
- C
- C++
- Rust
- C#
- Java
- Node.js
- Perl
- PHP
- Python
- Ruby
- Scala
- Go
- Erlang
Note: Unlike relational databases, MongoDB does not require a fixed schema, making it easier to adapt to changing application needs

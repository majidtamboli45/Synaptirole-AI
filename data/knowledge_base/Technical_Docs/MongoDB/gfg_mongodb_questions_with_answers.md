# MongoDB  Questions with Answers

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-interview-questions/

MongoDB is a popular open-source NoSQL database that stores data in flexible, JSON-like BSON documents. It is widely used by companies such as Adobe, eBay, Verizon, Coinbase, and Bosch to build scalable, high-performance, and data-intensive applications. Mastering key MongoDB interview questions is essential for succeeding in technical interviews for MongoDB, Backend, and Full-Stack Developer roles.
Basic Questions
1. How does MongoDB differ from relational databases?
Data Model:
- MongoDB: Document-oriented, stores data in flexible JSON/BSON documents.
- Relational DB: Table-based, stores data in rows and columns with a fixed schema.
Schema:
- MongoDB: Schema-less; documents in a collection can have different structures.
- Relational DB: Schema must be defined upfront; all rows follow the same structure.
Relationships:
- MongoDB: Uses embedding or referencing; no JOINs required.
- Relational DB: Uses foreign keys and JOINs to establish relationships.
Scalability:
- MongoDB: Horizontally scalable using sharding.
- Relational DB: Typically vertically scalable; horizontal scaling is complex.
Querying:
- MongoDB: Uses a rich query language for documents, supports nested structures and arrays.
- Relational DB: Uses SQL for structured queries across tables.
2. Explain the concept of a document and a collection in MongoDB.
Document:
- A document is the basic unit of data in MongoDB.
- It is a JSON-like object (stored as BSON internally) containing key-value pairs.
- Each document can have different fields and nested structures.
Example:
{
  _id: ObjectId("64fe1234567890abcdef1234"),
  name: "John Doe",
  age: 30,
  skills: ["JavaScript", "MongoDB"]
}
Collection:
- A collection is a group of documents in MongoDB.
- It is similar to a table in relational databases, but schema-less.
- All documents in a collection are stored together and can be queried collectively.
- Example: A users collection may contain multiple documents like the one above.
3. How does MongoDB store data internally?
MongoDB stores data in BSON (Binary JSON) format, which is optimized for speed and traversing. Collections are stored in databases as files on disk using the WiredTiger storage engine.
4. Explain BSON and Its Significance in MongoDB.
BSON (Binary JSON) is the binary-encoded data format used by MongoDB to store and transmit documents. It extends JSON with additional data types and is optimized for efficient storage and fast query processing.
Significance of BSON in MongoDB
- Supports rich data types such as Date, Binary, ObjectId, and Decimal128.
- Enables faster parsing and traversal compared to text-based JSON.
- Improves query and indexing performance due to binary encoding.
5. What data types are supported in MongoDB documents?
MongoDB supports a variety of BSON data types, which extend standard JSON types:
- String – Textual data.
- Number – Integer (int), Long (long), Double (double), Decimal (Decimal128).
- Boolean – true or false.
- Date – Stores date and time in UTC format.
- Array – List of values (can store mixed types).
- Object / Embedded Document – Nested documents within a document.
- ObjectId – Unique identifier automatically generated for _id field.
- Null – Represents a null value.
- Binary Data – Stores binary data like images or files.
- Regular Expression – For pattern matching.
- Timestamp – Special internal type used for replication and sharding.
- Code / JavaScript – Stores JavaScript code.
6. How to Create a New Database and Collection in MongoDB?
To create a new database and collection in MongoDB, you can use the mongo shell:
use mydatabase
db.createCollection("mycollection")
This command switches to mydatabase (creating it if it doesn't exist) and creates a new collection named mycollection.
7. How Does MongoDB Ensure High Availability and Scalability?
- MongoDB ensures high availability and scalability through its features like replica sets and sharding.
- Replica sets provide redundancy and failover capabilities by ensuring that data is always available.
- Sharding distributes data across multiple servers, enabling horizontal scalability to handle large volumes of data and high traffic loads.
8. What is the role of _id in MongoDB documents?
_id uniquely identifies each document within a collection. It acts as the default primary key and helps in indexing and quick retrieval.
9. How do you insert data into a collection?
You can use the insertOne() or insertMany() methods.
Example:
db.users.insertOne({ name: “John”, age: 28 })
10. Explain the Concept of Replica Sets in MongoDB.
- A replica set in MongoDB is a group of mongod instances that maintain the same data set.
- A replica set consists of a primary node and multiple secondary nodes.
- The primary node receives all write operations while secondary nodes replicate the primary's data and can serve read operations.
- If the primary node fails, an automatic election process selects a new primary to maintain high availability.
11. What is Sharding, and How Does It Work in MongoDB?
Sharding is a method for distributing data across multiple servers in MongoDB. It allows for horizontal scaling by splitting large datasets into smaller, more manageable pieces called shards.
- Each shard is a separate database that holds a portion of the data.
- MongoDB automatically balances data and load across shards, ensuring efficient data distribution and high performance.
12. Explain the Basic Syntax of MongoDB CRUD Operations.
CRUD operations in MongoDB are used to create, read, update, and delete documents.
- Create: db.collection.insertOne({ name: "Alex", age: 25 })
- Read: db.collection.find({ name: "Alex" })
- Update: db.collection.updateOne({ name: "Alex" }, { $set: { age: 26 } })
- Delete: db.collection.deleteOne({ name: "Alex" })
13. How to Perform Basic Querying in MongoDB?
Basic querying in MongoDB involves using the find method to retrieve documents that match certain criteria.
Example:
db.collection.find({ age: { $gte: 20 } })
This query retrieves all documents from the collection where the age field is greater than or equal to 20.
14. What is an Index in MongoDB, and How to Create One?
An index in MongoDB is a data structure that improves the speed of data retrieval operations on a collection. You can create an index using the createIndex method.
For example, to create an index on the name field:
db.collection.createIndex({ name: 1 })
15. How Does MongoDB Handle Data Consistency?
MongoDB provides several mechanisms to ensure data consistency:
- Journaling: MongoDB uses write-ahead logging to maintain data integrity.
- Write Concerns: Define how many nodes must acknowledge a write (e.g., primary only or primary + secondaries).
- Replica Sets: Replicate data across nodes to ensure availability and consistency, with read concerns controlling read consistency.
16. How to Perform Data Import and Export in MongoDB?
To perform data import and export in MongoDB, you can use the mongoimport and mongoexport tools. These tools allow you to import data from JSON, CSV or TSV files into MongoDB and export data from MongoDB collections to JSON or CSV files.
Import Data:
mongoimport --db mydatabase --collection mycollection --file data.json
This command imports data from data.json into the mycollection collection in the mydatabase database.
Export Data:
mongoexport --db mydatabase --collection mycollection --out data.json
This command exports data from the mycollection collection in the mydatabase database to data.json.
17. What are MongoDB Aggregation Pipelines and How are They Used?
The aggregation pipeline is a framework for data aggregation, modeled on the concept of data processing pipelines. Documents enter a multi-stage pipeline that transforms the documents into aggregated results. Each stage performs an operation on the input documents and passes the results to the next stage.
db.orders.aggregate([
{ $match: { status: "A" } },
{ $group: { _id: "$cust_id", total: { $sum: "$amount" } } },
{ $sort: { total: -1 } }
])
- Stage 1 ($match) filters documents by status "A".
- Stage 2 ($group) groups documents by customer ID and calculates the total amount for each group.
- Stage 3 ($sort) sorts the results by total amount in descending order.
Aggregation pipelines are powerful and flexible, enabling complex data processing tasks to be executed within MongoDB.
Intermediate Questions
MongoDB Intermediate Interview Questions explore advanced concepts and features, such as schema design, aggregation pipelines, indexing strategies, and transaction management. These questions help gauge your ability to utilize MongoDB efficiently in more complex scenarios.
1. Describe the Aggregation Framework in MongoDB
The Aggregation Framework in MongoDB processes documents through a multi-stage pipeline to filter, group, sort, reshape, and compute results. It enables complex data transformations and analytics to be performed efficiently within the database itself.
2. How to Perform Aggregation Operations Using MongoDB?
Aggregation operations in MongoDB are performed using the aggregate method. This method takes an array of pipeline stages, each stage representing a step in the data processing pipeline.
Example: Calculate total sales for each product:
db.sales.aggregate([
{ $match: { status: "completed" } },
{ $group: { _id: "$product", totalSales: { $sum: "$amount" } } },
{ $sort: { totalSales: -1 } }
])
3. Explain the Concept of Write Concern and Its Importance in MongoDB
Write Concern in MongoDB defines how many nodes must acknowledge a write before it is considered successful, with levels like acknowledged (default), unacknowledged, journaled, and replica-acknowledged.
Importance of Write Concern
- Balances data durability and performance.
- Higher write concern ensures data is safely written and replicated.
- Lower write concern improves performance with less acknowledgment.
- Helps control latency based on application reliability needs.
4. What are TTL Indexes, and How are They Used in MongoDB?
TTL (Time To Live) Indexes in MongoDB are special indexes that automatically remove documents from a collection after a certain period. They are commonly used for data that needs to expire after a specific time, such as session information, logs, or temporary data. To create a TTL index, you can specify the expiration time in seconds
Example: Remove documents 1 hour after createdAt:
db.sessions.createIndex({ "createdAt": 1 }, { expireAfterSeconds: 3600 })
This index will remove documents from the sessions collection 1 hour (3600 seconds) after the createdAt field's value.
5. How to Handle Schema Design and Data Modeling in MongoDB?
Schema design and data modeling in MongoDB involve defining how data is organized and stored in a document-oriented database. Unlike SQL databases, MongoDB offers flexible schema design, which can be both an advantage and a challenge.
Key considerations for schema design include:
- Embedding vs. Referencing: Deciding whether to embed related data within a single document or use references between documents.
- Document Structure: Designing documents that align with application query patterns for efficient read and write operations.
- Indexing: Creating indexes to support query performance.
- Data Duplication: Accepting some level of data duplication to optimize for read performance.
- Sharding: Designing the schema to support sharding if horizontal in MongoDB
6. Explain the Differences Between WiredTiger and MMAPv1 Storage Engines.
| WiredTiger | MMAPv1 | 
|---|---|
| Document-level concurrency, allowing multiple operations simultaneously. | Collection-level concurrency, limiting performance under heavy write operations. | 
| Supports data compression. | Does not support data compression. | 
| Better performance and efficiency for most workloads | Limited performance under heavy workloads. | 
| Uses write-ahead logging for better data integrity. | Basic journaling, less advanced. | 
| Modern and default storage engine. | Legacy engine, deprecated. | 
| Advanced implementation with additional features. | Simple implementation but lacks advanced features. | 
7. How to Handle Transactions in MongoDB?
MongoDB supports multi-document ACID transactions by allowing us to perform a series of read and write operations across multiple documents and collections in a transaction. This ensures data consistency and integrity. To use transactions we typically start a session, begin a transaction, perform the operations and then commit or abort the transaction.
Example in JavaScript:
const session = client.startSession();
session.startTransaction();
try {
  db.collection1.insertOne({ name: "Alice" }, { session });
  db.collection2.insertOne({ name: "Bob" }, { session });
  session.commitTransaction();
} catch (error) {
  session.abortTransaction();
} finally {
  session.endSession();
}
8. Describe the MongoDB Compass Tool and Its Functionalities
MongoDB Compass is a graphical user interface (GUI) tool for MongoDB that provides an easy way to visualize, explore, and manipulate your data. It offers features such as:
- Schema Visualization: View and analyze your data schema, including field types and distributions.
- Query Building: Build and execute queries using a visual interface.
- Aggregation Pipeline: Construct and run aggregation pipelines.
- Index Management: Create and manage indexes to optimize query performance.
- Performance Monitoring: Monitor database performance, including slow queries and resource utilization.
- Data Validation: Define and enforce schema validation rules to ensure data integrity.
- Data Import/Export: Easily import and export data between MongoDB and JSON/CSV files.
9. What is MongoDB Atlas, and How Does it Differ From Self-Hosted MongoDB?
MongoDB Atlas is a fully managed cloud database service provided by MongoDB. It offers automated deployment, scaling, and management of MongoDB clusters across various cloud providers (AWS, Azure, Google Cloud). Key differences from self-hosted MongoDB include:
- Managed Service: Atlas handles infrastructure management, backups, monitoring, and upgrades.
- Scalability: Easily scale clusters up or down based on demand.
- Security: Built-in security features such as encryption, access controls, and compliance certifications.
- Global Distribution: Deploy clusters across multiple regions for low-latency access and high availability.
- Integrations: Seamless integration with other cloud services and MongoDB tools.
10. How to Implement Access Control and User Authentication in MongoDB?
Access control and user authentication in MongoDB are implemented through a role-based access control (RBAC) system. You create users and assign roles that define their permissions. To set up access control:
- Enable Authentication: Configure MongoDB to require authentication by starting the server with --auth or setting security.authorization to enabled in the configuration file.
- Create Users: Use the db.createUser method to create users with specific roles.
- Assign Roles: Assign roles to users that define their permissions, such as read, write, or admin roles for specific databases or collections.
db.createUser({
user: "admin",
pwd: "password",
roles: [{ role: "userAdminAnyDatabase", db: "admin" }]
});
11. What are Capped Collections, and When are They Useful?
Capped collections in MongoDB are fixed-size collections that automatically overwrite the oldest documents when the specified size limit is reached. They maintain insertion order and are useful for scenarios where you need to store a fixed amount of recent data, such as logging, caching, or monitoring data.
Example of creating a capped collection:
db.createCollection("logs", { capped: true, size: 100000 });
12. Explain the Concept of Geospatial Indexes in MongoDB.
Geospatial indexes in MongoDB are special indexes that support querying of geospatial data, such as locations and coordinates. They enable efficient queries for proximity, intersections, and other spatial relationships. MongoDB supports two types of geospatial indexes: 2d for flat geometries and 2dsphere for spherical geometries.
Example of creating a 2dsphere index:
db.places.createIndex({ location: "2dsphere" });
13. How to Handle Backups and Disaster Recovery in MongoDB?
Handling backups and disaster recovery in MongoDB involves regularly creating backups of your data and having a plan for restoring data in case of failure. Methods include:
- Mongodump/Mongorestore: Use the mongodump and mongorestore utilities to create and restore binary backups.
- File System Snapshots: Use file system snapshots to take consistent backups of the data files.
- Cloud Backups: If using MongoDB Atlas, leverage automated backups provided by the service.
- Replica Sets: Use replica sets to ensure data redundancy and high availability. Regularly test the failover and recovery process.
14. Describe the Process of Upgrading MongoDB to a Newer Version
Upgrading MongoDB to a newer version involves several steps to ensure a smooth transition:
- Check Compatibility: Review the release notes and compatibility changes for the new version.
- Backup Data: Create a backup of your data to prevent data loss.
- Upgrade Drivers: Ensure that your application drivers are compatible with the new MongoDB version.
- Upgrade MongoDB: Follow the official MongoDB upgrade instructions, which typically involve stopping the server, installing the new version, and restarting the server.
- Test Application: Thoroughly test your application with the new MongoDB version to identify any issues.
- Monitor: Monitor the database performance and logs to ensure a successful upgrade.
15. What are Change Streams in MongoDB, and How are They Used?
Change Streams in MongoDB allow applications to listen for real-time changes to data in collections, databases, or entire clusters. They provide a powerful way to implement event-driven architectures by capturing insert, update, replace, and delete operations. To use Change Streams, you typically open a change stream cursor and process the change events as they occur.
Example:
const changeStream = db.collection('orders').watch();
changeStream.on('change', (change) => {
  console.log(change);
});
This example listens for changes in the orders collection and logs the change events.
16. Explain the Use of Hashed Sharding Keys in MongoDB
Hashed sharding keys in MongoDB distribute data across shards using a hashed value of the shard key field, ensuring even data distribution and preventing issues caused by data locality or uneven distribution.
- Uses a hashed value of the shard key field to distribute data evenly across shards.
- Prevents data locality and uneven distribution issues common in range-based sharding.
- Ideal for monotonically increasing fields such as timestamps or identifiers.
Example:
db.collection.createIndex({ _id: "hashed" });
sh.shardCollection("mydb.mycollection", { _id: "hashed" });
17. How to Optimize MongoDB Queries for Performance?
Optimizing MongoDB queries involves several strategies:
- Indexes: Create appropriate indexes to support query patterns.
- Query Projections: Use projections to return only necessary fields.
- Index Hinting: Use index hints to force the query optimizer to use a specific index.
- Query Analysis: Use the explain() method to analyze query execution plans and identify bottlenecks.
- Aggregation Pipeline: Optimize the aggregation pipeline stages to minimize data processing and improve efficiency.
18. Describe the Map-Reduce Functionality in MongoDB
Map-Reduce in MongoDB is a data processing paradigm used to perform complex data aggregation operations. It consists of two phases: the map phase processes each input document and emits key-value pairs, and the reduce phase processes all emitted values for each key and outputs the final result.
Example:
db.collection.mapReduce(
  function() { emit(this.category, this.price); },
  function(key, values) { return Array.sum(values); },
  { out: "category_totals" }
);
This example calculates the total price for each category in a collection.
19. What is the Role of Journaling in MongoDB, and How Does It Impact Performance?
Journaling in MongoDB ensures data durability and crash recovery by writing changes to a journal file before updating the actual database files. In case of a crash, MongoDB replays the journal to restore data consistency. While it improves data safety, it may slightly affect performance due to extra disk I/O operations.
20. How to Implement Full-Text Search in MongoDB?
Full-Text Search in MongoDB is implemented using text indexes. These indexes allow you to perform text search queries on string content within documents.
Example:
db.collection.createIndex({ content: "text" });
db.collection.find({ $text: { $search: "mongodb" } });
A text index is created on the content field, and a text search query is performed to find documents containing the word "mongodb."
21. What are the Considerations for Deploying MongoDB in a Production Environment?
Considerations for deploying MongoDB in a production environment include:
- Replication: Set up replica sets for high availability and data redundancy.
- Sharding: Implement sharding for horizontal scaling and to distribute the load.
- Backup and Recovery: Establish a robust backup and recovery strategy.
- Security: Implement authentication, authorization, and encryption.
- Monitoring: Use monitoring tools to track performance and detect issues.
- Capacity Planning: Plan for adequate storage, memory, and CPU resources.
- Maintenance: Regularly update MongoDB to the latest stable version and perform routine maintenance tasks.
22. Explain the Concept of Horizontal Scalability and Its Implementation in MongoDB
- Horizontal Scalability in MongoDB refers to the ability to add more servers to distribute the load and data. This is achieved through sharding, where data is partitioned across multiple shards.
- Each shard is a replica set that holds a subset of the data. Sharding allows MongoDB to handle large datasets and high-throughput operations by distributing the workload.
23. How to Monitor and Troubleshoot Performance Issues in MongoDB?
Monitoring and troubleshooting performance issues in MongoDB involve:
- Monitoring Tools: Use tools like MongoDB Cloud Manager, MongoDB Ops Manager, or third-party monitoring solutions.
- Logs: Analyze MongoDB logs for errors and performance metrics.
- Profiling: Enable database profiling to capture detailed information about operations.
- Explain Plans: Use the explain() method to understand query execution and identify bottlenecks.
- Index Analysis: Review and optimize indexes based on query patterns and usage.
- Resource Utilization: Monitor CPU, memory, and disk I/O usage to identify resource constraints.
24. Describe the Process of Migrating Data from a Relational Database to MongoDB
Migrating data from a relational database to MongoDB involves several steps:
- Schema Design: Redesign the relational schema to fit MongoDB's document-oriented model. Decide on embedding vs. referencing, and plan for indexes and collections.
- Data Export: Export data from the relational database in a format suitable for MongoDB (e.g., CSV, JSON).
- Data Transformation: Restructure and convert data to fit the MongoDB schema and relationships.
- Data Import: Import the transformed data into MongoDB using tools like mongoimport or custom scripts.
- Validation: Validate the imported data to ensure consistency and completeness.
- Application Changes: Update the application code to interact with MongoDB instead of the relational database.
- Testing: Thoroughly test the application and the database to ensure everything works as expected.
- Go Live: Deploy the MongoDB database in production and monitor the transition.
Query Based Questions
MongoDB Query-Based Interview Questions focus on your ability to write efficient and optimized queries to interact with databases. These tasks include retrieving specific data using filters, sorting and paginating results, and utilizing projections to select desired fields.
Sample Dataset
The following dataset represents a collection named employees, containing documents about employees in an organization. Each document includes details such as the employee's name, age, position, salary, department, and hire date.
"[
{
""_id"": 1,
""name"": ""John Doe"",
""age"": 28,
""position"": ""Software Engineer"",
""salary"": 80000,
""department"": ""Engineering"",
""hire_date"": ISODate(""2021-01-15"")
},
{
""_id"": 2,
""name"": ""Jane Smith"",
""age"": 34,
""position"": ""Project Manager"",
""salary"": 95000,
""department"": ""Engineering"",
""hire_date"": ISODate(""2019-06-23"")
},
{
""_id"": 3,
""name"": ""Emily Johnson"",
""age"": 41,
""position"": ""CTO"",
""salary"": 150000,
""department"": ""Management"",
""hire_date"": ISODate(""2015-03-12"")
},
{
""_id"": 4,
""name"": ""Michael Brown"",
""age"": 29,
""position"": ""Software Engineer"",
""salary"": 85000,
""department"": ""Engineering"",
""hire_date"": ISODate(""2020-07-30"")
},
{
""_id"": 5,
""name"": ""Sarah Davis"",
""age"": 26,
""position"": ""UI/UX Designer"",
""salary"": 70000,
""department"": ""Design"",
""hire_date"": ISODate(""2022-10-12"")
}
]"
1. Find all Employees Who Work in the "Engineering" Department.
Query:
db.employees.find({ department: "Engineering" })
Output:
[
{
"_id": 1,
"name": "John Doe",
"age": 28,
"position": "Software Engineer",
"salary": 80000,
"department": "Engineering",
"hire_date": ISODate("2021-01-15")
},
{
"_id": 2,
"name": "Jane Smith",
"age": 34,
"position": "Project Manager",
"salary": 95000,
"department": "Engineering",
"hire_date": ISODate("2019-06-23")
},
{
"_id": 4,
"name": "Michael Brown",
"age": 29,
"position": "Software Engineer",
"salary": 85000,
"department": "Engineering",
"hire_date": ISODate("2020-07-30")
}
]
This query finds all employees whose department field is "Engineering".
2. Find the Employee with the Highest Salary.
Query:
db.employees.find().sort({ salary: -1 }).limit(1)
Output:
[
{
"_id": 3,
"name": "Emily Johnson",
"age": 41,
"position": "CTO",
"salary": 150000,
"department": "Management",
"hire_date": ISODate("2015-03-12")
}
]
This query sorts all employees by salary in descending order and retrieves the top document, which is the employee with the highest salary.
3. Update the Salary of "John Doe" to 90000.
Query:
db.employees.updateOne({ name: "John Doe" }, { $set: { salary: 90000 } })
Output:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
This query updates the salary of the employee named "John Doe" to 90000.
4. Count the Number of Employees in Each Department.
Query:
db.employees.aggregate([
{ $group: { _id: "$department", count: { $sum: 1 } } }
])
Output:
[
{ "_id": "Engineering", "count": 3 },
{ "_id": "Management", "count": 1 },
{ "_id": "Design", "count": 1 }
]
This query groups the employees by the department field and counts the number of employees in each department.
5. Add a New Field Bonus to All Employees in the "Engineering" Department with a Value of 5000.
Query:
db.employees.updateMany({ department: "Engineering" }, { $set: { bonus: 5000 } })
Output:
{ "acknowledged" : true, "matchedCount" : 3, "modifiedCount" : 3 }
This query adds a new field bonus with a value of 5000 to all employees in the "Engineering" department.
6. Retrieve All Documents in the Employees Collection and Sort Them by the Length of Their Name in Descending Order.
Query:
db.employees.aggregate([
{ $addFields: { nameLength: { $strLenCP: "$name" } } },
{ $sort: { nameLength: -1 } },
{ $project: { nameLength: 0 } }
])
Output:
[
{
"_id": 2,
"name": "Jane Smith",
"age": 34,
"position": "Project Manager",
"salary": 95000,
"department": "Engineering",
"hire_date": ISODate("2019-06-23")
},
{
"_id": 3,
"name": "Emily Johnson",
"age": 41,
"position": "CTO",
"salary": 150000,
"department": "Management",
"hire_date": ISODate("2015-03-12")
},
{
"_id": 1,
"name": "John Doe",
"age": 28,
"position": "Software Engineer",
"salary": 80000,
"department": "Engineering",
"hire_date": ISODate("2021-01-15")
},
{
"_id": 4,
"name": "Michael Brown",
"age": 29,
"position": "Software Engineer",
"salary": 85000,
"department": "Engineering",
"hire_date": ISODate("2020-07-30")
},
{
"_id": 5,
"name": "Sarah Davis",
"age": 26,
"position": "UI/UX Designer",
"salary": 70000,
"department": "Design",
"hire_date": ISODate("2022-10-12")
}
]
This query calculates the length of each employee's name, sorts the documents by this length in descending order, and removes the temporary nameLength field from the output.
7. Find the Average Salary of Employees in the "Engineering" Department.
Query:
db.employees.aggregate([
{ $match: { department: "Engineering" } },
{ $group: { _id: null, averageSalary: { $avg: "$salary" } } }
])
Output:
[
{ "_id": null, "averageSalary": 86666.66666666667 }
]
This query filters employees to those in the "Engineering" department and calculates the average salary of these employees.
8. Find the Department with the Highest Average Salary.
Query:
db.employees.aggregate([
{ $group: { _id: "$department", averageSalary: { $avg: "$salary" } } },
{ $sort: { averageSalary: -1 } },
{ $limit: 1 }
])
Output:
[
{ "_id": "Management", "averageSalary": 150000 }
]
This query groups employees by department, calculates the average salary for each department, sorts these averages in descending order, and retrieves the department with the highest average salary.
9. Find the Total Number of Employees Hired in Each Year.
Query:
db.employees.aggregate([
{ $group: { _id: { $year: "$hire_date" }, totalHired: { $sum: 1 } } }
])
Output:
[
{ "_id": 2015, "totalHired": 1 },
{ "_id": 2019, "totalHired": 1 },
{ "_id": 2020, "totalHired": 1 },
{ "_id": 2021, "totalHired": 1 },
{ "_id": 2022, "totalHired": 1 }
]
This query groups employees by the year they were hired, which is extracted from the hire_date field, and counts the total number of employees hired each year.
10. Find the Highest and Lowest Salary in the "Engineering" Department.
Query:
db.employees.aggregate([
{ $match: { department: "Engineering" } },
{
$group: {
_id: null,
highestSalary: { $max: "$salary" },
lowestSalary: { $min: "$salary" }
}
}
])
Output:
[
{ "_id": null, "highestSalary": 95000, "lowestSalary": 80000 }
]
This query filters employees to those in the "Engineering" department, then calculates the highest and lowest salary within this group.

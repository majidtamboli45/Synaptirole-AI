# Hashed Sharding in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/hashed-sharding-in-mongodb/

Hashed sharding in MongoDB distributes data using the hashed value of a shard key to balance load and improve scalability.
- Evenly distributes data and queries across shards, preventing hotspots from skewed or sequential values.
- Improves read and write performance at scale through balanced load.
- Stores data as chunks distributed across multiple shard servers.
Hashed Shard Key
Hashed sharding distributes data across a distributed database using the hashed value of a shard key to ensure balanced load and avoid hotspots.
- Uses a hash function on the shard key to evenly distribute data.
- Prevents hotspots by spreading reads and writes across shards.
- Shard key choice is critical for balanced distribution and performance.
- Requires analyzing access patterns, queries, and data characteristics.
1. Sharding on a Single Field Hashed Index
Sharding on a single-field hashed index distributes documents across shards using the hashed value of one field, helping balance load and improve scalability, especially for write-heavy workloads.
- Uses a hashed value of a single field as the shard key.
- Evenly distributes data to prevent hotspots.
- Improves write scalability and load balancing.
- Simple shard key design and setup.
- Not suitable for range queries or ordered queries on the shard key.
2. Sharding on a Compound Hashed Index
Sharding on a compound hashed index distributes data using the combined hashed value of multiple fields, offering more flexible query support with balanced data distribution.
- Uses a compound shard key with one hashed field and additional non-hashed fields.
- Supports complex, multi-criteria query patterns.
- Evenly distributes related data across shards for balanced load.
- Requires careful shard key design to avoid uneven distribution.
Implementing Hashed Sharding
An example of implementing hashed sharding in MongoDB.
Step 1: Enable Sharding
Before enabling sharding on a collection, ensure that the MongoDB deployment is configured for sharding.
# Enable sharding on the database
sh.enableSharding("mydatabase")
# Enable sharding on the collection with a specified shard key
sh.shardCollection("mydatabase.mycollection", { "myShardKeyField": "hashed" })
Step 2: Insert Data
Insert data into the sharded collection. MongoDB will automatically distribute documents across shards based on the hashed shard key.
db.mycollection.insertOne({
"name": "John Doe",
"age": 30,
"myShardKeyField": "someValue"
})
Step 3: Query Sharded Data
Query data from the sharded collection. MongoDB will route queries to the appropriate shards based on the hashed shard key.
db.mycollection.find({ "myShardKeyField": "someValue" })
Example: We have a sharded collection named "mycollection" with hashed sharding on the "myShardKeyField" field, querying the data will produce output similar to the following:
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"name": "John Doe",
"age": 30,
"myShardKeyField": "someValue"
}
Advantages of Hashed Sharding
Hashed sharding offers several benefits:
- Even Data Distribution: Hash values spread data evenly across shards, preventing hotspots and skewed load.
- Predictable Shard Placement: Hashing provides consistent shard assignment for documents.
- Write Scalability: Insert operations are distributed across shards, improving write throughput.
- Balanced Read/Write Load: Workloads are evenly shared across the cluster.
- Reduced Hotspot Risk: Sequential or skewed keys don’t overload a single shard.
Hashed Vs Ranged Sharding
| Hashed Sharding | Ranged Sharding | 
|---|---|
| Uses a hash function on the shard key to evenly distribute data across shards. | Divides data into shards based on ranges of the shard key values. | 
| Ensures uniform distribution and minimizes hotspot. | Can lead to uneven distribution if ranges are poorly chosen. | 
| Efficient for point queries and high volume inserts. | Efficient for range queries that align with shard key ranges. | 
| Not suitable for range queries that span multiple shards (data is non-sequential). | Supports ordered and sequential data access within each shard. | 
| Limited flexibility for range-based queries. | More flexible for range-based queries. | 
| Simpler to implement and manage shard keys. | More complex to implement and manage shard ranges effectively. | 
| Ideal for unpredictable access patterns and write-heavy workloads. | Suitable for applications with frequent range queries or ordered retrieval. |

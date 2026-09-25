# Ranged Sharding in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/ranged-sharding-in-mongodb/

Sharding in MongoDB partitions data across multiple servers using a shard key to enable horizontal scaling, improve performance, and support fault-tolerant, large-scale workloads.
- Distributes data and query load across shards for better scalability and performance.
- Each shard stores a subset of data, enabling efficient handling of large datasets.
- Enhances fault tolerance and supports parallel query processing.
- Scales seamlessly as data volume and workload grow.
- Proper shard key selection and cluster configuration are critical for balanced distribution and optimal performance.
Ranged Sharding
Range sharding in MongoDB partitions data across shards using ranges of shard key values, making it efficient for range-based queries and ordered access patterns.
- Distributes data based on shard key ranges (e.g., date, numeric, alphabetical).
- Each shard stores a specific value range of the data.
- Enables efficient query routing for range-based queries.
- Preserves data locality for ordered and sequential access.
- Improves performance for range scans and sorted queries.
Concepts of Ranged Sharding
Range sharding distributes data across shards using ordered shard key ranges to enable efficient, targeted query routing.
- Shard Key: Must be an ordered field (e.g., date, numeric) to support range-based partitioning.
- Range Boundaries: Define shard-specific key intervals that determine data placement.
- Query Routing: MongoDB targets shards based on query predicates and configured range boundaries.
Advantages of Ranged Sharding
Ranged sharding offers several benefits:
- Fine-grained Control: Precisely controls data placement using defined shard key ranges.
- Efficient Range Queries: Targets only relevant shards for range-based filters (e.g., date ranges).
- Data Locality: Keeps related and sequential data on the same shard for faster scans.
- Ordered Access: Supports ordered queries and sorting on the shard key efficiently.
- Query Performance: Reduces scatter–gather queries when ranges align with shard boundaries.
- Use-Case Fit: Ideal for time-series and range-driven workloads (dates, IDs, numeric ranges).
Implementing Ranged Sharding
An Example of implementing ranged sharding in MongoDB.
Step 1: Enable Sharding
Ensure that sharding is enabled on the MongoDB deployment and configure the database and collection for sharding.
# Enable sharding on the database
sh.enableSharding("mydatabase")
# Enable sharding on the collection with a specified shard key
sh.shardCollection("mydatabase.mycollection", { "myShardKeyField": 1 })
Step 2: Define Range Boundaries
Define the range boundaries for each shard based on the values of the shard key field.
// Define range boundaries for each shard
sh.addShardTag("shard1", "range1")
sh.addShardTag("shard2", "range2")
Step 3: Insert Data
Insert data into the sharded collection. MongoDB will automatically distribute documents across shards based on the values of the shard key field.
db.mycollection.insertOne({
"name": "John Doe",
"age": 30,
"myShardKeyField": "valueInRange1"
})
Step 4: Query Sharded Data
Query data from the sharded collection. MongoDB will route queries to the appropriate shards based on the values specified in the query conditions and the defined range boundaries.
db.mycollection.find({ "myShardKeyField": "valueInRange1" })
Example: We have a sharded collection named "mycollection" with ranged sharding on the "myShardKeyField" field, querying the data will produce output similar to the following:
{
"_id": ObjectId("60f9d7ac345b7c9df348a86e"),
"name": "John Doe",
"age": 30,
"myShardKeyField": "valueInRange1"
}

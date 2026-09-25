# Sharded Cluster Components in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/sharded-cluster-components-in-mongodb/

A Sharded cluster in MongoDB distributes data across multiple servers to improve performance, scalability, and reliability. It consists of shards, config servers, and mongos routers that work together to manage data and queries efficiently.
1. Shards in MongoDB
Shards are individual databases that store portions of data across multiple servers.
- They allow horizontal scaling by adding more shards as data volume increases.
- MongoDB automatically balances data across shards for even workload distribution.
- The shard key determines how data is split among shards, ensuring efficient queries and performance.
- New shards can be added dynamically without downtime.
2. Primary Shard in MongoDB
Each database in a sharded cluster is associated with a primary shard that holds unsharded collections and metadata.
- Initially assigned based on database size, but can be reassigned manually if needed.
- If a primary shard fails, MongoDB automatically promotes another shard to maintain availability.
- Monitoring the primary shard’s performance is essential to prevent bottlenecks.
- The sh.status() command helps track shard health and configuration.
3. Config Servers in MongoDB
Config servers store metadata about the sharded cluster, including shard locations, chunk information, and cluster organization.
- They ensure all nodes have a consistent view of the cluster.
- Manage authentication, authorization, and distributed locks to maintain data integrity.
- Deployed as a replica set for high availability and fault tolerance.
Read/Write Operations:
- Writes: Metadata updates (e.g., migrations) are written to config servers using a majority write concern to maintain consistency.
- Reads: Used mainly for internal operations like migrations and routing; they use a majority read concern for reliability.
- Mongos instances query config servers to retrieve metadata and route client requests efficiently.
4. Mongos Instances in MongoDB
Mongos acts as the router between client applications and the sharded cluster.
- It directs queries to the correct shard(s) based on the shard key.
- Aggregates results from multiple shards and returns a unified response.
- Uses strategies like round-robin to balance query load.
- Provides a single, simplified interface, hiding the complexity of the underlying sharded system.
Responsibilities of Mongos Instances
- Query Routing: Mongos instances route client queries to the appropriate shard based on the shard key.
- Result Aggregation: After querying the shards, mongos instances aggregate the results and return them to the client.
- Routing Optimization: Mongos instances use intelligent strategies, such as round-robin or targeted routing, to ensure even distribution of queries across shards.
Working of Mongos Instances
- Query Parsing: Mongos parses incoming queries to identify which shard or shards need to process the query.
- Efficient Query Execution: It uses the metadata from config servers to route the query efficiently.
- Client Transparency: Mongos abstracts the complexity of sharding from the client application, allowing it to interact with the cluster as if it were a single instance.
5. Routing and Query Handling
During query execution:
- Mongos identifies the relevant shards using metadata from config servers.
- Queries are executed on the appropriate shards.
- Mongos aggregates results, applies modifiers (like sorting or limits), and sends them back to the client.
- This ensures efficient query processing and hides the distributed nature of the cluster from the client.

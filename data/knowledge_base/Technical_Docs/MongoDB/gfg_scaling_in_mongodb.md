# Scaling in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/scaling-in-mongodb/

MongoDB Scaling is the process of increasing a database’s capacity and performance to handle growing data volumes, user traffic, and processing demands while maintaining optimal performance and resource utilization.
- Adapts database capacity to growing data and workload requirements.
- Helps maintain performance as application usage increases.
- Supports efficient resource utilization at scale.
- Provides built-in mechanisms to manage growth and traffic.
Need of Scaling in MongoDB
Scaling in MongoDB is essential for supporting growing applications by handling increasing data volumes, user traffic, and workload complexity while maintaining performance, reliability, and efficient resource utilization.
- Increased Data Volume: Distributes growing data across nodes to avoid query and operation slowdowns.
- Rising User Traffic: Handles higher concurrent read/write requests while maintaining responsiveness.
- Diverse Workloads: Adapts to changing query patterns and processing needs.
- Improved Fault Tolerance: Sharding spreads data across servers to ensure high availability during failures.
- Cost-Efficiency: Enables incremental horizontal scaling to optimize infrastructure costs.
Types of Scaling in MongoDB
In MongoDB, scaling can be achieved through different approaches, each addressing specific aspects of resource allocation and accommodating different requirements. The primary types of scaling in MongoDB include:
1. Horizontal Scaling(Scaling Out)
Horizontal scaling in MongoDB distributes data across multiple servers using sharding, allowing the database to handle large data volumes and high workloads by partitioning data into manageable shards within a sharded cluster.
- Distributes data across multiple servers or nodes (shards).
- Uses sharding to partition the database into smaller, manageable pieces.
- Each shard stores a portion of the overall dataset.
- Shards run on separate servers or replica sets.
- All shards together form a sharded cluster for scalability and availability.
Sharding
Sharding in MongoDB is a horizontal scaling technique that distributes data across multiple servers to improve performance, scalability, and write throughput for large datasets.
- Splits and distributes large datasets across shards to balance load and improve performance.
- Enables horizontal scaling to handle larger data volumes and higher write throughput.
- Uses a shard key to partition data; each shard (server/replica set) stores a subset within a sharded cluster.
2. Vertical Scaling(Scaling Up)
Vertical scaling in MongoDB increases the capacity of a single server by upgrading hardware resources (CPU, RAM, storage) to improve performance and handle higher workloads.
- Upgrading Hardware: Involves moving to a more powerful server by increasing CPU cores, RAM, or using faster storage.
- Increased Capacity: Improves the ability of a single server to handle more concurrent connections and higher workloads.
- Downtime Risk: Hardware upgrades may require service interruption, especially when replacing critical components.
Horizontal Vs Vertical Scaling
Here are some differences:
| Horizontal Scaling | Vertical Scaling | 
|---|---|
| Distributes workload across multiple servers (nodes). | Increases the capacity of a single server. | 
| Adds more machines or nodes to the system. | Upgrades existing server hardware (CPU, RAM, storage). | 
| Highly scalable, handles significant growth efficiently. | Limited scalability, becomes costly at higher levels. | 
| High availability through replication, minimal downtime when scaling. | Availability depends on backups, upgrades may cause downtime. | 
| Suitable for unpredictable or rapidly growing workloads. | Suitable for modest or predictable growth. | 
| Example: During IPL, streaming platforms add servers to handle traffic spikes. | Example: Streaming platforms upgrade servers (CPU/RAM) to support 4K streaming. | 
Replica Sets
A MongoDB replica set is a distributed architecture that provides high availability and fault tolerance by maintaining multiple synchronized copies of data across nodes, ensuring continuous database availability during failures or maintenance.
- Primary Node: Handles all write operations and serves reads by default; only one primary exists at a time.
- Secondary Nodes: Replicate data from the primary and provide redundancy; can be used for read scaling with eventual consistency.
- Data Replication: Uses asynchronous replication to keep secondary nodes eventually consistent with the primary.
- High Availability: Ensures database access continues even if one or more nodes go offline.
Sharding Vs Replica Sets
Here are the differences:
| Sharding | Replica Sets | 
|---|---|
| Distributes data across multiple servers to handle large datasets and high write loads. | Provides high availability and data redundancy by maintaining multiple copies of data. | 
| Suitable when data volume or write throughput exceeds a single server’s capacity. | Suitable for fault tolerance and high availability during failures or maintenance. | 
| Splits data into chunks (shards) using a shard key; each shard stores a subset of data. | Stores identical copies of the entire dataset on multiple nodes (no shard key). | 
| Enables parallel writes across shards for better write scalability. | Writes go to the primary node, secondaries can serve reads (eventual consistency). | 
| Reads can be distributed across shards through the mongos query router, depending on shard key targeting and query routing. | Reads can be load-balanced across replica set members. | 
| Fault tolerance via data distribution; other shards continue serving if one shard fails. | Fault tolerance via replicas, a new primary is elected on failure. | 
| Eventual consistency across shards. | Strong consistency on primary, secondaries may be eventually consistent. | 
| Sharding alone doesn’t provide failover, replica sets are used per shard for failover. | Supports automatic failover by electing a new primary. | 
| Uses config servers to store sharding metadata. | Does not use config servers, config is stored in replica set metadata. | 
| More complex to set up and manage (config servers + shard key selection). | Simpler to set up and manage for high availability. |

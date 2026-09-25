# Replica Set Deployment in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/replica-set-deployment-in-mongodb/

A MongoDB replica set is a group of servers that store the same data to provide high availability and fault tolerance. It enables automatic failover and synchronized copies to keep operations continuous and consistent.
- High Availability: Automatic failover if the primary node fails.
- Fault Tolerance: Continuous data access via multiple copies.
- Scalability: Supports read scaling via secondary nodes; write operations are handled only by the primary.
- Consistency: Replication is asynchronous; secondary nodes eventually become consistent with the primary (eventual consistency).
MongoDB Replica Set Architecture
A typical MongoDB Replica set architecture consists of the following components:
- Primary Node: The main node that handles all write operations and records changes for replication to secondaries.
- Secondary Nodes: Replicate data from the primary to maintain identical copies and can serve read requests for better availability.
- Arbiter: Does not store data; participates only in elections to help maintain quorum and select a primary.
Deploy a MongoDB Replica Set
Deploying a MongoDB Replica Set involves several steps, from server preparation to replica set configuration. Below is a step-by-step guide to help us set up our MongoDB Replica Set:
1. Prepare Servers: Set up multiple servers (physical or virtual) to host MongoDB instances. Ensure all servers have network connectivity and can communicate with each other.
2. Install MongoDB: Install MongoDB on each server following the MongoDB installation instructions for your operating system. Make sure MongoDB is installed on each server that will participate in the replica set.
3. Configure Replica Set: Initialize the replica set by configuring each MongoDB instance with the appropriate replica set configuration. This includes specifying the replica set name, defining each node's role (primary, secondary, or arbiter), and specifying the network addresses of all members.
// Primary Node Configuration 
mongod --replSet myReplicaSet --port 27017 --dbpath /path/to/data/db1 --bind_ip localhost
// Secondary Node Configuration
mongod --replSet myReplicaSet --port 27018 --dbpath /path/to/data/db2 --bind_ip localhost
// Arbiter Node Configuration
mongod --replSet myReplicaSet --port 27019 --dbpath /path/to/data/db3 --bind_ip localhost
4. Start MongoDB Instances
Start MongoDB instances on each server and ensuring that they join the replica set by connecting to each other.
mongod --replSet myReplicaSet --port 27017 --dbpath /path/to/data/db1
5. Initiate the Replica Set
Once the MongoDB instances are running, connect to the primary node and initiate the replica set. In the Mongo shell, run:
// Connect to Primary Node
mongo --port 27017
// Initialize Replica Set
rs.initiate({
  _id: "myReplicaSet",
  members: [
    { _id: 0, host: "mongo-primary:27017" },
    { _id: 1, host: "mongo-secondary:27018" },
    { _id: 2, host: "mongo-arbiter:27019", arbiterOnly: true }
  ]
})
After running the rs.initiate() command, MongoDB will initiate the replica set and configure the nodes accordingly.
Output
{
"ok": 1,
"$clusterTime": {
"clusterTime": Timestamp(1627653927, 1),
"signature": {
"hash": BinData(0, "AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
"keyId": NumberLong(0)
}
},
"operationTime": Timestamp(1627653927, 1)
}
- Upon successful initialization, MongoDB will return a configuration object confirming the replica set's creation.
- This output indicates that the replica set myReplicaSet was successfully initiated with the specified members.
Handling Failures
MongoDB replica sets support automatic failover by electing a secondary as the new primary when the primary fails.
- Automatic Failover: If the primary node fails, MongoDB automatically promotes a secondary node to primary, ensuring continuous database operations.
- Automatic Node Recovery: Secondary nodes that become temporarily unavailable due to network issues or maintenance automatically reconnect, keeping the replica set fully operational.
- Data Synchronization: All nodes in the replica set replicate data from the primary, maintaining identical copies to ensure data consistency and availability across the set.

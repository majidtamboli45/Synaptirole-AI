# AWS DynamoDB Overview

> Source: https://www.geeksforgeeks.org/python/dynamodb-introduction/

DynamoDB allows users to create databases capable of storing and retrieving any amount of data, and comes in handy while serving any amount of traffic. It dynamically manages each customer's requests and provides high performance by automatically distributing data and traffic over servers.
- It is a fully managed NoSQL database service that is fast, predictable in terms of performance, and seamlessly scalable.
- It relieves the user from the administrative burdens of operating and scaling a distributed database, as the user doesn't have to worry about hardware provisioning, patching Software, or cluster scaling.
- It also eliminates the operational burden and complexity involved in protecting sensitive data by providing encryption at REST.
Core Architecture: Tables, Items, and Attributes
DynamoDB organizes data in a hierarchy:
- Table: A collection of data. (Equivalent to a Table in SQL).
- Item: A single record in the table. (Equivalent to a Row in SQL).
- Attribute: A single data element in an item. (Equivalent to a Column in SQL).
The Primary Key: Partition Key Vs Sort Key
The most critical design decision in DynamoDB is your Primary Key. It determines how data is stored and queried. There are two types:
Partition Key (Simple Primary Key):
- Composed of one attribute (e.g., UserID).
- DynamoDB uses this key to hash and distribute data across physical partitions.
- Constraint: You can only query for an exact match on this key (e.g., GetItem where UserID = 123).
Partition Key + Sort Key (Composite Primary Key):
- Composed of two attributes (e.g., Artist as Partition Key and SongTitle as Sort Key).
- All items with the same Partition Key are stored together physically and sorted by the Sort Key.
- Constraint: Uniqueness is enforced on the combination (Artist + SongTitle).
- Power: This allows rich queries, like "Get all songs by Taylor Swift (Partition) that start with the letter L (Sort)".
Secondary Indexes: LSI Vs GSI
What if you want to query by a field that isn't your primary key (e.g., finding a user by Email instead of UserID)? You use Secondary Indexes.
| Feature | Local Secondary Index (LSI) | Global Secondary Index (GSI) | 
|---|---|---|
| Creation | Must be created at table creation time. Cannot be added later. | Can be created or deleted at any time. | 
| Key Schema | Same Partition Key as base table, different Sort Key. | Different Partition Key and/or different Sort Key. | 
| Scope | Queries are scoped to a single partition (e.g., "Find orders for User 123"). | Queries can span the entire table (e.g., "Find user with email X"). | 
| Scaling | Shares throughput capacity with the base table. | Has its own independent throughput capacity. | 
Note: Most modern applications prefer GSIs because they are more flexible and scalable. LSIs are rarely used in new designs due to their limitations.
Capacity Modes: On-Demand Vs Provisioned
DynamoDB offers two pricing models that dictate how it scales.
| Feature | On-Demand Mode | Provisioned Mode | 
|---|---|---|
| Best For | Unpredictable traffic, new apps, dev/test environments. | Predictable, steady traffic, massive scale with cost optimization. | 
| Scaling | Automatic. Scales instantly to accommodate thousands of requests per second. | Manual or Auto-Scaling. You define Read/Write Capacity Units (RCU/WCU). | 
| Pricing | Pay-per-request (Higher unit cost, but zero waste). | Pay-per-hour for reserved capacity (Lower unit cost if fully utilized). | 
| Throttling | Rare (only during massive, instant bursts). | Possible if traffic exceeds provisioned limits. | 
Advanced Features
1. DynamoDB Streams
- A time-ordered flow of information about item changes in a table. When you enable Streams, every insert, update, or delete is recorded.
- Use Case: Trigger an AWS Lambda function every time a new user signs up (Insert) to send a welcome email, or replicate data to OpenSearch for full-text search.
2. Global Tables
- Fully managed, multi-region replication.
- Active-Active: You can write to the table in us-east-1 and eu-west-1 simultaneously. DynamoDB handles the conflict resolution and replication (typically in < 1 second).
- Use Case: Apps requiring 99.999% availability and low latency for users worldwide.
3. DynamoDB Accelerator (DAX)
- A fully managed, in-memory cache for DynamoDB.
- Performance: Reduces response times from milliseconds to microseconds.
- Use Case: Read-heavy workloads like gaming leaderboards or real-time bidding.
DynamoDB Vs RDBMS: A Quick Comparison
| Feature | DynamoDB (NoSQL) | RDBMS (SQL) | 
|---|---|---|
| Schema | Flexible (Schema-less). | Rigid (Fixed Schema). | 
| Scaling | Horizontal (Unlimited storage/throughput). | Vertical (Hard to scale write throughput). | 
| Querying | Optimized for Key-Value lookups. No JOINs. | Powerful SQL (JOINs, Aggregations). | 
| Transactions | ACID support (Multi-item transactions). | ACID support (Standard). | 
| Cost Model | Pay for storage + requests (IO). | Pay for instance uptime (Server). | 
Limitations of DynamoDB
The below list provides us with the limitations of Amazon DynamoDB:
- All tables and global secondary indexes must have a minimum of one read and one write capacity unit.
- Table sizes have no limits, but accounts have a 256 table limit unless you request a higher cap.
- Only Five local and twenty global secondary (default quota) indexes per table are permitted.
- DynamoDB restricts the use of reserved keywords in expressions.
- Partition key length and value minimum length sits at 1 byte, and maximum at 2048 bytes, however, DynamoDB places no limit on values.

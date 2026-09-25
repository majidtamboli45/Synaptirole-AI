# AWS RDS vs Aurora

> Source: https://www.geeksforgeeks.org/devops/aws-rds-vs-aurora/

AWS provides two major managed relational database services: Amazon RDS and Amazon Aurora. Both services simplify database management by handling backups, scaling, maintenance, and high availability automatically. However, they differ in terms of architecture, performance, scalability, storage design, and pricing.
Amazon RDS
Amazon Relational Database Service (RDS) is a traditional managed relational database service that supports multiple engine options, including MySQL, PostgreSQL, MariaDB, Oracle, and Microsoft SQL Server. It simplifies database management by automating tasks such as backups, patching, monitoring, and scaling for traditional relational database engines.
- Multi-Engine Support: Permits direct hosting of MySQL, PostgreSQL, MariaDB, Oracle, and SQL Server within a managed database environment.
- Traditional Multi-AZ: Uses synchronous replication to copy data to a dedicated, passive standby instance in a different Availability Zone for automatic failover.
- Managed Scalability: Supports up to 5 read replicas to offload read-heavy application traffic, though replication lag can occur under heavy workloads.
Amazon Aurora
Amazon Aurora is a MySQL and PostgreSQL-compatible relational database engine custom-built for cloud-native performance. By completely separating the compute layer from the storage layer, Aurora delivers up to 5 times the throughput of standard MySQL and up to 3 times the throughput of standard PostgreSQL.
- Distributed Storage: Maintains six copies of your database across three distinct Availability Zones on SSD-backed, self-healing storage.
- Serverless and Auto-Scaling: Automatically scales storage up to 128 TB in seamless 10 GB increments, and offers an Aurora Serverless option to scale compute capacity dynamically matching real-time demand.
- Rapid Read Replication: Supports up to 15 Aurora Replicas with sub-10 millisecond replication lag, using shared storage to prevent duplication.
- Query Optimization: Features Aurora Optimized Reads to deliver up to 8 times faster query latencies and up to a 30% reduction in database operational costs.
AWS RDS vs. Amazon Aurora
The table below evaluates the primary technical, architectural, and financial differences between the two managed database services:
| Feature | Amazon RDS | Amazon Aurora | 
|---|---|---|
| Service Type | Managed relational database service | Cloud-native relational database service | 
| Supported Database Engines | MySQL, PostgreSQL, MariaDB, Oracle, Microsoft SQL Server | MySQL and PostgreSQL compatible | 
| Architecture | Traditional database architecture | Distributed cloud-native architecture | 
| Storage Architecture | Uses Amazon EBS storage volumes | Uses distributed shared storage across multiple AZs | 
| Storage Replication | Multi-AZ synchronous replication | Six copies of data across three Availability Zones | 
| Storage Scaling | Manual scaling up to 64 TB | Automatic scaling up to 128 TB | 
| Performance | Suitable for standard workloads | Higher throughput and lower latency | 
| MySQL Performance | Standard MySQL performance | Up to 5x faster than standard MySQL | 
| Read Replicas | Supports up to 5 read replicas | Supports up to 15 Aurora Replicas | 
| Replication Lag | Possible under heavy workloads | Very low replication lag (typically under 10 ms) | 
Choosing the Optimal Database Solution
The choice between AWS RDS and Amazon Aurora is governed by budget parameters, performance requirements, and engine dependencies.
1. When to Choose AWS RDS
- Engine Requirements: The application specifically requires Oracle, Microsoft SQL Server, or MariaDB backends.
- Budget Constraints: Budget limitations favor predictable, lower baseline instance costs for standard, non-critical database applications.
- Moderate Traffic: The web application exhibits steady, predictable read/write patterns that do not require ultra-low latency or massive horizontal replica scaling.
- Engine-Level Control: The database administrator requires fine-grained control over specific database parameters and localized engine configuration options.
2. When to Choose Amazon Aurora
- Peak Scalability Requirements: The application expects volatile spikes in transaction traffic, making self-scaling storage up to 128 TB or Aurora Serverless compute scaling essential.
- High-Performance Needs: Workloads demand maximum data ingestion speeds, high throughput, and exceptionally low-latency reads across globally distributed users.
- Low Replication Lag: Real-time reporting tools and analytics applications require near-instant synchronization across up to 15 read replicas.
- Self-Healing Resiliency: The deployment demands automated, non-disruptive data block repairs and rapid, sub-30-second failovers to maintain high availability.

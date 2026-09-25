# Amazon Aurora

> Source: https://www.geeksforgeeks.org/devops/amazon-aurora/

Amazon Aurora is a fully managed relational database engine compatible with MySQL and PostgreSQL. It combines high-end commercial database performance with the simplicity and cost-effectiveness of open-source databases, delivering up to 5x MySQL and 3x PostgreSQL throughput through a cloud-native architecture that separates compute from storage.
- Aurora replicates every piece of data 6 times across 3 Availability Zones for fault tolerance and automatic self-healing.
- Supports up to 15 read replicas reading from shared storage with sub-10ms replication lag, eliminating traditional copy overhead.
- Offers provisioned and serverless deployment modes for predictable and variable workloads.
- Includes advanced features like Global Database for multi-region replication, Backtracking for instant point-in-time recovery, and Fast Cloning.
- Failover occurs in under 30 seconds with automatic promotion of a read replica to primary.
Architecture
Unlike traditional databases that write to local EBS volumes, Aurora uses a log-structured distributed storage system independent of compute instances.
- 6 Copies Across 3 AZs: Every write is automatically replicated 6 times across 3 Availability Zones.
- Fault Tolerance: Tolerates loss of up to 2 copies without affecting write availability and up to 3 copies without affecting read availability.
- Self-Healing: Continuously scans data blocks, detects errors, and repairs them automatically from other copies.
- Shared Storage Volume: Up to 15 read replicas read from the same underlying storage, eliminating the data copy overhead that causes replication lag in traditional systems.
Cluster Architecture
An Aurora cluster consists of a writer instance, multiple reader instances, and a shared cluster volume spanning multiple Availability Zones.
- Primary Instance (Writer): Handles all read and write operations; exactly one per cluster.
- Reader Instances (Read Replicas): Handle read-only operations; up to 15 per cluster.
- Automatic Failover: If the primary fails, Aurora automatically promotes a reader to primary in under 30 seconds.
- Multi-Master Cluster: All instances have read and write capabilities for distributed write operations across zones.
Deployment Modes
- Aurora Provisioned: Specify a fixed instance class (e.g., db.r6g.large); best for predictable steady-state workloads. Scale manually by changing instance type or use Auto-Scaling for read replicas.
- Aurora Serverless v2: Define a capacity range (min/max Aurora Capacity Units). Automatically scales compute and memory in fractions of a second based on actual traffic. Best for variable workloads, dev/test, and SaaS applications with unpredictable traffic spikes. Pay per ACU-second consumed.
Advanced Features
- Aurora Global Database: Spans multiple AWS regions with typical replication latency under 1 second. Enables local reads for geographically distributed users and disaster recovery with secondary region promotion in under 1 minute.
- Backtracking: Instantly rewinds the database to any prior point in time without restoring a backup snapshot. Invaluable for fixing bad deployments or accidental deletions.
- Fast Cloning: Creates a new cluster from an existing one in minutes regardless of data size using copy-on-write protocol. The clone shares storage blocks with the original until changes are made, avoiding double storage costs. Ideal for spinning up full-size production clones for testing or analytics.
Aurora vs RDS (MySQL/PostgreSQL)
| Feature | Amazon Aurora | Standard RDS (MySQL/PostgreSQL) | 
|---|---|---|
| Performance | Up to 5x faster (MySQL) / 3x faster (PostgreSQL) | Standard engine performance | 
| Storage Scaling | Auto-scales up to 128 TB | Manual scaling up to 64 TB | 
| Replication Lag | Sub-10ms (shared storage) | Seconds to minutes (binlog replication) | 
| Failover Time | Under 30 seconds | 60-120 seconds | 
| Read Replicas | Up to 15 | Up to 5 | 
| Cost Per Instance Hour | ~20% higher | Lower base cost | 
Aurora Pricing
- Compute: Provisioned: hourly rate per instance size. Serverless v2: per ACU-hour billed per second.
- Storage: Pay per GB-month for data stored; auto-expanding with no pre-allocation required.
- I/O Rate — Aurora Standard: Pay per million I/O requests; best for low-I/O applications.
- I/O Rate — Aurora I/O-Optimized: Higher storage and instance cost with zero I/O charges; best for I/O-intensive workloads such as payment processors.

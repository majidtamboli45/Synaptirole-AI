# Difference Between AWS S3 and AWS EBS

> Source: https://www.geeksforgeeks.org/techtips/difference-between-aws-s3-and-aws-ebs/

Amazon S3 and Amazon EBS are both storage services offered by AWS, but they serve different purposes based on how data is stored and accessed. While S3 is designed for scalable object storage, EBS provides block-level storage for use with virtual machines.
Comparing the operational characteristics of S3 and EBS reveals how their distinct architectural foundations impact cloud applications:
| Feature | Amazon S3 (Object Storage) | Amazon EBS (Block Storage) | 
|---|---|---|
| Architecture | Flat structure; objects with metadata/IDs. | Fixed, raw sectors (blocks). | 
| Primary Use | Backups, media, raw data, compliance. | Boot disks, databases, transactional apps. | 
| Connectivity | Global HTTPS endpoints (Public/Private). | Direct attachment to EC2 (AZ-locked). | 
| Durability | 99.999999999% (11 9s); Multi-AZ. | 99.999% (EBS-specific); Single-AZ. | 
| Security | Bucket Policies, ACLs, Pre-signed URLs. | EC2 Instance security, IAM attachments. | 
| Capacity Limit | Virtually unlimited (Bucket level). | Max 16 TiB per volume. | 
| Scalability | Instant, automatic auto-scaling. | Manual Elastic Volumes (cannot shrink). | 
| Concurrency | Millions of concurrent users globally. | Single instance (Multi-Attach: 16 Nitro). | 
| Latency | High (~10ms–50ms+ to first byte). | Low (Single-digit millisecond). | 
| Compliance | S3 Object Lock (WORM) support. | Encryption at rest/transit via KMS. | 
Use Cases Comparison
Choosing between S3 and EBS depends on your specific application architecture and storage access demands:
Amazon S3
- Static Website Hosting: Serve static frontend assets (HTML, CSS, JavaScript, images) directly to web browsers globally without hosting a server.
- Data Lakes and Big Data: Store raw, semi-structured, or unstructured datasets to run SQL queries in-place using Amazon Athena or EMR.
- Enterprise Backup and Archive: Retain system backups, historical transaction databases, and regulatory compliance logs securely at low cost using Glacier Deep Archive.
Amazon EBS
- Database Storage: Host transactional relational databases (PostgreSQL, MySQL, Oracle) and NoSQL environments demanding high IOPS and minimal latency.
- Operating System Disks: Serve as boot volumes and root partitions holding the OS and application installations of running EC2 servers.
- Software Testing Environments: Provide rapid, local block storage that can be duplicated quickly using snapshots to create testing and staging servers.
Pricing Comparison
S3 and EBS operate on entirely different financial structures, making storage design crucial for managing monthly cloud spending:
Amazon S3 Cost Structure
- Free Tier: Includes 5 GB of standard storage, 2,000 PUT requests, and 20,000 GET requests for the first 12 months.
- First 50 TB per Month: Billed at $0.023 per gigabyte.
- Next 450 TB per Month: Billed at $0.022 per gigabyte.
- Over 500 TB per Month: Billed at $0.021 per gigabyte.
Amazon EBS Cost Structure
- Free Tier: Includes 30 GB of total GP2 or GP3 volume capacity and 1 GB of snapshot storage for 12 months.
- General Purpose SSD (gp3): Billed at $0.08 per gigabyte-month (includes baseline performance of 3,000 IOPS and 125 MB/s).
- Throughput Optimized HDD (st1): Billed at $0.045 per gigabyte-month.
- Provisioned IOPS SSD (io2): Billed at $0.125 per gigabyte-month (plus additional provisioned IOPS fees).

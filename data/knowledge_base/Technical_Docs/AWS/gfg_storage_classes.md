# Amazon S3 Storage Classes

> Source: https://www.geeksforgeeks.org/devops/amazon-s3-storage-classes/

Amazon Simple Storage Service (Amazon S3) is an industry-leading object storage service offering scalable, secure, and low-latency data storage. S3 stores data as objects within logical containers called buckets, supporting individual files up to five terabytes.
- To optimize costs, AWS provides several distinct storage classes tailored for different access frequencies, retention periods, and pricing models.
- Supports virtually unlimited data storage capacity with individual object sizes up to 5 TB.
- Designed to provide 99.999999999% (11 nines) durability by replicating data across multiple Availability Zones.
- Features default server-side encryption (SSE-S3), custom KMS keys, and strict block public access controls.
S3 Storage Classes
S3 uses automated checksum checks to maintain data integrity across all seven storage classes:
1. S3 Standard
- Use Cases: Ideal for cloud applications, dynamic websites, content delivery networks (CDNs), gaming assets, and big data lakes.
- Availability: Designed for 99.99% availability with a 99.9% SLA.
- Durability: 11 nines of durability across at least three physical Availability Zones (AZs).
2. S3 Intelligent-Tiering
- How It Works: Automatically shifts objects between Frequent, Infrequent, and Archive access tiers based on monitoring data activity.
- Automation Rules: Moves inactive objects to colder tiers after 30, 90, or 180 days without any manual overhead.
- No Retrieval Fees: Users are not charged for retrieving data or moving objects between internal tiers.
- Availability: Designed for 99.9% availability with a 99.0% SLA.
3. S3 Standard-Infrequent Access (S3 Standard-IA)
- Use Cases: Well-suited for long-term database backups, older logs, and disaster recovery data.
- Cost Model: Lower storage rate than S3 Standard, but introduces a per-GB retrieval fee.
- SLA & Durability: Designed for 99.9% availability with 11 nines of durability across 3+ AZs.
4. S3 Glacier Instant Retrieval
- Performance: Provides the exact same millisecond-level latency and high throughput as S3 Standard.
- Limitations: Charges a minimum storage duration of 90 days and a minimum object size of 128 KB.
- Availability: Designed for 99.9% availability with a 99.0% SLA.
5. S3 One Zone-Infrequent Access (S3 One Zone-IA)
- Cost Savings: Reduces storage fees by 20% compared to S3 Standard-IA by utilizing only a single Availability Zone.
- Risk Profile: Data is vulnerable to physical loss if the specific facility hosting that single AZ is destroyed.
- SLA & Durability: Designed for 99.5% availability (98.0% SLA) with 11 nines of durability in that single zone.
6. S3 Glacier Flexible Retrieval
- Retrieval Speeds: Supports Expedited (1–5 minutes), Standard (3–5 hours), and free Bulk (5–12 hours) retrieval options.
- Use Cases: Built for offsite backups and general archiving where immediate access is unnecessary.
- Availability: Designed for 99.99% availability with a 99.9% SLA.
7. S3 Glacier Deep Archive
- Performance: Retrieval times are slower, with options for Standard (12 hours) and Bulk (48 hours) restores.
- Use Cases: Ideal for regulatory data (e.g., healthcare, financial records) that is stored for years and rarely accessed.
- Availability: Designed for 99.99% availability with a 99.9% SLA.
Storage Class Comparison
The table below compares key metrics, billing baselines, and standard US East (N. Virginia) pricing across all S3 storage classes:
| Storage Class | Availability (SLA) | Availability (Design) | Min. Duration | Retrieval Fee? | Monthly Pricing (per GB) | 
|---|---|---|---|---|---|
| S3 Standard | 99.9% | 99.99% | None | No | $0.023 | 
| S3 Intelligent-Tiering | 99.0% | 99.9% | None | No | $0.023 / $0.0125 | 
| S3 Standard-IA | 99.0% | 99.9% | 30 days | Yes | $0.0125 | 
| S3 One Zone-IA | 98.0% | 99.5% | 30 days | Yes | $0.010 | 
| S3 Glacier Instant | 99.0% | 99.9% | 90 days | Yes | $0.004 | 
| S3 Glacier Flexible | 99.9% | 99.99% | 90 days | Yes | $0.0036 | 
| S3 Glacier Deep Archive | 99.9% | 99.99% | 180 days | Yes | $0.00099 |

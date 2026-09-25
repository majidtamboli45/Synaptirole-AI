# Difference Between Amazon EBS and Amazon EFS

> Source: https://www.geeksforgeeks.org/cloud-computing/difference-between-amazon-ebs-and-amazon-efs/

Amazon Web Services (AWS) offers multiple cloud storage solutions designed for different workload requirements. Among them, Amazon Elastic Block Store (EBS) and Amazon Elastic File System (EFS) are two widely used storage services that provide block-level and file-level storage respectively.
Amazon EBS
Amazon Elastic Block Store (EBS) is a high-performance, block-level storage service designed to be used with Amazon EC2 instances. It behaves like a virtual hard drive attached to an EC2 instance, allowing users to format and use it with standard operating system file systems.
Amazon EBS Block Storage Architecture
EBS volumes store data in block units, which are highly optimized for random read/write patterns. They are not accessible directly via the public internet and must be mounted directly to an EC2 instance within the same Availability Zone.
Note: EBS volumes can be detached from an EC2 instance and reattached to another instance, but they must exist in the same Availability Zone.
Amazon EFS
Amazon Elastic File System (EFS) is a fully managed, serverless, file-level storage service that provides a shared directory with virtually unlimited scaling. It automatically adjusts its capacity dynamically as files are added or removed, using a pay-as-you-go pricing model.
Amazon EFS Shared File System Architecture
EFS uses the standard NFSv4 protocol, allowing thousands of EC2 instances, containers, or serverless functions to access the same centralized file structure concurrently. Its performance scales automatically with workload demand and can also use Elastic Throughput mode for independent throughput scaling.
EFS Vs EBS Characteristics
| Characteristics | Amazon EBS (Block Storage) | Amazon EFS (File Storage) | 
|---|---|---|
| Storage Nature | Raw, unformatted block-level storage. | Shared file system with hierarchical directories. | 
| Durability | 99.999% Availability (Single AZ). | 99.999999999% Durability (Multi-AZ). | 
| Latency | Consistent sub-millisecond latency. | Low latency (milliseconds). | 
| Max Performance | Very high IOPS depending on volume type. | Up to 250,000 Read IOPS & 10 GB/s. | 
| Concurrent Access | Typically attached to one EC2 instance. | Thousands of concurrent instances. | 
| Management | Manual sizing, formatting, & partitioning. | Serverless and fully AWS-managed. | 
| File Size Limit | Up to volume capacity (Max 64 TiB). | Max single file: 47.9 TiB. | 
| Total Capacity | Limited to provisioned volume size. | Virtually unlimited. | 
| Cost Model | Pay for provisioned capacity. | Pay for consumed storage/throughput. | 
When to Choose Amazon EBS
- Low latency is required
- Storage is attached to a single EC2 instance
- Running databases or boot volumes
When to Choose Amazon EFS
- Multiple instances need shared access
- Automatic scaling is required
- Applications need a shared linux file system

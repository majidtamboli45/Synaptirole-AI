# AWS Snowball

> Source: https://www.geeksforgeeks.org/cloud-computing/what-is-aws-snowball/

The AWS Snow Family is a suite of physical, ruggedized devices designed to migrate large datasets offline and run edge computing tasks. These devices allow organizations to secure, process, and analyze data in remote, disconnected, or harsh environments before transferring it to the cloud.
- Migrates massive datasets to AWS securely using physical storage hardware, bypassing bandwidth limitations.
- Built with durable, weather-resistant cases and trusted hardware encryption modules.
- Runs EC2 instances and AWS Lambda functions directly on-device in disconnected locations.
- Secures all data at rest and in transit using 256-bit keys managed via AWS KMS.
- Features a built-in electronic E Ink shipping label that automatically updates for return transit.
AWS Snow Family
The Snow Family consists of physical devices with varying capacity, compute capabilities, and portability options.
1. AWS Snowcone and Snowcone SSD
The smallest and most portable member of the family, the AWS Snowcone is a lightweight, secure, and highly durable device designed for edge computing and data transfer in space-constrained settings.
- Portability Profile: Exceptionally small and lightweight, weighing approximately 4.5 lbs (2.1 kg).
- Storage Capacity: Equipped with up to 8 TB of HDD or 14 TB of SSD usable storage.
- Compute Capacity: Configured with 2 vCPUs and 4 GB of RAM memory.
- Best For: IoT data aggregation, drone and vehicle data capture, and small-scale remote office migrations.
2. AWS Snowball Edge
This petabyte-scale data transfer and edge computing device is the primary workhorse of the Snow Family. It is available in two specialized variants:
| Feature | Snowball Edge Storage Optimized | Snowball Edge Compute Optimized | 
|---|---|---|
| Primary Goal | Massive data migration / Deep storage. | High-perf compute / AI at the edge. | 
| Storage (Usable) | 210 TB (NVMe SSD). | 28 TB (NVMe SSD). | 
| Compute (vCPU) | 104 vCPUs. | 104 vCPUs. | 
| RAM | 416 GB. | 416 GB. | 
| GPU Support | No. | Optional (NVIDIA Tesla V100). | 
| Network Speed | Up to 100 Gbps. | Up to 100 Gbps. | 
3. AWS Snowmobile (Legacy/Deprecated)
Originally designed for massive, exabyte-scale migrations, the AWS Snowmobile consisted of a 45-foot ruggedized shipping container pulled by a semi-trailer truck.
- Portability Profile: A full-sized shipping container truck.
- Storage Capacity: Supported up to 100 PB (Petabytes) of storage capacity per truck.
- Best For: Historic, massive-scale data center decommissions, large-scale media archives, and genomic repositories.
Key Features Across the Snow Family
All AWS Snow devices share standard software, security, and hardware features:
- High-Speed Offline Transfer: Accelerates data migration times; moving 80 TB takes about a week via shipping, compared to months over standard internet connections.
- Rugged and Tamper-Proof Security: Houses data in physical cases equipped with a Trusted Platform Module (TPM) chip that prevents the device from booting if physical tampering is detected.
- End-to-End Encryption: Encrypts data at rest and in transit using 256-bit encryption keys managed through AWS Key Management Service (KMS).
- Edge Computing Support: Permits local server operations by running Amazon EC2 instances and AWS Lambda functions directly on-device without internet connectivity.
- AWS OpsHub GUI: Provides a user-friendly graphical desktop application to easily configure, unlock, and manage Snow devices.
- S3 and NFS Compatibility: Supports standard S3 API endpoints and Network File System (NFS) mount points for easy connection to on-premises servers.
- Clustering for Scale: Enables clustering of 5 to 16 Snowball Edge devices to create a single, highly durable local S3-compatible storage pool of up to 2.6 PB.
- Automatic E Ink Shipping Label: Employs an integrated electronic paper label that automatically updates with return shipping addresses once a job is complete.
Working of AWS Snowball
- Create a Job: Log in to the AWS Console, plan the migration, choose your desired device (Snowcone or Snowball Edge), and assign S3 target buckets.
- AWS Ships the Device: AWS configures your chosen hardware with pre-loaded job details and ships it to your physical location.
- Connect and Unlock: Connect the device to your local local area network (LAN), power it on, and use AWS OpsHub or the Snowball Client to unlock it.
- Transfer Your Data: Copy your target local datasets onto the device using standard S3 API calls or local NFS mounts; data is encrypted dynamically during transfer.
- Return the Device: Power down the device, verify that the built-in E Ink label has automatically refreshed with the AWS return address, and ship it back via a standard carrier.
- AWS Ingests Data: AWS receives the hardware, verifies security seals, and transfers your encrypted data directly into your target Amazon S3 bucket at high speed. The device is then securely sanitized following NIST 800-88 standards.
Real-World Use Cases
- Data Center Decommissioning: Securely transfers legacy database archives and backups from on-premises servers directly to Amazon S3.
- Disaster Recovery Planning: Delivers off-site data archives to AWS to build redundant disaster recovery copies.
- Disconnected Analytics: Deploys on maritime research ships, military bases, or remote mining locations to analyze sensor data locally without internet connectivity.
- Media and Entertainment Processing: Ships raw daily video files directly from filming sets to secure S3 buckets to initiate video editing and production tasks.
- Healthcare and Genomics: Securely transfers compliance-regulated genomic datasets and patient records from research hospitals directly to cloud storage.
Snow Family vs. Other AWS Data Transfer Services
The table below compares offline physical shipping against AWS online network transfer options:
| Feature | AWS Snow Family | AWS DataSync | AWS Direct Connect | 
|---|---|---|---|
| Best For | Offline bulk data migrations (TBs to PBs) and remote edge operations. | Online, automated scheduled synchronizations between locations. | Establishing a permanent, dedicated high-speed hybrid network link. | 
| Transfer Speed | Ultra-Fast (dependent on shipping; days for multiple petabytes). | Medium to Fast (governed entirely by your internet bandwidth). | High-Speed, dedicated physical connections up to 100 Gbps. | 
| Internet Needed | No internet required (needed only for initial console job setup). | Yes, requires a continuous network connection. | Yes, operates over dedicated private telecom networks. | 
| Setup Process | Simple (order, transfer data locally, ship back). | Moderate (deploy an online software agent in VM). | Complex (demands dedicated network infrastructure provisioning). | 
| Primary Use Case | One-time bulk data transfers and disconnected edge computing. | Continuous database replication and recurring backup workflows. | Real-time low-latency hybrid data workloads and feeds. |

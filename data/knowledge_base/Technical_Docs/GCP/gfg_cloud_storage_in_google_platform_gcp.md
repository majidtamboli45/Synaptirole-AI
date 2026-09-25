# Cloud Storage in Google Cloud Platform (GCP)

> Source: https://www.geeksforgeeks.org/cloud-computing/cloud-storage-in-google-cloud-platform-gcp/

Google Cloud Storage is a secure, scalable, and high-performance storage solution that lets businesses store, manage, and retrieve data effortlessly. It’s designed for big data analytics, media storage, backups, and disaster recovery, making it a go-to option for enterprises looking for cost-effective cloud storage. With automatic scalability, robust security, and deep integration with Google Cloud services, it simplifies data management at any scale.
Types of Google Cloud Storage
We can store our data on a remote server with Google Cloud storage, and we can access that data whenever we need to. In addition, Google Cloud Platform provides a number of cloud storage choices, each with special features and applications. The types are listed below.
- Google Cloud Persistent Disk(Block Storage)
- Google Cloud Filestore(Network File storage)
- Google Cloud Storage (Object Storage).
- Google Cloud Storage for Firebase
- Google Cloud Storage Transfer Service.
1. Google Cloud Persistent Disks (Block Storage)
A type of block storage called Google Cloud Persistent Disks offers dependable and quick storage for your virtual machine instances on the Google Cloud Platform.
- We can back up our storage using persistent discs, which allow us to attach discs of various sorts and sizes, such as SSDs or HDDs, to the necessary virtual machines. This block storage will boost throughput and decrease latency.
- Because of its high durability and support for snapshots, persistent discs enable us to take a disc backup when necessary without losing any data.
- Once the disk is attached to the VMs then also we can change the size of the disk which makes them more flexible it can be done without losing the data.
- Persistent Disks are more secure we can encrypt the data by using a Google key or customer-managed keys and also we can restrict the access of the disk to specific users, groups, or resources by using IAM roles.
2. Google Cloud Filestore (Network File Storage)
A controlled network file storage service offered by Google Cloud Platform is Google Cloud File Store. It enables reliable performance and high availability for storing and sharing files.
- We can create files with the aid of file storage that can be mounted onto the necessary path and accessed from an instance operating on the GCP or on-premises.
- File storage is available in two types: 
  - Standard tier: It provides a throughput of 800 MB/s per share, which will result in minimal latency and good performance.
  - Premium tier: The premium tier's throughput is 1.2 GB/s per share, enables SSD storage and can be particularly beneficial for applications that require high IOPs and low latency.
- Automatic snapshots will be taken in the file storage, and since our storage is automatically backed up, we can prevent data loss.
3. Google Cloud Storage (Object Storage)
Object storage is scalable, durable, and secure once we store our data in object storage it can be accessed from anywhere means the object storage is region independent.
- Object storage is very different from Block storage and file storage in this we store the data in the form of objects it is more suited for static data like videos, photos, etc.
- We can save our data in accordance with our needs; for example, if we frequently use it, we will keep it in Standard storage, while less frequently accessed data can be kept in Coldline and Archive for long-term data access.
- Object storage offers us data encryption, data replication, and lifecycle management which make it more reliable and we can integrate the object storage with multiple GCP services like Google Cloud Functions, BigQuery, and AI Platform, enabling you to build powerful applications.
4. Google Cloud Storage for Firebase
Designed for mobile and web applications, providing secure, scalable, and real-time storage.
- Secure file storage for user-generated content.
- Integrated with Firebase Authentication for role-based access.
- Auto-scaling for handling growing data needs.
5. Google Cloud Storage Transfer Service
A managed solution for migrating large datasets from on-premises or other cloud providers.
- Supports data transfer from AWS S3, Azure Blob, and on-premises storage.
- Automated scheduling for efficiency and reliability.
- Ensures high availability and data integrity post-transfer.
Google Cloud Storage Classes & Pricing
GCP offers multiple storage classes to optimize costs based on how frequently data is accessed.
Storage Class Comparison
| Storage Class | Best For | Availability | Access Time | Price per GB | Retrieval Fees | 
|---|---|---|---|---|---|
| Standard | Frequently accessed data | 99.95% | Milliseconds | $0.02 | None | 
| Nearline | Accessed once a month | 99.90% | Milliseconds | $0.01 | Low | 
| Coldline | Accessed once a year | 99.00% | Milliseconds | $0.004 | Medium | 
| Archive | Long-term archival | 99.00% | Hours | $0.0012 | High | 
Google Cloud Archival Storage & Lifecycle Management
- Archival Storage: Ideal for data that must be stored long-term but rarely accessed.
- Lifecycle Management: Automate data movement to cheaper storage classes.
- Long Retention: Archive storage retains data for 8+ years at a fraction of the cost.
Which Storage Should I Use?
Your use case's particular requirements will determine which Google Cloud Platform (GCP) storage option is best for you. The following list of typical GCP storage options and use cases include:
- Object Storage: Large amounts of data, such as pictures, movies, backups, and archives, can be stored in the cloud. A RESTful API is used to access cloud storage, which makes it simple to integrate with other programs and services.
- Block Storage(Peristent Disks): Compute Engine persistent disks are suitable for storing data that require low-latency access, such as databases, transactional workloads, and high-performance computing (HPC) applications.
- FileStore: Workloads including media rendering, analytics, and content management are ideal for Cloud Filestore. Despite being primarily an object storage service, cloud storage can also be used to store files.
Google Cloud Storage Security & Compliance
Google Cloud Storage ensures top-tier security and compliance, making it a trusted choice for enterprises handling sensitive data. It offers robust protection against unauthorized access, data breaches, and accidental deletions.
1. IAM-Based Access Control
Implement fine-grained, role-based access policies to restrict data access to authorized users only.
2. Advanced Data Encryption
Protect data at rest and in transit with default encryption, customer-managed keys (CMEK), and customer-supplied encryption keys (CSEK).
3. Bucket Lock & Object Holds
Enforce data retention policies to prevent accidental deletion or unauthorized modifications.
4. Real-Time Audit Logs & Monitoring
Gain complete visibility into storage activities with Cloud Audit Logs, ensuring compliance with industry regulations like GDPR, HIPAA, and SOC 2.
Best Practices for Cost & Performance Optimization
The following are Some Best Practices we can use for Cost & Performance Optimization:
1. Enable Lifecycle Management
Reduce storage costs by automating data transitions between storage classes. Define policies to move infrequently accessed data from Standard Storage to Nearline, Coldline, or Archive Storage, optimizing costs without manual intervention.
2. Use Versioning
Protect critical data by enabling object versioning, which keeps previous versions of files in case of accidental deletions or overwrites. This ensures data recovery without downtime.
3. Optimize Data Access
Store high-demand data in multi-regional storage to ensure low-latency access for global users. For region-specific workloads, regional storage helps balance performance and cost.
4. Leverage Storage Transfer Service
Streamline bulk data migration from on-premises, AWS S3, or other cloud providers to Google Cloud Storage. Automate periodic syncs to ensure data consistency and availability across environments.
Use Cases of Cloud Storage
The following are the important use cases of cloud storage
- Integrated repository for analytics and ML: Cloud Storage is strongly consistent giving accuracy in analytics workloads.
- Media content storage and delivery: Cloud Storage provides the availability and throughput needed to stream audio or video directly to applications and websites.
- Backups and Archives: Backup data in Cloud Storage can be used for more than just recovery because all storage classes have ms latency and are accessed through a single API.
Features of GCP for Cloud Storage Optimization
The following are the most important features of GCP for cloud optimization:
- Object Lifecycle Management: Automatically transition data between storage tiers.
- Object Versioning: Keep previous versions of files for recovery.
- Retention Policies & Bucket Lock: Define data retention periods for regulatory compliance.
- Customer-Managed Encryption: Encrypt object data with Cloud Key Management Service.
- Real-Time Monitoring & Alerts: Track usage, security, and performance metrics.
Conclusion
In this article, we covered what is Cloud storage in the Google Cloud Platform, Types of storage in the Google Cloud Platform, their features, and pricing which is more important to learn while you are starting to learn the cloud storage. To know more about file storage refer to Google File System.

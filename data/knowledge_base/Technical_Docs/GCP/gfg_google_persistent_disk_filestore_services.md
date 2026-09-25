# Google Persistent Disk & Google Filestore Services

> Source: https://www.geeksforgeeks.org/cloud-computing/google-persistent-disk-google-filestore-services/

Google Persistent Disk is a block storage service provided by Google Cloud that delivers durable and high-performance storage for virtual machine instances. It allows users to attach persistent storage volumes to virtual machines for running applications and storing data. Persistent disks retain data even after the VM instance is stopped or deleted.
- It Provides fast read and write operations suitable for databases and enterprise workloads.
- Data is automatically replicated within a zone to ensure durability and fault tolerance.
- Disk size and performance can be increased as application storage needs grow.
- Disks can be attached, detached, or moved between virtual machines when needed.
Types of Storages
There are three different types of Google Cloud storage.
- Block Storage: It is a type of data storage that helps you manage your data in fixed-sized blocks or chunks. Data is stored by dividing into blocks, which are stored as kilobytes(Kb) or megabytes(Mb) in size. Each stored data block is assigned a unique identifier or address. Persistent Disk and Local SSD are examples of Block Storage.
- File Storage: It is a method of storing and organizing your data in a hierarchical structure, where the data stored is grouped into files and folders. It is very similar to on-premises Network Attached Storage(NAS). Filestore, NetApp Cloud Volumes, etc. are examples of Object Storage.
- Object Storage: It is a method of storage in which data is stored as objects in a hierarchy of buckets in which each object is assigned an ID that is globally Unique.
Types of Google Persistent Disks
- Standard Persistent Disks (HDD):
Standard Persistent Disks are backed by traditional hard disk drives and are designed for cost-effective storage. They are suitable for workloads that require large storage capacity but do not need very high I/O performance, such as backups, archives, and batch processing.
- Balanced Persistent Disks (SSD):
Balanced Persistent Disks use solid-state drives and offer a balance between performance and cost. They provide better throughput and IOPS than standard disks, making them suitable for general-purpose workloads like web servers, small databases, and development environments.
- Performance Persistent Disks (SSD):
Performance Persistent Disks (also called SSD persistent disks) deliver high IOPS and low latency compared to standard disks. They are ideal for high-performance workloads such as transactional databases, analytics applications, and applications that require frequent read and write operations.
- Extreme Persistent Disks (SSD):
Extreme Persistent Disks are designed for the most demanding workloads that require extremely high IOPS and consistent performance. They are commonly used for large enterprise databases and mission-critical applications where storage performance is crucial.
- Local SSDs :
Local SSDs are physically attached to the host machine running the virtual machine. They provide very high I/O performance and extremely low latency, but the data stored on them is temporary and lost if the VM stops or restarts. They are commonly used for caching, temporary data processing, and high-speed analytics workloads.
Features of Google Persistent Disk
- Durability: 
Persistent Disk provides durable storage, which is designed to be able to withstand failures. It replicates your data within the same zone, which ensures data integrity and protection against infrastructure failures.
- Scalability: 
With Persistent Disk, you can meet your changing needs by quickly scaling your storage capacity. You can easily create and attach multiple disks to your virtual machine instance and resize your disks dynamically while they are also attached to running instances.
- Performance: 
Google offers both Standard Persistent Disk(HDD) and SSD Persistent Disk options, allowing you to choose the level of performance which is perfect for your application.
- Snapshots and Backups:
Persistent Disk also provides you with snapshot functionality, allowing you to create backups of your disk data in time. Snapshots are incremental, which means only the data which gets changes is stored in subsequent snapshots. It makes persistent disk efficient and also minimizes storage costs. Snapshots are best for backing up your data for disaster recovery and cloning purposes, which allows you to protect and manage your data effectively.
- Integration with Google Cloud Services:
Persistent Disk easily integrates with other services and features offered by Google Cloud. It works smoothly with Compute Engine, which allows you to attach and detach disks to your virtual machine instances easily. It also helps us integrate with other services, such as Google Kubernetes Engine (GKE), where you can use Persistent Disk for your containerized workloads as the storage solution.
- Cost-Effective: 
Persistent Disk offers you cost-effective storage options which are suitable for various workloads. The pricing for Persistent Disk is transparent and depends on factors such as disk size, type (standard or SSD or Balanced SSD), and data transfer.
- Automatic security and encryption: 
It also encrypts your data automatically before it is transferred out of your instance to Persistent Disk storage. Data of each Persistent Disk remains encrypted with customer-supplied keys ( or with system-defined keys).
Pricing of Google Persistent Disk
Standard persistent disks (HDD), SSD persistent disks, and Balanced persistent disks prices are based on the amount of provisioned space. Since disk performance increases linearly with the size of your disk, you must consider your I/O needs when you are deciding the size of your disk. Extreme persistent disk prices are based on the amount of provisioned space and the number of provisioned IOPS. So, you are charged for both the amount of space you utilize and your need for the number of IOPS. The below table shows the pricing of different Persistent Disks. Pricing varies from region to region. Here, You can check the price comparison of different types of Persistent Disks in Delhi(Asia-south2 region).
[IOPS - Input/Output Operations per second.]
| Type | Price (Monthly in $ USD) | 
|---|---|
| Standard provisioned space | $0.048 per GB | 
| SSD provisioned space | $0.204 per GB | 
| Balanced provisioned space | $0.12 per GB | 
| Extreme provisioned space | $0.15 per GB | 
| Extreme provisioned IOPS | $0.078 per IOPS provisioned | 
| Regional standard provisioned space | $0.096 per GB | 
| Regional SSD provisioned space | $0.408 per GB | 
| Regional balanced provisioned space | $0.24 per GB | 
| Hyperdisk Extreme provisioned space | $0.15 per GB | 
| Hyperdisk Extreme provisioned IOPS | $0.038 per IOPS provisioned | 
| Hyperdisk Throughput provisioned space | Unavailable | 
| Hyperdisk Throughput provisioned throughput | Unavailable | 
Dividing different Persistent Disks as per their usage
| Disk Type | Priced by | 
|---|---|
| Standard Persistent Disk | Provisioned Space | 
| SSD Persistent Disk | Provisioned Space | 
| Balanced Persistent Disk | Provisioned Space | 
| Extreme Persistent Disk | Provisioned Space and Provisioned IOPS | 
Google Filestore
Google Filestore is a managed file storage service which is offered by Google Cloud Platform (GCP). It provides a fully managed Network Attached Storage (NAS) solution. It helps in creating and managing file shares that multiple virtual machine instances can access concurrently. Filestore is designed to offer
- High-Performance
- Scalability
- Reliability
Features of Google Filestore
- High availability: Google Filestore instances are highly available, and have a 99.99% regional availability SLA.
- Scalability: Google Filestore instances can be easily scaled up or down as per your need, so you only need to pay for the storage that you use.
- Performance: Google Filestore offers very good performance for your file-based workloads. It also supports NFSv3 and NFSv4.1, So, It is compatible with many other existing applications.
- Manageability: Google Filestore is a managed service, so you need not worry about managing the underlying infrastructure. So, It's a good choice for organizations that don't have the resources to manage their own file storage.
- Security: Filestore is a secure service that provides encryption at rest for data that is stored within the file shares. Data gets automatically encrypted with Google-managed keys before It is transferred to the disk. Additionally, Filestore also supports encryption in transit, which ensures that data is encrypted when data is being transferred between Filestore and clients who are accessing the file shares.
Types of Google Filestore
Google Filestore offers three different service tiers:
- Filestore Basic (HDD & SSD)
- Filestore Enterprise
- Filestore High Scale
We can further divide Filestore Basic (HDD & SSD) into two tiers
Filestore Basic (HDD & SSD) into Filestore Basic (HDD) and Filestore Basic (SSD).
- Basic HDD: This tier is the most affordable option. It is suitable for workloads watch do not require high performance or scalability.
- Basic SSD: This tier offers better performance than Basic HDD. It is mainly suitable for workloads that require some amount of IOPS.
- Filestore High-Scale SSD: This tier offers the best performance and scalability offered by GCP. It is suitable for workloads that require a high volume of IOPS.
- Filestore Enterprise: This tier is the most expensive option. It offers the highest level of performance, availability, and scalability. It is suitable for critical workloads.
Pricing of Google Filestore
| Service Tier | Storage Capacity | Max Sequential Read Throughput (MB/s) | Max Random Read IOPS | Price ($) | 
|---|---|---|---|---|
| Basic HDD | 1-63.9 TiB | 180 | 1000 | 0.24/GB/month | 
| Basic SSD | 2.5-63.9 TiB | 1200 | 60,000 | 0.36/GB/month | 
| High Scale SSD | 10-100 TiB | 26,000 | 960,000 | 0.36/GB/month | 
| Enterprise | 1-10 TiB | 1200 | 57,000 | 0.72/GB/month | 
Details of Google Persistent Disk and Google Filestore
| Feature | Google Persistent Disk | Google Filestore | 
|---|---|---|
| Storage type | Block-based | File Storage based | 
| Performance | High performance for a variety of workloads | Good performance for file-based workloads | 
| Scalability | Can be scaled up or down as needed | Can be scaled up or down as needed | 
| Manageability | Not a managed service | Managed service | 
| Security | Encrypted at rest and in transit | Encrypted at rest and in transit | 
| Pricing | More expensive than Google Filestore | More affordable than Google Persistent Disk | 
| Use cases | Databases, high-performance computing, virtual machines, containerized applications | File sharing, media streaming, backup and disaster recovery, application development | 
Google Persistent Disk VS Google Filestore Services
| Feature | Google Persistent Disk | Google Filestore | 
|---|---|---|
| Durability | Very durable | Durable | 
| Performance | High performance | Good performance | 
| Scalability | Scalable | Not much scalable | 
| Manageability | Not as easy to manage | Easy to manage | 
| Compatibility | Compatible with a variety of Google Cloud Platform services | Compatible with NFS-based applications | 
| Cost | More Expensive | More Affordable |

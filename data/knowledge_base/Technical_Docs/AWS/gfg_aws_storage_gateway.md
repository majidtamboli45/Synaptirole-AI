# AWS Storage Gateway

> Source: https://www.geeksforgeeks.org/devops/aws-storage-gateway/

AWS Storage Gateway is a hybrid cloud storage service that connects your on-premises applications to virtually unlimited cloud storage. It acts as a bridge, allowing your local servers to access AWS storage services (like S3, EBS, and Glacier) using standard file protocols (NFS, SMB, iSCSI).
This eliminates the need for complex data migration projects. You simply install the gateway appliance (a virtual machine) in your local data center, and it handles the data transfer, encryption, and caching transparently.
Core Architecture: How It Works
Storage Gateway uses a Virtual Appliance that you deploy on-premises (VMware, Hyper-V, KVM, or EC2). This appliance connects to your local applications via LAN and to AWS via the internet or Direct Connect.
- Local Cache: The appliance keeps frequently accessed data on a local disk (SSD) for low-latency performance.
- Cloud Backend: The "source of truth" for your data is stored durably in AWS.
- Optimized Transfer: It compresses and optimizes data transfer to minimize bandwidth usage.
Types of AWS Storage Gateways
Storage Gateway offers three main types of gateways, each designed for a specific storage protocol and use case.
Amazon S3 File Gateway
This gateway establishes migration to cloud as an organization can maintain application data files, and backup images as persistent objects in Amazon S3 File Gateway Supporting efficient data transfer for SMB or NFS-based access and local storage It means that this gateway also guarantees accessibility.
- Protocol: NFS (Network File System) and SMB (Server Message Block).
- Best For: Storing unstructured data (PDFs, images, logs) in S3 or accessing Windows file shares.
- Amazon S3 File Gateway: Maps files 1:1 to objects in an S3 bucket. A file written to the NFS share becomes an object in S3.
- Amazon FSx File Gateway: Provides a local cache for a cloud-based Amazon FSx for Windows File Server. Great for replacing on-prem Windows file servers.
Amazon FSx File Gateway
In Specifically for customers who have configuration or file data, Amazon FSx File Gateway enables on premise access to comprehensive, low-operating-overhead Windows File Server file shares on Amazon FSx So this gateway handles a less exacting, access-grouped SMB engagement. It also offers facility to integrate heights with business applications.
Volume Gateway
In a Volume Gateway delivers ISCSI block storage volumes backed by cloud for on-premises applications that need to scale and cut costs on storage With modes including cache mode or archived mode, Volume Gateway controls data in Amazon S3 for its availability and even persistence.
- Protocol: iSCSI (Internet Small Computer Systems Interface).
- Best For: Block storage for applications, databases, or replacing on-prem SAN arrays.
- Modes:
- Cached Volumes: Primary data is stored in S3. Frequently accessed data is cached locally. Allows you to store petabytes of data without buying local disks.
- Stored Volumes: Primary data is stored locally on your hardware. Asynchronous backups (snapshots) are sent to AWS EBS. Best for low-latency access to the entire dataset.
Tape Gateway
In Tape Gateway makes it easier to handle back up operations; that is, instead of using physical tapes on campus; one can use virtual tapes in Amazon Web Services. Optimizing top-tier backup software and caching virtual tapes on site, Tape Gateway smoothly integrates with existing backup workflows to guarantee data with low latency.
- Protocol: iSCSI Virtual Tape Library (VTL).
- Best For: Replacing physical tape libraries.
- How it works: It emulates a physical tape changer and tape drives. Your existing backup software (Veeam, NetBackup) sees it as a physical library.
- Backend: "Virtual Tapes" are stored in S3 (for active tapes) or archived to S3 Glacier (for long-term retention).
Comparison Matrix
| Feature | S3 File Gateway | Volume Gateway | Tape Gateway | 
|---|---|---|---|
| Protocol | NFS, SMB | iSCSI | iSCSI VTL | 
| Backend | Amazon S3 Objects | Amazon EBS Snapshots | S3 Glacier | 
| Local Access | Files & Folders | Block Volumes (Disks) | Virtual Tapes | 
| Primary Use | Data Lakes, content repository, SQL backups. | Database storage, SAN replacement. | Long-term archival, Tape replacement. | 
Key Benefits
- Low Latency: Because the appliance caches hot data locally, your on-prem applications get SSD-speed performance for active files.
- Unlimited Scale: You are no longer constrained by the size of your local SAN. You can store petabytes in the cloud while only keeping a few terabytes locally.
- Data Protection: Data is encrypted in transit (TLS) and at rest (AWS KMS). Volume Gateway allows you to take EBS Snapshots for disaster recovery.
Pricing Model
Pricing consists of three main components:
- Storage: You pay for the amount of data stored in S3/EBS/Glacier (standard AWS rates).
- Requests: You pay for the data written to/read from AWS (e.g., $0.01 per GB written).
- Gateway Instance: If you run the gateway appliance in EC2, you pay for the EC2 instance. If you run it on-premises (VMware), the software is free.
Use Case Scenarios
- Cloud Migration: Move a massive on-prem file server to S3 File Gateway. Users keep using the same mapped drive (Z:), but the data is silently moved to the cloud.
- Disaster Recovery: Use Stored Volume Gateway to keep your primary database local but continuously snapshot it to AWS. If your data center fails, you can restore the snapshots as EBS volumes in EC2 instantly.
- Backup Archival: Point your Veeam backup jobs to a Tape Gateway instead of a physical tape drive. The "tapes" are automatically sent to S3 Glacier Deep Archive for pennies per GB.

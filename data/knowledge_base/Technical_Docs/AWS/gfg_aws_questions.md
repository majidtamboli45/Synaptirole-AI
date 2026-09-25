# AWS Interview Questions

> Source: https://www.geeksforgeeks.org/cloud-computing/aws-interview-questions/

Amazon Web Services (AWS) is one of the world’s leading cloud computing platforms that provides a wide range of services such as computing power, storage, networking, databases, and security. It helps businesses and developers build applications quickly and efficiently without managing physical hardware. AWS is widely popular because of its scalability, reliability, and global infrastructure.
- AWS was launched in 2006 with core services like storage, computing, and messaging.
- It is used by major companies such as Netflix, Airbnb, and Spotify.
- AWS provides highly scalable and reliable cloud solutions.
- It offers a large collection of cloud services for different business needs.
- AWS continuously improves and expands its services based on modern technology trends.
1. What is IAM, and why is it critical for security? Differentiate between an IAM User, Group, and Role.
IAM (Identity and Access Management) is an AWS service used to securely manage access to AWS resources. It helps enforce the principle of least privilege by controlling who can access specific services and actions.
- IAM Users: Individuals users or applications with long-term credentials.
- IAM Groups: Collections of users with shared permissions and policies.
- IAM Roles: Temporary credentials assumed by trusted entities like EC2 or Lambda.
2. What is the difference between an AWS Region and an Availability Zone (AZ), and how do they work together?
AWS Regions and Availability Zones (AZs) are core components of AWS's global infrastructure. A Region is a geographical location, while an Availability Zone is an isolated data center (or group of data centers) within that Region.
- A geographic location that contains multiple AWS data centers.
- Consists of two or more Availability Zones.
- Used to deploy applications closer to users for lower latency.
- Each Region is isolated from other Regions.
- Helps meet data residency and compliance requirements.
- Resources can be deployed across multiple AZs within the same Region.
- Examples: ap-south-1 (Mumbai), eu-west-1 (Ireland), us-east-1 (N. Virginia).
- An isolated data center or group of data centers within an AWS Region.
- Connected to other AZs in the same Region through high-speed, low-latency networking.
- Designed to provide high availability and fault tolerance.
- Allows applications to continue running even if one AZ experiences an outage.
- Commonly used for Multi-AZ deployments of services such as EC2, RDS, and ECS.
- Each AZ has independent power, cooling, and networking infrastructure.
- Examples: ap-south-1a, ap-south-1b, ap-south-1c.
How They Work Together
- A Region contains multiple Availability Zones.
- Applications are deployed across multiple AZs within a Region to improve availability and resilience.
- If one AZ fails, resources in another AZ within the same Region can continue serving users.
- Multiple Regions can be used for global applications, disaster recovery, and lower latency for users in different geographic locations.
3. Explain the AWS Shared Responsibility Model.
The AWS Shared Responsibility Model divides security responsibilities between AWS and the customer. AWS manages the cloud infrastructure, including hardware, software, and data centers, while customers are responsible for securing their data, applications, and user access.
Responsibilities vary by service type
- IaaS: Customers manage OS and data.
- PaaS: AWS manages the platform; customers handle data.
- SaaS/Serverless: Customers focus on code and permissions.
4. Differentiate between horizontal and vertical scaling.
Horizontal and Vertical scaling are two fundamental strategies for increasing the capacity of a system to handle load, but they operate on different principles.
- Vertical Scaling: Increases the power of a single instance by adding more CPU, RAM, or storage. It is simple but has hardware limits and may require downtime.
- Horizontal Scaling: Adds multiple instances behind a load balancer to distribute traffic. It provides better scalability, high availability, and fault tolerance.
5. Explain the AWS Well-Architected Framework. What are its pillars?
The AWS Well-Architected Framework is a set of best practices that helps design secure, reliable, efficient, and cost-effective cloud architectures on AWS. Pillars of the AWS Well-Architected Framework
- Operational Excellence: Focuses on monitoring, automation, and continuous improvement.
- Security: Protects systems, applications, and data from threats.
- Reliability: Ensures systems recover quickly from failures and remain available.
- Performance Efficiency: Uses resources efficiently to maintain high performance.
- Cost Optimization: Reduces unnecessary costs while maximizing value.
6. Compare and contrast Security Groups and Network ACLs (NACLs).
Security Groups and Network ACLs (NACLs) are both virtual firewalls used to control network traffic in an AWS VPC, but they operate at different layers and serve different purposes.
- Operate at the instance (resource) level.
- Act as a virtual firewall for EC2 instances, RDS, ECS, and other AWS resources.
- Stateful: return traffic is automatically allowed, even if no outbound rule exists.
- Support only allow rules; explicit deny rules are not supported.
- Rules are evaluated as a set of allowed rules, and all matching allow rules are applied.
- Easier to manage for application-specific access control.
- Best suited for controlling traffic to and from specific instances or services.
- Operate at the subnet level.
- Apply to all resources within a subnet.
- Stateless: return traffic must be explicitly allowed in the opposite direction.
- Support both allow and deny rules.
- Rules are evaluated in number order, and the first matching rule is applied.
- Provide an additional layer of security beyond Security Groups.
- Best suited for subnet-wide traffic filtering and blocking specific IP addresses or ports.
7. Explain how AWS Key Management Service (KMS) works and define Envelope Encryption.
AWS Key Management Service (KMS) is a managed service used to create, manage, and control encryption keys for securing data in AWS. It uses secure hardware security modules (HSMs) to protect cryptographic keys.
Envelope Encryption: Envelope encryption is a method where data is encrypted using a data key, and the data key itself is encrypted using a master key in KMS.
Process
- KMS generates a plaintext data key and an encrypted data key.
- The plaintext key encrypts the data locally.
- The plaintext key is discarded after encryption.
- The encrypted data and encrypted data key are stored together securely.
8. What is the purpose of S3 Object Lock and MFA Delete?
- S3 Object Lock: helps enforce data immutability by using a Write-Once-Read-Many (WORM) model. Once enabled, objects cannot be modified or deleted for a defined retention period or until a legal hold is removed. This feature is commonly used in industries with compliance requirements, such as finance, healthcare, and government.
- MFA Delete: adds an additional security layer by requiring multi-factor authentication (MFA) before an object version can be permanently deleted or before S3 versioning can be disabled. This helps prevent accidental deletions and protects against unauthorized or malicious actions.
9. Explain the purpose of a Virtual Private Cloud (VPC). What are its core components?
A Virtual Private Cloud (VPC) allows you to create a secure and isolated network within AWS, similar to a traditional on-premises network. It helps control networking, connectivity, and security for AWS resources. Core components of VPC
- Subnets: Divide the VPC into public and private networks.
- Route Tables: Define how network traffic is routed.
- Internet Gateway (IGW): Provides internet access for public subnets.
- NAT Gateway: Allows private subnets to access the internet outbound only.
- Security Groups: Stateful security at the instance level.
- Network ACLs (NACLs): Stateless security at the subnet level.
10. What is the difference between an Elastic IP and a Public IP address?
Both Public IP addresses and Elastic IP addresses allow AWS resources to communicate over the internet, but they differ in how they are assigned and managed.
- A public IPv4 address automatically assigned by AWS to an EC2 instance (if enabled).
- Changes when the instance is stopped and started (unless it is backed by an Elastic IP).
- Automatically assigned and managed by AWS.
- Cannot be easily moved from one instance to another.
- Suitable for temporary internet connectivity where a fixed IP address is not required.
- Commonly used for development, testing, or short-lived workloads.
- A static public IPv4 address allocated to your AWS account.
- Remains the same until you explicitly release it.
- Must be manually allocated and associated with an EC2 instance or supported AWS resource.
- Can be quickly reassigned to another instance during maintenance or failover.
- Ideal for applications that require a permanent public IP address.
- Commonly used for production servers, DNS mappings, and disaster recovery scenarios.
11. What is Amazon Route 53, and what routing policies does it support?
Amazon Route 53 is AWS’s scalable Domain Name System (DNS) service used to route user traffic to applications and AWS resources. It provides high availability, domain registration, health checks, and traffic routing capabilities. Routing Policies Supported by Route 53
- Simple Routing: Routes traffic to a single resource.
- Weighted Routing: Distributes traffic based on assigned weights.
- Latency-Based Routing: Routes users to the region with the lowest latency.
- Failover Routing: Redirects traffic to a backup resource during failure.
- Geolocation Routing: Routes traffic based on user geographic location.
- Geoproximity Routing: Routes traffic based on resource location and bias settings.
- Multi-Value Answer Routing: Returns multiple healthy IP addresses for better availability.
12. Explain the difference between VPC Peering and AWS Transit Gateway for connecting multiple VPCs.
Both VPC Peering and AWS Transit Gateway are used to connect multiple VPCs, but they differ in architecture, scalability, and management.
- Creates a direct one-to-one connection between two VPCs.
- Supports non-transitive routing, so traffic cannot pass through an intermediate VPC.
- Requires manual configuration of route tables for each peering connection.
- Management becomes more complex as the number of VPCs increases.
- Offers low-latency communication between directly connected VPCs.
- Best suited for connecting a small number of VPCs.
- Ideal for simple networking environments with limited connectivity requirements.
- Uses a hub-and-spoke architecture to connect multiple VPCs and on-premises networks.
- Supports transitive routing, allowing connected VPCs to communicate through the Transit Gateway.
- Provides centralized route management, simplifying network administration.
- Easily scales to hundreds or thousands of VPCs and network connections.
- Integrates with services such as AWS Site-to-Site VPN and AWS Direct Connect for hybrid cloud networking.
- Reduces the number of individual network connections required.
- Best suited for large-scale, multi-VPC, and hybrid cloud environments.
When to Choose
- VPC Peering: When you need a simple, direct connection between a few VPCs.
- AWS Transit Gateway (TGW): When you need to connect and manage many VPCs through a central gateway.
13. What is an EC2 instance, and what are the factors you consider when choosing an instance type?
An EC2 instance is a virtual server in AWS that provides scalable computing power with full control over the operating system and installed software. It is commonly used to host applications, websites, and databases. Factors to consider when choosing an instance type
- Compute, memory, and storage requirements of the workload.
- Common families include General Purpose (T/M), Compute Optimized (C), Memory Optimized (R/X), and Storage Optimized (I).
- Burstable instances (T-family) suit low or variable traffic workloads.
- Fixed-performance families suit steady, high-demand workloads.
- On-Demand pricing provides flexibility with pay-as-you-go billing.
- Reserved Instances and Savings Plans offer lower costs for long-term usage.
- Spot Instances are cost-effective for fault-tolerant and interruptible workloads.
14. What is the difference between stopping and terminating an EC2 instance?
Stopping and terminating an EC2 instance both stop the instance from running, but they differ in whether the instance can be reused.
Stopping an EC2 Instance
- Temporarily shuts down the EC2 instance.
- The instance can be started again later.
- The instance ID remains the same after restarting.
- The root EBS volume is preserved by default, so data is retained.
- Compute charges stop while the instance is stopped, but storage charges for EBS volumes continue.
- Useful when an instance is not needed temporarily but will be used again later.
- Example: Stop a development server during weekends and restart it on Monday.
Terminating an EC2 Instance
- Permanently deletes the EC2 instance.
- The instance cannot be restarted or recovered after termination.
- The instance ID is permanently lost.
- The root EBS volume is deleted by default (unless configured otherwise).
- All compute charges stop, and storage charges also stop if the associated volumes are deleted.
- Useful when the instance is no longer required.
- Example: Terminate a temporary testing server after project completion.
15. What is an Amazon Machine Image (AMI)?
An Amazon Machine Image (AMI) is a pre-configured template that provides the information required to launch a virtual server (an EC2 instance) in the cloud. An AMI is the fundamental unit of deployment for EC2. An AMI includes several key components
- Root Volume Template: Contains the operating system and installed software.
- Launch permissions: Define whether the AMI is private, shared, or public.
- Block device mapping: Specifies the storage volumes attached during launch.
16. Explain the concept of an Auto Scaling Group (ASG). What components are needed to configure one?
An Auto Scaling Group (ASG) automatically manages the number of EC2 instances based on traffic and workload demand. It helps maintain performance, high availability, and cost optimization by scaling instances in or out automatically.
Components needed to configure an ASG
- Launch Template/Configuration: Defines AMI, instance type, security groups, and other settings.
- Auto Scaling Group: Sets minimum, maximum, and desired number of instances.
- Scaling Policies: Define when to scale in or out based on metrics like CPU usage.
- CloudWatch Alarms: Monitor metrics and trigger scaling actions.
- Subnets/VPC: Specify where instances will be launched.
17. What is an Elastic Load Balancer (ELB)? Describe the different types.
Elastic Load Balancer (ELB) is an AWS service that distributes incoming traffic across multiple targets (like EC2, containers, Lambda), improving application availability and fault tolerance by avoiding overload and routing around unhealthy targets.
Types of ELB
- Application Load Balancer (ALB): Works at Layer 7 and is used for HTTP/HTTPS traffic with content-based routing. Ideal for web applications and microservices.
- Network Load Balancer (NLB): Works at Layer 4 and handles TCP/UDP traffic with very low latency. Suitable for high-performance applications.
- Gateway Load Balancer (GLB): Works at Layer 3 and is used for security appliances like firewalls and intrusion detection systems.
- Classic Load Balancer (CLB): Legacy load balancer supporting basic Layer 4 and Layer 7 traffic handling. Mostly replaced by ALB and NLB.
18. Explain EC2 Placement Groups and their use cases.
EC2 Placement Groups are used to control how EC2 instances are placed on AWS infrastructure for better performance, fault tolerance, or low latency.
Types of Placement Groups
- Cluster Placement Group: Places instances close together in a single AZ for low latency and high throughput. Best for High-performance computing (HPC) and big data workloads.
- Partition Placement Group: Distributes instances across separate partitions to reduce failure impact. Best for distributed systems like Hadoop, Kafka, and Cassandra.
- Spread Placement Group: Places instances on separate hardware to maximize availability. Best for critical applications like databases and domain controllers.
When to Use Placement Groups
- Performance sensitive applications needing fast inter-instance communication.
- Fault-tolerant architectures that must isolate failure domains.
- Compliance driven deployments requiring physical separation of resources.
19. What is the purpose of AWS Lambda? Compare it to EC2.
AWS Lambda is a serverless compute service that runs code without managing servers. It automatically handles scaling, patching, and infrastructure management, making it ideal for event-driven applications like API requests, file uploads, and automation tasks.
EC2 (Amazon Elastic Compute Cloud)
- Requires you to provision and manage virtual servers.
- You are responsible for operating system updates, patches, and server maintenance.
- Suitable for long-running and stateful applications.
- Supports manual scaling or Auto Scaling based on demand.
- Pricing is based on the time the instance is running.
- Best suited for web servers, databases, enterprise applications, and workloads requiring full control over the operating system.
AWS Lambda
- Serverless service where AWS manages the infrastructure.
- No need to provision, patch, or maintain servers.
- Executes short-lived, stateless functions in response to events.
- Automatically scales based on the number of incoming requests.
- Pricing is based on the number of requests and execution duration.
- Best suited for event-driven applications, APIs, scheduled tasks, file processing, and backend automation.
20. Explain AWS Lambda Cold Starts and methods to reduce them.
A “Cold Start” in AWS Lambda is the delay that occurs when a Lambda function is invoked without an already running execution environment. AWS needs to create a new environment, load the code, and initialize the runtime before executing the function.
Note: Cold starts are more noticeable in Java and .NET runtimes compared to Node.js and Python.
Strategies to reduce cold starts
- Provisioned Concurrency: Keeps Lambda environments pre-initialized.
- Optimize Deployment Package: Reduce package size and dependencies.
- Choose Efficient Runtimes: Use faster runtimes like Node.js or Python.
- Optimize Initialization Code: Minimize code executed outside the handler.
- Optimize VPC Configuration: Reduce networking delays when using VPCs.
21. What is Amazon S3, and what guarantees does it provide for durability and availability?
Amazon S3 is a scalable object storage service used for backups, archives, data lakes, and static website hosting. It stores data as objects inside buckets and is designed for high durability and availability.
- S3 provides 11 nines (99.999999999%) durability by replicating data across multiple Availability Zones (AZs).
- S3 Standard offers around 99.99% availability.
- Durability ensures protection against data loss.
- Availability ensures data can be accessed whenever needed.
22. Explain the difference between the main AWS storage services: S3, EBS, and EFS. Provide a use case for each.
Amazon S3, Amazon EBS, and Amazon EFS are AWS storage services designed for different workloads. They differ in storage type, access method, performance, and sharing capabilities.
Amazon S3 (Simple Storage Service)
- Provides object storage for storing files, images, videos, backups, and logs.
- Accessed through REST APIs, SDKs, or URLs.
- Offers virtually unlimited storage capacity.
- Highly durable and suitable for storing large amounts of unstructured data.
- Data can be easily shared over the internet or integrated with other AWS services.
- Use case: Storing website assets, backups, media files, data lakes, and log files.
Amazon EBS (Elastic Block Store)
- Provides block storage for Amazon EC2 instances.
- Attached to an EC2 instance as a virtual hard disk.
- Delivers high-performance, low-latency storage for applications and databases.
- Volume size can be increased as storage requirements grow.
- Typically attached to one EC2 instance at a time.
- Use case: Hosting operating systems, relational databases, and enterprise applications that require persistent block storage.
Amazon EFS (Elastic File System)
- Provides a shared file storage service for Linux-based workloads.
- Can be mounted simultaneously on multiple EC2 instances.
- Automatically scales as files are added or removed.
- Supports concurrent access from multiple servers.
- Ideal for workloads requiring a shared file system.
- Use case: Shared application data, content management systems, web server clusters, and machine learning workloads requiring shared storage.
23. Explain the different S3 Storage Classes and the purpose of S3 Lifecycle Policies.
Amazon S3 provides different storage classes based on data access frequency and cost requirements.
- S3 Standard: For frequently accessed data with high performance and availability.
- S3 Intelligent-Tiering: Automatically moves data between storage tiers based on usage.
- S3 Standard-IA: For infrequently accessed data with lower storage cost.
- S3 One Zone-IA: Similar to Standard-IA but stores data in a single AZ at lower cost.
- S3 Glacier Classes: Used for archival storage with very low cost and slower retrieval times.
Purpose of S3 Lifecycle Policies
- Automatically move objects to cheaper storage classes over time.
- Delete old objects after a defined period.
- Help reduce storage costs and manage data efficiently.
24. When would you choose a relational database like Amazon RDS versus a NoSQL database like DynamoDB?
- Amazon RDS: Used for structured relational data that requires schemas, relationships, ACID compliance, and complex queries. Best for applications like banking systems, e-commerce platforms, and CRMs.
- Amazon DynamoDB: Used for highly scalable, low-latency NoSQL workloads with flexible schemas. Best for user sessions, IoT data, gaming, and real-time applications.
25. What is Amazon Aurora, and how is it different from standard RDS databases?
Amazon Aurora is a high-performance relational database service offered by AWS, compatible with MySQL and PostgreSQL. It is designed for better scalability, availability, and performance compared to standard RDS databases.
- Use Aurora for high-performance enterprise applications.
- Use RDS for cost-effective managed database workloads.
| Feature | Amazon Aurora | Standard RDS | 
|---|---|---|
| Performance | Higher performance | Standard performance | 
| Storage | Auto-scales up to 128 TB | Limited/manual scaling | 
| Availability | Multiple copies across AZs | Multi-AZ support | 
| Failover | Faster failover | Slower failover | 
| Cost | Higher cost | Lower cost | 
26. What is the purpose of Amazon CloudWatch?
Amazon CloudWatch is a monitoring and observability service used to track AWS resources and applications. It helps monitor performance, analyze logs, set alerts, and maintain the overall health of systems running on AWS.
Purpose of CloudWatch
- Metrics: Collects resource performance data like CPU utilization and request count.
- Logs: Stores and analyzes logs from applications and AWS services.
- Alarms: Sends alerts when defined thresholds are reached.
- Events (Amazon EventBridge): Responds to resource changes and triggers actions automatically.
- Dashboards: Provides a centralized view of metrics, logs, and application health.
27. What is the difference between Amazon ECS and Amazon EKS, and when would you use each one?
| Feature | Amazon ECS | Amazon EKS | 
|---|---|---|
| Platform | AWS-native container orchestration service. | Fully managed Kubernetes service. | 
| Setup & Management | Simple to set up and manage. | More complex and requires Kubernetes expertise. | 
| Integration | Deep integration with AWS services (IAM, VPC, ELB). | Integrates with AWS and the Kubernetes ecosystem. | 
| Portability | Primarily AWS-focused. | Supports multi-cloud and Kubernetes portability. | 
When to Choose
- Amazon ECS: When you want a simple, AWS-native container platform with minimal management and faster deployment.
- Amazon EKS: When you need Kubernetes features, multi-cloud portability, or already have Kubernetes expertise in your team.
28. What is Infrastructure as Code (IaC), and what is the role of AWS CloudFormation?
Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using code instead of manual configuration. It helps automate deployments, maintain consistency, and reduce human errors.
AWS CloudFormation is AWS’s native IaC service used to create and manage infrastructure through templates.
Role of Infrastructure as Code (IaC)
- Automates infrastructure provisioning and management.
- Reduces manual configuration errors.
- Ensures consistent environments across development, testing, and production.
- Supports version control and easy rollback of infrastructure changes.
- Enables faster deployment and easier scalability.
- CloudFormation can automatically roll back resources if stack creation or updates fail.
29. Explain the difference between Amazon SNS and Amazon SQS. When would you use each one?
Amazon SNS (Simple Notification Service) and Amazon SQS (Simple Queue Service) are AWS messaging services, but they serve different purposes.
| Feature | Amazon SNS | Amazon SQS | 
|---|---|---|
| Type | Pub/Sub Messaging Service | Message Queue Service | 
| Communication | One-to-Many | One-to-One | 
| Delivery | Sends messages to multiple subscribers instantly | Stores messages until processed | 
| Use Case | Notifications, alerts, event broadcasting | Background processing, decoupling applications | 
| Examples | Email, SMS, Lambda, SQS | Order processing, task queues | 
When to Use
- Use SNS when one message needs to be sent to multiple receivers instantly.
- Use SQS when messages need to be processed reliably and independently by applications.
30. Explain the difference between Monolithic and Microservices architecture.
Monolithic and Microservices are two different software architecture approaches used to build applications.
| Feature | Monolithic Architecture | Microservices Architecture | 
|---|---|---|
| Structure | Single unified application. | Application divided into multiple independent services. | 
| Coupling | Components are tightly coupled. | Services are loosely coupled and communicate through APIs. | 
| Deployment | Entire application is deployed together. | Each service can be deployed independently. | 
| Scalability | Scales as a whole application. | Individual services can be scaled separately. | 
| Maintenance | Becomes harder to maintain as the application grows. | Easier to maintain and update individual services. | 
| Development | Simpler to develop initially. | More complex to design and manage. | 
31. Explain Blue/Green Deployment and Rolling Deployment in AWS.
Blue/Green Deployment and Rolling Deployment are software deployment strategies used to release application updates with minimal downtime and reduced risk.
- Blue/Green Deployment: Maintains two identical environments. One environment (Blue) runs the current version, while the other (Green) runs the new version. Traffic is switched to the Green environment after testing. It provides quick rollback and near-zero downtime.
- Rolling Deployment: Updates application instances gradually in batches instead of replacing the entire environment at once. It reduces downtime and resource usage but rollback may take longer compared to Blue/Green deployment.
When to Use
- Use Blue/Green Deployment for critical applications requiring fast rollback and minimal downtime.
- Use Rolling Deployment for simpler and cost-effective gradual updates.
32. You need to provide an EC2 instance in a private subnet with access to the internet to download software patches. How would you achieve this securely?
To securely provide internet access to an EC2 instance in a private subnet:
- Use a NAT Gateway in a public subnet with an Elastic IP.
- Update the private subnet route table to send internet traffic (0.0.0.0/0) through the NAT Gateway.
- The EC2 instance gets outbound internet access without allowing direct inbound internet traffic.
- A NAT Instance can also be used, but it requires manual management and scaling.
33. You are designing a serverless API backend. Which AWS services would you use, and what would the architecture look like?
A serverless API backend on AWS can be built using fully managed services for scalability, low cost, and minimal server management.
Architecture Components
- API Gateway: Handles REST API requests, routing, throttling, and authentication.
- Amazon Cognito: Manages user authentication and JWT tokens.
- AWS Lambda: Executes the business logic in a serverless manner.
- Amazon DynamoDB: Stores application data with low-latency access.
- Amazon CloudWatch: Monitors logs, metrics, and application performance.
- AWS SAM/CloudFormation: Used for Infrastructure as Code (IaC) deployment.
34. How would you design a highly available and fault-tolerant architecture for a critical web application on AWS?
To design a highly available and fault-tolerant web application on AWS, resources should be distributed across multiple Availability Zones (AZs) to avoid single points of failure.
- Application Load Balancer (ALB): Distributes traffic across multiple AZs and routes traffic away from unhealthy instances.
- EC2 Auto Scaling Group (ASG): Launches instances across multiple AZs for automatic scaling and recovery.
- Amazon RDS Multi-AZ: Maintains a standby database with automatic failover for high availability and durability.
- Multiple AZ Deployment: Ensures the application continues running even if one AZ fails.
35. How would you design a CI/CD pipeline for a containerized application on AWS?
A CI/CD pipeline for a containerized application on AWS automates code building, testing, and deployment using AWS DevOps services.
Pipeline Components
- Source Control: Use CodeCommit, GitHub, or Bitbucket to store code and trigger the pipeline.
- CodePipeline: Orchestrates the complete CI/CD workflow.
- CodeBuild: Builds Docker images, runs tests, and performs security checks.
- Amazon ECR: Stores and manages Docker container images securely.
- Deployment:
  - Use CodeDeploy with ECS for container deployment.
  - Use kubectl or Helm for deployments on EKS.
36. How would you troubleshoot intermittent 502 Bad Gateway errors in an application behind an ALB and Auto Scaling Group?
To diagnose intermittent 502 Bad Gateway errors in an application behind an ALB and Auto Scaling Group, follow a systematic troubleshooting approach
- Check ALB CloudWatch metrics and access logs for failed requests.
- Review EC2 and application logs for crashes, timeouts, or high resource usage.
- Verify ALB health check configuration.
- Ensure Security Groups and NACLs allow proper traffic between ALB and EC2.
- Check Auto Scaling instances are healthy before receiving traffic.
37. How would you investigate a sudden increase in AWS costs and reduce expenses?
To investigate an unexpected AWS cost spike and recommend savings, follow these steps
- Check the AWS Billing Dashboard to identify which service or region caused the spike.
- Use AWS Cost Explorer to analyze costs by service, usage type, and region.
- Review EC2, S3, and data transfer usage for unusual activity or idle resources.
- Use CloudTrail to identify recently created or modified resources.
- Remove unused resources and right-size overprovisioned instances.
- Use Savings Plans, Reserved Instances, S3 lifecycle policies, and Spot Instances for long-term cost optimization.
38. Design a scalable, fault-tolerant, and cost-effective architecture for a global photo-sharing application.
A scalable, fault-tolerant, and cost-effective global photo-sharing application should be designed to handle millions of users, provide low-latency access worldwide, and automatically scale based on demand while minimizing operational overhead.
Architecture Components
- Image Upload & Storage: Use Amazon S3 with Transfer Acceleration to store uploaded images globally.
- Image Processing: Use S3 Events to trigger AWS Lambda for thumbnail generation and image processing.
- Content Delivery: Use CloudFront CDN to cache and deliver images with low latency worldwide.
- API Layer: Use API Gateway with Lambda for scalable serverless APIs.
- Authentication: Use Amazon Cognito for user authentication and JWT-based access control.
- Database: Use DynamoDB with Global Tables for user profiles, metadata, likes, and social data.
- Search & Feed: Use OpenSearch for indexing images and generating personalized feeds.
- Routing: Use Route 53 latency-based routing to direct users to the nearest region.
- Monitoring & Cost Optimization: Use CloudWatch for monitoring, IAM for security, and S3 lifecycle policies with Savings Plans for cost reduction.
39. How would you respond if IAM access keys were accidentally exposed in a public GitHub repository?
If IAM access keys are accidentally exposed in a public GitHub repository, it should be treated as a security incident because the keys may already be compromised. The priority is to secure the AWS account, investigate any unauthorized activity, and prevent future exposures.
- Immediately deactivate or delete the exposed access keys.
- Use AWS CloudTrail to investigate suspicious activity and identify affected resources.
- Rotate all related credentials such as database passwords and API keys.
- Remove any unauthorized resources or malicious changes.
- Use AWS Secrets Manager for secure secret storage and automatic rotation.
- Enable secret scanning in repositories and CI/CD pipelines.
- Train developers on security best practices and update the incident response process.
40. How would you migrate a 10TB on-premises Oracle database to AWS with minimal downtime?
- Use AWS Database Migration Service (DMS) for live database migration with minimal downtime.
- Use Amazon RDS as the target database (Oracle or PostgreSQL depending on migration type).
- Assess and prepare the database schema using AWS Schema Conversion Tool (SCT) if required.
- Perform the initial full data load while the source database remains online.
- Enable Change Data Capture (CDC) to continuously replicate ongoing changes.
- During the final maintenance window, stop the application briefly, sync remaining changes, validate data, and switch the application to the new RDS endpoint.
- Use RDS Multi-AZ deployment for high availability and reliability.
41. How would you design a scalable and manageable AWS network architecture for a large enterprise?
To design a scalable, secure, and manageable network architecture for a large enterprise, use a hub-and-spoke model with centralized networking and governance.
Architecture Components
- AWS Organizations: Manage multiple AWS accounts and apply Service Control Policies (SCPs).
- AWS Transit Gateway (TGW): Connect multiple VPCs through a central hub and simplify routing.
- AWS Direct Connect: Provide dedicated, low-latency connectivity between on-premises data centers and AWS.
- AWS Resource Access Manager (RAM): Share networking resources such as Transit Gateway across accounts.
- Security Controls: Use Security Groups, Network ACLs, IAM, and AWS KMS to secure resources and data.
- High Availability: Deploy workloads across multiple Availability Zones and use Route 53 for DNS and failover.
- Monitoring: Use CloudWatch and CloudTrail for monitoring, logging, and auditing.
42. How would you troubleshoot Lambda timeouts when connected to RDS inside a VPC?
- Check CloudWatch Logs and AWS X-Ray to identify where the timeout occurs.
- Analyze Lambda cold starts and enable Provisioned Concurrency if needed.
- Check database connection limits and use RDS Proxy for connection pooling.
- Monitor RDS performance metrics like CPU, memory, and active connections.
- Verify VPC networking, route tables, Security Groups, and NACLs allow Lambda-to-RDS communication.
- Perform load testing after fixes and continue monitoring for stability.
43. What AWS services would you use to ingest, process, and analyze real-time IoT sensor data?
- Data Ingestion - Amazon Kinesis Data Streams: Collect high-velocity data with guaranteed durability and ordering, handling massive concurrent producers.
- Real-Time Processing:
  - AWS Lambda: Event-driven processing for lightweight tasks like filtering, enrichment, format conversion, and alerting; integrates with SNS for notifications.
  - Amazon Kinesis Data Analytics: Run continuous SQL queries for time-series analysis, aggregations, and anomaly detection without managing infrastructure.
- Durable Storage - Amazon S3: Store raw and processed data in a scalable, durable, and cost-effective data lake for long-term retention and analytics.
- Ad-Hoc Analytics Amazon Athena: Query S3 data directly using SQL, or optionally load structured data into Amazon Redshift for high-performance analytics and BI.
- Optional Enhancements: Secure data flow with IAM roles, KMS encryption, and VPC endpoints; monitor using CloudWatch and X-Ray; manage metadata and ETL with AWS Glue.
44. How would you design a zero-trust networking environment on AWS for microservices running on EKS?
To design a zero-trust networking environment for microservices on EKS
- Strong identity (IRSA): Give each microservice its own least-privilege IAM role; avoid node-level roles.
- Micro-segmentation: Default deny-all NetworkPolicy; add narrow allows (e.g., orders → payments).
- Encrypted comms: Use a service mesh (Istio/Linkerd/App Mesh) with mTLS and identity-based access.
- Ingress/Egress control: ALB Ingress + TLS + WAF; outbound via NAT/VPC Endpoints with strict egress policies.
45. Your company has a critical application with a Recovery Time Objective (RTO) of 15 minutes and a Recovery Point Objective (RPO) of 1 minute. The application runs in a single AWS Region. What disaster recovery (DR) strategy would you recommend to meet these requirements in case of a full region failure?
To meet a 15-minute RTO and 1-minute RPO for a critical application, a Warm Standby disaster recovery strategy is recommended.
- Maintain a scaled-down but fully functional environment in a secondary AWS Region.
- Continuously replicate data using Aurora Global Database, DynamoDB Global Tables, or S3 Cross-Region Replication (CRR).
- Use Route 53 health checks for automatic failover between regions.
- In case of regional failure, route traffic to the DR region and scale the Auto Scaling Group to full capacity.
- This approach provides fast recovery with lower cost than a full Active/Active setup.
46. An EC2 instance is unable to access objects stored in an Amazon S3 bucket. How would you troubleshoot and resolve the issue?
To troubleshoot this issue, we would follow a systematic approach:
- Verify IAM Permissions: Check that the EC2 instance has an IAM role attached with the required S3 permissions such as s3:GetObject ands3:ListBucket .
- Review Bucket Policies: Ensure the S3 bucket policy allows access and does not contain any explicit deny statements.
- Check Encryption Settings: If the bucket uses AWS KMS encryption, verify that the IAM role has permission to use the KMS key.
- Validate Network Connectivity: Confirm that the instance can reach S3 through an Internet Gateway, NAT Gateway, or S3 VPC Endpoint.
- Test Access: Use AWS CLI commands such as aws s3 ls oraws s3 cp and review any error messages.
- Analyze Logs: Review CloudTrail and CloudWatch logs to identify permission, networking, or encryption-related issues.
47. Design an AWS-based e-commerce platform that can automatically scale during peak shopping periods while maintaining high availability and security.
To build a scalable, highly available, and secure e-commerce platform on AWS, we would use a multi-tier architecture with automatic scaling and fault tolerance.
Architecture Components
- Amazon Route 53: Direct users to the application and provide DNS failover.
- Application Load Balancer (ALB): Distribute incoming traffic across multiple application servers.
- EC2 Auto Scaling Group (ASG): Automatically add or remove EC2 instances based on traffic demand.
- Amazon RDS Multi-AZ / Aurora: Provide a highly available database with automatic failover.
- Amazon ElastiCache (Redis): Cache frequently accessed product and session data to improve performance.
- Amazon S3 + CloudFront: Store and deliver product images, videos, and static content with low latency.
- AWS WAF and Shield: Protect the application from common web attacks and DDoS threats.
- Amazon CloudWatch: Monitor application performance and trigger alerts when needed.
48. An Auto Scaling Group is not launching new EC2 instances even though CPU utilization is above the scaling threshold. How would you troubleshoot the issue?
To troubleshoot this issue, we would verify each component involved in the Auto Scaling process.
- Check whether the CloudWatch alarm is in the ALARM state.
- Verify that the scaling policy is correctly attached to the Auto Scaling Group.
- Ensure the Auto Scaling Group has not reached its maximum capacity.
- Review the launch template for configuration errors.
- Check the Auto Scaling activity history for any launch failures.
49. An AWS Region becomes unavailable. How would you ensure your application continues serving users with minimal downtime?
To ensure business continuity during a regional outage, we would use a multi-region disaster recovery strategy.
- Deploy the application in a secondary AWS Region.
- Replicate data using services such as Aurora Global Database, DynamoDB Global Tables, or S3 Cross-Region Replication.
- Use Route 53 health checks and failover routing to automatically redirect traffic to the healthy region.
- Keep infrastructure synchronized using CloudFormation or Infrastructure as Code (IaC).
- Monitor both regions using CloudWatch and regularly test failover procedures.
50. Your application stores sensitive credentials such as API keys and database passwords. How would you securely manage and rotate these secrets in AWS?
To securely manage sensitive credentials, we would use AWS Secrets Manager.
- Store API keys, database passwords, and other secrets in AWS Secrets Manager instead of hardcoding them in the application.
- Use IAM roles and policies to control access to secrets.
- Enable automatic secret rotation for supported databases.
- Encrypt secrets using AWS KMS.
- Retrieve secrets dynamically at runtime rather than storing them in configuration files.
- Monitor secret access using CloudTrail and CloudWatch.
51. An application generates and stores millions of files each day. How would you design the AWS storage architecture to ensure scalability, durability, and cost optimization?
To design a scalable, durable, and cost-effective storage solution, we would use Amazon S3 as the primary storage service.
Architecture Components
- Amazon S3: Store files with virtually unlimited scalability and 99.999999999% durability.
- S3 Intelligent-Tiering: Automatically move files between storage tiers based on access patterns.
- S3 Lifecycle Policies: Transition older files to Glacier storage classes for long-term archival at lower cost.
- Amazon CloudFront: Cache and deliver frequently accessed files with low latency.
- S3 Versioning: Protect against accidental deletion or overwrites.
- Cross-Region Replication (CRR): Replicate critical data to another AWS Region for disaster recovery.
- CloudWatch and Cost Explorer: Monitor storage usage, performance, and costs.
52. A microservices-based application running on EKS is experiencing communication failures between services. How would you troubleshoot the issue?
To troubleshoot communication failures between microservices on EKS, we would systematically verify networking, service discovery, and application configurations.
Troubleshooting Steps
-  Check the health and status of pods using kubectl get pods .
- Verify Kubernetes Services and Endpoints are correctly configured.
- Test DNS resolution using CoreDNS to ensure services can discover each other.
- Review Network Policies to confirm traffic between services is allowed.
- Check Security Groups and VPC networking settings for connectivity issues.
- Examine application and container logs for errors or timeouts.
- Use CloudWatch and service mesh tools (if configured) to trace requests and identify failures.

# Introduction to Amazon Web Services

> Source: https://www.geeksforgeeks.org/cloud-computing/introduction-to-amazon-web-services/

Amazon Web Services (AWS) is the world's most comprehensive and broadly adopted cloud platform. Since its launch in 2006, AWS has revolutionized how individuals, companies and governments access technology services.
- Access computing power, storage, and databases on-demand
- Eliminate the need to buy, own, and maintain physical data centers
- Pay only for what you use (pay-as-you-go model)
- Flexible scaling based on business needs
AWS Global Infrastructure
Understanding AWS global infrastructure is essential for architecting resilient, low-latency applications.
Regions
- Physical locations worldwide where AWS clusters data centers
- Examples: us-east-1 (N. Virginia), ap-south-1 (Mumbai)
- Optimize latency by choosing regions close to your users
- Minimize costs (pricing varies by region)
- Meet data sovereignty and compliance requirements
Availability Zones (AZs)
- Multiple isolated locations within each region
- Each AZ contains one or more discrete data centers with redundant power, networking, and connectivity
- Ensures high availability and disaster recovery
- Prevents single points of failure
Edge Locations
- Smaller data centers in major cities worldwide
- Used by Amazon CloudFront (CDN) to cache content closer to end-users
- Reduces latency for faster content delivery
Shared Responsibility Model
Security is AWS's top priority, with responsibilities divided between AWS and customers.
AWS Responsibility (Security OF the Cloud)
- Protects cloud infrastructure, hardware, software, networking, and facilities
- Ensures data center security and compliance
Your Responsibility (Security IN the Cloud)
- Encrypt your data
- Configure network security (firewalls)
- Manage identity and access (IAM)
- Patch operating systems
- Implement application-level security
Core AWS Services
AWS offers over 200 services. Here are the fundamental ones you must know to get started.
1. Compute Services
- Amazon EC2 (Elastic Compute Cloud): Resizable virtual servers. You choose the OS (Linux/Windows) and the hardware power (CPU/RAM). It is the workhorse of AWS.
- AWS Lambda: Serverless compute. You upload your code, and Lambda runs it only when triggered (by an event like a file upload). You don't manage any servers.
- AWS Elastic Beanstalk: Platform as a Service (PaaS) for deploying web apps. You upload code, and AWS handles the deployment (capacity provisioning, load balancing, auto-scaling).
2. Storage Services
- Amazon S3 (Simple Storage Service): Object storage for files (images, videos, backups). It allows you to store and retrieve any amount of data from anywhere on the web.
- Amazon EBS (Elastic Block Store): Block storage (virtual hard drives) that you attach to EC2 instances. It is persistent storage for your virtual servers.
- Amazon Glacier: Extremely low-cost storage for data archiving and long-term backup.
3. Database Services
- Amazon RDS (Relational Database Service): Managed SQL databases. It supports engines like MySQL, PostgreSQL, Oracle, SQL Server, and Amazon Aurora (AWS's high-performance proprietary engine).
- Amazon DynamoDB: A managed NoSQL database service that provides fast and predictable performance with seamless scalability.
4. Networking Services
- Amazon VPC (Virtual Private Cloud): Lets you provision a logically isolated section of the AWS Cloud where you can launch resources in a virtual network you define.
- Amazon CloudFront: A Content Delivery Network (CDN) that speeds up distribution of your static and dynamic web content to users.
- Amazon Route 53: A highly available and scalable cloud Domain Name System (DNS) web service.
Real-World Use Cases
By Organization Size
- Startups: Reduce infrastructure costs, deploy efficiently, and scale as needed
- Enterprises: Manage infrastructure at scale, focus on product development, reduce operational overhead
Company Examples
Netflix
- Stores and scales applications for global content delivery
- Maintains low latency across millions of users
Airbnb
- Manages diverse workloads and marketplace infrastructure
- Provides scalable, reliable lodging platform
NASA's Jet Propulsion Laboratory
- Handles large-scale scientific research data
- Supports space exploration computing needs
Capital One
- Delivers banking services with AWS security and compliance standards
AWS Pricing Overview
1. Pay-as-You-Go Pricing
AWS charges for usage-based billing, meaning you only pay for what you use. This pricing model is based on factors like:
- Compute (e.g., EC2 instances)
- Storage (e.g., S3)
- Data transfer
- Requests and service usage (e.g., Lambda invocations)
This model is ideal for businesses with variable workloads.
2. On-Demand Instances
On-Demand Instances let you pay for compute capacity by the hour or second (depending on the instance type) with no long-term commitments or upfront payments. This option is ideal for:
- Applications with short-term, irregular, or unpredictable workloads
- First-time AWS users testing the platform
- Projects that cannot be interrupted
These instances offer maximum convenience and are perfect for development, testing, and prototyping workloads.
3. Reserved Pricing
For predictable usage, you can commit to a long-term contract (1 or 3 years) with reserved instances for services like EC2, RDS, and Redshift. This offers:
- Up to 75% cost savings compared to on-demand pricing.
- Flexible payment options (All upfront, Partial upfront, or No upfront).
4. Spot Instances
Spot Instances allow you to bid on unused EC2 capacity. Prices fluctuate based on supply and demand, and you can save up to 90% compared to on-demand prices.
- Great for batch processing, data analysis, or flexible workloads.
5. Free Tier
AWS offers a Free Tier for new users, providing access to a limited set of services for free, such as:
- 750 hours/month of EC2 (t2.micro instance) for the first 12 months.
- 5GB of standard S3 storage.
- 1 million Lambda requests/month.
This is an excellent way for businesses to explore AWS without incurring costs.
To Know How to Set up Free Tier Account on Amazon Web Services Click Here
6. AWS Pricing Calculator
AWS provides a Pricing Calculator to estimate costs based on your specific usage. It helps you project the total cost of your cloud infrastructure by selecting services and configurations relevant to your business.
7. Cost Management and Optimization
AWS offers tools like AWS Cost Explorer and AWS Budgets to:
- Track usage and manage expenses.
- Set custom budgets and receive alerts when approaching limits.

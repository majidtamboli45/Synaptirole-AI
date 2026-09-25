# Amazon Redshift

> Source: https://www.geeksforgeeks.org/devops/amazon-redshift/

Amazon Redshift is a fully managed, petabyte-scale data warehouse service in the cloud. It allows you to analyze all your data across your data warehouse and data lake using standard SQL. It is highly optimized for complex analytical queries on massive datasets.
- Fully managed, petabyte-scale cloud data warehouse designed for large-scale analytical query processing.
- Organizes data by column rather than row to significantly reduce disk I/O and boost query performance.
- Distributes query execution across multiple compute nodes to process massive datasets in parallel.
- Offers both Provisioned Cluster (with RA3 or DC2 nodes) and Serverless options to match varying workloads.
- Features tools like Redshift Spectrum to directly query exabytes of unstructured data in Amazon S3.
Core Architecture
Amazon Redshift operates on a unique clustered architecture designed for distributed processing.
Cluster
- Leader Node: Coordinates the cluster, parses queries, creates execution plans, and stores database metadata. It does not store user database records.
- Compute Nodes: Store the actual user data and perform analytical queries in parallel.
- Node Slices: Sub-allocations of memory and disk space within compute nodes for high performance.
Redshift Managed Storage (RMS)
- Separates compute and storage scaling using RA3 nodes.
- Hot Data: Frequently used data stored on local SSDs for fast access.
- Cold Data: Less-used data automatically moved to Amazon S3 for cost-effective storage.
Key Concepts for Performance
Columnar Storage
- Stores data column-wise instead of row-wise.
- Reduces disk I/O by scanning only required columns.
Distribution Styles
- AUTO: Redshift automatically chooses the best distribution style.
- KEY: Distributes data based on a selected column for faster joins.
- EVEN: Distributes rows evenly across all nodes.
- ALL: Copies the full table to every node for faster access to small tables.
Sort Keys
- Organizes data physically based on selected columns.
- Helps queries skip unnecessary data blocks and improves filtering performance.
Deployment Options
Amazon Redshift provides two main operational models to fit different workload types:
Amazon Redshift Provisioned
- How it works: Users manually configure node types (e.g., ra3.4xlarge ) and scale the cluster size explicitly.
- Best For: Steady, predictable production workloads demanding highly consistent performance and precise budget control.
- Scaling: Scaled manually via cluster resizing or automatically via Concurrency Scaling for peak times.
Amazon Redshift Serverless
- How it works: Automatically provisions and scales database capacity (measured in Redshift Processing Units or RPUs) based on active query volume.
- Best For: Variable or intermittent workloads, ad-hoc analysis, development/testing environments, and easy operations.
- Zero-ETL: Supports automated, pipeline-free replication of transactional data from services like Amazon Aurora or DynamoDB.
Advanced Features
Redshift Spectrum
- Functionality: Enables querying structured or semi-structured data directly in S3 using standard ANSI SQL without loading.
- Use Case: Minimizes storage costs by keeping older, rarely-accessed historical logs in S3 and joining them with active data in Redshift.
Data Sharing
- Functionality: Permits sharing live, read-only data across different Redshift clusters, AWS accounts, or regions without copy overhead.
- Use Case: Allows isolated marketing or financial analysis workloads to query master sales data without affecting operational performance.
Set Up and Use Amazon Redshift
Follow these steps to configure a Redshift cluster, set up security, and load data:
Note: Ensure that your security groups allow inbound traffic on port 5439, which is the default port used by Amazon Redshift for database connections.
Step 1: Create and Configure the Redshift Cluster
- Navigate to Service: Log in to the AWS Management Console, search for Amazon Redshift, and click on Create cluster.
- Configure Details: Define the cluster identifier, master database username, database name, and admin password.
- Set Network Options: Choose the Virtual Private Cloud (VPC), subnet group, and associated security groups to restrict access to trusted endpoints.
- Launch and Verify: Click Create cluster and wait for the cluster status to change from Creating to Available.
Step 2: Amazon Redshift requires IAM permissions to access services such as Amazon S3.
- Create IAM Role: Create an IAM role with policies that grant read permissions to S3 (e.g., AmazonS3ReadOnlyAccess).
- Attach Role: Navigate to the cluster's Security and encryption settings and attach the newly created IAM role.
Step 3: Define your database schema by running a CREATE TABLE statement within the Query Editor:
CREATE TABLE sales (    sales_id INT,    product_name VARCHAR(255),    quantity INT,    price DECIMAL(10, 2),    sale_date DATE);
Step 4: Bulk-load data efficiently into Redshift using the COPY command:
- Prepare Data: Store clean, preprocessed files (e.g., CSV, Parquet) inside an Amazon S3 bucket.
- Run COPY Command: Execute the COPY statement to load files directly from your S3 bucket into the Redshift target table.
COPY salesFROM 's3://your-bucket/your-data'IAM_ROLE 'arn:aws:iam::your-account-id:role/your-iam-role'FORMAT AS CSV;
Benefits
- High scalability and performance
- Integration with AWS ecosystem
- Cost-effective analytics solution
- Secure data warehousing with encryption and IAM
Limitations
- Not ideal for transactional workloads (OLTP)
- Requires proper distribution and sort key design for best performance
- Query performance may vary with poor schema optimization
Pricing Models
- On-Demand (Provisioned): Charged a flat rate per node/hour depending on node size (e.g., approximately $3.26/hr for an ra3.4xlarge node).
- Reserved Instances: Offers up to 75% savings over On-Demand when committing to 1-year or 3-year terms.
- Serverless Pricing: Calculated per Redshift Processing Unit (RPU) per hour based on real-time query consumption.
- Spectrum Pricing: Billed serverlessly per Terabyte (TB) of data scanned directly in Amazon S3 (currently $5.00/TB).

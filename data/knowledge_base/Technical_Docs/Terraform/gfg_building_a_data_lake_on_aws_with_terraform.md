# Building a Data Lake on AWS with Terraform

> Source: https://www.geeksforgeeks.org/devops/building-a-data-lake-on-aws-with-terraform/

Today, in the age of digital supremacy, data has shifted into a strategic asset that drives business decision-making, innovation, and competitive advantage. Now, organizations collect significant amounts of data from different sources, so the task of efficient management, storage, and proper information analysis arises as a significant challenge. That is where a data lake comes into play.
A data lake is a centralized repository for storing structured and unstructured big data at any scale. Unlike traditional data warehouses, data lakes do generally not require making the data's structure evident in advance. The flexibility associated with raw data in terms of type and content format brings immense opportunities for diverse data analytics, machine learning, and real-time processing of data.
In this guide, we are going through a process to build a data lake on AWS using Terraform, we will cover critical concepts while defining major terminologies and take you step-by-step to help design and build a scalable and maintainable solution for your data lake. Whether you are a data engineer, cloud architect, or IT professional, this guide will provide you with knowledge and tools for harnessing data lakes on AWS.
Primary Terminologies
- Data Lake: A centralized repository that allows organizations to store very large quantities of raw data in its original format, facilitating various analytic and processing activities without prior data transformation.
- Amazon S3 (Simple Storage Service): scalable, durable, and secure storage via Amazon Web Services service for object storage, handling all types of data, such as images, videos, log files, and more.
- Terraform: Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. Terraform is used to describe and provision thousands of cloud infrastructures declaratively using configuration files.
- IAM: A service of AWS through which the user can control access to valuable resources assuredly and securely. It also enables the user to groundly assign dissimilar permissions by creating users, groups, roles, and policies.
- Glue: AWS service for data preparation, transformation, and cataloging. It makes it easier for one to locate, organize, and prepare data for analysis and easy learning from various sets of datasets.
- Athena: AWS administration for questioning information put away in S3 utilizing standard SQL grammar. One can quickly examine large datasets without the need to use complicated infrastructures or load these data.
What is Data Lake?
A data lake is a centralized repository that allows you to store all kinds of structured and unstructured data at absolutely any scale. It stores data in its raw form so that it can be saved so that the ability for processes can be regulated according to needs for specific purposes. Below are some features and benefits of data lakes.
Characteristics of Data Lakes
- Scalability: These platforms can store enormous quantities of data ranging from terabytes to petabytes, empowering a business with the capacity to handle big data.
- Flexibility: They can accept different kinds of data like structured, semi-structured, and unstructured.
- Raw Data Storage: This stores data in its original format; this leads to in-depth analysis and various uses.
- Schema-on-Read: While traditional databases follow the convention of schema-on-write, data lakes perform schema-on-read. In other words, the data structure is applied only when read and not when stored.
Benefits of Data Lakes
- Cost-Effective: Data lakes can be more cost-effective as data lakes require commodity hardware and pure open-source software.
- Analytics and Insights: Enable next-generation advanced analytics encompassing big data analytics, machine learning, and real-time analytics.
- Integration: Data lakes can easily be integrated with other systems and data sources to get a complete view of data across the organization.
- Data democratization: It allows for broader access, so different teams within an organization can do their analyses.
Use cases of data lakes
- Processing big data: Handling large volumes of data from sources including IoT devices, social media, logs, and more.
- Machine learning: Providing raw data to train the machine learning model being developed.
- Data Archiving: Storing historical data and any particular file repository is mainly for future access and analysis purposes.
- Data Exploration and Discovery: Providing users with exploring and finding out new information through iterative search and investigation without predefined data structures.
Step-by-Step Process to Building a Data Lake on AWS with Terraform
Step 1: Launch an EC2 Instance
- Go to AWS Console and launch an EC2 Instance
Step 2: Install Terraform
Now install terraform on our local machine by using following commands
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
Step 3: Create a file for Terraform Configuration
Now create a file with .tf extension. Inside this file we are defining terraform configuration
Provider Configuration: In this Provider Configuration we are proving provider details
provider "aws" {
region = "eu-north-1" # modify according to your region
}
#S3 Bucket Configuration
Creates an S3 bucket named my-unique-data-lake-bucket-name.
resource "aws_s3_bucket" "data_lake_bucket" {
bucket = "my-unique-data-lake-bucket-name"
force_destroy = true
versioning {
enabled = true
}
server_side_encryption_configuration {
rule {
apply_server_side_encryption_by_default {
sse_algorithm = "AES256"
}
}
}
tags = {
Name = "DataLakeBucket"
}
}
resource "aws_s3_bucket_public_access_block" "public_access_block" {
bucket = aws_s3_bucket.data_lake_bucket.id
block_public_acls = true
block_public_policy = true
ignore_public_acls = true
restrict_public_buckets = true
}
#AWS Glue Catalog Database
Creates an AWS Glue Catalog Database named data_lake_db.
resource "aws_glue_catalog_database" "data_lake_db" {
name = "data_lake_db"
}
#AWS Glue Crawler
Creates an AWS Glue Crawler to crawl data in the S3 bucket and update the Glue Catalog Database.
resource "aws_glue_crawler" "data_lake_crawler" {
name = "data_lake_crawler"
database_name = aws_glue_catalog_database.data_lake_db.name
role = aws_iam_role.glue_service_role.arn
s3_target {
path = "s3://${aws_s3_bucket.data_lake_bucket.bucket}/"
}
}
IAM Role for AWS Glue
Creates an IAM role for AWS Glue.
resource "aws_iam_role" "glue_service_role" {
name = "AWSGlueServiceRole"
assume_role_policy = jsonencode({
"Version": "2012-10-17",
"Statement": [{
"Action": "sts:AssumeRole",
"Effect": "Allow",
"Principal": {
"Service": "glue.amazonaws.com"
}
}]
})
}
resource "aws_iam_policy_attachment" "glue_service_role_policy" {
name = "glue-service-role-policy"
roles = [aws_iam_role.glue_service_role.name]
policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
Step 4: Applying the Configuration
- To create these resources, run the following Terraform commands:
terraform initterraform validateterraform apply --auto-approve
- Here we see that terraform apply completed and total 6 resources be created
Step 5: Resources Created
AWS S3
AWS Glue Crawlers
Data Lake Databases
Step 6: Execute Terraform Destroy Command
To delete created resources now execute Terraform destroy command
terraform destroy --auto-approve
Here we see that total 6 resources was destroyed successfully
Conclusion
In conclusion, the importance of data lakes in modern data management lies in their scalability and flexibility to hold vast amounts of structured and unstructured data in raw form. They allow schema-on-read processing, supporting one's ability to do many types of analysis that are purposed or needed. Data lake integrations' capabilities provide a way to consolidate data from multiple sources into one source to allow for comprehensive data analysis across the board.
The key benefits of data lakes include, Reduced costs because they are built on commodity hardware and open-source technologies. Support for advanced analytics, such as big data processing, machine learning, and real-time analytics. Democratization of data so members across an organization can innovate and make more informed decisions.
This is reflected in the fact that data lakes, in general, allow companies to harness all the value from data to help businesses stand up, better customer experiences, and remain competitive. As the demand for real-time analytics and data-driven decision-making increases, the data lake will become more strategic to the enterprise with features that take an enterprise ahead in a data-driven world.

# What is AWS Bastion Host

> Source: https://www.geeksforgeeks.org/blogs/what-is-aws-bastion-host/

A Bastion Host (also called a Jump Server or Jump Box) is a special EC2 instance that acts as a secure access point for private servers inside a VPC.
- It is placed in a public subnet.
- It allows secure access to instances in private subnets.
- Private servers remain hidden from direct internet access.
In a cloud setup, backend servers usually do not have public IP addresses for security reasons. A Bastion Host is used as a secure entry point to access these private servers through SSH for tasks such as updates, monitoring, and log checking.
The term “Bastion” refers to a strong defensive point that protects access to a system or area.
How It Works
The architecture relies on the separation of Public and Private subnets
1. Public Subnet: The Bastion Host is deployed in a public subnet. It has a public IP address and can be accessed from the internet, typically with access restricted to specific trusted IP addresses.
2. Private Subnet: Application servers, database servers, and other critical resources are deployed in private subnets. These instances have only private IP addresses and cannot be accessed directly from the internet.
3. Access Flow:
- Users first connect to the Bastion Host using SSH.
- From the Bastion Host, they connect to the required private instance.
- Private instances remain secure because they do not require public IP addresses.
Why Use a Bastion Host?
- Security: It reduces the "attack surface." Instead of protecting 50 servers from the internet, you only need to harden and protect ONE server (the Bastion).
- Logging: It provides a central place to monitor and track user access.
- Network Isolation: It allows you to keep your critical workloads in private subnets, meeting compliance requirements (HIPAA, PCI-DSS).
Note: HIPAA and PCI-DSS are industry security and compliance standards used to improve data protection and network security.
Architecture Requirements
The following points describe the basic architecture and requirements for deploying a Bastion Host in AWS.
- A VPC with both Public and Private subnets is required to create a secure network environment.
- An Internet Gateway is needed to allow the Bastion Host to communicate with the internet.
- The architecture can span across two Availability Zones for better availability.
- Amazon EC2 Auto Scaling instances can be used for scalability and reliability.
- Elastic IP addresses are required for Bastion Host instances.
- Amazon CloudWatch is used to store and monitor Bastion Hosts logs.
- Security Groups are configured to securely allow access between the Bastion Host and private instances.
Setting Up a Bastion Host (Best Practices)
Setting up a bastion is more than just launching an EC2 instance. You must configure it securely.
1. Security Group Rules
- Bastion SG: Inbound: Allow SSH (Port 22) ONLY from your specific IP address (e.g., 203.0.113.5/32). Never allow 0.0.0.0/0.
- Private Instance SG: Allow SSH (Port 22) ONLY from the Bastion Security Group ID. This ensures that only the Bastion can talk to your private servers.
2. SSH Agent Forwarding (The "Secret Sauce")
- Problem: You need your private key (my-key.pem) to log into the private instance. But you should NEVER copy your private key to the Bastion Host. If the Bastion is compromised, your key is stolen.
- Solution: Use SSH Agent Forwarding. This allows the Bastion to "pass through" your local credentials without storing the key on the server.

# Security in Amazon Virtual Private Cloud

> Source: https://www.geeksforgeeks.org/devops/amazon-vpc-security-in-amazon-virtual-private-cloud/

Amazon VPC provides a secure and isolated networking environment for AWS resources. It includes multiple security features that help protect applications, servers, and network communication inside the cloud.
- Provides isolated private networking in AWS
- Protects resources using Security Groups and NACLs
- Controls inbound and outbound traffic
- Improves security and reliability of cloud infrastructure
Observe the attached image and refer to the points written ahead.
Multiple levels of security
It is clearly stated in the given diagram that, a VPC secures its components on various different levels. This increases the overall security of the VPC. For instance, refer to the attached image and understand the pointers.
- 1st Level of Security: Each VPC is assigned a private IP address range that is isolated from other networks.
- 2nd Level of Security: Each subnet inside the VPC uses its own IP address range. Private subnets are not directly accessible from the internet.
- 3rd Level of Security: Resources such as EC2 instances and S3 buckets include their own security settings and access controls for additional protection.
These were the various security levels inside the VPC.
To increase the total reliability of the VPC, security groups are created.
Security Groups
act as virtual firewalls that protect EC2 instances inside a VPC by controlling inbound and outbound traffic.
- One or more Security Groups can be attached to an EC2 instance based on security requirements.
- They help control which traffic is allowed to reach the instance.
- If no Security Group is assigned, AWS automatically attaches the default Security Group to the instance.

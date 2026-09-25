# Creating an Amazon Machine Image(AMI)

> Source: https://www.geeksforgeeks.org/devops/amazon-web-services-creating-an-amazon-machine-imageami/

An Amazon Machine Image (AMI) is a template containing an operating system, installed programmes, and configuration settings used as the foundation for launching Amazon EC2 instances. Creating a custom AMI saves time and guarantees consistency when launching multiple instances with identical configurations.
- A custom AMI captures your exact software stack and settings, eliminating repeated manual configuration.
- It can be created from either a running or a stopped EC2 instance.
- AMI creation automatically snapshots all associated EBS volumes.
- By default, EC2 shuts down the instance during AMI creation to ensure file system integrity, then reboots it automatically.
Launching an EC2 Instance
Step 1. Log in to your AWS account. Click the Services tab in the top-left corner, navigate to the Compute category, and select EC2.
Step 2. In the top-right corner of the EC2 dashboard, select the AWS Region closest to your users or best suited to your application's latency and availability requirements.
Step 3. Click Launch Instance on the EC2 dashboard to open the instance creation wizard.
Step 4. Select an AMI appropriate for your application. For this example, select Amazon Linux 2 from the available options.
Step 5. Choose t2.micro (Free Tier eligible) or select the instance type that best matches your CPU, memory, and storage requirements.
Step 6. Create a new key pair if you do not already have one. Download the private key file and store it securely, as it is required to connect to any instance launched using this key pair.   
- Public Key: Stored on the instance.
- Private Key: Stored locally and used to authenticate SSH connections.
Step 7. Set the number of instances to 1. Select your default VPC or a custom VPC along with its associated subnet.
Step 8. Create a new security group or select an existing one. Specify the allowed protocols and permitted IP address ranges for inbound and outbound traffic.
Step 9. Configure EBS volumes for your instance. Available volume types include:
- General Purpose SSD (gp2/gp3): Balanced price and performance for most workloads.
- Provisioned IOPS SSD (io1/io2): For I/O-intensive workloads requiring consistent high performance.
- Magnetic (st1/sc1): Low-cost options for infrequently accessed data.
Step 10. Review all configuration settings, make any necessary adjustments, and click Launch.
Creating an AMI from an EC2 Instance
Step 1. Open the AWS Management Console, navigate to the EC2 Dashboard, and select Instances from the left-hand navigation pane.
Step 2. Use the search box or filter options to locate the instance you want to use as the AMI source. Right-click the instance and select Create Image from the context menu.
Step 3. Enter a unique name and optional description for the new AMI.
- By default, EC2 shuts down the instance, creates and registers the AMI, snapshots all associated volumes, and reboots the instance automatically.
- Select No reboot only if downtime is not acceptable, as this may cause file system integrity issues in the resulting image.
- Click Create Image to begin the process.
Note: Selecting No reboot does not guarantee that all pending file system writes will be captured in the snapshot, which may result in an inconsistent image.
Step 4. AMI creation may take several minutes.
- To track progress, navigate to AMIs in the EC2 left-hand menu.
- Select Owned by me from the filter dropdown.
- Wait for the status to change to available.
Step 5. Once the AMI status is available, click Launch Instance in the EC2 dashboard.
- Select the My AMIs tab and locate the new AMI, then click Select.
- Complete the launch wizard, configuring instance type, storage, security groups, and any other required settings.
- Click Launch.
The Instance has been created successfully from your custom AMI.

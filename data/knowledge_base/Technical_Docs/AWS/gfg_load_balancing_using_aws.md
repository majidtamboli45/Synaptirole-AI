# Load Balancing using AWS

> Source: https://www.geeksforgeeks.org/system-design/load-balancing-using-aws/

Elastic Load Balancing (ELB) is an AWS service that distributes incoming traffic across multiple targets, such as EC2 instances, containers, IP addresses, and Lambda functions. It helps improve application availability, scalability, and fault tolerance by preventing any single server from becoming overloaded.
- Spreads incoming requests across multiple healthy targets.
- Keeps applications available even when individual targets fail.
- Works with Auto Scaling to handle changes in traffic.
- Reduces the chance of a single server receiving too many requests.
- Can route traffic to EC2 instances, containers, IP addresses, and Lambda functions.
AWS provides four types of load balancers in Elastic Load Balancing (ELB), each designed for different networking and application requirements based on the OSI model.
1. Application Load Balancer (ALB)
Best For: Modern web applications, microservices, and container-based applications.
How it Works: The Application Load Balancer operates at the Application Layer (HTTP/HTTPS). It can inspect request details such as URL paths, headers, and cookies, then route traffic accordingly.
Key Features:
- Path-Based Routing: Route /api to one target group and /images to another.
- Host-Based Routing: Route api.example.com and www.example.com to different backends.
- Integration: Native support for AWS WAF (Web Application Firewall) and AWS Lambda.
2. Network Load Balancer (NLB)
Best For: High-performance and low-latency applications such as gaming, financial systems, and TCP/UDP traffic.
How it Works: The Network Load Balancer operates at the Transport Layer (Layer 4). It forwards packets quickly without inspecting the request content.
Key Features:
- Extreme Performance: Handles millions of requests per second with ultra-low latency.
- Static IP Support: Provides a static IP address for each Availability Zone, which is useful for firewall whitelisting.
- TCP/UDP Support: Supports TCP, UDP, and TLS traffic for high-performance networking applications.
3. Gateway Load Balancer (GWLB)
- Best For: Deploying third-party virtual appliances such as firewalls and intrusion detection systems.
- How it Works: The Gateway Load Balancer operates at the Network Layer (Layer 3). It listens to IP traffic and forwards packets to security appliances for inspection before sending them to the application.
- Key Features: Transparent inspection, auto-scaling of security appliances.
4. Classic Load Balancer (CLB)
- Status: Deprecated. Do not use for new workloads.
- Details: Supports both Layer 4 and Layer 7 but lacks modern features like path-based routing or WebSocket support. Use ALB or NLB instead.
Features
- High Availability: Distributes traffic across multiple targets to reduce downtime and improve reliability.
- Auto Scaling Integration: Works with Auto Scaling to automatically add or remove instances based on traffic demand.
- Health Checks: Continuously monitors targets and routes traffic only to healthy resources.
- Flexibility: Supports customizable routing rules and traffic management for different application needs.
Setting up AWS Load Balancing
Setting up AWS load balancing involves a series of well-defined steps, which are listed below:
1. Choose the Appropriate Load Balancer Type: First, select the load balancer that best fits your application needs:
- Application Load Balancer (ALB): For web applications using HTTP/HTTPS
- Network Load Balancer (NLB): For high-speed TCP/UDP traffic
- Classic Load Balancer (CLB): For older or legacy applications
2. Define Listeners: Listeners define how the load balancer receives incoming traffic. You need to specify:
- Protocol (HTTP, HTTPS, TCP, etc.)
- Port number (such as 80 or 443)
The listener then forwards requests to the correct target group.
3. Set Up Target Groups: Create target groups that act as the destination for the traffic forwarded by the load balancer. Define the protocol and port for the target group, and configure health checks to ensure that the load balancer directs traffic only to healthy instances.
4. Configure Health Checks: Health checks continuously monitor backend instances to make sure they are working properly. If an instance becomes unhealthy, the load balancer automatically stops sending traffic to it and redirects requests to healthy instances.
5. Adjust Security Group Settings: Update the security group rules to allow communication:
- From users to the load balancer
- From the load balancer to backend instances
This ensures secure and smooth traffic flow within the application architecture.
For a complete step-by-step setup of the AWS ELB Load Balancer, refer to Elastic Load Balancer in AWS
Security Features
AWS Elastic Load Balancing provides several security features to protect applications and infrastructure.
- IAM Integration: Controls access to AWS resources using AWS Identity and Access Management (IAM).
- SSL/TLS Encryption: Secures data in transit using SSL/TLS certificates.
- AWS WAF Integration: Protects web applications from common web attacks and exploits.
1. Set up SSL/TLS Termination on AWS
To set up SSL/TLS termination on AWS, users can configure SSL certificates for their load balancers using AWS Certificate Manager (ACM) or by uploading their custom certificates. This process involves
- Defining the security policy
- Selecting the appropriate cipher suites
- Configuring the listener to handle HTTPS requests.
2. Companies Using AWS
Many companies use AWS load balancing services to ensure scalability and high availability.
Some well-known examples include:
- Netflix
- Airbnb
- Adobe
These companies use AWS load balancing to manage traffic efficiently and improve user experience.
Advantages
- Distributes traffic across multiple Availability Zones and healthy instances.
- Automatically scales based on incoming traffic demand.
- Supports SSL/TLS encryption and integrates with AWS WAF.
- Continuously checks backend health and routes traffic only to healthy resources.
Disadvantages
- Adds slight delay because traffic passes through the load balancer first.
- High traffic or multiple load balancers can increase AWS costs.
- Requires proper configuration and monitoring.
- Low-level OS and network customization options are limited in the managed service.

# Introduction to Amazon Route53

> Source: https://www.geeksforgeeks.org/cloud-computing/introduction-to-amazon-route53/

Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service. In simplest terms, it acts as the phone book of the internet, translating human-readable domain names, such as www.google.com, into the numeric IP addresses (like 192.0.2.1) that computers use to connect to each other.
Beyond standard DNS, Route 53 is a traffic management tool that can route users to the best endpoint based on latency, health, or geography.
Core Concepts
To understand Amazon Route 53, you should know these key concepts:
Hosted Zone: A container for DNS records that controls traffic routing for a domain and its subdomains.
- Public Hosted Zone: Routes internet traffic to your resources.
- Private Hosted Zone: Routes internal traffic within an Amazon VPC.
Records (Resource Record Sets): The actual instructions in a hosted zone.
- A Record: Points a hostname to an IPv4 address.
- AAAA Record: Points a hostname to an IPv6 address.
- CNAME Record: Points a hostname to another hostname.
- Alias Record: AWS-specific record that points to AWS resources like ELB or S3 with better performance and no extra cost.
Working
When a user visits your website, Route 53 facilitates the connection in milliseconds:
- User Query: A user types www.example.com into their browser.
- DNS Resolution: The request travels to a DNS Resolver (ISP), which queries the Root and TLD servers to find the authoritative nameserver.
- Route 53 Response: Route 53 checks the DNS records and routing policy to find the correct IP address.
- Traffic Routing: Route 53 returns the IP address (e.g., of your Load Balancer), and the user's browser connects to your application.
Functions Of Route53
- Helps register domain names for web applications.
- Connects users to websites using DNS resolution.
- Automatically routes traffic to healthy resources if failures occur.
- Provides a cost-effective, secure, and scalable DNS service.
- Offers high availability, reliability, and flexibility.
Methodologies
- Records: Records are created to route internet traffic to resources. They are stored inside a hosted zone and define how traffic for a domain or subdomain should be directed.
- Hosted zone: A hosted zone is a collection of DNS records for a domain and its subdomains. When a domain is registered in Amazon Route 53, a hosted zone is created to manage traffic routing.
- DNS query: It is a request for information sent from DNS client to the DNS server.
- Alias records: Alias records route traffic to AWS resources such as S3 buckets, CloudFront distributions, or Load Balancers. They provide better integration with AWS services.
- Name servers: They are the servers in the DNS that translates the domain name into IP address so that internet traffic can be routed to the resources.
- DNS failover: DNS failover automatically redirects traffic from unhealthy resources to healthy resources when a failure occurs.
- Routing policy: Routing policy determines how Amazon Route53 responds to queries.
Route 53 Routing Policies and Traffic Management
Route 53's power lies in its routing policies. You can choose how Route 53 answers DNS queries.
Simple Routing
- Meaning: One domain → one resource.
- Use Case: Best for small applications or when only one resource handles all traffic.
- Example: A company website hosted on a single EC2 instance.
Weighted Routing
- Meaning: Split traffic between multiple resources based on percentages.
- Use Case: Ideal for A/B testing, gradual deployments, or testing new application versions.
- Example: 
  - 80% traffic → Version 1
  - 20% traffic → Version 2
Latency Routing
- Meaning: Sends users to the AWS Region with the lowest network latency.
- Use Case: Improves performance for global applications.
- Example:
  - Users in India → Mumbai Region
  - Users in Germany → Frankfurt Region
Failover Routing
- Meaning: Switches traffic from a primary resource to a backup resource if the primary fails.
- Use Case: Disaster recovery and high availability.
- Example: 
  - Primary server → US-East
  - Backup server → US-West
Geolocation Routing
- Meaning: Routes users based on their geographic location.
- Use Case: Deliver localized content or meet regional requirements.
- Example:
  - France users → French-language servers
  - Japan users → Japanese-language servers
Geoproximity Routing
- Meaning: Routes traffic based on the physical distance between users and AWS resources, with optional traffic bias.
- Use Case: Balance traffic across regions or shift traffic to preferred locations.
- Example: Even if users are closer to Region A, traffic can be shifted toward Region B when Region A is overloaded.
Multivalue Answer Routing
- Meaning: Returns multiple healthy IP addresses randomly.
- Use Case: Basic load balancing and redundancy without a load balancer.
- Example: A DNS query returns several healthy server IPs, and the client connects to one of them.
Amazon Route53 supported DNS Record Types
The following are the DNS record types that are supported in Amazon Route53:
- A Record ( Address Record ): Maps a domain or subdomain to an IPv4 address.
- AAAA Record ( IPv6 Address Record ): Maps a domain or subdomain to an IPv6 address.
- CNAME Record ( Canonical Name Record ): Creates an alias from one domain name to another domain name. Commonly used for subdomains.
- MX Record (Mail Exchange Record ): Specifies the mail servers responsible for receiving emails for a domain and defines their priority order.
Advanced Features
1. Health Checks
Route 53 can monitor the health of your application endpoints.
- HTTP/HTTPS Checks: Route 53 pings your endpoint. If it gets a non-200 response or times out, it marks the endpoint as unhealthy.
- CloudWatch Alarms: Trigger health status changes based on metrics (e.g., CPU > 90%).
- Failover: When an endpoint is unhealthy, Route 53 stops sending traffic to it (if configured in the routing policy).
2. Route 53 Resolver
Route 53 Resolver enables hybrid cloud DNS between on-premises networks and AWS VPCs.
- Inbound Endpoints: Allow on-premises systems to resolve DNS records in AWS.
- Outbound Endpoints: Allow AWS resources to resolve DNS records from on-premises environments.
Use Cases
The following are the use cases of Amazon Route 53:
- High Availability And Reliability: Amazon Route 53 uses a global network of DNS servers to provide fast, reliable, and highly available DNS resolution.
- Scalability: Route 53 can handle millions of DNS queries per second and automatically scales during high traffic periods.
- Traffic Management: It routes users to the most appropriate resources based on factors such as latency, geographic location, health checks, and routing policies.
- Health Checks And Failures: Route 53 monitors application endpoints and automatically redirects traffic to healthy resources if failures occur.
- Integration With Other AWS Services: Route 53 integrates seamlessly with AWS services like Amazon S3, Elastic Load Balancing, and Amazon CloudFront for scalable cloud architectures.
Limitations
Amazon Route53 is an AWS service that offers scalable and highly available DNS web service. It has many limitations aside of benefits. The following are some of the limitation of Amazon Route53:
- Geographical Load Balancing Limitations: Route 53 supports geographic routing, but it is not as advanced as dedicated global server load balancing solutions.
- Complex Configuration for Advanced Routing: Configuring routing policies such as latency-based or weighted routing can be difficult for beginners unfamiliar with DNS and AWS services.
- DDoS Protection Constraints: Route 53 can handle some DDoS attacks, but organizations with strict security requirements may need additional protection services.
- Basic Domain Registration Features: Route 53 provides basic domain registration features and lacks some advanced options like extensive TLD choices and enhanced privacy features.
Pricing
Route 53 uses a pay-as-you-go model:
- Hosted Zone: ~$0.50 per zone / month.
- Standard Queries: ~$0.40 per million queries.
- Latency/Geo Queries: ~$0.60 - $0.70 per million queries.
- Health Checks: ~$0.50 - $0.75 per check / month.
- Domain Registration: Varies (e.g., ~$12/year for .com).
Alternatives Of Amazon Route53
| Feature | Amazon Route 53 | GoDaddy / Namecheap | Cloudflare DNS | 
|---|---|---|---|
| AWS Integration | Native. (Alias records to ELB, S3, CloudFront). | Manual CNAME/IP entry. | Manual setup (though often good). | 
| Routing Policies | Advanced. (Latency, Geolocation, Failover). | Basic DNS routing | Advanced routing and load balancing | 
| Health Checks | Integrated with AWS resources. | Limited or paid add-on. | Yes, often paid. | 
| Latency | Ultra-low (Global Anycast network). | Varies. | Ultra-low (Global Anycast). | 
| Cost | Pay-per-use pricing | Often flat fee/free with domain. | Free tier available. | 
To Know How to Configure Amazon Route 53 In AWS refer this - Article

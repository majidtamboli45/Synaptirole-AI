# AWS CloudFront

> Source: https://www.geeksforgeeks.org/devops/aws-cloudfront/

AWS CloudFront is Amazon’s high-performance Content Delivery Network (CDN) service designed to accelerate the delivery of static and dynamic web content to users worldwide. CloudFront caches files in a global network of data centers. This dramatically reduces latency and improves load times.
- CloudFront delivers content from the nearest edge location to reduce response times.
- Employs hundreds of Edge Locations and Regional Edge Caches across major cities.
- Integrates directly with AWS WAF and AWS Shield for web exploit and DDoS protection.
- Optimizes API acceleration and dynamic application performance in addition to static content.
- Supports serverless code execution at edge locations using CloudFront Functions or Lambda@Edge.
Core Components
AWS CloudFront consists of three main architectural components:
- Origin: This is the source of truth for your content. It is the server where the original files are stored, such as an Amazon S3 bucket, Elastic Load Balancer (ELB), EC2 instance, or custom HTTP/S server.
- Edge Location: This is a data center in a global network, strategically located in major cities worldwide to cache copies of your content.
- Distribution: This is the core configuration that tells CloudFront how to deliver your content, including caching rules, origins, and security settings.
Content Delivery Workflow
The step-by-step process of delivering content to users globally is described below:
- User Request: A user requests a specific file (e.g., logo.jpg) from your website.
- DNS Routing: The request is routed by DNS to the closest CloudFront Edge Location.
- Cache Check: The local Edge Location checks its cache for the requested file.
- Cache Hit: If the file exists in the cache, CloudFront immediately delivers it to the user.
- Cache Miss: If the file is missing, the Edge Location forwards the request to the Origin server.
- Origin Response: The Origin server sends the requested file back to the Edge Location.
- Cache and Deliver: The Edge Location caches the file for future requests and delivers it to the user.
Key Features
- Cache Invalidation: Allows manual removal of cached files before their TTL expires to force updates.
- Origin Groups: Configures primary and secondary origins for high availability and automatic failover.
- Origin Access Control (OAC): Secures Amazon S3 buckets by ensuring they only accept traffic routed through CloudFront.
- Field-Level Encryption: Encrypts sensitive form data at the edge before sending it to the origin application.
Lambda@Edge vs. CloudFront Functions
Custom logic can be executed closer to users to modify request and response data at the edge.
| Feature | CloudFront Functions | Lambda@Edge | 
|---|---|---|
| Best For | High-volume, simple logic (URL/Header). | Complex logic, API calls, and Image processing. | 
| Runtime | Restricted JS (ES6/2.0 runtime). | Full Node.js and Python. | 
| Max Duration | < 2ms (strict limit). | Up to 5s (Viewer) / 30s (Origin). | 
| Max Memory | 2 MB. | 128 MB (Viewer) up to 10 GB (Origin). | 
| Network Access | No (Isolated sandbox). | Yes (Can call external APIs/DBs). | 
| Triggers | Viewer Request/Response only. | All 4 (Viewer/Origin Request/Response). | 
| Cost | ~$0.10 per 1M requests. | ~$0.60 per 1M requests + Duration. | 
AWS CloudFront and WAF Integration
AWS CloudFront integrates with AWS Web Application Firewall (WAF) to block malicious traffic at the edge before it reaches origin servers.
- AWS WAF: AWS WAF is a web application firewall service that protects web applications from common exploits and online threats. It allows organizations to define custom security rules to block malicious inputs like SQL injection and cross-site scripting (XSS).
- CloudFront Integration with WAF: Integrating AWS WAF with CloudFront relies on Web Access Control Lists (Web ACLs) deployed at edge locations. When a request is received, the Web ACL evaluates it against predefined security rules and either allows or blocks the traffic.
Web ACL Configurations
Web ACLs allow developers to filter traffic based on several request characteristics:
- Restrict or allow access based on specific IP ranges.
- Filter traffic using the values of custom HTTP headers.
- Detect and block SQL injection or cross-site scripting payloads.
- Allow or deny requests originating from specific countries.
Benefits of AWS WAF and CloudFront Integration
- Blocks malicious requests at the edge before they put load on origin servers.
- Only verified and clean traffic reaches backend environments.
- Enables specific, adaptable security rules tailored to application needs.
- Continuously monitors incoming traffic to help protect against modern web-based attacks and exploits.
Use Cases
AWS Content Delivery Network is widely adopted across various application architectures:
- Static Website Hosting: Serving static assets from Amazon S3 buckets securely with minimal latency.
- Video and Media Streaming: Delivering live and on-demand media globally using protocols like HLS.
- API Acceleration: Reducing API response times by caching dynamic responses closer to application clients.
- Software Distribution: Distributing installation files, patches, and updates globally.
- Security Boundary: Establishing a secure frontend perimeter using CloudFront and AWS WAF.
CloudFront vs. AWS Global Accelerator
A comparison of CloudFront and AWS Global Accelerator highlights their different architectural targets:
| Feature | AWS CloudFront | AWS Global Accelerator | 
|---|---|---|
| Purpose | Focuses on content caching | Focuses on network optimization | 
| Protocol Support | Works mainly with HTTP/HTTPS | Supports TCP and UDP | 
| Routing Method | Uses edge caching | Uses AWS global backbone routing | 
CloudFront vs. Other CDNs
The key differences between AWS CloudFront and alternative content delivery networks are summarized below:
| Feature | AWS CloudFront | Alternative CDNs (e.g., Cloudflare, Akamai) | 
|---|---|---|
| Provider Type | Amazon Web Services (AWS) | Independent providers specializing in global content routing | 
| Integration | Tightly integrated with AWS ecosystems like S3, WAF, Route 53, and Lambda | Compatible across multi-cloud and diverse hosting environments | 
| Customization | Offers extensive customization options via edge computing scripts | Provides standard out-of-the-box configurations and add-ons | 
Key Benefits of CDNs
Implementing a Content Delivery Network offers several operational advantages:
- Improved Website Performance: Reduces network latency by caching content close to the end-user, speeding up page load times.
- Enhanced Reliability: Distributes web traffic across multiple edge servers, preventing failures even if individual servers experience outages.
- Scalability: Absorbs sudden spikes in user traffic during events like product launches or news cycles without overloading origins.
- Advanced Security: Mitigates distributed denial-of-service (DDoS) attacks and encrypts communications using SSL/TLS.
- Cost Efficiency: Minimizes egress bandwidth fees from origin servers by serving cached content directly from the edge.
AWS CloudFront Pricing
The operational cost structure of AWS CloudFront depends on several components:
| Pricing Component | Description | Estimated Cost | 
|---|---|---|
| Data Transfer Out | Volume of data sent from edge locations to users over the internet. | Starts at $0.085 per GB for the first 10 TB/month in the U.S. and Europe regions. | 
| HTTP/HTTPS Requests | The quantity of request messages processed at edge locations. | Approximately $0.0075 per 10,000 HTTP requests and $0.0100 per 10,000 HTTPS requests in the U.S. region. | 
| Invalidation Requests | The manual removal of objects from cache prior to expiration. | First 1,000 invalidation paths free each month, then $0.005 per path. | 
| Real-Time Logs | Continuous logs delivered to streaming systems. | Typically billed at $0.01 per 1,000,000 log lines. | 
| Origin Shield | Centralized caching layer to protect origin capacity. | Approximately $0.0075 per 10,000 requests in the U.S. region. |

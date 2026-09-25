# What is Google Cloud CDN?

> Source: https://www.geeksforgeeks.org/cloud-computing/what-is-google-cloud-cdn/

Cloud CDN will cache the content at edge locations that are located around the world. By doing so, we can reduce the latency, which improves the performance of our applications. It will enable users to access the content from nearby edge locations, regardless of the app or website you have, there's a reasonable probability that your users are dispersed across the globe and aren't necessarily local to your servers.
This implies that the requests go over a wide area of the public internet, resulting in unpredictable and annoying user experiences. In this situation, Cloud CDN is useful.
Google Cloud CDN vs Cloudflare
| Feature | Google Cloud CDN | Cloudflare | 
|---|---|---|
| Network | Integrated with Google Cloud Platform | Operates independently of cloud providers | 
| Global Network | Utilizes Google's global network infrastructure | Operates its own global network | 
| Performance | Optimized for Google Cloud Platform services | Offers performance optimizations for any origin | 
| Pricing | Based on bandwidth and request volume | Offers multiple pricing plans and options | 
| Security | Integrates with Google Cloud security features | Provides DDoS protection and security services | 
| CDN Features | Provides caching, SSL termination, and logging | Offers additional features like WAF, DNS, etc. | 
| Customization | Limited customization options | Highly customizable configurations and rules | 
| Support | Offers Google Cloud support services | Provides dedicated support plans and options | 
What is Google Cloud CDN?
Cloud CDN is a content delivery network that uses Google's Global Edge Network to bring content as close to the user as possible. This accelerates the transmission of your site content and videos. It becomes simpler to grow to millions of users as a result of the decreased latency, expense, and stress on your backend servers.
Key Features of using Google Cloud CDN
Google Cloud CDN offers below features that enhance content delivery:
- Caching:The CDN caches content, at edge locations reducing the need to retrieve it from the origin server each time a user requests it. This results in content delivery.
- Global Network:With its network of data centers Google leverages this network to serve content from the nearest edge location minimizing data travel distance.
- SSL/TLS Support: Google Cloud CDN provides SSL/TLS termination, enabling content delivery through encryption.
- Integration with HTTP(S) Load Balancing: By integrating CDN with Google Clouds HTTP(S) Load Balancing service incoming traffic can be distributed across instances in regions while benefiting from the caching capabilities of CDN.
- Anycast IP Addresses: To optimize content delivery performance the CDN utilizes Anycast IP addresses to route users to their edge location.
- Real Time Purging: Easily. Remove content from the CDN cache to ensure users receive up to date information promptly.
- Distributed Denial of Service (DDoS) Protection: Google Cloud CDN includes built in DDoS protection to safeguard applications against attacks.
- Analytics and Monitoring: Gain insights, into your content delivery performance using Google Cloud Monitoring and Logging tools.
To set up Google Cloud CDN you need to configure your origin server (where your content is hosted) create a service that supports CDN and adjust cache behavior cache keys and other relevant settings. With the help of Google Cloud CDN you can greatly improve your applications user experience by delivering content to users in a fast and responsive manner.
Common Uses of Google Cloud CDN
- Improving Website Performance: Accelerating the delivery of web content such as images, videos, and static assets to users worldwide, resulting in faster website loading times and improved user experience.
- Global Content Distribution: Distributing content across Google's extensive network of edge locations worldwide, ensuring low-latency access to content for users regardless of their geographic location.
- Bandwidth Cost Reduction: Offloading traffic from origin servers by caching content at edge locations, reducing bandwidth consumption and lowering operational costs associated with serving content.
How Google Cloud CDN Work?
So, let's consider an app to understand how this works.
A user's request for your website or app is forwarded to the nearby Google Edge Node. For dependable and quick traffic flow, GCP has 120 of these. After that, the backend, origin, or the global HTTP(S) load balancer. We will then deliver the material directly from the cache after turning on Cloud CDN.
The cache is nothing more than a collection of servers that handle and store content that can be cached in order to respond more quickly to future requests for that content. The cached content, which commonly consists of web assets like JavaScript, CSS, pictures, and videos, is a duplicate of the cachable content that is kept on your origin servers.
With the click of a single checkbox, Cloud CDN may automatically cache this material using the suggested cache modes for all static content. By configuring HTTP headers on your answers, you can direct Cloud seeding CDN if you require additional control. Also, you can make sure that all content is cached. Just be aware that the private, no-store, and no-cache directives in the cache control response headers are disregarded by this. When Cloud CDN receives a request, it uses the cache key—typically the URI—to find the content that has already been cached. However, this cache key can be modified to eliminate protocol posts or query strings.
If a cached response to the user's request is discovered in the Cloud CDN cache, the response is retrieved and provided to the user. It's known as a cache hit. Shortening the round trip time and avoiding the origin server needing to handle the request when a cache hit happens, Cloud CDN examines the content byte's cache key and responds directly to the user.
The Cloud CDN cannot satisfy the initial request for a piece of material from the cache since it does not yet have it. It's known as a cache miss. The Cloud CDN could try to get the material from the close-by cache when a cache miss occurs. The content is sent to the first cache using cache-to-cache fill if the nearby cache contains it. If not, the request is simply routed through the origin server.
The TTLs, or time to live values, set by the cache directives from each HTTP response, or cache mode, determine the maximum lifespan of the object in cache. Content is removed from catch once the TTL has passed.
How Do You Use Google Cloud CDN?
You can set up Cloud CDN by
- Cloud Command Line interface,
- Could Cl, or
- The APIs.
While routing, health checking, and Anycast support are provided by Google Cloud global external HTTP(S) load balancers, it is simple to enable Cloud CBN when configuring the backends or the origins by just clicking a box. Google Cloud Storage's Cloud CDN makes handling web and media files much more straightforward. You just set up a load balancer, enable caching, and upload your content to a bucket. You likely have services that are on-prem or in other clouds if you're like many of our clients. Cloud CDN and HTTP(S) load balancing also support external backends to enable these hybrid systems.
Anycast & QUIC
Now, let's get into the specifics. Single IPs with worldwide reach are offered via global Anycast IPs. It enables Google Cloud to automatically direct users to the closest edge cache rather than relying on DNS propagation delays, which can reduce availability. Moreover, it supports the fast protocol between caches and end-to-end HTTP.
For lossy mobile networks, QUIC is the best multiplex-to-stream transport over UDP since it lowers latency.
Security with Cloud CDN
In order to support an end-to-end encrypted experience, data is encrypted both at rest and in transit from Google Cloud load balancing to the backend. To only allow authorized users access to a video section, you can programmatically sign URLs and cookies. The request that shouldn't get through is immediately denied when the signature has been checked at the CDN Edge. On a larger scale, you can use Google managed certs to provide SSL for free. Finally, use Cloud CDN to automatically cache static material with a click of a button to enhance performance and lower serving costs for frequently visited content. Do you wish to know more about Cloud CDN? Visit cloud.google.com/cdn to learn more.
Google Cloud CDN Pricing
Google Cloud CDN charges based on usage it follows the pay-as-you-go model mentioned below.
- Amount of data transferred: While we are using google cloud CDN there will be data transfer from edge servers to the end users so the google cloud will charge based on the amount of data transferred from the edge location to the end user.
- Integration with other services: Google Cloud CDN will also charge based upon the integration with other services provided by google cloud CDN. Mainly the google cloud CDN will be integrated with the load balancing service.
- Based on encryption: When the content is delivered from the edge locations to the end user who is accessing it the content must be encrypted. Google Cloud CDN supports SSL/TLS certificates for secure-content delivery.
Cache Egress:
- <10 TiB: Starting at $0.08 per GiB per month
- 10 TiB-150 TiB: Starting at $0.055 per GiB per month
- 150 TiB-500 TiB: Starting at $0.03 per GiB per month
- >500 TiB: Contact us for a volume-based discount
Cache Fill:
- Within North America or Europe: $0.01 per GiB
- Within each of Asia Pacific, South America, Middle East, Africa, and Oceania: $0.02 per GiB
- Inter-region cache fill (e.g., between Asia Pacific and North America): $0.04 per GiB
Lookup Requests:
- HTTP/HTTPS cache lookup requests: $0.0075 per 10,000 requests
Google Cloud CDN API
The Google Cloud CDN API allows developers to programmatically manage and control Google Cloud CDN resources, such as caching configurations, SSL policies, and cache invalidation. It enables automation of tasks related to configuring and managing CDN services within Google Cloud Platform (GCP) projects. Using the API, developers can integrate CDN functionality into their applications, automate deployments, and perform advanced configurations to optimize content delivery performance and reliability.
Google Cloud CDN CORS
Google Cloud CDN does not directly handle Cross-Origin Resource Sharing (CORS) configurations. CORS is typically managed at the origin server level, where the content originates. However, you can configure CORS headers at the origin server to allow or restrict access to resources served through Google Cloud CDN. By setting appropriate CORS headers, you can control which origins are allowed to access your resources and define the HTTP methods that are permitted for cross-origin requests.
To configure CORS headers for resources served through Google Cloud CDN, you would typically configure these settings on the origin server or use a content delivery service like Cloud Storage or Cloud Storage for Firebase, which allows you to specify CORS configurations for your stored objects. Once the appropriate CORS headers are set, Google Cloud CDN will honor these settings when serving content to clients.
Getting started with cloud CDN
For detailed steps and comprehensive guidance, please refer to the following link

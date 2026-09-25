# API Gateway

> Source: https://www.geeksforgeeks.org/system-design/what-is-api-gateway-system-design

An API Gateway is a centralized entry point that manages client requests and directs them to the appropriate backend services. It simplifies communication between clients and multiple microservices while enforcing security and performance policies.
- Routes client requests, handles authentication and rate limiting, while acting as a reverse proxy to hide internal service complexity.
- Provides a single, unified API interface that simplifies communication between clients and multiple backend services.
Example: In an e-commerce system, a single API Gateway can route requests for product details, user orders, and payment processing to separate microservices, while also checking user authentication and limiting request rates.
In the above diagram:
- User will send the request from mobile or web application.
- API Gateway will determine which request is coming.
- Authentication means the user need to proof their identity to the server or client, by providing there User_Id and Password. For example: Login or Signup page.
- SSL full form Secure Socket Layer, it is used to establish an encrypted link between a server and a client.
- It provides the ability to perform protocol translation, where incoming requests are translated from one channel to another.
- When a request is aggregated, the API Gateway sends requests to multiple backend services and combines their responses into a single result for the client. This reduces client requests but may increase latency as it waits for all services to respond.
Working
Let us see how API Gateway works:
- Routing: Directs client requests to the appropriate service based on URL, method, or headers.
- Protocol Translation: Converts requests between protocols (e.g., HTTP to gRPC/WebSocket).
- Request Aggregation: Combines multiple backend service calls into a single response, reducing client-side requests. However, it may increase latency as the gateway waits for responses from multiple services before returning the final result.
- Authentication & Authorization: Validates user identity and access permissions.
- Rate Limiting & Throttling: Controls request traffic to prevent abuse and ensure system stability.
- Load Balancing: Distributes requests across multiple service instances for better scalability.
- Caching: Stores frequently accessed responses to improve performance.
- Monitoring & Logging: Captures metrics and logs for observability and debugging.
Working of API Gateway with Microservices and Monolith Architecture
The way an API Gateway works with microservices differs from how it works with a monolithic architecture in several key aspects:
| Monolithic Architecture | Microservices Architecture | 
|---|---|
| Routes requests to different modules within a single application based on URL or logic | Routes requests to multiple independent microservices, acting as a “front door” | 
| Service discovery is not required since all components exist in one codebase | Uses service discovery to dynamically locate and route to services | 
| Handles authentication and authorization centrally with simpler access control | Handles authentication centrally, but authorization can be more complex across services | 
| Load balancing is simpler, usually across identical application instances | Load balancing is more complex across multiple services and their instances | 
| Fault tolerance is less complex as failures are within a single system | Fault tolerance is critical; failures must be isolated to avoid system-wide impact | 
API Gateway with Microservices Example
A real-world pattern where the API Gateway acts as a single entry point to efficiently manage and coordinate multiple microservices behind the scenes.
Example: Consider an e-commerce system built using microservices, where separate services handle user management, product catalog, shopping cart, and order processing. Clients interact with the system through a web or mobile application via a single API Gateway.
Explanation of the diagram
- Client sends request (e.g., view product or place order) to the API Gateway
- API Gateway authenticates the user and routes the request to the relevant microservice(s)
- It may aggregate responses (e.g., product + reviews + price) before sending back
- Final response is returned to the client through the API Gateway
API Gateway with Monolith Example
A simplified approach where the API Gateway enhances a single unified application by managing external requests and applying common functionalities.
Example: Consider a traditional e-commerce monolithic application where all functionalities (user, product, order, payment) exist within a single codebase. The API Gateway still acts as a central entry point to manage requests and apply cross-cutting concerns.
Explanation of the diagram
- Client sends request (e.g., login, view product, place order) to the API Gateway
- API Gateway handles authentication, caching, and request transformation
- It routes the request to the appropriate module within the monolith
- The monolithic application processes the request and returns a response via the API Gateway
Best practices for implementation
Below are the best practices for API Gateway:
- Security: Use SSL/TLS for encryption, implement strong authentication and authorization, and apply IP whitelisting and rate limiting to prevent abuse.
- Performance Optimization: Improve response time using caching, request/response compression, and efficient routing.
- Scalability: Design for horizontal scaling, use load balancing, and monitor system metrics to scale resources as needed.
- Monitoring & Logging: Track performance metrics, integrate with centralized logging systems, and maintain detailed logs for debugging.
- Error Handling: Implement robust error handling and use standardized error codes and messages for consistency.
- Versioning & Documentation: Maintain backward compatibility with versioning and keep API documentation up to date for developers.
Challenges
API Gateways can introduce several challenges, especially in complex environments or when not properly configured. Some common challenges include:
- Performance Bottlenecks: Can become a bottleneck or single point of failure under high traffic if not properly designed.
- Increased Latency: Additional processing like routing, authentication, and transformations can slow down requests.
- Complexity: Managing and configuring the gateway becomes difficult with many services and endpoints.
- Security Risks: Misconfiguration can lead to vulnerabilities like improper authentication or data exposure.
- Scalability Challenges: Scaling the gateway efficiently in dynamic, high-demand environments can be challenging.
Popular API Gateway Solution
Some API Gateway Solution:
1. Amazon API Gateway
It is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale. It supports RESTful APIs as well as WebSocket APIs for real-time communication.
2. Apigee
It now part of Google Cloud, is a platform that enables organizations to design, secure, deploy, monitor, and scale APIs. It offers features like API analytics, API monetization, and developer portal management.
3. Kong
It is an open-source API Gateway and microservices management layer. It is built on top of Nginx and provides features like request routing, authentication, rate limiting, and logging.
4. Microsoft Azure API Management
It is a fully managed service that helps organizations publish, secure, and manage APIs. It offers features like API gateway functionality, developer portal management, and API versioning.
5. Apache APISIX
Apache APISIX is a top-level project of the Apache Software Foundation, with 15K+ stars on GitHub and over 460 contributors. Known for its high performance, cloud-native architecture, and rich plugin ecosystem, APISIX has become one of the leading API gateways.

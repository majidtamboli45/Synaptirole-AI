# Communication Protocols in System Design

> Source: https://www.geeksforgeeks.org/system-design/communication-protocols-in-system-design

Communication protocols define the rules for how different components in a distributed system exchange messages. They ensure smooth coordination and reliable interaction between services. Choosing the right protocol helps build scalable and efficient systems.
- Enables seamless communication and coordination between services.
- Improves system reliability, scalability, and performance.
Synchronous Communication
Synchronous communication is a pattern where one service sends a request to another service and waits for a response before continuing. This follows a request-response model and is commonly used in microservices.
- HTTP Request-Response: Services communicate using HTTP (REST APIs) or SOAP, and wait for a response.
- RPC (Remote Procedure Call): Services use frameworks like gRPC to call remote functions and wait for results.
- Synchronous Messaging: Some brokers support request-response messaging where the sender waits for a reply.
Example: A user service sends a request to a payment service and waits for confirmation before completing the transaction.
Microservices development and debugging can be made easier using synchronous communication since its request-response structure makes it simpler to understand and control.
Applications
The applications of Synchronous Communication are:
- Real-Time Messaging Applications: WhatsApp/Slack use asynchronous messaging with event-driven delivery, not strict request-response communication.
- Database Operations: Suitable for operations requiring immediate confirmation, like reading or updating critical data in transactional systems.
- Payment Gateways: Ensures immediate feedback for payment authorization or failure in online transactions.
- APIs Requiring Immediate Response: Services like authentication APIs or search queries that require instant results.
- Video Conferencing and Calls: Video conferencing tools like Zoom/Google Meet use real-time streaming protocols like WebRTC, not standard request-response APIs.
- Remote Procedure Calls (RPCs): Often employed when one service needs an immediate response from another, as in microservices-based systems.
Challenges
The challenges of Synchronous Communication are:
- Latency: Synchronous communication can introduce latency, especially if services are waiting for responses from slow or unresponsive services.
- Blocking Nature: Services can become blocked if they are waiting for a response, potentially leading to performance issues.
- Complexity: While simpler than asynchronous communication, synchronous communication can still add complexity, especially in large microservices architectures.
- Error Handling: Error handling in synchronous communication can be more challenging, as services need to deal with immediate failures.
- Scalability: Synchronous communication can be less scalable than asynchronous communication, as services need to handle more concurrent connections and requests.
Asynchronous Communication
Asynchronous communication is a pattern where services send messages without waiting for an immediate response. This allows services to work independently and improves scalability and flexibility in distributed systems.
- Services communicate asynchronously using message queues and event-driven/pub-sub systems (e.g., RabbitMQ, Kafka), where messages are processed later by consumers.
- Publishers emit events that are broadcast to multiple subscribers, enabling decoupled and reactive service communication without direct interaction.
Example: An order service sends a message to a queue after placing an order, and payment and notification services process it later without blocking the user.
Purpose
The purposes of Asynchronous Communication are:
- Scalability: permits microservices to manage several requests at once without being blocked, which promotes scalability.
- Fault Tolerance: Decoupling services improves fault tolerance by preventing the rapid impact of one service failure on others.
- Resilience: Improves resilience by allowing services to buffer and retry messages in case of transient failures.
Challenges
The challenges of Asynchronous Communication are:
- Complexity: Asynchronous communication increases complexity by requiring extra error-handling, retrying, and message buffering techniques.
- Eventual Consistency: Asynchronous communication may eventually cause consistency problems because services may use data that is out-of-date or stale.
- Debugging and Monitoring: Because the message flow may not always be obvious, debugging and monitoring asynchronous systems might be more difficult than synchronous systems.
- Message Ordering: In asynchronous systems, it can be difficult to guarantee proper message ordering, particularly when dealing with distributed systems and eventual consistency.
Differences between Synchronous and Asynchronous Communication
Below are the differences between Synchronous and Asynchronous Communication:
| Synchronous Communication | Asynchronous Communication | 
|---|---|
| Real-time communication where services wait for a response | Communication where services do not wait for a response | 
| Services block execution until a response is received | Services continue execution without waiting | 
| Requires both services to be available at the same time | Services can operate independently at different times | 
| Examples: HTTP, REST, RPC | Examples: Message Queues, Event-Driven Systems | 
| Less flexible due to tight coupling | More flexible due to loose coupling | 
| Simpler to implement and understand | More complex due to queues and message handling | 
| Less scalable due to blocking nature | Highly scalable with parallel processing | 
| Easier error handling (immediate response) | Complex error handling (delayed or async) | 
| Best for real-time request-response use cases | Best for background processing and high-load systems | 
Factors to consider for choosing right communication protocol
When choosing the right communication protocol, you need to consider whether your system needs synchronous or asynchronous communication. Here's how to decide:
Response Time Requirements: Decide based on how quickly a response is needed.
- Synchronous: Use when immediate response is required (e.g., user-facing apps)
- Asynchronous: Use when delays are acceptable and tasks can run in background
System Decoupling: Consider how independent your services should be.
- Synchronous: Suitable for tightly coupled systems
- Asynchronous: Ideal for loosely coupled, independent services
Scalability Needs: Evaluate how well the system should handle growth.
- Synchronous: May face bottlenecks under heavy load
- Asynchronous: Better scalability with load distribution
Reliability & Fault Tolerance: Check how the system behaves during failures.
- Synchronous: Depends on all services being available
- Asynchronous: More reliable as tasks can be queued and retried
Real-Time vs Batch Processing: Choose based on timing requirements of tasks.
- Synchronous: Best for real-time operations (e.g., live interactions)
- Asynchronous: Suitable for background or batch jobs
Bandwidth & Resource Constraints: Consider system resource usage.
- Synchronous: Requires continuous connection and higher resources
- Asynchronous: Uses fewer resources with queued processing

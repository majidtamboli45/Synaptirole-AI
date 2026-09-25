# Simple Queue Service(SQS)

> Source: https://www.geeksforgeeks.org/devops/aws-sqs/

Modern distributed applications often experience traffic spikes, service failures, or uneven workloads. Amazon Simple Queue Service (SQS) is a fully managed message queuing service that helps applications remain reliable by acting as a buffer between services, enabling asynchronous message processing while decoupling and scaling microservices, distributed systems, and serverless applications without losing data.
- Eliminates direct dependency bottlenecks by allowing application components to send and retrieve messages independently.
- Automatically scales to handle varying workloads without requiring manual infrastructure management or provisioning.
- Stores messages redundantly across multiple AWS Availability Zones to ensure high availability and durability.
- Supports FIFO (First-In-First-Out) queues for ordered message processing and message deduplication.
- Uses a flexible pay-as-you-go pricing model with a free tier that includes up to one million requests per month.
Lifecycle
Understanding SQS requires knowing the step-by-step lifecycle of a message as it moves through a distributed system:
- Producer Sends Message: A producer (such as a web server) sends a message payload to an SQS queue. The message natively supports text payloads (JSON, XML, or plain text) up to 256 KB in size.
- Message Storage: SQS redundantly distributes and stores the message across multiple SQS servers for high availability and durability.
- Consumer Polls: A consumer (such as an EC2 instance or AWS Lambda function) polls the queue and retrieves the message.
- Visibility Timeout (In-Flight): When a message is retrieved, SQS starts a Visibility Timeout clock (defaulting to 30 seconds). During this period, the message is kept in the queue but is "invisible" to other polling consumers to prevent double-processing.
- Success Deletion: If the consumer processes the message successfully, it issues a "DeleteMessage" API call using the receipt handle to permanently purge the message from the queue.
- Failure Recovery: If the consumer crashes or fails before deleting the message, the Visibility Timeout expires, and the message automatically becomes visible again in the queue for another consumer to process.
Architecture
- In a distributed messaging environment, SQS operates on three primary architectural elements: producers, distributed queues, and consumers.
- Multiple producers send messages simultaneously to the queue, which is distributed across several Amazon SQS servers.
- Consumers continuously poll these servers to retrieve, process, and delete messages, guaranteeing redundancy and eliminating single points of failure.
Key SQS Features
1. Dead Letter Queues (DLQ):
A DLQ is a secondary queue targeting messages that repeatedly fail to process. If a message cannot be successfully consumed after a configured maximum receive count (e.g., 5 attempts), SQS moves it to the DLQ. This prevents "poison pill" messages (messages with bad payloads that crash consumers) from blocking main queue traffic.
2. Long Polling vs. Short Polling:
- Short Polling (Default): The receive message request queries only a subset of SQS servers and returns immediately, even if no messages are found. This can result in empty responses and higher API transaction costs.
- Long Polling: SQS waits up to 20 seconds for a message to arrive in the queue before sending a response. It is highly recommended to configure "WaitTimeSeconds > 0" to minimize empty API responses and lower transaction costs.
3. Delay Queues: This configuration postpones the delivery of newly added messages to the queue for a specified duration (up to 15 minutes). This is useful when background tasks require an initial cooling-off period before running.
4. Batch Operations: To reduce network overhead and lower transactional costs, SQS supports sending, receiving, and deleting messages in batches of up to 10 messages (or up to 256 KB) per single API call.
Security Features
- Server-Side Encryption (SSE) using AWS KMS
- IAM policies for fine-grained access control
- Queue access policies for cross-account access
- HTTPS endpoints for secure data transmission
- Integration with AWS CloudTrail for auditing API activity
Creation of AWS SQS Queues
Step 1: Open the AWS Management Console, search for SQS in the top search bar, and select Amazon Simple Queue Service from the results.
Step 2: Click on the Create Queue button.
Step 3: Choose either a Standard queue or a FIFO queue.
Step 4: Enter the queue name and configure settings such as visibility timeout, delivery delay, and message retention period.
Step 5: Click Create Queue to deploy the queue successfully.
Step 6: Verify that the queue has been created successfully by checking the queue list page
Use Cases
- Batch Processing: Manages high-volume data workloads—such as image transcoding, generating reports, or data ingestion—by allowing multiple workers to process tasks concurrently.
- Decoupled Microservices: Acts as the asynchronous communication link in microservice architectures, allowing services to pass messages without requiring direct knowledge of each other.
- E-commerce Order Workflows: Manages order placement spikes by buffering orders in a queue, allowing checkout workers to process them sequentially without dropping data.
- Notification Pipelines: Buffers and coordinates alert messages or push notifications across multi-tier application environments.
AWS SQS Queue Types
Selecting the correct queue type is a foundational architectural decision that impacts throughput, ordering, and data deduplication:
| Standard Queue (Default) | FIFO Queue (.fifo) | 
|---|---|
| Nearly infinite API transactions per second. | Supports up to 3,000 transactions per second (when using batching). | 
| Best-effort ordering (messages are occasionally delivered out of order). | First-In-First-Out ordering (messages are strictly processed in order). | 
| At-least-once delivery (occasional message duplication is possible). | Exactly-once delivery (built-in deduplication guarantees no duplicate messages). | 
| Best for decoupling microservices, high-volume logs, and generic batching. | Best for financial transactions, flight booking, and inventory updates. | 
| Can use any valid name (e.g., my-queue). | Must end in the `.fifo` suffix (e.g., my-queue.fifo). | 
Pricing Model
SQS operates under a pay-as-you-go pricing model with a generous free tier:
- Free Tier: The first 1 million requests are free every month.
- Standard Queues: Charged at approximately $0.40 per 1 million requests after the free tier.
- FIFO Queues: Charged at approximately $0.50 per 1 million requests.
- Data Egress: Data transferred out to the internet is subject to standard AWS transfer rates; transfers to EC2 or Lambda in the same region are free.
Note: An SQS request constitutes any single API action (such as Send, Receive, or Delete). Using SQS batch operations allows up to 10 messages to count as a single API request, optimizing costs.
AWS SQS Command Line Interface (CLI)
The AWS CLI allows you to manage queues and interact with messages directly from the terminal. Common commands include:
1. Creating a FIFO Queue
aws sqs create-queue \  --queue-name MyQueue.fifo \  --attributes FifoQueue=true
2. Listing Active Queues
aws sqs list-queues
3. Sending a Message to a Standard Queue
aws sqs send-message \  --queue-url https://sqs.<region>.amazonaws.com/123456789012/MyQueue \  --message-body "This is my message"
4. Sending a Message to a FIFO Queue
aws sqs send-message \  --queue-url https://sqs.<region>.amazonaws.com/123456789012/MyQueue.fifo \  --message-body "This is my ordered message" \  --message-group-id "Group1" \  --message-deduplication-id "UniqueDeduplicationId123"
5. Receiving a Message
aws sqs receive-message \  --queue-url https://sqs.<region>.amazonaws.com/123456789012/MyQueue
6. Deleting a Message
aws sqs delete-message \  --queue-url https://sqs.<region>.amazonaws.com/123456789012/MyQueue \  --receipt-handle "ReceiptHandlePlaceholder"
7. Modifying Queue Attributes
aws sqs set-queue-attributes \  --queue-url https://sqs.<region>.amazonaws.com/123456789012/MyQueue \  --attributes VisibilityTimeout=60

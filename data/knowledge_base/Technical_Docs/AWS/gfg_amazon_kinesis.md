# Amazon Kinesis

> Source: https://www.geeksforgeeks.org/devops/what-is-amazon-kinesis/

Amazon Kinesis is a fully managed cloud platform on AWS designed to collect, process, and analyze real-time, streaming data.
- Ingests and processes streaming data in real-time, delivering actionable metrics with minimal delay.
- Adapts capacity dynamically to accommodate fluctuating stream volumes and high-throughput workloads.
- Serves as a highly available, distributed buffer between diverse message producers and target consumers.
- Eliminates the administrative overhead of configuring, patching, and maintaining physical storage clusters.
- Works natively with analytical frameworks, databases, and visualization tools inside the AWS cloud.
Amazon Kinesis Operational Stages
The standard lifecycle of a real-time Kinesis data processing pipeline operates across four sequential stages:
- Data Ingestion: Gathers and imports live data streams from source devices (e.g., clickstreams, telemetry, or server logs) in diverse formats like JSON or raw binary.
- Sharding and Scaling: Groups and distributes incoming records into manageable storage divisions called shards to ensure horizontal scaling and parallel processing.
- Processing and Buffering: Segregates, aggregates, and transforms the streaming records to prep them for down-stream database indexing.
- Data Accessibility: Exposes processed stream records to analytical consumers using native APIs, serverless functions, or structured SQL engines.
Detailed Breakdown
The Amazon Kinesis platform comprises four specialized services, each addressing a distinct requirement within the real-time data streaming lifecycle:
Amazon Kinesis Data Streams (KDS): KDS is a highly scalable, real-time buffering service that ingests gigabytes of data per second from thousands of source applications.
- Throughput Capacity (Shards): Composed of individual Shards. One shard supports an ingest rate of 1 MB/sec (or 1,000 records/sec) and an egress rate of 2 MB/sec.
- Data Retention Policy: Stores data records for 24 hours by default, with extensions available up to 365 days.
- Replayability: Unlike message queues, retrieving a stream record does not delete it. Multiple independent consumer applications can read and process the same stream concurrently.
- Ordering Guarantee: Strictly guarantees first-in-first-out ordering of streaming data logs at the individual shard level.
Amazon Data Firehose (ADF): Formerly known as Kinesis Data Firehose, ADF is a fully managed, serverless delivery stream designed to load real-time streaming data directly into target storage vaults.
- Zero Administration: Automatically scales matching the incoming data volume with zero infrastructure provisioning.
- Automated Delivery: Loads ingested data directly into destination repositories including Amazon S3, Amazon Redshift, Amazon OpenSearch Service, Splunk, or Datadog.
- Data Transformation: Integrates with AWS Lambda to automatically transcode or convert incoming JSON records into formats like Apache Parquet or ORC on-the-fly.
Amazon Managed Service for Apache Flink: Formerly known as Kinesis Data Analytics, this fully managed service enables developers to process, aggregate, and analyze streaming data continuously using standard SQL or Apache Flink.
- Continuous Analytics: Queries streaming records continuously over custom sliding-time windows (e.g., tracking average sensor telemetry over 5-minute segments).
- Output Routing: Forwards processed alert metrics or anomaly logs directly to other S3 buckets, KDS streams, or Data Firehose destinations.
Amazon Kinesis Video Streams: A secure, fully managed ingestion platform built to stream live media, audio, and depth map data from connected devices into AWS.
- AI/ML Vision Integration: Integrates seamlessly with computer vision models like Amazon Rekognition to execute facial recognition and object detection.
- WebRTC Support: Relies on high-speed, peer-to-peer WebRTC frameworks to establish low-latency, two-way media streaming connections.
Comparison Table
The table below compares the specific roles and characteristics of each service in the Kinesis ecosystem:
| Service | Primary Use Case | Key Capability | When to Choose | 
|---|---|---|---|
| Kinesis Data Streams (KDS) | Ingesting and processing custom real-time streams with sub-second latency. | Capacity managed by Shards (1 MB/s write; 2 MB/s read). | When you need custom real-time applications and multiple consumers reading the same stream independently. | 
| Amazon Data Firehose (ADF) | Capturing, transforming, and loading streams into databases and data lakes. | Zero administrative serverless configuration. | When you want to load logs or streaming data directly into S3, Redshift, OpenSearch, or Splunk with zero code. | 
| Managed Service for Apache Flink | Querying and performing complex analysis on live data streams. | Executing continuous SQL or Apache Flink streaming queries. | When you need to filter, aggregate, or calculate real-time window metrics from a live stream. | 
| Kinesis Video Streams | Ingesting, processing, and index storing of media feeds. | WebRTC low-latency streaming and media playback. | When you are streaming live audio, video, or camera sensor data from IoT devices for ML analytics. | 
Use Cases
- Real-Time Application Monitoring: Consolidates microservice system logs and operational metrics, offering live analytics dashboards to isolate runtime errors instantly.
- Fraud Detection and Prevention: Audits credit card transaction streams to identify fraudulent telemetry and block security violations before transactions execute.
- Personalized Marketing Recommendations: Examines live website user clickstreams, instantly generating and displaying personalized item recommendations.
- IoT Analytics and Predictive Maintenance: Aggregates and parses hardware sensor data from industrial machinery to schedule proactive, predictive maintenance.
Amazon Kinesis Pricing Models
- Provisioned Mode (KDS): Charged a baseline rate per active Shard Hour, alongside transactional fees per 1 million PUT Payload Units.
- On-Demand Mode (KDS): Scales capacity automatically, with billing based on the volume (GB) of data ingested and retrieved with no baseline shard fees.
- Data Firehose: Standard pay-as-you-go pricing billed strictly per gigabyte (GB) of data processed.
- Video Streams: Charged based on the volume (GB) of media data ingested, stored, and subsequently retrieved.

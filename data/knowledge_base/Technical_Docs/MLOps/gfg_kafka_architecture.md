# Kafka Architecture

> Source: https://www.geeksforgeeks.org/apache-kafka/kafka-architecture

Apache Kafka is a distributed streaming platform designed for building real-time data pipelines and streaming applications. It is known for its high throughput, low latency, fault tolerance and scalability. This article delves into the architecture of Kafka, exploring its core components, functionalities and the interactions between them.
Real-World Use Cases of Kafka
Apache Kafka is a versatile platform used in various real-world applications due to its high throughput, fault tolerance and scalability. Here, we will explore three common Kafka architectures: Pub-Sub Systems, Stream Processing Pipelines and Log Aggregation Architectures.
1. Pub-Sub Systems
In a publish-subscribe (pub-sub) system, producers publish messages to topics and consumers subscribe to those topics to receive the messages. Kafka's architecture is well-suited for pub-sub systems due to its ability to handle high volumes of data and provide reliable message delivery.
Key Components
- Producers: Applications that send data to Kafka topics.
- Topics: Logical channels to which producers send data and from which consumers read data.
- Consumers: Applications that subscribe to topics and process the data.
- Consumer Groups: Groups of consumers that share the load of reading from topics.
A real-world example of a pub-sub system using Kafka could be a news feed application where multiple news sources (producers) publish articles to a topic and various user applications (consumers) subscribe to receive updates in real-time.
2. Stream Processing Pipelines
Stream processing pipelines involve continuously ingesting, processing and transforming data in real-time. Kafka's ability to handle high-throughput data streams and its integration with stream processing frameworks like Apache Flink and Apache Spark make it ideal for building such pipelines.
Key Components
- Producers: Applications that send raw data streams to Kafka topics.
- Topics: Channels where raw data is stored before processing.
- Stream Processors: Applications or frameworks that consume raw data, process it and produce transformed data.
- Sink Topics: Topics where processed data is stored for further use.
3. Log Aggregation Architectures
Log aggregation involves collecting log data from various sources, centralizing it and making it available for analysis. Kafka's durability and scalability make it an excellent choice for log aggregation systems.
Key Components
- Log Producers: Applications or services that generate log data.
- Log Topics: Kafka topics where log data is stored.
- Log Consumers: Applications that read log data for analysis or storage in a centralized system.
A real-world example of a log aggregation architecture using Kafka could be a microservices-based application where each microservice produces logs. These logs are sent to Kafka topics and a centralized logging system (like ELK Stack) consumes the logs for analysis and monitoring.
Kafka's architecture supports various real-world applications, including pub-sub systems, stream processing pipelines and log aggregation architectures. Its ability to handle high-throughput data streams, provide fault tolerance and scale horizontally makes it a powerful tool for building robust and scalable data-driven applications.
Core Components of Kafka Architecture
- Kafka Cluster:
A distributed system of multiple Kafka brokers that ensures fault tolerance, scalability and high availability for real-time data streaming.
- Brokers:
Kafka servers that handle data storage and read/write operations and manage data replication for reliability.
- Topics & Partitions:
Data is organized into topics (logical channels), divided into partitions for parallelism and horizontal scalability.
- Producers:
Client applications that write data to Kafka topics, distributing records across partitions.
- Consumers:
Applications that read data from topics; consumer groups enable load balancing and fault tolerance.
- ZooKeeper:
Manages and coordinates Kafka brokers, handling configuration, synchronization and leader election.
- Offsets:
Unique IDs for each message in a partition, used by consumers to track read progress.
Kafka APIs
Kafka provides several APIs to interact with the system:
- Producer API: Allows applications to send streams of data to topics in the Kafka cluster. It handles the serialization of data and the partitioning logic.
- Consumer API: Allows applications to read streams of data from topics. It manages the offset of the data read, ensuring that each record is processed exactly once.
- Streams API: A Java library for building applications that process data in real-time. It allows for powerful transformations and aggregations of event data.
- Connector API: Provides a framework for connecting Kafka with external systems. Source connectors import data from external systems into Kafka topics, while sink connectors export data from Kafka topics to external systems.
Interactions in the Kafka Architecture
- Producers to Kafka Cluster: Producers send data to the Kafka cluster. The data is published to specific topics, which are then divided into partitions and distributed across the brokers.
- Kafka Cluster to Consumers: Consumers read data from the Kafka cluster. They subscribe to topics and consume data from the partitions assigned to them. The consumer group ensures that the load is balanced and that each partition is processed by only one consumer in the group.
- ZooKeeper to Kafka Cluster: ZooKeeper coordinates and manages the Kafka cluster. It keeps track of the cluster's metadata, manages broker configurations and handles leader elections for partitions.
The relationship between partitions, offsets and consumer groups in a Kafka-based system:
- Partitions: There are 3 partitions (Partition 0 ,1 and2 ), each storing records with unique offsets (0–6), indicating record positions.
- Consumer Group: Three consumers, each assigned to one partition:
- Consumer 1 → Partition 0, starts at offset 4
- Consumer 2 → Partition 1, starts at offset 2
- Consumer 3 → Partition 2, starts at offset 3
- Data Flow: Each consumer reads from its assigned partition starting at the given offset, ensuring all records are processed exactly once by the group.
Key Features of Kafka Architecture
- High Throughput and Low Latency: Kafka is designed to handle high volumes of data with low latency. It can process millions of messages per second with latencies as low as 10 milliseconds.
- Fault Tolerance: Kafka achieves fault tolerance through data replication. Each partition can have multiple replicas and Kafka ensures that data is replicated across multiple brokers. This allows the system to continue operating even if some brokers fail.
- Durability: Kafka ensures data durability by persisting data to disk. Data is stored in a log-structured format, which allows for efficient sequential reads and writes.
- Scalability: Kafka's distributed architecture allows it to scale horizontally by adding more brokers to the cluster. This enables Kafka to handle increasing amounts of data without downtime.
- Real-Time Processing: Kafka supports real-time data processing through its Streams API and ksqlDB, a streaming database that allows for SQL-like queries on streaming data.
Apache Kafka Frameworks
Kafka is a distributed streaming platform that can be extended and integrated with various frameworks to extend its capabilities and integrate with other systems. Some of the key frameworks in Kafka ecosystem include:
- Kafka Connect is a tool in the Kafka ecosystem that enables reliable and scalable data integration between Kafka and external systems like databases or file systems. It offers built-in connectors to simplify the process of moving data in and out of Kafka.
- Kafka Streams is a client library for building applications that process and analyze data in Kafka topics. It provides easy-to-use APIs for tasks like filtering, joining and aggregating streaming data.
3.Schema Registry (part of the Confluent Platform) is a centralized service that manages Avro schemas for Kafka messages, ensuring producers and consumers use compatible data formats during serialization and deserialization.
Kafka Topic Management
One of the fundamental aspects of working with Kafka is managing topics. Topics are the categories to which records are sent by producers and from which records are received by consumers.
1. Creating Topics
To create a topic in Kafka, you can use the kafka-topics.sh script, which is included in the Kafka distribution. Here is an example command to create a Kafka topic:
./bin/kafka-topics.sh --create --topic topic_name --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1
Command Explanation:
- --create : This flag is used to create a new topic.
- --topic topic_name : Specifies the name of the topic that needs to be created.
- --bootstrap-server localhost:9092 : Specifies the Kafka broker to connect to. You can replacelocalhost:9092 with your actual broker address.
- --replication-factor 1 : Specifies the replication factor for the topic, which indicates how many copies of each partition should be maintained. In this example, it is set to 1.
- --partitions 1 : Specifies the number of partitions for the topic. In this example, it is set to 1.
2. Topic Configurations
The Kafka topics have several configurations that determine their behavior. If no topic configuration is provided then the default server properties were used. You can create a topic using "kafka-topic" tool and "--config" option. We can modify the configuration using "kafka-configs" and "--alter" option.
Example: Creating a Topic with Configurations
./bin/kafka-topics.sh --create --topic topic_name --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --config retention.ms=604800000
Example: Modifying Topic Configurations
./bin/kafka-configs.sh --alter --entity-type topics --entity-name topic_name --add-config retention.ms=259200000
3. Topic Partitions and Replication
- Partitions: Topic partitions are a fundamental concept in Kafka that allow data to be parallelized and distributed among multiple brokers. Each partition is an ordered collection of messages that are immutable. When creating a topic, you specify the number of partitions using the --partitions flag.
- Replication: Kafka allows replication of data across multiple brokers to ensure data durability and fault tolerance. Each partition can have one or more replicas. Among these replicas, one serves as the leader and the others serve as followers. The leader handles all read and write requests for the partition, while the followers replicate the data. If the leader replica fails, one of the follower replicas is elected as the new leader. The replication factor is specified using the --replication-factor flag when creating a topic.
Example: Creating a Topic with Partitions and Replication
./bin/kafka-topics.sh --create --topic topic_name --bootstrap-server localhost:9092 --replication-factor 3 --partitions 4
Advantages of Kafka Architecture
- Decoupling of Producers and Consumers: Kafka decouples producers and consumers, allowing them to operate independently. This makes it easier to scale and manage the system.
- Ordered and Immutable Logs: Kafka maintains the order of records within a partition and ensures that records are immutable. This guarantees the integrity and consistency of the data.
- High Availability: Kafka's replication and fault tolerance mechanisms ensure high availability and reliability of the data.

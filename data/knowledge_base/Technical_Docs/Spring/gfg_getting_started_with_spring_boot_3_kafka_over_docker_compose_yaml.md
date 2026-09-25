# Getting started with Spring Boot 3, Kafka over docker with docker-compose.yaml

> Source: https://www.geeksforgeeks.org/advance-java/getting-started-with-spring-boot-3-kafka-over-docker-with-docker-composeyaml/

We will create two Spring Boot 3.x applications (Producer and Consumer) requiring Java 17 to get started. We need a queuing service to pass messages from the producer Spring service to the consumer Spring service. Here, we will use Kafka. Confluent provides Docker images that are easy to use for setting up the Kafka environment. Since we will use a Docker Compose file to start all three services (the two Spring applications and the Kafka environment with one broker and one Zookeeper), we will initially set up our Kafka environment using a docker-compose.yaml file.
Prerequisite
- Java 17 installed and configured in the command line
- Maven configured on the command line
- docker
- IDE
Setting up Kafka Environment
Step 1: Verify Docker Installation
Run the following command to check if Docker is installed and running properly:
docker info
Good to go to next step if you didn't get any errors or warning.
Step 2: Create Docker Compose File
Create file docker-compose.yaml
vi docker-compose.yaml
Paste the following configuration into the file and save it (press ESC, type :wq!, and press Enter if using vi/vim):
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    container_name: zookeeper
    environment:
      ZOOKEEPER_SERVER_ID: 1
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000
    ports:
      - "22181:2181"
  broker:
    image: confluentinc/cp-kafka:latest
    container_name: broker
    ports:
      - "9090:9090"
    depends_on:
      - zookeeper
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_AUTO_CREATE_TOPICS_ENABLE: "true"
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://broker:9090
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
      KAFKA_TRANSACTION_STATE_LOG_MIN_ISR: 1
      KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR: 1
Explanation:
- Pulls confluent zookeeper and broker images and starts in a container.
- Makes sure that zookeeper starts before broker and shutdowns after broker (depends_on property)
- PLAINTEXT://broker:9090 is kafka broker's address, which will be needed in spring boot applications to produce and consume.
Step 3: Start Kafka Environment
Now time to start our Kafka environment. Start the Kafka environment using Docker Compose:
docker compose up -d
Output:
Step 4: Verifying Running Containers
To view running containers, use following command:
docker container list
Note: We will be modifying this(docker-compose.yaml) file again once our spring applications are all setup.
Setting up Spring Boot Producer and Consumer Service
Step 1: Open Spring initializer and create 2 spring boot applications named consumer and producer with sync web and Kafka dependency.
Consumer Application Creation:
Producer Application Creation:
Download the zip file and open same with your IDE. There are several configuration and code we will be adding.
Producer Service Configuration
We are using topic name as topic-name and multiple partition can used.
Kafka Configuration Class:
@Configuration
public class KafkaConfig {
    @Value("${spring.kafka.bootstrap-servers}") String bootstrapServers;
    @Bean
    public ProducerFactory<String, MyMsg> producerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        config.put(ProducerConfig.ENABLE_IDEMPOTENCE_CONFIG, true);
        config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class.getName());
        return new DefaultKafkaProducerFactory<>(config);
    }
    @Bean
    public NewTopic taskTopic() {
        return TopicBuilder.name("topic-name")
                .partitions(1)
                .replicas(1)
                .build();
    }
    @Bean
    public KafkaTemplate<String, MyMsg> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }
}
MyMsg Class:
This is DTO that will be transferred serialized and transferred to Kafka broker.
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyMsg implements Serializable { 
    String msg;
    Integer id;
}
Kafka Producer Service:
Kafka Producer Service that uses KafkaTemplate to send the MyMsg object and returns Future object.
@Service
@Slf4j
public class KafkaProducerService {
    @Autowired
    KafkaTemplate<String, MyMsg> kafkaTemplate;
    public void send(String topicName, MyMsg value) {
        var future = kafkaTemplate.send(topicName, value);
        future.whenComplete((sendResult, exception) -> {
            if (exception != null) {
                future.completeExceptionally(exception);
            } else {
                future.complete(sendResult);
            }
            log.info(String.format("Task status send to Kafka topic : %s, Object: ", topicName)+ value);
        });
    }
}
Producer Controller:
A simple controller with one endpoint to test application that will trigger the message trigger object that we send.
@RestController
@RequestMapping("/api")
public class ProducerController {
    @Autowired
    KafkaProducerService kafkaProducerService;
    @PostMapping(value = "/produce")
    public ResponseEntity<Boolean> produce(@RequestBody MyMsg myMsg) {
        try {
            kafkaProducerService.send("topic-name", myMsg);
            return ResponseEntity.ok(Boolean.TRUE);
        } catch (Exception ex) {
            return ResponseEntity.ok(Boolean.FALSE);
        }
    }
}
application.properties:
server.port=9091
spring.kafka.bootstrap-servers=PLAINTEXT://broker:9090
Consumer Service Configuration
Kafka Configuration Class:
@Configuration
@EnableKafka
public class KafkaConfig {
    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;
    @Bean
    public ConsumerFactory<String, MyMsg> consumerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, JsonDeserializer.class.getName());
        config.put("spring.json.type.mapping", "com.gfg.producer.MyMsg:com.gfg.consumer.MyMsg");    // This config tells mapper that these two classes although in different package but are same.
        return new DefaultKafkaConsumerFactory<>(config);
    }
    @Bean
    public ConcurrentKafkaListenerContainerFactory<String, MyMsg> kafkaListenerContainerFactory(
            ConsumerFactory<String, MyMsg> consumerFactory) {
        ConcurrentKafkaListenerContainerFactory<String, MyMsg> factory = new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConsumerFactory(consumerFactory);
        return factory;
    }
}
Kafka Consumer Service:
@Service
@Slf4j
public class KafkaConsumerService {
    @KafkaListener(topics = {"topic-name"}, groupId = "topic-name")
    public void consume(MyMsg myMsg) {
        log.info(String.format("Received: " + myMsg));
    }
}
MyMsg Class:
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyMsg implements Serializable {
    String msg;
    Integer id;
}
application.properties:
# IMPORTANT: Since we are adding PLAINTEXT://broker:9090 as broker-server URL,
# if you start the consumer service outside the kafka_network, it will not be able to connect to the broker.
# Hence, the service will not start outside the Docker container network.
server.port=9092
spring.kafka.bootstrap-servers=PLAINTEXT://broker:9090
Containerization of both Spring Application
Create a Dockerfile in the root path of both Spring Boot applications (adjacent to pom.xml). You can refer this link on how to create Dockerfile.
Producer Dockerfile:
FROM openjdk:17-slim
MAINTAINER shvm.cloud
COPY target/producer-0.0.1-SNAPSHOT.jar producer-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/producer-0.0.1-SNAPSHOT.jar"]
Consumer Dockerfile:
FROM openjdk:17-slim
MAINTAINER shvm.cloud
COPY target/consumer-0.0.1-SNAPSHOT.jar consumer-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/consumer-0.0.1-SNAPSHOT.jar"]
Build the images using the Docker files using the following commands:
docker build -t gfg/producer .docker build -t gfg/consumer .
Final Step
Update the docker-compose.yaml file to include the two new services:
  producer:
    image: gfg/producer:latest
    container_name: producer-svc-container
    ports:
      - "9091:9091"
    depends_on:
      - broker
  consumer:
    image: gfg/consumer:latest
    container_name: consumer-svc-container
    ports:
      - "9092:9092"
    depends_on:
      - brokerdocker compose up -d
Output:
Now we have 4 services under same network gfg_default
Testing our services
Now on executing following cURL from postman/cmd:
curl --location 'http://localhost:9091/api/produce' \
--header 'Content-Type: application/json' \
--data '{
    "msg": "test messsage from postman",
    "id": 1
}'
You will see following Console log from producer service:
And following Console log from consumer service:

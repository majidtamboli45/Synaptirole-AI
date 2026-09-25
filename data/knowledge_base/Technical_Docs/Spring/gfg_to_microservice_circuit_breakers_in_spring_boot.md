# Introduction to Microservice Circuit Breakers in Spring Boot

> Source: https://www.geeksforgeeks.org/advance-java/introduction-to-microservice-circuit-breakers-in-spring-boot

In a microservices architecture, services often depend on other services to complete a request. If one service becomes slow or unavailable, continuously sending requests to that service can cause failures to spread across the entire system. A Circuit Breaker is a fault-tolerance pattern that detects such failures and temporarily stops sending requests to the failing service, giving it time to recover and preventing cascading failures.
- Prevents cascading failures when a dependent service becomes unavailable.
- Improves the resilience and fault tolerance of microservices applications.
- Provides fallback responses and allows services time to recover gracefully.
Circuit Breaker States flow
There are follwing Different states used in Cicuit Breaker pattern.
Closed State
In the Closed state, the Circuit Breaker allows all requests to pass through to the target service and continuously monitors the success and failure rates.
- All requests are forwarded to the target service.
- If the failure rate exceeds the configured threshold, the circuit transitions to the Open state.
Open State
In the Open state, the Circuit Breaker blocks all incoming requests and immediately returns an error response or fallback response without contacting the target service.
- Prevents repeated calls to an unhealthy service.
- Remains open for a configured waiting period before attempting recovery.
Half-Open State
In the Half-Open state, the Circuit Breaker allows a limited number of test requests to determine whether the service has recovered.
- If the test requests succeed, the circuit moves back to the Closed state.
- If the test requests fail, the circuit returns to the Open state.
How Circuit Breaker Works
The Circuit Breaker continuously monitors service requests and changes its state based on the success and failure rate of the target service.
Service Request
- A client or microservice sends a request to another microservice through the Circuit Breaker.
- Initially, all requests are allowed to pass to the target service.
Monitor Service Responses
- The Circuit Breaker tracks successful and failed requests.
- It calculates the failure rate based on the configured threshold.
Circuit Opens on Failure
- If the number of failures exceeds the configured limit, the Circuit Breaker moves to the Open state.
- Further requests are blocked immediately without contacting the failing service.
Service Recovery Period
- The Circuit Breaker waits for a predefined timeout period before attempting recovery.
- This waiting period gives the failing service time to recover.
Test and Recover
- After the timeout, the Circuit Breaker enters the Half-Open state and allows a limited number of test requests.
- If the test requests succeed, the circuit closes; otherwise, it returns to the Open state.
How it Works:
- Closed State: In the closed state then the circuit breakers allows all the requests to pass through to the service.
- Open State: When the number of the failure exceeds the threshold, the circuit breaker opens the circuit and all the further requests fail immediately without attempting to contact the service.
- Half Open State: After the timeout period, the Circuit breaker allows the limited Breaker transitions back to the closed state. If they fails, the circuit breaker returns to the open state.
Common Circuit Breaker Libraries in Spring Boot
Circuit Breakers can be essential in the microservices architecture to prevent the cascading the failures and improve the system resilience. In context of the Spring Boot, two popular tools for implementing the Circuit Breakers are Netflix Hystrix and Resilience4j.
Netflix Hystrix
Netflix Hystrix is a fault-tolerance library developed by Netflix that implements the Circuit Breaker pattern to improve the resilience and reliability of microservices communication.
- Provides Circuit Breaker functionality to prevent cascading failures.
- Supports fallback methods to return alternative responses when a service becomes unavailable
Note: Hystrix is currently in maintenance mode and is no longer actively developed.
Steps to configure Netflix Hystix
Step 1: Add Maven Dependency
Add these dependency in your pom.xml file.
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
</dependency>
Step 2: Enable Hystrix
Add the @EnableHystrix annotation to the main application class.
@EnableHystrix
@SpringBootApplication
public class Application {
}
Step 3: Use Hystrix Command
Use the @HystrixCommand annotation to wrap the methods you want to protect with the Circuit Breaker.
@HystrixCommand(fallbackMethod = "fallback")
public String callService() {
    return restTemplate.getForObject(
            "http://service/api",
            String.class);
}
Step 4: Hystrix Configuration
Add the below configuration in the application.yml:
hystrix:
  command:
    default:
      execution:
        isolation:
          thread:
            timeoutInMilliseconds: 1000
Resilience4j
Resilience4j is a lightweight and modern fault-tolerance library designed for Java applications. It provides Circuit Breaker functionality and several resilience patterns to improve the reliability of microservices communication
- Supports Circuit Breaker, Retry, Rate Limiter, Bulkhead, and Time Limiter patterns.
- Integrates seamlessly with Spring Boot and provides built-in monitoring and metrics support through Spring Boot Actuator
Steps to Implementing Circuit Breakers using Resilience4j
Follow these steps to implements circuit Breacker using Resilience4j
Step 1: Add Maven Dependencies
Add these dependency in your application pom.xml file.
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>
        spring-cloud-starter-circuitbreaker-resilience4j
    </artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>
        spring-boot-starter-actuator
    </artifactId>
</dependency>
Step 2: Configure Circuit Breaker
Add the following configuration to application.yml.
resilience4j:
  circuitbreaker:
    instances:
      backendA:
        registerHealthIndicator: true
        slidingWindowSize: 10
        minimumNumberOfCalls: 5
        failureRateThreshold: 50
        waitDurationInOpenState: 10s
        permittedNumberOfCallsInHalfOpenState: 3
Step 3: Implement Circuit Breaker
Use the @CircuitBreaker annotation to protect service calls.
@Service
public class ExternalService {
    @CircuitBreaker(
        name = "backendA",
        fallbackMethod = "fallback")
    public String callService() {
        return restTemplate.getForObject(
                "http://service/api",
                String.class);
    }
    public String fallback(Exception ex) {
        return "Service unavailable";
    }
}
Step 4: Monitor Circuit Breaker
Enable Spring Boot Actuator endpoints.
management:
  endpoints:
    web:
      exposure:
        include: "*"
Access metrics:
/actuator/health
/actuator/metrics
/actuator/circuitbreakers
Resilience4j vs Hystrix
| Feature | Resilience4j | Hystrix | 
|---|---|---|
| Active Development | Yes | No | 
| Lightweight | Yes | No | 
| Java 8 Support | Yes | Limited | 
| Functional Programming | Yes | No | 
| Spring Boot Support | Excellent | Limited | 
| Recommended | Yes | No |

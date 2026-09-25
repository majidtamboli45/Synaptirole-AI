# Circuit Breaker Pattern with Resilience4J

> Source: https://www.geeksforgeeks.org/advance-java/spring-boot-circuit-breaker-pattern-with-resilience4j/

Circuit Breaker Pattern prevents cascading failures in microservices by halting calls to failing services after a threshold is reached and providing graceful fallbacks. Resilience4J is a lightweight Java library that implements resilience patterns like Circuit Breaker, Retry, Rate Limiter, and Bulkhead to build fault-tolerant applications.
Circuit Breaker with Resilience4J
The Circuit Breaker acts as a fail-safe mechanism to prevent repeated failures from propagating in your system. It “breaks the circuit” when a service is unresponsive or consistently failing, allowing the system to fail fast and recover gracefully.
How the Circuit Breaker Works
- Closed State: All requests pass through. If failures reach a defined threshold, the circuit opens.
- Open State: Requests are blocked. After a timeout, the circuit transitions to half-open.
- Half-Open State: A limited number of test requests are allowed. If successful, the circuit closes; if they fail, it opens again.
Resilience4J's Circuit Breaker monitors calls to the downstream service, tracks failure rates and trips the circuit if the failure rate crosses the defined threshold.
Benefits of Using Circuit Breakers
- Prevents Cascading Failures: Isolates failures to avoid a chain reaction.
- Graceful Degradation: Provides fallback responses to maintain a good user experience.
- Improves System Stability: Stops repeated attempts to execute failing operations.
Implementing the Circuit Breaker Pattern with Resilience4J in Spring Boot
We’ll create a simple Spring Boot application demonstrating the Circuit Breaker pattern.
Step 1: Create a New Spring Boot Project
Create a new Spring Boot project using IntelliJ IDEA with the following options:
- Name: spring-boot-circuit-breaker
- Language: Java
- Type: Maven
- Packaging: Jar
Click on the Next button.
Step 2: Add Dependencies
Add the following dependencies into the Spring Boot project.
- Spring Web
- Resilience4J
- Spring Boot DevTools
- Lombok
Click on the Create button.
Project Structure
The file structure should look like this:
Step 3: Configure Application Properties
Rename application.properties to application.yml and add the following configuration:
resilience4j:
  circuitbreaker:
    instances:
      sampleService:
        registerHealthIndicator: true
        slidingWindowSize: 5
        minimumNumberOfCalls: 5
        failureRateThreshold: 50
        waitDurationInOpenState: 10s
        permittedNumberOfCallsInHalfOpenState: 3
        eventConsumerBufferSize: 10
management:
  endpoints:
    web:
      exposure:
        include: '*'
Explanation of key parameters:
- failureRateThreshold: Percentage of failures before opening the circuit.
- slidingWindowSize: Size of the sliding window for calculating failure rate.
- minimumNumberOfCalls: Minimum requests before calculating failure rate.
- waitDurationInOpenState: Duration the circuit stays open before half-opening.
- permittedNumberOfCallsInHalfOpenState: Test calls allowed in half-open state.
- registerHealthIndicator: Exposes circuit breaker health at /actuator/health
Step 4: Create the SampleService Class
Create the SampleService class to simulate the external service call that might fail of the Spring Boot application.
SampleService.java
package com.gfg.springbootcircuitbreaker;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import org.springframework.stereotype.Service;
@Service
public class SampleService {
    private static final String SAMPLE_SERVICE = "sampleService";
    @CircuitBreaker(name = SAMPLE_SERVICE, fallbackMethod = "fallbackResponse")
    public String callExternalService() {
        // Simulating a random failure
        if (Math.random() > 0.5) {
            throw new RuntimeException("Service failed");
        }
        return "Service call succeeded";
    }
    public String fallbackResponse(Exception ex) {
        return "Fallback response: " + ex.getMessage();
    }
}
Explanation:
- @CircuitBreaker: Protects the method with the specified Circuit Breaker.
- fallbackResponse(Exception ex): Provides a fallback when the service fails or the circuit is open.
Step 5: Create the CircuitBreakerController Class
Create the CircuitBreakerController class to define the REST endpoints for the testing the circuit breaker of the Spring Boot application.
CircuitBreakerController.java
package com.gfg.springbootcircuitbreaker;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class CircuitBreakerController {
    private final SampleService sampleService;
    public CircuitBreakerController(SampleService sampleService) {
        this.sampleService = sampleService;
    }
    @GetMapping("/test")
    public String testCircuitBreaker() {
        return sampleService.callExternalService();
    }
}
- @RestController : Defines a RESTful controller.
- @GetMapping("/test") : Endpoint for testing the Circuit Breaker functionality.
Step 6: Main Class
This is the entry point of the application. There is no changes are required in the main class.
package com.gfg.springbootcircuitbreaker;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringBootCircuitBreakerApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringBootCircuitBreakerApplication.class, args);
    }
}
pom.xml file
<dependencies>
    <!-- Web -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <!-- Circuit Breaker with Resilience4J -->
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-circuitbreaker-resilience4j</artifactId>
    </dependency>
    <!-- Actuator (REQUIRED) -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
    <!-- DevTools -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
        <scope>runtime</scope>
        <optional>true</optional>
    </dependency>
    <!-- Lombok -->
    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <optional>true</optional>
    </dependency>
    <!-- Test -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
Explanation:
- spring-boot-starter-web : Provides web application support.
- spring-cloud-starter-circuitbreaker-resilience4j: Provides seamless integration of Resilience4J with Spring Boot through the Spring Cloud Circuit Breaker abstraction.
- spring-boot-starter-actuator : Provides production-ready features like monitoring and management.
- lombok : Simplifies boilerplate code.
Step 7: Run the Application
To run the application, execute the following command:
mvn spring-boot:run
Output:
Step 8: Testing the Application
Use Postman or any REST client to test the /test endpoint:
GET http://localhost:8080/test
- On a successful service call, you should receive "Service call succeeded".
- If the service fails, you should see the fallback response "Fallback response: Service failed".
Application Logs
In the application logs, it will show the exception of the Spring Boot application.

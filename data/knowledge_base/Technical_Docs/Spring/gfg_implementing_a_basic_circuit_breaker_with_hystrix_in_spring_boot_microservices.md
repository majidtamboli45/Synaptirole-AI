# Implementing a Basic Circuit Breaker with Hystrix in Spring Boot Microservices

> Source: https://www.geeksforgeeks.org/advance-java/implementing-a-basic-circuit-breaker-with-hystrix-in-spring-boot-microservices

The Circuit breaker is a design pattern used in software development to improve system resilience by preventing cascading failures. It monitors failures and opens the circuit when a certain threshold is reached, preventing further calls to the failing service. This prevents the system from being overwhelmed and allows it to recover.
Hystrix is the library that implements the circuit breaker pattern. It provides mechanisms for handling faults when calling remote services via HTTP or other protocols. The circuit breaker opens when the specified error threshold is reached and closes again after a specified period, allowing subsequent calls to be attempted. Hystrix also provides fallback mechanisms to handle failures gracefully.
Key Terminologies:
- Circuit Breaker: A mechanism that monitors service health. When a predefined number of consecutive failures occurs, it interrupts further calls to the failing service, preventing cascading failures.
- Command: Represents a potentially risky action or service call wrapped with circuit breaker functionality. It corresponds to the method call making the remote call to another service.
- Fallback: A backup mechanism providing default or alternative behavior when the command fails or when the circuit breaker is open. It prevents application crashes due to failures.
- Timeout: The maximum time a command takes to execute before considering it a failure. If the command exceeds this time, it is aborted, and the fallback mechanism is invoked.
- Rolling Window: The time window within which Hystrix monitors service health. It calculates metrics such as error percentage and request volume within this window to determine the circuit state.
- Isolation: Hystrix provides isolation of commands using separate threads, thread pools, or semaphores. It ensures that the failure in one command does not affect others, providing fault tolerance.
- Metrics: Data collected by Hystrix, such as success rate, failure rate, latency, and concurrency. These metrics are used to make decisions about the circuit state and for monitoring and debugging purposes.
- Thread Pool: Used by Hystrix to execute commands asynchronously. Each command can have its thread pool, providing isolation and preventing resource contention between commands.
Implementing a Basic Circuit Breaker with Hystrix in Spring Boot Microservices
Below are the steps to implement a basic Circuit Breaker with Hystrix.
Step 1:
Create a new Spring Boot project using Spring Initializr, and include the following dependencies:
- Spring Web
- Spring DevTools
- Lombok
External dependency:
<dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
            <version>2.0.0.RELEASE</version>
        </dependency>
Once the project is created, the file structure will resemble the image below.
Step 2:
Open the application.properties file and add the server port configuration properties to the project.
spring.application.name=circuit-breakers-hystrix
server.port=8081
Step 3: Create service class
We'll create the service class for the remoteService of the application.
Go to src > org.example.circuitbreakershystrix > service> RemoteService and put the below code.
package org.example.circuitbreakershystrix.service;
public interface RemoteService {
    String callService() throws InterruptedException;
}
Step 4: Create RemoteServiceSimulator class
We'll create the RemoteServiceSimulator class for the configuration of the hystrix mechanism into the Spring application.
Go to src > org.example.circuitbreakershystrix > service> RemoteServiceSimulator and put the below code.
package org.example.circuitbreakershystrix.service;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.stereotype.Service;
import java.util.Random;
@Service
public class RemoteServiceSimulator implements RemoteService {
    @HystrixCommand(fallbackMethod = "reliable")
    public String callService() throws InterruptedException {
        if (new Random().nextBoolean()) {
            throw new RuntimeException("Service Failure!");
        }
        return "Successfully called service!";
    }
    public String reliable() {
        return "Default Response";
    }
}
- Fallback Methods: Hystrix can allows the specifying the fallback methods that get the invoked when the call fails. It is useful to the degrade functionality gracefully when the service fails.
- @HystrixCommand(fallbackMethod = "reliable") : This annotation can marks the callService() as a method managed by the Hystrix and it can the indicating that it should have circuit breaker properties and specifies reliable() as the fallback method to be called if callService() fails.
Step 5: Create ServiceController class.
We'll create the ServiceController class for the RESTful API of the application.
Go to src > org.example.circuitbreakershystrix > controller > ServiceController and put the below code.
package org.example.circuitbreakershystrix.controller;
import org.example.circuitbreakershystrix.service.RemoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class ServiceController {
    @Autowired
    private RemoteService remoteService;
    @GetMapping("/service")
    public String callService() {
        try {
            return remoteService.callService();
        } catch (InterruptedException e) {
            return "Failed to call service";
        }
    }
}
Step 6:
Open the Main Class and add the @EnableHystrix to the enable the hystrix mechanism of the application.
Go to src > org.example.circuitbreakershystrix > CircuitBreakersHystrixApplication and put the below code.
package org.example.circuitbreakershystrix;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
@SpringBootApplication
@EnableHystrix
public class CircuitBreakersHystrixApplication {
    public static void main(String[] args) {
        SpringApplication.run(CircuitBreakersHystrixApplication.class, args);
    }
}
Step 7: Run the application
Once we run the application, then the project will run at port 8081.
API Endpoint:
GET http://localhost:8081/service
Output:
This example demonstrates the implementation of the basic circuit breaker with Hystrix in a Spring Boot application.

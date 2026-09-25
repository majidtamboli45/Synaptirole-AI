# Spring Boot @Controller Annotation with Example

> Source: https://www.geeksforgeeks.org/advance-java/spring-boot-controller-annotation-with-example/

Spring Boot provides the @Controller annotation to define classes that handle web requests and control the flow of a web application. A controller acts as an intermediary between the user interface and the business layer, processing incoming requests and returning appropriate responses or views.
- Marks a class as a Spring MVC controller for handling HTTP requests.
- Maps URLs to specific handler methods using request mapping annotations.
- Interacts with service classes to process business logic.
Real-World Example
In an Employee Management System:
- A user opens /employees.
- The EmployeeController receives the request.
- The controller calls the service layer.
- The service fetches employee data from the repository.
- The controller sends the data to the view.
- The view displays the employee details to the user.
Steps to Use the @Controller Annotation
Follow these steps to create Controller in spring boot application.
Step 1: Create a Spring Boot Project
Create a new Spring Boot project using your preferred IDE (Eclipse, IntelliJ IDEA, or Spring Initializr).
 If using Spring Initializr, select:
- Project: Maven
- Dependencies: Spring Web
Step 2: Add the spring-web dependency
In case your project does not include it by default, add the following dependency to your pom.xml:
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
This provides the necessary libraries for creating web applications and REST APIs.
Step 3: Create a Controller Package
Create a package named controller under src/main/java/com/example/demo/. This package will contain the controller class that handles web requests.
Step 4: Create a Controller Class
Inside the controller package, create a file named DemoController.java.
package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class DemoController {
    @RequestMapping("/hello")
    @ResponseBody
    public String helloGFG() {
        return "Hello GeeksForGeeks";
    }
}
- @Controller: Marks the class as a Spring MVC controller.
- @RequestMapping("/hello"): Maps the /hello URL to thehelloGFG() method.
- @ResponseBody: Instructs Spring to return the method result directly as the HTTP response body, rather than looking for a view.
Step 5: Create the Main Application Class
Create a main class DemoApplication.java under the base package com.example.demo.
package com.example.demo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
@SpringBootApplication combines three annotations:
- @Configuration: Marks the class as a source of bean definitions.
- @EnableAutoConfiguration: Enables automatic configuration based on classpath dependencies.
- @ComponentScan: Scans the package for annotated components like @Controller, @Service , and@Repository .
Step 6: Run the Application
Run the DemoApplication class as a Java Application. By default, the application starts on port 8080.
Access the endpoint at
http://localhost:8080/hello
If you want to change the port, modify the application.properties file:
server.port=8989

# How to Create a Simple Spring Boot Application?

> Source: https://www.geeksforgeeks.org/advance-java/how-to-create-a-simple-spring-boot-application/

Spring Boot is one of the most popular frameworks for building Java-based web applications. It is used because it simplifies the development process by providing default configurations and also reduces boilerplate code.
In this article, we will cover the steps to create a simple Spring Boot application using Spring Initializr, and we will also demonstrate how to set up a basic REST API.
Steps to Create a Simple Spring Boot Application
Step 1: Generate the Spring Boot Project Using Spring Initializr
- Go to Spring Initializr
- Fill in the following details, which are mentioned below:
  - Project: Maven
  - Language: Java
  - Spring Boot Version: 3.4.3
  - Packaging: JAR
  - Java Version: 17
  - Dependencies: Spring Web
- Click on the GENERATE button to download the project as a ZIP file.
Step 2: Import the project into IDE
- Extract the downloaded ZIP file.
- Open your IDE (e.g., IntelliJ IDEA or Eclipse).
- Go to File > New > Project from Existing Sources and select the pom.xml file from the extracted folder.
- Click Import Changes to sync the project with Maven.
Note: In the Import Project for Maven window, make sure you choose the same version of JDK which you selected while creating the project.
Step 3: Create a REST Controller
- Go to src/main/java/com/example/demo (replace com.example.demo with your package name).
- Create a new Java class named Controller add the annotation @RestController.
Add the following code to create a simple REST API:
package com.example.spring_boot_demo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class Controller {
    @GetMapping("/hello/{name}/{age}")
    public String hello(@PathVariable String name, @PathVariable int age) {
        return "Name: " + name + ", Age: " + age;
    }
}
Step 4: Run the Application
- Locate the SpringBootAppApplication class in the src/main/java folder.
- Right-click on the class and select Run.
- Wait for the Tomcat server to start. We will see something like below:
Note: By default, Spring Boot runs on port 8080. If we want to change the port, open the application.properties and add the following line:
server.port=9090
Now, the application will run on port 9090.
Step 5: Test the Application
- Open your browser.
- Enter the following URL: http://localhost:8080/hello/Muskan/28 .
- We will see the output like below:

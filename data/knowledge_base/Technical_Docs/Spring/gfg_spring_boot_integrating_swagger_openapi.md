# Spring Boot – Integrating Swagger/OpenAPI

> Source: https://www.geeksforgeeks.org/advance-java/spring-boot-integrating-swagger-openapi/

Swagger, based on the OpenAPI Specification (OAS), is the industry-standard tool for designing, documenting, and testing RESTful APIs. It provides an intuitive and interactive UI that allows developers and testers to explore endpoints, view request/response formats, and even execute API calls without writing any client code.
What Is Swagger / OpenAPI?
Swagger and OpenAPI are closely related terms for describing and documenting RESTful APIs.OpenAPI Specification (OAS) is a standard for defining RESTful APIs. Springdoc OpenAPI is the most modern way to integrate Swagger with Spring Boot. Swagger provides a set of tools to like.
- Automatically generate API documentation
- Create an interactive UI for testing endpoints
Prerequisites for Integrating Swagger/OpenAPI with Spring Boot
Step-by-Step Implementation of Swagger/OpenAPI with Spring Boot
In the following code, we can see how we can automatically generate and expose interactive API documentation for a Spring Boot application using Swagger/OpenAPI, so developers and stakeholders can test and explore endpoints without external tools or manual documentation.
Step 1: Create SwagerApplication.java class:
This is the main Spring Boot application class that starts the app. It also defines basic Swagger/OpenAPI documentation metadata like title, version, and description using @OpenAPIDefinition.
SwagerApplication.java:
package com.example.swager;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@OpenAPIDefinition(
		info = @Info(
				title = "Student API",
				version = "1.0",
				description = "API documentation for managing students"
		)
)
@SpringBootApplication
public class SwagerApplication {
	public static void main(String[] args) {
		SpringApplication.run(SwagerApplication.class, args);
	}
}
Step 2: Create StudentController.java class: 
This class is a Spring Boot REST controller that handles student-related API requests. It defines two GET endpoints to return a list of student names and fetch a student by ID.
StudentController.java.
package com.example.swager;
import org.springframework.web.bind.annotation.*;
import java.util.List;
//Marks this class as a REST controller
@RestController
//Base URL for all endpoints in this controller
@RequestMapping("/api/students")
public class StudentController {
    
// Handles GET request to /api/students
    @GetMapping
    
    //Returns list of student names
    public List<String> getAllStudents() {
        return List.of("Amit", "Sita", "Raj");
    }
    
 // Handles GET request to /api/students/{id}
    @GetMapping("/{id}")
    public String getStudentById(@PathVariable int id) {
        return "Student with ID: " + id;
    }
}
Explanation of the code:
- Implements a Spring Boot REST controller for managing REST APIs.
- Base URL: /api/students
- GET /api/students → Returns a fixed list of student names.
- GET /api/students/{id} → Returns a message with the student ID.
- Uses annotations: @RestController, @RequestMapping, @GetMapping, and handles path variables.
Step 3: Set the server port inside the application.properties file:
server.port=8080
Step 4: Add Dependency in your pom.xml file:
- Spring web.
- springdoc-openapi
pom.xml:
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>3.5.3</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.example</groupId>
	<artifactId>swager</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>swager</name>
	<description>Demo project for Spring Boot</description>
	<url/>
	<licenses>
		<license/>
	</licenses>
	<developers>
		<developer/>
	</developers>
	<scm>
		<connection/>
		<developerConnection/>
		<tag/>
		<url/>
	</scm>
	<properties>
		<java.version>17</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.springdoc/springdoc-openapi-ui -->
		<dependency>
			<groupId>org.springdoc</groupId>
			<artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
			<version>2.2.0</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>
</project>
Step 5: Run the Application:
After running your application then test your Application:
Visit:
http://localhost:8080/swagger-ui.html // for swagger ui (interactive doc).
Output: In Swagger UI, you will see:
- GET /api/students – with Try it out option
- GET /api/students/{id} – with input field for ID
- Ability to test endpoints and view real-time responses
Step 6: Test Using Swagger UI:
Open your browser and visit:
http://localhost:8080/swagger-ui/index.html
You will see:
- GET /api/students with a "Try it out" button
- GET /api/students/{id} with an input field for ID
Output:
GET /api/students-> Click try it out button then execute:
GET /api/students/5-> click try it out button and select id:
output:
In the image, response code and response body are seen as a result of the request. So it returned a successful answer.

# Customizing the Configuration Location in Spring Cloud Config Server

> Source: https://www.geeksforgeeks.org/advance-java/customizing-the-configuration-location-in-spring-cloud-config-server/

Spring Cloud Config provides both server and client-side support for externalized configuration in distributed systems. The Config Server manages configuration properties for applications across various environments, allowing them to retrieve their configuration from a central location. By default, Spring Cloud Config Server uses a Git repository to store configuration files, but it can be customized to use other storage locations such as local file systems, SVN repositories, or databases.
Spring Cloud Config Server acts as a centralized configuration server for distributed systems. It allows multiple applications to share configuration properties stored in a single location. By default, it uses a Git repository to share these configurations, but you can customize the storage location to meet your needs. Customization options include local file systems, SVN repositories, and relational databases.
This article will guide you on how to customize the configuration location in the Spring Cloud Config Server.
Prerequisites:
- Basic knowledge of Spring Boot and Spring Cloud Config.
- Git installed on your local system.
- Maven for building the project.
- A working Spring Boot application.
- Java JDK installed on your system.
Configuration Backends
- Git Repository: Default backend for version-controlled configuration.
- File System: Stores configuration on the local file system.
- SVN Repository: Uses SVN for configuration storage.
- JDBC (Database): Stores configuration in a relational database.
How it works:
- The client application requests configuration from the Config Server.
- The Config Server fetches configuration from the specified backend.
- The configuration is returned to the client application, which applies it.
Example Workflow:
- Client Application: The Spring Boot application named my-app with the profiledev requests its configuration.
- Config Server: The server retrieves the request and looks for the configuration files corresponding to my-app anddev in the specified backend (e.g., Git repository, local file system).
- Configuration Retrieval: The Config Server fetches the relevant configuration properties and returns them to the client application.
- Application Configuration: The client application applies the retrieved configuration properties to initialize itself.
This process allows for centralized management and version control of configuration properties, making it easier to handle different environments (development, testing, production). It ensures consistency across distributed applications.
Configuration Files
Server Application Configuration:
These files in the Config Server application specify the backend storage location and other configuration details. For example, if using a Git repository, you would configure the application.yml as follows:
server:
port: 8888
spring:
cloud:
config:
server:
git:
uri: https://github.com/your-repo/config-repo
searchPaths: config
- server.port : The port on which the Config Server will run.
- spring.cloud.config.server.git.uri : The URL of the Git repository containing configuration files.
- spring.cloud.config.server.git.searchPaths : The path within the repository where configuration files are located.
Client Application Configuration:
The client application has an application.yml file that specifies the Config Server URL and other necessary details to connect to the Config Server.
spring:
cloud:
config:
uri: http://localhost:8888
name: my-app
profile: dev
- spring.cloud.config.uri : The URL of the Config Server.
- spring.cloud.config.name : The name of the application requesting configuration.
- spring.cloud.config.profile : The profile of the application (e.g., dev, prod).
By customizing the configuration location in Config Server, we gain flexibility in how and where we store the configuration properties. This allows us to adapt to various project requirements and infrastructure setups.
Implementing Custom Configuration Locations in Spring Cloud Config Server
Step 1: Create the New Spring Boot Project
Create a new Spring Boot Project using IntelliJ IDEA with the following options:
- Name: config-server-demo
- Language: Java
- Type: Maven
- Packaging: Jar
Click on the Next button.
Step 2: Add the Dependencies
Add the following dependencies to the project:
After the project creation done, the folder structure will look like the below image:
Step 3: Configure the Application Properties
Create a new application.properties file in the config folder under src/main/resources:
Go to src > resources > config > application.properties and put the below code.
message=Hello from the Config Server!
Then, create an application.yml file and add the configuration code for the Config Server:
spring:
cloud:
config:
server:
native:
searchLocations: classpath:/config
Step 4: Create the TestController Class
Create a simple endpoint for the project. Go to src/main/java/com/gfg/configserverdemo/TestController and add the following code:
package com.gfg.configserverdemo;
// Import necessary Spring annotations and classes
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
// Annotate the class as a REST controller and map requests to "/test"
@RestController
@RequestMapping("/test")
public class TestController {
    // Inject the value of the 'message' property from the configuration
    @Value("${message}")
    private String message;
    // Handle GET requests to "/test" and return the value of the 'message' property
    @GetMapping
    public String getMessage() {
        return message;
    }
}
Step 5: Main Class
Open the main class and add the @EnableConfigServer annotation to activate the Config Server functionalities:
package com.gfg.configserverdemo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
@EnableConfigServer
public class ConfigServerDemoApplication {
	public static void main(String[] args) {
		SpringApplication.run(ConfigServerDemoApplication.class, args);
	}
}
pom.xml
Ensure your pom.xml includes the necessary properties and dependencies:
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>3.3.2</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.gfg</groupId>
	<artifactId>config-server-demo</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>config-server-demo</name>
	<description>config-server-demo</description>
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
		<spring-cloud.version>2023.0.3</spring-cloud.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-config-server</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>
	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>org.springframework.cloud</groupId>
				<artifactId>spring-cloud-dependencies</artifactId>
				<version>${spring-cloud.version}</version>
				<type>pom</type>
				<scope>import</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<configuration>
					<excludes>
						<exclude>
							<groupId>org.projectlombok</groupId>
							<artifactId>lombok</artifactId>
						</exclude>
					</excludes>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
Step 6: Run the application
Once the project is complete, start the application. It will run on port 8080.
Step 7: Test the Endpoint
Test the endpoint using Postman or any other tool:
GET http://localhost:8080/test
Output:
Conclusion
Customizing the configuration location in the Spring Cloud Config Server allows you to store configuration properties in various backends like Git, local file systems, or databases. This flexibility ensures that you can manage configuration properties in a way that best fits your project requirements.

# Externalized Configuration

> Source: https://www.geeksforgeeks.org/advance-java/spring-boot-externalized-configuration/

In Spring Boot, externalized configuration is a feature that allows you to separate configuration settings from your code. This means you can change how your application behaves by modifying configuration files without needing to recompile or redeploy the application. Spring Boot supports various configuration formats such as properties files, YAML files, environment variables, and command-line arguments. This flexibility makes it easier to manage and deploy applications across different environments.
Externalized Configuration in Spring Boot
Externalized configuration refers to separating configuration settings from your application's codebase. This allows you to modify settings without changing or redeploying the application, enhancing flexibility, maintainability, and portability across different environments like development, testing, and production.
Spring Boot provides robust mechanisms for externalizing configuration, supporting sources such as properties files, YAML files, environment variables, command-line arguments, and external configuration servers.
Configuration Sources and Priority
Spring Boot loads configuration properties from multiple sources, following a specific order of precedence. Understanding this hierarchy is crucial as it determines which configuration overrides others when properties are duplicated across different sources. Here is the order of precedence from highest to lowest:
- Command-Line Arguments: Properties passed directly when starting the application via the command line (e.g., java -jar app.jar --server.port=8081 ).
- Java System Properties: Typically set using the -D flag in the command line (e.g.,-Dserver.port=8080 ).
- OS Environment Variables: Environment variables set at the operating system level.
- Java Naming and Directory Interface (JNDI): Used in Java EE environments.
- ServletContext and ServletConfig Init Parameters: Used in web applications.
Implementation of Externalized Configuration in Spring Boot Application
Step 1: Create a New Spring Boot Project
Create a new Spring Boot project using IntelliJ IDEA. Add the following dependencies to your pom.xml file:
Dependencies:
- Spring Web
- Lombok
- Spring DevTools
Project Structure:
Your project structure will look like this:
Step 2: Configure the Application Properties
Open application.properties in src/main/resources and add the following key-value pairs:
spring.application.name=external-demo
# src/main/resources/application.properties
app.name=Spring Boot Externalized Configuration
app.version=1.0.0
These properties define the application name and version.
Step 3: Create the AppConfig Class
Create the AppConfig class to define a Spring Bean that accesses these properties using the @Value annotation:
package com.gfg.externaldemo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
/**
 * Configuration class to access application properties.
 */
@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AppConfig {
    @Value("${app.name}") // Injects 'app.name' property
    private String appName;
    @Value("${app.version}") // Injects 'app.version' property
    private String appVersion;
    /**
     * Prints the application configuration.
     */
    public void printConfig() {
        System.out.println("Application Name: " + appName);
        System.out.println("Application Version: " + appVersion);
    }
}
This class uses @Value to inject properties from application.properties into fields and provides a method to print these values.
Step 4: Create the AppController Class
Create a REST Controller to display the configuration properties:
package com.gfg.externaldemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * REST Controller to expose application configuration.
 */
@RestController
public class AppController {
    @Autowired
    private AppConfig appConfig;
    /**
     * Endpoint to show configuration properties.
     */
    @GetMapping("/config")
    public String showConfig() {
        return "Application Name: " + appConfig.getAppName() +
                "\nApplication Version: " + appConfig.getAppVersion();
    }
}
This controller uses AppConfig to get the properties and exposes them via a REST endpoint
Step 5: Main class
No changes are needed in the main class. It initializes the Spring Boot application.
package com.gfg.externaldemo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
/**
 * Main class to start the Spring Boot application.
 */
@SpringBootApplication
public class ExternalDemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(ExternalDemoApplication.class, args);
    }
}
pom.xml file:
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
    <artifactId>external-demo</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>external-demo</name>
    <description>external-demo</description>
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
Step 6: Run the Application
Start the application. It will run on port 8080 by default.
Step 7: Testing the Endpoint
Access the configuration endpoint by visiting http://localhost:8080/config in your browser. You should see the application name and version displayed.
GET http://localhost:8080/config
Output:
Conclusion
Externalized configuration is key to developing flexible and maintainable Spring Boot applications. By separating configuration from code, you can easily adjust settings for different environments without modifying the codebase. Understanding the precedence of configuration sources and using profiles effectively helps in managing complex configurations in large applications.

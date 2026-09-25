# Spring Boot Security Auto-Configuration

> Source: https://www.geeksforgeeks.org/advance-java/spring-boot-security-auto-configuration/

Spring Boot Security Auto-Configuration automatically sets up basic security features in a Spring Boot application without requiring much manual configuration. It provides default authentication, authorization, and protection against common security threats. This helps developers quickly secure applications with minimal setup.
- Provides built-in security features like CSRF protection and password encoding.
- Reduces configuration effort by using sensible default security settings.
Setting Up Spring Security
Add the Spring Boot Security Dependency
<dependency>  
  <groupId>org.springframework.boot</groupId>   
 <artifactId>spring-boot-starter-security</artifactId>
</dependency>
By the default, Spring Boot Security Auto configuration secures all the endpoints of the application. Try to accessing any endpoint in the application. Display the prompted to the login in with the default username and password.
Project Implementation of Spring Boot Security Auto-Configuration
Below are the steps to implement Security Auto-Configuration in Spring Boot.
Step 1: Create the Spring Boot Project
Create a Spring Boot project using Spring STS or Spring Initializr.
Add the Following Dependencies:
- Spring Web
- Spring Security
- Spring DevTools
- Lombok
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.4</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>org.example</groupId>
    <artifactId>spring-security-configuration</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>spring-security-configuration</name>
    <description>spring-security-configuration</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
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
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-test</artifactId>
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
Once we complete the project creation then the file structure looks like the below image.
Step 2: Configure Security Credentials
Open the application.properties file and add the security configuration.
- Sets application name and server port.
- Creates a default username and password for login authentication.
  spring.application.name=spring-security-configuration
# Server port
   server.port=8080
# Spring Security default user credentials
   spring.security.user.name=admin
   spring.security.user.password=admin
Step 3: Create Security Configuration Class
Create a package named config and add the WebSecurity class.
- Configures application security rules.
- Allows public access to the home page (/).
package org.example.springsecurityconfiguration.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
@Configuration
public class WebSecurity {
    @Deprecated
    protected void configure(HttpSecurity http) throws Exception {
      http.authorizeRequests()
                .requestMatchers("/").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin().permitAll();
    }
}
Step 4: Create Controller Class
Create a package named controller and add the HomeController class.
- Creates a REST endpoint for testing security.
- Displays a response when the home URL is accessed.
package org.example.springsecurityconfiguration.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "Welcome to the secure area!";
    }
}
Step 5: Create Main Application Class
Open the main class file and add the following code.
- Starts the Spring Boot application.
- Loads all configurations and dependencies automatically.
package org.example.springsecurityconfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringSecurityConfigurationApplication {
    public static void main(String[] args) {
        SpringApplication.run(
            SpringSecurityConfigurationApplication.class, args);
    }
}
Step 6: Run the Application
Run the Spring Boot application as a Spring project.
- Application starts on port 8080 .
- Spring Security displays a login page for authentication.
Output:
GET http://localhost:8080/
Once login with credentials then show the below output.

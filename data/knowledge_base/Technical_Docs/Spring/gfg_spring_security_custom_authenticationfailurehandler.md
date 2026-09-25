# Spring Security Custom AuthenticationFailureHandler

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-custom-authenticationfailurehandler/

In Spring Security, AuthenticationFailureHandler is used to handle actions when user authentication fails. A custom AuthenticationFailureHandler allows developers to define their own logic, such as displaying custom error messages, logging failed login attempts, or redirecting users to specific pages.
- Handles login failures when authentication is unsuccessful.
- Allows custom error messages and redirections based on failure reasons.
- Improves security and user experience by implementing custom failure handling logic.
Implementation of Custom AuthenticationFailureHandler in Spring Security
Follow the steps below to implement a Custom AuthenticationFailureHandler in a Spring Boot application.
Step 1: Create a Spring Boot Project
Create a Spring Boot project and add the following dependencies:
- Spring Web
- Spring Security
- Spring Data MongoDB
- Spring Boot DevTools
- Lombok
pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.3</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.gfg</groupId>
    <artifactId>CustomAuthenticationFailure</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>CustomAuthenticationFailure</name>
    <description>CustomAuthenticationFailure</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-mongodb</artifactId>
        </dependency>
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
File Structure:
Step 2: Configure MongoDB Database
Open the application.properties file and configure the MongoDB connection.
spring.data.mongodb.uri=mongodb://localhost:27017/CustomData
Step 3: Create User Model
Create a package named model and create a User class.
- Represents user data stored in MongoDB.
- Uses Lombok annotations to generate boilerplate code.
- Maps the class to the users collection.
package com.gfg.customauthenticationfailure.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
// The @Data annotation generates getters, setters, toString, equals, and hashCode methods automatically
@Data
// The @AllArgsConstructor annotation generates a constructor with all arguments
@AllArgsConstructor
// The @NoArgsConstructor annotation generates a constructor with no arguments
@NoArgsConstructor
// The @Document annotation marks this class as a document in a MongoDB collection
@Document(collection = "users")
public class User {
    // The @Id annotation marks this field as the primary key of the document
    @Id
    private String id;
    // The @Field annotation specifies the name of the field in the MongoDB document
    // If not specified, the field name will be the same as the variable name
    private String username;
    private String password;
}
Step 4: Create User Repository
Create a package named repository and create UserRepository.
- Extends MongoRepository.
- Provides database operations.
- Includes a method to find users by username.
package com.gfg.customauthenticationfailure.repository;
import com.gfg.customauthenticationfailure.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
// The @Repository annotation marks this interface as a repository component in Spring
@Repository
public interface UserRepository extends MongoRepository<User, String> {
    // Method to find a user by their username
    User findByUsername(String username);
}
Step 5: Create User Service
Create a package named service and create UserService.
- Contains business logic.
- Retrieves user details from MongoDB.
- Uses UserRepository.
package com.gfg.customauthenticationfailure.service;
import com.gfg.customauthenticationfailure.model.User;
import com.gfg.customauthenticationfailure.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
// The @Service annotation marks this class as a service component in Spring
@Service
public class UserService {
    // Autowire the UserRepository to interact with the database
    @Autowired
    private UserRepository userRepository;
    // Method to find a user by their username
    public User findByUsername(String username) {
        // Call the findByUsername method of the userRepository to find the user by username
        return userRepository.findByUsername(username);
    }
}
Step 6: Create Custom AuthenticationFailureHandler
Create a package named securityconfig and create CustomAuthenticationFailureHandler.
- Implements AuthenticationFailureHandler.
- Handles failed login attempts.
- Redirects users to a custom error page.
package com.gfg.customauthenticationfailure.securityconfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import java.io.IOException;
// Implement the AuthenticationFailureHandler interface to create a custom authentication failure handler
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
    // Override the onAuthenticationFailure method to handle authentication failure
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        // Your custom failure handling logic goes here
        // For example, redirect the user to the login page with an error message in the URL
        response.sendRedirect("/login?error=true");
    }
}
Step 7: Configure Spring Security
Create a class named SecurityConfig.
- Enables Spring Security.
- Configures login and logout functionality.
- Registers the custom failure handler.
package com.gfg.customauthenticationfailure.securityconfig;
import com.gfg.customauthenticationfailure.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private UserRepository userRepository;
    // Override the configure method to specify which URLs are allowed and which are not
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .requestMatchers("/signup").permitAll() // Allow requests to /signup without authentication
                .anyRequest().authenticated() // Require authentication for all other requests
                .and()
                .formLogin() // Enable form-based login
                .loginPage("/login") // Specify the login page URL
                .failureHandler(new CustomAuthenticationFailureHandler()) // Specify the failure handler for login attempts
                .permitAll() // Allow anyone to access the login page
                .and()
                .logout() // Enable logout functionality
                .permitAll(); // Allow anyone to access the logout URL
    }
    // Create a PasswordEncoder bean to encode and decode passwords
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
Step 8: Create Signin Request Class
Create a package named request and create SigninRequest.
- Stores login credentials.
- Used during authentication requests.
package com.gfg.customauthenticationfailure.request;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
// Lombok annotations for automatically generating getters, setters, and constructors
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SigninRequest {
    // Fields for username and password
    String username;
    String password;
}
Step 9: Create User Controller
Create a package named controller and create UserController.
- Handles signup requests.
- Handles signin requests.
- Authenticates users using username and password.
package com.gfg.customauthenticationfailure.controller;
import com.gfg.customauthenticationfailure.model.User;
import com.gfg.customauthenticationfailure.repository.UserRepository;
import com.gfg.customauthenticationfailure.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.gfg.customauthenticationfailure.request.SigninRequest;
@RestController
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    // Handle the /signup endpoint for registering new users
    @PostMapping("/signup")
    public void signUp(@RequestBody User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }
    @Autowired
    private UserService userService;
    // Handle the /signin endpoint for user authentication
    @PostMapping("/signin")
    public void signIn(@RequestBody SigninRequest signInRequest) throws Exception {
        // Authenticate the user manually
        User user = userService.findByUsername(signInRequest.getUsername());
        if (user != null && user.getPassword().equals(signInRequest.getPassword())) {
            // If the user is found and the password matches, authenticate the user
            Authentication authentication = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
            SecurityContextHolder.getContext().setAuthentication(authentication);
        } else {
            // If the user is not found or the password doesn't match, throw an exception
            throw new Exception("Invalid username or password");
        }
    }
}
Step 10: Create Main Application Class
Create the Spring Boot main class.
- Starts the Spring Boot application.
- Initializes all Spring components.
package com.gfg.customauthenticationfailure;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class CustomAuthenticationFailureApplication {
    public static void main(String[] args) {
        SpringApplication.run(CustomAuthenticationFailureApplication.class, args);  // starts the Spring Boot application
        // run the Spring Boot application
    }
  
}
Step 11: Run the Application
Run the Spring Boot application.
- Application starts on port 8080.
- Register users using /signup.
- Authenticate users using /signin.

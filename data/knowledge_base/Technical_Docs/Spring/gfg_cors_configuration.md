# CORS Configuration

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-cors-configuration/

Cross-Origin Resource Sharing (CORS) is a browser security mechanism that allows or restricts web applications from accessing resources hosted on a different domain, protocol, or port. In Spring Security, CORS configuration helps define which external origins can communicate with the application while maintaining security. It is commonly used when a frontend application and backend API are hosted on different servers.
- Can be configured globally or at the controller level.
- Works through HTTP headers such as Access-Control-Allow-Origin.
- Commonly used in REST APIs, microservices, and frontend-backend architectures.
CORS Configuration Levels in Spring Security
CORS can be configured at two levels in a Spring Boot application:
1. Global Level Configuration
Global configuration applies the same CORS rules to all endpoints in the application.
- Centralized CORS management.
- Suitable when all APIs require the same CORS policy.
@Configuration
public class CorsConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:3000")
                .allowedMethods("GET", "POST", "PUT", "DELETE");
    }
}
2. Controller-Level Configuration
Controller-level configuration applies CORS settings only to a specific controller or endpoint.
- Fine-grained control over individual APIs.
- Different endpoints can have different CORS policies.
@RestController
@RequestMapping("/api")
public class HelloController {
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/hello")
    public String hello() {
        return "Hello, CORS!";
    }
}
Prerequisites
- Java Development Kit installed in your local system.
- Maven for building dependency management
- Basic understanding of the Spring Boot and Spring Security.
Implementation of Spring Security - CORS Configuration
Step 1: Create a new Spring Boot Project
Create a new spring boot project using spring initializr and add the below dependencies to it.
Dependencies:
- Spring Web
- Spring Security
- Lombok
- Spring DevTools
After creating the project, the folder structure in the IDE will look like the below image:
Step 2: Configure the Application Properties
Open the application.properties file and add the server port configuration of the project.
server.port=8080
Step 3: Create the SecurityConfig Class
Create a SecurityConfig class to configure Spring Security and enable CORS support.
- Enables CORS support using .cors().
- Disables CSRF for simplicity.
package com.auxentios.springcors;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    // Configures security filters and authentication settings
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // Disables CSRF protection
                .cors().and() // Enables CORS
                .authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .httpBasic(); // Enables Basic Authentication
        return http.build();
    }
    // Configures an in-memory user for testing
    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails user = User.builder()
                .username("user")
                .password("{noop}password") // {noop} indicates no password encoding
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(user);
    }
}
Explanation:
- SecurityConfig class configures security settings.
- securityFilterChain() method sets up CSRF disablement, CORS configuration, and HTTP Basic authentication.
- userDetailsService() method provides an in-memory user for testing purposes.
Step 4: Create the CorsConfig Class
Create a configuration class to define allowed origins, methods, and headers.
package com.auxentios.springcors;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class CorsConfig {
    // Configures CORS for the application
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("http://localhost/3000") // Allows requests from this origin
                        .allowedMethods("GET", "POST", "PUT", "DELETE") // Allows specified HTTP methods
                        .allowedHeaders("*") // Allows all headers
                        .allowCredentials(true); // Allows credentials (e.g., cookies)
            }
        };
    }
}
Explanation:
- Allows cross-origin requests from specified origins.
- addMapping("/**") applies CORS settings to all endpoints.
- allowedOrigins("http://localhost:3000") permits requests from the specified origin.
- allowCredentials(true) enables cookies and authentication credentials in requests.
Step 5: Create the HelloController Class
Create a simple REST controller to test CORS functionality.
package com.auxentios.springcors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api")
public class HelloController {
    // Handles GET requests to /api/hello endpoint
    @GetMapping("/hello")
    public String getHello() {
        return "Hello, GET!";
    }
}
Explanation:
- HelloController class defines a REST controller with @RestController and base mapping /api.
- getHello() method responds to GET /api/hello with "Hello, GET!".
Step 6: Main Class
No changes are required in the main class. It remains standard for a Spring Boot application.
package com.auxentios.springcors;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringCorsApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringCorsApplication.class, args);
    }
}
Step 7: Writing the Test Cases
Create test cases to validate both security and CORS configurations.
- Verify authenticated requests.
- Verify requests originating from allowed domains.
- Ensure CORS headers are present in responses.
package com.auxentios.springcors;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import java.util.Base64;
import static org.assertj.core.api.Assertions.assertThat;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class SpringCorsApplicationTests {
    @LocalServerPort
    private int port;
    @Autowired
    private TestRestTemplate restTemplate;
    // Creates HTTP headers for basic authentication
    private HttpHeaders createHeaders(String username, String password) {
        return new HttpHeaders() {{
            String auth = username + ":" + password;
            byte[] encodedAuth = Base64.getEncoder().encode(auth.getBytes());
            String authHeader = "Basic " + new String(encodedAuth);
            set("Authorization", authHeader);
            set("Origin", "http://localhost/3000"); // Sets request origin
        }};
    }
    @Test
    void contextLoads() {
        // Ensures Spring application context loads successfully
    }
    @Test
    void testCorsConfiguration() {
        HttpHeaders headers = createHeaders("user", "password");
        HttpEntity<String> entity = new HttpEntity<>(headers);
        // Sends GET request to /api/hello and verifies response
        ResponseEntity<String> response = restTemplate.exchange(
                "http://localhost/" + port + "/api/hello",
                HttpMethod.GET,
                entity,
                String.class
        );
        assertThat(response).isNotNull();
        assertThat(response.getStatusCodeValue()).isEqualTo(200);
    }
    @Test
    void testPostHelloEndpoint() {
        HttpHeaders headers = createHeaders("user", "password");
        HttpEntity<String> entity = new HttpEntity<>("John", headers);
        // Sends POST request to /api/hello and verifies response
        ResponseEntity<String> response = restTemplate.exchange(
                "http://localhost/" + port + "/api/hello",
                HttpMethod.POST,
                entity,
                String.class
        );
        assertThat(response).isNotNull();
        assertThat(response.getStatusCodeValue()).isEqualTo(200);
        assertThat(response.getBody()).isEqualTo("Hello, POST! Welcome, John");
    }
}
Explanation:
- SpringCorsApplicationTests class contains integration tests using @SpringBootTest.
- createHeaders() method generates HTTP headers with basic authentication and sets the request origin.
- testCorsConfiguration() and testPostHelloEndpoint() methods verify GET and POST requests respectively to /api/hello.
pom.xml file:
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.3.1</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.auxentios</groupId>
    <artifactId>spring-cors</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>spring-cors</name>
    <description>spring-cors</description>
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
Step 8: Testing the Application
Execute tests using Maven (./mvnw test) to validate CORS and security configurations.
./mvnw test
Test Logs:
Test Results:
Step 9: Run the Application
Starts the Spring Boot application on port 8080.
Step 10: Test the Endpoint
Send a GET request:
GET http://localhost/8080/api/hello
Output:
By following the above steps, we can setup the global CORS configuration that allows specific origins, headers and methods of the application. It ensures that the application communicate with the frontend applications running on the different domain securely.

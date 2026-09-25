# Integration testing in spring boot

> Source: https://www.geeksforgeeks.org/advance-java/integration-testing-in-spring-boot/

Integration Testing in Spring Boot verifies that multiple application components work together correctly. It can test the interaction between controllers, services, repositories, and databases.
- Tests interactions between multiple Spring components.
- Verifies data flow across application layers.
- Helps detect configuration and integration issues.
Why Use Integration Testing?
A typical Spring Boot application consists of multiple layers that work together to process a request:
- Verifies that the Controller, Service, Repository, and Database work together correctly.
- Checks whether data is passed correctly between different application layers.
- Tests complete application flows instead of testing individual components separately.
- Helps identify integration, configuration, and database-related issues.
- Verifies that API requests are processed correctly and the expected data is stored in the database.
- Complements unit testing by finding issues that may occur only when multiple components interact.
Step-by-Step Implementation
Step 1: Create a Spring Boot Project
Create a Spring Boot project using Spring Initializr with:
- Project: Maven
- Language: Java
- Java: 17
- Dependencies: Spring Web, Spring Data JPA, H2 Database, Spring Boot Starter Test
spring-boot-starter-test provides the commonly used testing libraries, including JUnit Jupiter and AssertJ.  
Step 2: Create the Entity
Create a User entity.
package com.example.demo.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    public User() {
    }
    public User(String name) {
        this.name = name;
    }
    public Long getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
Step 3: Create the Repository
Create a repository to access the database.
package com.example.demo.repository;
import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<User, Long> {
}
Step 4: Create the Service
Create a service to handle user operations.
package com.example.demo.service;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.springframework.stereotype.Service;
@Service
public class UserService {
    private final UserRepository repository;
    public UserService(UserRepository repository) {
        this.repository = repository;
    }
    public User saveUser(User user) {
        return repository.save(user);
    }
    public User getUser(Long id) {
        return repository.findById(id).orElseThrow();
    }
}
Step 5: Create the Controller
Create REST endpoints for creating and retrieving users.
package com.example.demo.controller;
import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.springframework.web.bind.annotation.*;
@RestController
@RequestMapping("/users")
public class UserController {
    private final UserService service;
    public UserController(UserService service) {
        this.service = service;
    }
    @PostMapping
    public User createUser(@RequestBody User user) {
        return service.saveUser(user);
    }
    @GetMapping("/{id}")
    public User getUser(@PathVariable Long id) {
        return service.getUser(id);
    }
}
Step 6: Configure the Test Database
spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driver-class-name=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password= 
spring.jpa.hibernate.ddl-auto=create-drop 
H2 provides an in-memory database for the test environment, so a separate database server is not required.
Step 7: Create the Integration Test
Use @SpringBootTest to load the application context and @AutoConfigureMockMvc to configure MockMvc.
package com.example.demo;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
@SpringBootTest
@AutoConfigureMockMvc
class UserIntegrationTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private UserRepository repository;
    @Test
    void createUserTest() throws Exception {
        mockMvc.perform(post("/users")
                .contentType(MediaType.APPLICATION_JSON)
                .content("""
                    {
                        "name": "John"
                    }
                    """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("John"));
        User user = repository.findAll().get(0);
        assertThat(user.getName()).isEqualTo("John");
    }
}
Step 8: Run the Test
Run the test from the IDE or use Maven:
mvn test
Testing JPA Repositories
Spring Boot provides @DataJpaTest for tests focused on JPA repositories and persistence-related components.
package com.example.demo;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import static org.assertj.core.api.Assertions.assertThat;
@DataJpaTest
class UserRepositoryTest {
    @Autowired
    private UserRepository repository;
    @Test
    void saveUserTest() {
        User user = repository.save(new User("John"));
        assertThat(user.getId()).isNotNull();
        assertThat(user.getName()).isEqualTo("John");
    }
}
Advantages
- Tests interactions between multiple application layers.
- Detects integration and configuration problems.
- Can verify REST API and database operations together.
- Finds problems that isolated unit tests may not detect.
- Can be automated as part of the build and CI/CD process.

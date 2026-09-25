# test slices spring boot

> Source: https://www.geeksforgeeks.org/advance-java/test-slices-spring-boot/

Test Slices in Spring Boot provide a way to test a specific part of an application without loading the entire Spring application context. Instead of starting all application components, a test slice loads only the beans required for the layer being tested.
- Helps isolate controllers, repositories, JSON serialization, and other specific parts of an application.
- Uses specialized annotations such as @WebMvcTest, @DataJpaTest, and @JsonTest.
- Test slices are mainly useful for focused tests rather than full application integration testing.
Why Use Test Slices?
In a typical Spring Boot application, the application context may contain controllers, services, repositories, security configuration, database configuration, and many other beans.
- Tests only a specific part of the application.
- Loads only the required Spring context, making tests faster.
- Reduces unnecessary dependencies and configuration.
- Makes it easier to find and fix errors in a particular layer.
- Helps test controllers, repositories, JSON, or other layers independently.
- Requires less setup compared to loading the complete application context.
Common Test Slice Annotations
1. @WebMvcTest
@WebMvcTest is used to test the Spring MVC web layer, especially controllers. It configures the MVC infrastructure and loads MVC-related components without starting the complete application.
It is useful when you want to test:
- Request mappings
- HTTP status codes
- Request and response handling
- Validation
- JSON responses
- Controller behavior
Example: Consider a simple controller:
package com.example.demo.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class UserController {
    @GetMapping("/users")
    public String getUsers() {
        return "Users List";
    }
}
Create a test class:
package com.example.demo.controller;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
@WebMvcTest(UserController.class)
class UserControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @Test
    void testGetUsers() throws Exception {
        mockMvc.perform(get("/users"))
                .andExpect(status().isOk())
                .andExpect(content().string("Users List"));
    }
}
Explanation
- @WebMvcTest(UserController.class) loads the web layer required to test UserController.
- MockMvc is used to perform an HTTP GET request.
- get("/users") calls the /users endpoint.
- status().isOk() checks that the response status is 200 OK.
- content().string("Users List") verifies the response body.
- The complete application context is not loaded.
2. @DataJpaTest 
@DataJpaTest is used to test the persistence layer of a Spring Boot application, especially JPA repositories and entity mappings. It is useful for testing:
- JPA repository methods such as save(), findById(), and delete().
- Custom query methods defined in repositories.
- Entity-to-table mappings.
Example
Create a User entity:
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
Create the repository
package com.example.demo.repository;
import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<User, Long> {
}
Now create the test
package com.example.demo.repository;
import com.example.demo.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import static org.assertj.core.api.Assertions.assertThat;
@DataJpaTest
class UserRepositoryTest {
    @Autowired
    private UserRepository userRepository;
    @Test
    void testSaveUser() {
        User user = new User("Aayush");
        User savedUser = userRepository.save(user);
        assertThat(savedUser.getId()).isNotNull();
        assertThat(savedUser.getName()).isEqualTo("Aayush");
    }
}
Explanation
- @DataJpaTest loads the JPA-related test configuration.
- UserRepository is injected into the test.
- A User object is saved using the repository.
- assertThat() verifies that the entity was saved successfully.
- The test focuses on the persistence layer rather than loading the complete application.
3. @JsonTest
@JsonTest is used to test JSON serialization and deserialization without loading the complete Spring Boot application context. It is useful for testing:
- Converting Java objects into JSON.
- Converting JSON into Java objects.
- JSON property names and values.
- Custom JSON serialization rules.
Example
Create a Product class: 
package com.example.demo.model;
public class Product {
    private String name;
    private double price;
    public Product() {
    }
    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
}
Create the test:
package com.example.demo.model;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.json.JsonTest;
import org.springframework.boot.test.json.JsonContent;
import org.springframework.boot.test.json.JsonTester;
import static org.assertj.core.api.Assertions.assertThat;
@JsonTest
class ProductJsonTest {
    @Autowired
    private JsonTester<Product> json;
    @Test
    void testSerializeProduct() {
        Product product = new Product("Laptop", 50000);
        JsonContent<Product> result = json.write(product);
        assertThat(result).extractingJsonPathStringValue("$.name")
                .isEqualTo("Laptop");
        assertThat(result).extractingJsonPathNumberValue("$.price")
                .isEqualTo(50000);
    }
}
Explanation
- @JsonTest loads the JSON testing configuration.
- JsonTester is used to serialize theProduct object.
- json.write(product) converts the Java object into JSON.
- JSON path expressions are used to verify individual JSON fields.
- The test focuses only on JSON serialization.
4. @WebFluxTest
@WebFluxTest is used to test the Spring WebFlux web layer, especially reactive controllers. It is useful for testing:
- Reactive controller endpoints.
- Request mappings and HTTP methods.
- Reactive request and response handling.
Example:
@WebFluxTest(UserController.class)
class UserControllerTest {
    // WebFlux controller tests
}
It is useful when testing reactive endpoints without loading the complete application context.
5. @JdbcTest
@JdbcTest is used to test the JDBC-based persistence layer of a Spring Boot application. It is useful for testing:
- JdbcTemplate database operations.
- Inserting, updating, retrieving, and deleting records using JDBC.
- Row mapping and result processing.
- Database-related JDBC configuration.
Example:
@JdbcTest
class UserJdbcTest {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Test
    void testDatabase() {
        Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM users",
                Integer.class
        );
        assertThat(count).isNotNull();
    }
}
How Test Slices Work
Test slices work by loading only the beans and auto-configuration required for a specific part of the Spring Boot application instead of loading the complete application context.
For example: when @WebMvcTest is used, Spring Boot focuses on the web layer and loads components required for testing controllers.
Working
- The test-slice annotation identifies the application layer being tested.
- Spring Boot applies the appropriate test auto-configuration for that slice.
- Only relevant components are included in the test context.
- Dependencies outside the slice can be provided as mocks when required.
- The test can then focus on the selected layer without starting the entire application.
Advantages of Test Slices
- Faster tests: Only the required application components are loaded.
- Better isolation: Each test can focus on a specific application layer.
- Easy debugging: Failures are easier to associate with the layer being tested.
- Less configuration: Spring Boot automatically configures the components needed by the selected slice.
- Better maintainability: Tests remain focused and easier to understand.
- Reduced dependency on unrelated components: A controller test does not need the complete database or service layer.
Limitations of Test Slices
Test slices are not intended to replace full integration tests.
- They do not load the complete application context.
- They may require mocks for dependencies outside the selected slice.
- They are not suitable when you need to verify the interaction between multiple application layers.
- A successful slice test does not guarantee that the complete application works correctly.

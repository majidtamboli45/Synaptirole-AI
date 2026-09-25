# Show SQL from Spring Data JPA/Hibernate in Spring Boot

> Source: https://www.geeksforgeeks.org/advance-java/show-sql-from-spring-data-jpa-hibernate-in-spring-boot

When working with Spring Boot applications using Spring Data JPA and Hibernate, it is often useful to see the actual SQL queries being executed. This helps in debugging, performance tuning, and understanding how JPQL or repository methods are translated into SQL.
- Helps in debugging database interactions and verifying generated queries
- Useful for performance optimization and query analysis
- Provides better understanding of how Hibernate translates Java code into SQL
Steps to Show SQL from Spring Data JPA/Hibernate in Spring Boot
To show the SQL from Spring Data JPA or Hibernate in Spring Boot set the below log level.
1. Set the Logging Level:
- Open application.properties (or application.yml).
- Add the following property:
logging.level.org.hibernate.SQL=DEBUG
This enables Hibernate to log all generated SQL queries.
2. View the Logs
- Check the console or log files.
- You will see: Executed SQL queries and Parameters bound to queries
Step-by-Step Implementation
We have developed a simple spring boot project to show the SQL from JPA/hibernate of the project.
Step 1: Create Spring Boot Project
Create a Spring Boot project using STS/IntelliJ with required dependencies:
- Spring Web
- Spring Data JPA
- MySQL Driver
- Lombok
- Spring DevTools
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
    <groupId>com.example</groupId>
    <artifactId>show-SQL-demo</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>show-SQL-demo</name>
    <description>show-SQL-demo</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
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
            <groupId>com.mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <scope>runtime</scope>
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
Once the project is created, the file structure looks like the below image.
Step 2: Configure application.properties
Add MySQL database configuration and enable SQL logging:
spring.application.name=show-SQL-demo # Data Source properties spring.datasource.url=jdbc:mysql://localhost:3306/example spring.datasource.username=root spring.datasource.password= spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver # Hibernate properties spring.jpa.hibernate.ddl-auto=update spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect # Logging level for Hibernate SQL logging.level.org.hibernate.SQL=DEBUG
Step 3: Create Entity Class
- Create the new Java package named as model in that package create the new Java class named as User.
- Go to src > main > java > showsqldemo > model > User and put the code below.
package com.example.showsqldemo.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    // Unique identifier for the user
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // Name of the user
    private String name;
    
    // Email address of the user
    private String email;
}
Step 4: Create Repository Layer
- Create the new Java package named as repository in that package create the new Java class named as UserRepository.
- Go to src > main > java > showsqldemo > repository > UserRepository and put the code below.
package com.example.showsqldemo.repository;
import com.example.showsqldemo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
// Repository interface for managing User entities
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
Step 5: Create Service Layer
- Create the new Java package named as service in that package create the new Java class named as UserService.
- Go to src > main > java > showsqldemo > service > UserService and put the code below.
package com.example.showsqldemo.service;
import com.example.showsqldemo.model.User;
import com.example.showsqldemo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
// Service class for managing User entities
@Service
public class UserService {
    // UserRepository dependency
    private final UserRepository userRepository;
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    // Method to get all users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
Step 6: Create Controller Layer
- Create the new Java package named as controller in that package create the new Java class named as UserController.
- Go to src > main > java > showsqldemo > service > UserService and put the code below.
package com.example.showsqldemo.controller;
import com.example.showsqldemo.model.User;
import com.example.showsqldemo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
// Controller class for managing user-related endpoints
@RestController
@RequestMapping("/api/users")
public class UserController {
    // UserService dependency
    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    // Endpoint to get all users
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}
Step 7: Main Class
Open the main class file and put the below code.
package com.example.showsqldemo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class ShowSqlDemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShowSqlDemoApplication.class, args);
    }
}
Step 8: Run and Observe SQL Logs
- Once the project completed, then run the application as a spring project then it run at port 8080.
- If we observe the below image, then we can find the logging data of the table creation of the project into the MySQL database.
If we follow the above steps, then we can successfully implement this showing SQL from the Spring Data JPA/hibernate into the project.

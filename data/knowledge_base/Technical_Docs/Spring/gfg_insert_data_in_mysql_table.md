# Insert Data in MySQL Table

> Source: https://www.geeksforgeeks.org/advance-java/spring-data-jpa-insert-data-in-mysql-table/

Spring Data JPA simplifies database operations in Spring Boot by eliminating boilerplate code. It provides built-in methods to perform CRUD (Create, Read, Update, Delete) operations on relational databases like MySQL.
In this article, we will learn how to insert data into a MySQL database using Spring Boot, Spring Data JPA, and Hibernate with the save() method of JpaRepository.
JPARepository.save() Method
The save() method in JpaRepository is used to insert or update an entity in the database.
userRepository.save(user);
If the entity does not exist, it will be inserted. If it exists (based on its primary key), it will be updated.
Step By Step Implementation
Step 1: Create a Spring Boot Project
1. Visit Spring Initializr.
2. Select:
- Spring Boot Version: 3.x
- Project: Maven Project
- Language: Java
3. Add the following dependencies:
- Spring Web
- Spring Data JPA
- MySQL Driver
Click Generate, extract the project, and open it in your IDE.
Note: Use JDK 17 or later.
Step 2: Configure pom.xml
Ensure your pom.xml contains the required dependencies and uses a supported Java version.
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 
                             https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
        <relativePath/>
    </parent>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <!-- Spring Boot Starters -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <!-- MySQL Driver -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <scope>runtime</scope>
        </dependency>
        <!-- Testing -->
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
Step 3: Configure Database in application.properties
Set up your database credentials and Hibernate configuration in src/main/resources/application.properties:
spring.datasource.url=jdbc:mysql://localhost:3306/user_db
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
Note: Replace user_db with your database name and ensure MySQL is running locally.
Step 4: Create Entity Class
Define an entity class to map Java objects to the database table.
User.java:
import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String name;
}
- @Entity marks this class as a JPA entity.
- @Table(name = "users") specifies the database table name.
- @GeneratedValue automatically generates the primary key value.
Step 5: Create Repository Interface
The repository interface extends JpaRepository to enable CRUD operations.
UserRepository.java:
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
}
No implementation is required since Spring Data JPA automatically provides one at runtime.
Step 6: Insert Data Using save() Method
Use the CommandLineRunner interface to execute code after the application starts.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringBootAppApplication implements CommandLineRunner {
    @Autowired
    private UserRepository userRepository;
    public static void main(String[] args) {
        SpringApplication.run(SpringBootAppApplication.class, args);
    }
    @Override
    public void run(String... args) {
        User firstUser = new User();
        firstUser.setName("Aayush");
        userRepository.save(firstUser);
        System.out.println("User inserted successfully!");
    }
}
Step 7: Run the Application
Run the application from your IDE or using the command:
mvn spring-boot:run
The Spring Boot application will start and automatically insert a new record into the users table.
Output:
Step 8: Verify the Data in MySQL
Execute the following SQL query in MySQL to confirm insertion:
SELECT * FROM users;
Output:

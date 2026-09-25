# Delete Records From MySQL

> Source: https://www.geeksforgeeks.org/advance-java/spring-data-jpa-delete-records-from-mysql/

Spring Data JPA makes deleting records from a MySQL database simple by providing built-in repository methods like deleteById() and delete(). It eliminates the need for manual SQL queries and integrates seamlessly with Spring Boot for efficient data management.
- deleteById() is a predefined method of JpaRepository
- No need to write custom SQL queries
- Can be combined with existsById() for safe deletion
Real-world example: In an e-commerce application, when a user cancels their account, then we can use Spring Data JPA to delete the user record from the database. Similarly, an admin panel may allow administrators to remove inactive users or outdated products using repository delete methods without writing custom SQL.
Step By Step Implementation to Delete a record
Follow these steps to create, configure, and run a Spring Boot application that deletes records from a MySQL database using the deleteById() method in Spring Data JPA.
Step 1: Create a Spring Boot Project
1. Go to Spring Initializr
2. Fill the following details:
- Project: Maven Project
- Language: Java
- Spring Boot: 3.x.x (Latest stable version)
- Group: com.example
- Artifact: SpringBootApp
- Name: SpringBootApp
- PackageName: com.example
- Packaging: Jar
- Java Version: 17
3. Add the following dependencies:
- Spring Data JPA
- Spring Web
- MYSQL Driver
4. Click on Generate to download the project as a ZIP file.
Step 2: Open Project in IDE
- Extract the zip file
- Now open a suitable IDE and then go to File->New->Project from existing sources->Springbootapp and select pom.xml. Click on import changes on prompt and wait for the project to sync.
Note: Ensure the same JDK version is selected while importing the project. Also, configure the database connection before running the application.
Step 3: Add Required Dependencies
The pom.xml file contains the project dependencies and configuration.
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.4.3</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.example</groupId>
    <artifactId>SpringBootApp</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>SpringBootApp</name>
    <description>Demo project for Spring Boot</description>
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
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
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
Step 4: Configure Database in (application.properties)
Add the following properties of database before executing the program in src/main/resources/application.properties file
spring.datasource.url=jdbc:mysql://localhost:3306/userdb
spring.datasource.username=root       # replace with your MySQL username
spring.datasource.password=yourpassword  # replace with your MySQL password
spring.jpa.hibernate.ddl-auto=update
Project Directory Structure:
Step 5: Create the Entity Class
Create a User entity class that represents a table in the MySQL database.
import jakarta.persistence.*; 
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int id;
    String name;
    User() {}
    User(int id, String name)
    {
        this.id = id;
        this.name = name;
    }
}
Step 6: Create the Repository Interface
Create a repository interface that extends JpaRepository to perform CRUD operations.
import org.springframework.data.jpa.repository.JpaRepository;
interface UserRepo extends JpaRepository<User,Integer> {
  
}
Step 7: Implement the Main Application Class
The main application class implements CommandLineRunner to execute code at startup. Here, we insert a record and then delete it using the deleteById() method.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.util.Assert;
@SpringBootApplication
public class SpringBootAppApplication implements CommandLineRunner {
    @Autowired
    UserRepo ob;
    public static void main(String[] args) {
        SpringApplication.run(SpringBootAppApplication.class, args);
    }
    @Override
    public void run(String... args) throws Exception {
        // Inserting the data in the MySQL table.
        User first = new User(1, "Aayush");
         // Save the record before deleting it
        ob.save(first); 
        System.out.println("Record inserted successfully.");
        // Deleting the record with id 1
        if (ob.existsById(1)) { 
             // Check if the record exists
            ob.deleteById(1);
            System.out.println("Record deleted successfully.");
        } else {
            System.out.println("Record not found.");
        }
    }
}
Step 8: Run the Application
Ensure MySQL is running and the user database exists. Run the application using the following command
mvn spring-boot:run
Output:
Step 9: Test The API
Use Postman or browser
- If record exists -> "Record deleted successfully."
-  If not -> "Record not found."
DELETE http://localhost:8080/users/1
Database Output:

# Entity and Repository in spring boot

> Source: https://www.geeksforgeeks.org/advance-java/entity-and-repository-in-spring-boot/

Spring Boot simplifies database application development by providing auto-configuration and starter dependencies. When working with a database using Spring Data JPA, two important components are Entity and Repository.
- @Entity marks a Java class as a JPA entity.
- A Repository is used to perform database operations.
Entity in Spring Boot
An Entity is a Java class that represents a table in the database. It is marked with the @Entity annotation, and its fields generally represent columns of that table.
Common Entity Annotations
- @Entity –> Marks a class as a JPA entity.
- @Table –> Specifies the database table name.
- @Id –> Marks a field as the primary key.
- @GeneratedValue –> Automatically generates primary-key values.
- @Column –> Specifies details about a database column.
Repository in Spring Boot
A Repository is an interface that provides database operations for an Entity. Spring Data JPA provides repository interfaces such as JpaRepository that already contain commonly used CRUD methods.
For example, StudentRepo can be used to perform database operations on the Student entity.
Step-by-Step Implementation
Step 1: Create a Spring Boot Project
Use Spring Initializr to generate the project. Project Configuration:
- Project: Maven
- Language: Java
- Spring Boot: 2.5.6
- Packaging: JAR
- Java: 11
- Dependencies: Spring Web, Spring Data JPA, MySQL Driver
Click on Generate to download the starter project.
Step 2: Import the Project into IDE
- Extract the downloaded ZIP file.
- Open the project in your IDE.
- Select the pom.xml file if required.
- Wait for Maven dependencies to download.
Step 3: Configure Database Properties
Add the following properties to application.properties:
spring.datasource.username=root
spring.datasource.password=Aayush
spring.datasource.url=jdbc:mysql://localhost:3306/studentdb
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true 
Step 4: Create an Entity Class
Create a Models package and create a Student class.
package com.example.demo.Models;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rollno;
    private String name;
    public Student() {
    }
    public Student(int rollno, String name) {
        this.rollno = rollno;
        this.name = name;
    }
    public int getRollno() {
        return rollno;
    }
    public void setRollno(int rollno) {
        this.rollno = rollno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
Explanation
- @Entity tells JPA that Student is a persistent entity.
- @Table(name = "student") maps the class to the student table.
- @Id marks rollno as the primary key.
- @GeneratedValue allows the database to generate the primary-key value.
- name is mapped to a column in the student table.
- The no-argument constructor is required by JPA.
Step 5: Create Repository Interface
Create a Repository package and create StudentRepo.
package com.example.demo.Repository;
import com.example.demo.Models.Student;
import org.springframework.data.jpa.repository.JpaRepository;
public interface StudentRepo extends JpaRepository<Student, Integer> {
}
Explanation
- StudentRepo is an interface for database operations on theStudent entity.
- JpaRepository<Student, Integer> specifies:Student → Entity type. Integer → Type of the entity's primary key.
- Spring Data JPA automatically provides the implementation.
- No implementation class is required.
Step 6: Use Repository to Save Data
We can use CommandLineRunner to save a student when the application starts.
package com.example.demo;
import com.example.demo.Models.Student;
import com.example.demo.Repository.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class DemoApplication implements CommandLineRunner {
    @Autowired
    StudentRepo studentRepo;
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
    @Override
    public void run(String... args) {
        Student student = new Student(1, "Aayush");
        studentRepo.save(student);
        System.out.println("Student saved successfully");
    }
}
Explanation
- CommandLineRunner executes the code after the Spring Boot application starts.
- A Student object is created.
- studentRepo.save(student) saves the object into the database.
- JPA converts the entity object into an SQL INSERT operation.
- The corresponding record is stored in the student table.
Step 7: Check Data in MySQL
After running the application, execute:
mysql> select * from student;
Output:
The Student entity is mapped to the student table, and the StudentRepo is used to save the record.

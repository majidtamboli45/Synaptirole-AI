# Unit Testing in Spring Boot Project using Mockito and Junit

> Source: https://www.geeksforgeeks.org/advance-java/unit-testing-in-spring-boot-project-using-mockito-and-junit/

Unit testing is a practice in software development, ensuring that individual components of an application work correctly. In Spring Boot projects, Mockito and JUnit are used to write clean, maintainable unit tests.
Technologies used
- Spring Boot: Java framework for rapid application development.
- JUnit 5: Popular testing framework for Java applications.
- Mockito: A Mocking framework that simulates dependencies, allowing testing in isolation.
Annotations and Testing Utilities
- @Mock: Creates mock objects to simulate real ones during testing using Mockito.
- @InjectMocks: Injects mock dependencies into the object under test.
- assert Methods: Used in testing to verify expected outcomes like equality, null or exception checks.
Step-by-Step Implementation
Step 1: Create a Spring Boot project.
We can create a Spring Boot Project with IntelliJ IDEA or Spring Initializr. Include the following dependencies:
- Spring Web
- MySQL Database
- Lombok
- Spring Data JPA
Example: pom.xml File
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.5.4</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.demo</groupId>
    <artifactId>BootDemoApp</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>BootDemoApp</name>
    <description>BootDemoApp</description>
    <properties>
        <java.version>16</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
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
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
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
Step 2: Project Structure
Create the packages and files as seen in the below image. Below is the complete file structure of this project.
Step 3: Create Entity Class
It is done via creating a simple POJO class inside the Person.java file.
package com.demo.entities;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer personId;
    private String personName;
    private String personCity;
}
Step 4: Create Repository Interface
Create a simple interface and name the interface as PersonRepo. This interface is going to extend the JpaRepository.
package com.demo.repo;
import com.demo.entites.Person;
import org.springframework.data.jpa.repository.JpaRepository;
// Interface Extends JpaRepository
public interface PersonRepo extends JpaRepository<Person, Integer> {
    //Spring data jpa  will automatically provide implementation for it when using existsBy{fieldName}
    boolean existsById(Integer id);
}
Note: JpaRepository provides built-in CRUD methods.
Step 5: Create Service Class
Inside the service package create one class named as PersonService .
package com.demo.service;
import com.demo.entites.Person;
import com.demo.repo.PersonRepo;
import java.util.List;
import org.springframework.stereotype.Service;
@Service
public class PersonService {
    //No need to use @Autowired when using Constructor Injection Dependencies are final
    private final PersonRepo repo;
    public PersonService(PersonRepo repo)
    {
        // this keyword refers to current instance
        this.repo = repo;
    }
    public List<Person> getAllPerson()
    {
        return repo.findAll();
    }
}
Note: Constructor-based dependency injection is preferred over @Autowired.
Step 6: Create Controller Class
Inside the controller package create one class named as PersonController.
package com.demo.controller;
import com.demo.entites.Person;
import com.demo.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
@RestController
public class PersonController {
    //Constructor Based Injection No need of using @Autowired
    private final PersonService personService;
    public PersonController(PersonService personService){
        this.personService=personService;
    }
    @GetMapping("/persons")
    public ResponseEntity<List<Person>> getAllPersons() {
        return ResponseEntity.ok(personService.getAllPerson());
;
    }
}
Step 7: Configure application.properties
Below is the code for the application.properties file
server.port=8082
spring.jpa.hibernate.ddl-auto=update
spring.datasource.url=jdbc:mysql://localhost:3306/schooldb
spring.datasource.username=amiya559
spring.datasource.password=password.123
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.show-sql=true
Now your sample spring boot project is ready and we are going to perform unit testing in this sample project.
Step 8: Prepare Test Packages
Create the following packages and the classes as shown in the below image. (Inside the green color box) 
Step 9: Unit Test for Repository
Inside the test -> repo package creates one class named as PersonRepoTest .
package com.demo.repo;
import com.demo.entites.Person;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import static org.assertj.core.api.Assertions.assertThat;
@DataJpaTest
public class PersonRepoTest {
    @Autowired
    private PersonRepo personRepo;
    @Test
    public void testExistsById() {
        Person person = new Person(null, "Test Name", "City");
        person = personRepo.save(person);
        boolean exists = personRepo.existsById(person.getPersonId());
        assertThat(exists).isTrue();
    }
}
Step 10: Unit Test for Service
Inside the test -> services package creates one class named as PersonServiceTest .
package com.demo.services;
//USing BDD Mockito 
import static org.mockito.BDDMockito.verify;
import static org.mockito.BDDMockito.given;
import static org.assertj.core.api.Assertions.assertThat;
import com.demo.repo.PersonRepo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
@ExtendWith(MockitoExtension.class)
class PersonServiceTest {
    @Mock
  private PersonRepo personRepo;
  //When using Mockito Use @InjectMocks to inject Mocked beans to following class
    @InjectMocks
  private PersonService personService;
@Test
void getAllPerson() {
    Person person1 = new Person(1, "Rahul Sharma", "Delhi");
    Person person2 = new Person(2, "Anita Singh", "Mumbai");
    given(personRepo.findAll()).willReturn(List.of(person1, person2));
    List<Person> personList = personService.getAllPerson();
    assertThat(personList).isNotNull();
    assertThat(personList.size()).isEqualTo(2);
    verify(personRepo).findAll(); // Optional but recommended
}
}
Similarly, we can perform testing of different units of your spring boot project.
Step 11: Run the Application
If we run that code on a server using port number 8082, we will get the following output.
- API Response: List of persons in JSON format.
- Unit Tests: Green checks for successful repository and service tests.
Test in the browser:
http://localhost:8082/persons

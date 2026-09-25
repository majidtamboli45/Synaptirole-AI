# Spring Data MongoDB

> Source: https://www.geeksforgeeks.org/advance-java/spring-data-mongodb/

Spring Data MongoDB is an Extremely useful tool for Java developers working with MongoDB databases. It simplifies data access and manipulation, provides a consistent programming model, and enhances developer productivity when building MongoDB-backed applications in the Spring ecosystem. It allows MongoDB collections and documents to be mapped to Java POJO classes using annotations like @Document and @Id. This object-document mapping reduces boilerplate code. It provides a MongoTemplate class for executing common MongoDB operations like find, save, update, and delete. This acts as the central API for data access.
Important Concepts in Spring Data MongoDB
- Repository: A repository is an interface that provides CRUD (create, read, update, delete) operations for a specific domain object. Spring Data MongoDB provides a number of repository interfaces that you can extend to get started quickly.
- Document: A document is a MongoDB data object. It is a JSON-like object that can be stored in a MongoDB collection.
- Query: A query is a way to retrieve documents from a MongoDB collection. Spring Data MongoDB provides a number of query methods that you can use to build queries.
To use Spring Data MongoDB, you need to
- Install the Spring Data MongoDB dependency in your project.
- Create a MongoDB database and collection.
- Create a Spring Boot application.
- Configure Spring Data MongoDB in your application.
- Create a repository interface for your domain object.
- Use the repository interface to store, retrieve, query, and manage data in MongoDB.
Working With Documents
- Define Java classes annotated with @Document to represent documents in MongoDB collections.
- The class name will be used as the collection name by default. Can specify collection name explicitly using @Document(collection="collectionName").
- Fields in the document are mapped to properties in the Java class. Use annotations like @Id, @Field, etc. to customize mapping.
- @Id annotation denotes the property that holds the unique identifier value of the document. It can be of any valid type like String, Integer, etc.
Relational Mapping
- Repositories provide a more declarative interface for data access compared to imperative MongoTemplate.
- Define a repository interface extending MongoRepository<EntityType, IdType> where EntityType is the document class and IdType is the id property type.
- This will provide implementations of common CRUD methods like save(), findById(), findAll() etc out of the box without writing any code.
MongoDB Query Language
- Query objects are used to build complex MongoDB queries programmatically.
- Create a Query instance and call methods like where(), regex(), etc. to add criteria.
- Common criteria methods are:
  - where(criteria) - add a Criteria object
  - regex(field, pattern) - regex match
  - near(point) - geospatial query
  - withinSphere(point, distance) - geospatial query
  - withinPolygon(polygon) - geospatial query
Example Project
Create a Spring Boot application and Install the Spring Data MongoDB dependency in your project:
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.1.4</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.mongo.demo</groupId>
    <artifactId>Spring_MongoDB</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>Spring_MongoDB</name>
    <description>Demo project for Spring Boot MongoDB</description>
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
            <artifactId>spring-boot-starter-web</artifactId>
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
Create a MongoDB database and collection:
Configure Spring Data MongoDB in your application:
spring.data.mongodb.host=localhost
spring.data.mongodb.port=27017
spring.data.mongodb.database=Spring_MongoDB_Demo
Create a Pojo Class , Controller and repository interface for your project:
// Pojo Class
package com.mongo.demo.entity;
import org.springframework.data.mongodb.core.mapping.Document;
@Document(collection = "employees")
public class Employee {
    private int id;
    private String emp_name;
    private String emp_city;
    private String emp_salary;
    public Employee()
    {
        super();
        // TODO Auto-generated constructor stub
    }
    public Employee(int id, String emp_name,
                    String emp_city, String emp_salary)
    {
        super();
        this.id = id;
        this.emp_name = emp_name;
        this.emp_city = emp_city;
        this.emp_salary = emp_salary;
    }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEmp_name() { return emp_name; }
    public void setEmp_name(String emp_name)
    {
        this.emp_name = emp_name;
    }
    public String getEmp_city() { return emp_city; }
    public void setEmp_city(String emp_city)
    {
        this.emp_city = emp_city;
    }
    public String getEmp_salary() { return emp_salary; }
    public void setEmp_salary(String emp_salary)
    {
        this.emp_salary = emp_salary;
    }
}
// Controller
package com.mongo.demo.controller;
import com.mongo.demo.entity.Employee;
import com.mongo.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeRepository employeeRepository;
    @PostMapping("/")
    public ResponseEntity<?>
    addEmployee(@RequestBody Employee employee)
    {
        Employee save
            = this.employeeRepository.save(employee);
        return ResponseEntity.ok(save);
    }
    @GetMapping("/") public ResponseEntity<?> getEmployee()
    {
        return ResponseEntity.ok(
            this.employeeRepository.findAll());
    }
}
// Employee Repository
package com.mongo.demo.repository;
import com.mongo.demo.entity.Employee;
import org.springframework.data.mongodb.repository.MongoRepository;
public interface EmployeeRepository
    extends MongoRepository<Employee, Integer> {
}

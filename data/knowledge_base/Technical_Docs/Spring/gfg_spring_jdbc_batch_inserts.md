# Spring JDBC Batch Inserts

> Source: https://www.geeksforgeeks.org/advance-java/spring-jdbc-batch-inserts/

Batch processing is a common technique used to efficiently handle large volumes of data. In this article, we'll implement Spring JDBC batch inserts in a Spring Boot application. Additionally, we’ll cover performance considerations and optimization strategies for batch operations.
Introduction to Batch Inserts
Batch inserts in Spring JDBC involve inserting multiple records into the database in a single operation rather than inserting each record individually. This approach significantly improves the performance, especially when dealing with large datasets, by reducing the number of round trips between the application and the database.
How Batch Inserts Work
When you perform the batch insert, the application groups the set of SQL insert statements into the batch and sends them to the database server in one go. The database processes these statements together and reduces the overhead associated with the individual insert operations.
Key Components
To implement batch inserts in the Spring JDBC, We can typically use the following components:
- JdbcTemplate: This is the central class in the Spring JDBC module which simplifies the database operations. It provides various methods for executing the SQL statements including the batch operations.
- BatchPreparedStatementSetter: It is an interface used to set the parameters values on the PreparedStatement for the each batch. It has two methods:
  - setValues(PreparedStatement ps, int i): It sets the parameter values on the PreparedStatement for the record at index i.
  - getBatchSize(): It returns the total number of the records in the batch.
Benefits of Batch Inserts
- Reduced Database Round-Trips: By bundling multiple inserts into a single batch, you reduce the overhead associated with multiple network round-trips between the application and the database.
- Improved Performance: Batch processing can improve performance by reducing the time spent on database operations. This is particularly useful for large datasets.
- Transaction Management: Batch operates can be executed within the single transaction and ensuring the atomicity and consistency.
- Efficient Resource Utilization: Batch inserts allow for more efficient use of database and application server resources, as fewer resources are spent on managing individual insert operations.
Implementation of Spring JDBC Batch Inserts
Consider the example where you need to insert the list of employees into a database. Instead of inserting the each employee one by one, we can use the batch inserts to insert all the employees in the single database call.
Step 1: Create a Spring Boot Application
Start by creating a new Spring Boot project. You can use Spring Initializr or your preferred IDE to set up the project.
- Name: Spring-JDBC-Batch-inserts
- Language: Java
- Type: Gradle-Groovy
- Packaging: Jar
Click on the Next button.
Step 2: Add the Dependencies
Make sure to include the following dependencies:
- Spring Web
- Spring Data JPA
- Spring Data JDBC
- Lombok
- Spring Dev Tools
Click on the Create button.
Step 3: Project Structure
After project creation done, the folder structure will look like the below image:
Step 4: Configure Application Properties
In the application.properties file, configure your database settings. For this example, we use an H2 in-memory database.
spring.application.name=Spring-JDBC-Batch-inserts
spring.datasource.url=jdbc:mysql://localhost:3306/batchData
spring.datasource.username=root
spring.datasource.password=mypassword
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update
Step 5: Create the Employee Entity Class
Create the Employee entity class that represents the employee table in the MySQL database of the Spring Project.
package com.gfg.springjdbcbatchinserts;
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
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String department;
    private double salary;
}
Step 6: Create the EmployeeRepository Interface
Create the EmployeeRepository interface for the CRUD operations of the Spring Boot Application.
package com.gfg.springjdbcbatchinserts;
import org.springframework.data.jpa.repository.JpaRepository;
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
Step 7: Implement the Batch Insert Logic
Create the EmployeeService class to use the JdbcTemplate and BatchPreparedStatementSetter to implement the batch operations of the Spring Boot Project.
package com.gfg.springjdbcbatchinserts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
@Service
public class EmployeeService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public void batchInsert(List<Employee> employees) {
        String sql = "INSERT INTO employee (name, department, salary) VALUES (?, ?, ?)";
        jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                Employee employee = employees.get(i);
                ps.setString(1, employee.getName());
                ps.setString(2, employee.getDepartment());
                ps.setDouble(3, employee.getSalary());
            }
            @Override
            public int getBatchSize() {
                return employees.size();
            }
        });
    }
}
Step 8: Create the EmployeeController Class
Create the REST controller endpoint to handle the incoming HTTP requests and trigger the batch insert operation of the Spring Boot Project.
package com.gfg.springjdbcbatchinserts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
@RestController
@RequestMapping("/employees")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @PostMapping("/batch")
    public ResponseEntity<String> batchInsert(@RequestBody List<Employee> employees) {
        employeeService.batchInsert(employees);
        return ResponseEntity.ok("Batch insert completed");
    }
}
Step 9: Main class
No changes are required in the main class.
package com.gfg.springjdbcbatchinserts;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringJdbcBatchInsertsApplication {
	public static void main(String[] args) {
		SpringApplication.run(SpringJdbcBatchInsertsApplication.class, args);
	}
}
build.gradle:
plugins {
	id 'java'
	id 'org.springframework.boot' version '3.3.2'
	id 'io.spring.dependency-management' version '1.1.6'
}
group = 'com.gfg'
version = '0.0.1-SNAPSHOT'
java {
	toolchain {
		languageVersion = JavaLanguageVersion.of(17)
	}
}
configurations {
	compileOnly {
		extendsFrom annotationProcessor
	}
}
repositories {
	mavenCentral()
}
dependencies {
	implementation 'org.springframework.boot:spring-boot-starter-data-jdbc'
	implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
	implementation 'org.springframework.boot:spring-boot-starter-web'
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.mysql:mysql-connector-j'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
}
tasks.named('test') {
	useJUnitPlatform()
}
Step 10: Run the Application
Once the project is completed, run the application and it will start at port 8080.
Step 11: Test the Endpoint
Now, we will test the endpoint using Postman tool.
POST http://localhost:8080/employee/batch
Output:
Employee Data in the Database
Performance Analysis and Optimization
Batch vs. Regular Inserts
- Batch Inserts: Combining multiple insert operations into a single batch reduces the number of database interactions and improves performance. This method is particularly effective for large datasets.
- Regular Inserts: Executing individual insert statements increases database interactions and overhead, leading to slower performance compared to batch inserts.
Performance Considerations
- Batch Size: Experiment with different batch sizes to find the optimal configuration. A batch size that is too large may cause memory issues, while a batch size that is too small may not fully leverage performance gains.
- Database Indexes: Indexes can improve query performance but may slow down insert operations. Optimize indexes based on your application's needs.
- Transaction Management: Wrapping batch operations in a transaction ensures atomicity and consistency. Use Spring’s @Transactional annotation to manage batch operations effectively.
- Database Configuration: Configure your database settings to handle batch operations efficiently. Some databases offer specific settings for optimizing batch processing.
Conclusion
By following these steps and using the provided code snippets, you can efficiently perform batch inserts in Spring JDBC, significantly improving the performance of database operations. The enhancements provided in this article help ensure that your application remains performant and scalable.

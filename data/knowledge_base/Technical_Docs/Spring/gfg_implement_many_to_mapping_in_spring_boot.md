# Implement Many-to-Many Mapping in Spring Boot

> Source: https://www.geeksforgeeks.org/advance-java/implement-many-to-many-mapping-in-spring-boot/

Spring Boot simplifies Java application development by providing auto-configuration, embedded servers, and starter dependencies. A Many-to-Many relationship means that multiple records in one entity can be associated with multiple records in another entity.
- A many-to-many relationship generally requires a join table.
- @JoinTable defines the join table and its foreign-key columns.
One-to-One Mapping in JPA
- A One-to-One relationship means one record of one entity is associated with exactly one record of another entity.
- It is represented using the @OneToOne annotation in JPA.
- A One-to-One relationship can be unidirectional or bidirectional.
One-to-One mapping is commonly used for relationships such as:
- Employee-> Employee Details
- User-> User Profile
- Person-> Passport
- Student-> Student Profile
Step-by-Step Implementation
Step 1: Create a Spring Boot Project
Use Spring Initializr to generate the project. Keep the project configuration:
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
-  Select the pom.xml file if required.
- Wait for Maven dependencies to download.
Step 3: Configure Database Properties
Add the following properties to application.properties:
spring.datasource.username=root
spring.datasource.password=Aayush
spring.datasource.url=jdbc:mysql://localhost:3306/mapping
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true  
Step 4: Create Entity Classes
Create a Models package and add the following classes.
StudentInformation Entity
package com.example.Mapping.Models;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
@Entity
@Table(name = "student")
public class StudentInformation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rollno;
    private String name;
    @ManyToMany
    @JoinTable(
        name = "student_course",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> courses = new HashSet<>();
    public StudentInformation() {
    }
    public StudentInformation(int rollno, String name) {
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
    public Set<Course> getCourses() {
        return courses;
    }
    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }
}
Explanation:
- @ManyToMany specifies that one student can be associated with multiple courses.
- @JoinTable specifies the intermediate table used to maintain the relationship.
- student_course is the join table.
- student_id stores the student reference.
- course_id stores the course reference.
- Set<Course> stores multiple courses associated with a student.
Course Entity
package com.example.Mapping.Models;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
@Entity
@Table(name = "course")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String courseName;
    @ManyToMany(mappedBy = "courses")
    private Set<StudentInformation> students = new HashSet<>();
    public Course() {
    }
    public Course(int id, String courseName) {
        this.id = id;
        this.courseName = courseName;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCourseName() {
        return courseName;
    }
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    public Set<StudentInformation> getStudents() {
        return students;
    }
    public void setStudents(Set<StudentInformation> students) {
        this.students = students;
    }
}
Step 5: Create Repository Interfaces
Create a Repository package and add the following interfaces.
Student Repository:
package com.example.Mapping.Repository;
import com.example.Mapping.Models.StudentInformation;
import org.springframework.data.jpa.repository.JpaRepository;
public interface StudentRepo
        extends JpaRepository<StudentInformation, Integer> {
}
Course Repository:
package com.example.Mapping.Repository;
import com.example.Mapping.Models.Course;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CourseRepo
        extends JpaRepository<Course, Integer> {
}
Explanation:
- JpaRepository provides predefined CRUD operations.
- StudentRepo performs database operations on the student table.
- CourseRepo performs database operations on the course table.
- No repository implementation class is required.
Step 6: Insert Data Using CommandLineRunner
The relationship can be created using CommandLineRunner.
package com.example.Mapping;
import com.example.Mapping.Models.Course;
import com.example.Mapping.Models.StudentInformation;
import com.example.Mapping.Repository.CourseRepo;
import com.example.Mapping.Repository.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class MappingApplication implements CommandLineRunner {
    @Autowired
    StudentRepo studentRepo;
    @Autowired
    CourseRepo courseRepo;
    public static void main(String[] args) {
        SpringApplication.run(MappingApplication.class, args);
    }
    @Override
    public void run(String... args) {
        Course java = new Course(1, "Java");
        Course springBoot = new Course(2, "Spring Boot");
        courseRepo.save(java);
        courseRepo.save(springBoot);
        StudentInformation student =
                new StudentInformation(1, "Aayush");
        student.getCourses().add(java);
        student.getCourses().add(springBoot);
        studentRepo.save(student);
    }
}
Explanation:
- CommandLineRunner executes the code after the Spring Boot application starts.
- Two courses, Java and Spring Boot, are created and saved.
- A student named Aayush is created.
- Both courses are added to the student's courses collection.
- Saving the student creates the corresponding entries in the student_course join table.
Relationship Structure
The mapping can be represented as:
Database created tables are following:
1. Student table
2. Course Table
3. Student_course

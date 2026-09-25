# Many-To-Many Mapping

> Source: https://www.geeksforgeeks.org/advance-java/jpa-many-to-many-mapping

JPA Many-to-Many mapping defines a relationship where multiple instances of one entity are associated with multiple instances of another entity. It is typically implemented using a join table to manage the associations.
- Uses @ManyToMany annotation to map relationships between entities.
- Requires a join table to store foreign keys of both entities.
- Can be uni-directional or bi-directional based on application needs.
Real-world example: A common example is a Student and Course system, where a student can enroll in multiple courses and each course can have multiple students.
Steps to Implement Many-To-Many Mapping in JPA
Follow these steps to create and manage a many-to-many relationship between entities using a join table in JPA.
1. Define the Entities
We’ll create two entities: Student and Course. Each entity maintains a collection referencing the other side.
Student Entity:
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToMany(mappedBy = "students")
    private Set<Course> courses = new HashSet<>();
    // Getters and Setters
}
- The @ManyToMany(mappedBy = "students") makes this side the inverse side of the relationship.
- The courses field maps to the owning side defined in Course.
Course Entity:
@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToMany
    @JoinTable(
        name = "course_student",
        joinColumns = @JoinColumn(name = "course_id"),
        inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    private Set<Student> students = new HashSet<>();
    // Getters and Setters
}
- The @JoinTable defines the join table name (course_student).
- joinColumns represents the foreign key for Course.
- inverseJoinColumns represents the foreign key for Student.
2. Configure the Persistence Unit
In persistence.xml, configure database connection and entity classes.
<persistence xmlns="https://jakarta.ee/xml/ns/persistence/"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence/ https://jakarta.ee/xml/ns/persistence/persistence_3_0.xsd"
             version="3.0">
    <persistence-unit name="jpa-example">
        <class>model.Student</class>
        <class>model.Course</class>
        <properties>
            <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/example"/>
            <property name="javax.persistence.jdbc.user" value="root"/>
            <property name="javax.persistence.jdbc.password" value=""/>
            <property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL5Dialect"/>
            <property name="hibernate.hbm2ddl.auto" value="update"/>
        </properties>
    </persistence-unit>
</persistence>
This file registers entity classes and sets up the database connectivity for JPA and Hibernate.
Project Structure:
3. Create Service Layer Classes
StudentService.java:
package service;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import model.Student;
import java.util.List;
public class StudentService {
    private final EntityManager entityManager;
    public StudentService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    public List<Student> getAllStudents() {
        return entityManager.createQuery("SELECT s FROM Student s", Student.class).getResultList();
    }
    public Student saveStudent(Student student) {
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(student);
        transaction.commit();
        return student;
    }
    public Student getStudentById(Long id) {
        return entityManager.find(Student.class, id);
    }
}
CourseService.java:
package service;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import model.Course;
import java.util.List;
public class CourseService {
    private final EntityManager entityManager;
    public CourseService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    public List<Course> getAllCourses() {
        return entityManager.createQuery("SELECT c FROM Course c", Course.class).getResultList();
    }
    public Course saveCourse(Course course) {
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(course);
        transaction.commit();
        return course;
    }
    public Course getCourseById(Long id) {
        return entityManager.find(Course.class, id);
    }
}
These classes provide reusable methods for persisting and retrieving Student and Course entities.
4. Create the Main Application
File: MainApplication.java
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Course;
import model.Student;
import service.CourseService;
import service.StudentService;
import java.util.List;
public class MainApplication {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-example");
        CourseService courseService = new CourseService(emf.createEntityManager());
        StudentService studentService = new StudentService(emf.createEntityManager());
        // Create courses
        Course javaCourse = new Course();
        javaCourse.setName("Java");
        courseService.saveCourse(javaCourse);
        Course pythonCourse = new Course();
        pythonCourse.setName("Python");
        courseService.saveCourse(pythonCourse);
        // Create students
        Student mahesh = new Student();
        mahesh.setName("Mahesh Kadambala");
        mahesh.getCourses().add(javaCourse);
        mahesh.getCourses().add(pythonCourse);
        studentService.saveStudent(mahesh);
        Student eswar = new Student();
        eswar.setName("Eswar Beta");
        eswar.getCourses().add(javaCourse);
        studentService.saveStudent(eswar);
        // Retrieve and print data
        List<Course> courses = courseService.getAllCourses();
        System.out.println("Courses:");
        for (Course c : courses) {
            System.out.println(c.getId() + ": " + c.getName());
        }
        List<Student> students = studentService.getAllStudents();
        System.out.println("\nStudents:");
        for (Student s : students) {
            System.out.println(s.getId() + ": " + s.getName());
            System.out.println("Enrolled Courses:");
            for (Course c : s.getCourses()) {
                System.out.println(" - " + c.getName());
            }
        }
        emf.close();
    }
}
- Creates and saves course and student records.
- Establishes many-to-many links by adding entities to each other’s collection.
- Prints out all stored records from the database.
5. Maven Configuration (pom.xml)
<dependencies>
    <dependency>
        <groupId>org.hibernate.orm</groupId>
        <artifactId>hibernate-core</artifactId>
        <version>6.0.2.Final</version>
    </dependency>
    <dependency>
        <groupId>org.glassfish.jaxb</groupId>
        <artifactId>jaxb-runtime</artifactId>
        <version>3.0.2</version>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.28</version>
    </dependency>
</dependencies>
6. Running the Application
Steps:
- Start your MySQL server.
- Run MainApplication.java.
- The program will automatically create tables - student, course, and the join table course_student.
Output in the console:

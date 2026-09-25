# Collection Mapping

> Source: https://www.geeksforgeeks.org/advance-java/jpa-collection-mapping

JPA provides a way to map Java objects to database tables. Collection Mapping is a feature in JPA that allows mapping of Java collections like List, Set, and Map to database relationships. It helps manage associations between entities efficiently for better data storage and retrieval.
- Maps Java collections (List, Set, Map) to database tables
- Helps define relationships like One-to-Many and Many-to-Many
- Improves data handling and retrieval in applications
JPA Annotations
| Annotation | Definition | Key Attributes | 
|---|---|---|
| @OneToMany | Defines one-to-many relationship | mappedBy, cascade, fetch | 
| @ManyToOne | Defines many-to-one relationship | fetch, optional, targetEntity | 
| @ManyToMany | Defines many-to-many relationship | mappedBy, cascade, targetEntity | 
| @ElementCollection | Collection of basic/embedded types | targetClass, fetch | 
| @JoinTable | Mapping using join table | name, joinColumns, inverseJoinColumns | 
| @OrderBy | Sorts collection elements | value (field), ASC/DESC | 
Steps to Implement Collection Mapping
Below are the steps to implement JPA Collection Mapping.
Step 1: Define the Entities
- Create classes using @Entity to map with database tables.
- Each entity represents a real-world object (e.g., Student, Course).
Step 2: Define the Collection Attributes
- Use collections like List orSet to represent relationships.
- Example: A student can have multiple courses.
Step 3: Map Collections Using Annotations
- Use @OneToMany ,@ManyToMany to define relationships.
- Use mappedBy to specify the inverse side.
Step 4: Configure the Fetch Type
- Set fetch type as EAGER orLAZY .
- Controls when related data is loaded from DB.
Step 5: Persistence Operations
- Use EntityManager for database operations.
- Perform insert, update, delete, and fetch operations.
Steps to Implementation of JPA Collection Mapping
Step 1: Create Maven Project
- Open IntelliJ IDEA
- Create a New Maven Project
- Name: jpa-collection-mapping-demo
- Select Java version (11 or above)
Step 2: Add Dependencies
Open the pom.xml and add the below dependencies into the project.
Dependencies:
<!-- Database Driver (MySQL in this example) -->        
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
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.28</version>
        </dependency>
After successfully creating the project, the project structure will look like :
Step 3: Configure persistence.xml
- Define persistence unit (examplePU )
- Add all entity classes: Student, Course, Employee, Department
- Configure DB: URL, username, password
- Set Hibernate properties:  hbm2ddl.auto = update
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence xmlns="https://jakarta.ee/xml/ns/persistence/"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence/ https://jakarta.ee/xml/ns/persistence//persistence_3_0.xsd"
             version="3.0">
    <persistence-unit name="examplePU">
        <class>model.Student</class>
        <class>model.Employee</class>
        <class>model.Department</class>
        <class>model.Course</class>
        <properties>
            <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/example"/>
            <property name="javax.persistence.jdbc.user" value="root"/>
            <property name="javax.persistence.jdbc.password" value=""/>
            <property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL5Dialect"/>
            <property name="hibernate.hbm2ddl.auto" value="update"/>
        </properties>
    </persistence-unit>
</persistence>
Step 4: Create Student Entity
- Annotate with @Entity
- Fields: id, name
- Add collection mapping
Go to src > main > java > model > Student and put the below code.
package model;
import jakarta.persistence.*;
import java.util.List;
/**
 * Represents a student entity.
 */
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    /** The list of courses associated with the student. */
    @ManyToMany
    @JoinTable(name = "student_course",
            joinColumns = @JoinColumn(name = "student_id"),
            inverseJoinColumns = @JoinColumn(name = "course_id"))
    private List<Course> courses;
    // Constructors, getters, and setters
    /**
     * Retrieves the student ID.
     */
    public Long getId() {
        return id;
    }
    /**
     * Sets the ID of the student.
     */
    public void setId(Long id) {
        this.id = id;
    }
    /**
     * Retrieves the name of the student.
     */
    public String getName() {
        return name;
    }
    /**
     * Sets the name of the student.
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * Retrieves the list of courses associated with the student.
     */
    public List<Course> getCourses() {
        return courses;
    }
    /**
     * Sets the list of courses associated with the student.
     */
    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
}
Step 5: Create Course Entity
Go to src > main > java > model > Course and put the below code.
package model;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
/**
 * Represents a course entity.
 */
@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    /** The list of students enrolled in the course. */
    @ManyToMany(mappedBy = "courses")
    private List<Student> students = new ArrayList<>();
    // Constructors, getters, and setters
    /**
     * Retrieves the course ID.
     * Sets the ID of the course.
     */
    public Long getId() {
        return id;
    }
    /**
     * Retrieves the course name.
     * Sets the name of the course.
     */
    public String getName() {
        return name;
    }
    /**
     * Retrieves the list of students enrolled in the course.
     * Sets the list of students enrolled in the course.
     */
    public List<Student> getStudents() {
        return students;
    }
    /**
     * Sets the list of students enrolled in the course.
     */
    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
Step 6: Create Employee Entity
- Create the new Entity Java class named Employee.
- Go to src > main > java > model > Employee and put the below code.
package model;
import jakarta.persistence.*;
/**
 * Represents an employee entity.
 */
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /** The name of the employee. */
    private String name;
    /** department to which the employee belongs. */
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;
    // Constructors, getters, and setters
    /**
     * Retrieves the employee iD.
     * Sets the ID of the employee.
     */
    public Long getId() {
        return id;
    }
    /**
     * Retrieves the employee name.
     * Sets the name of the employee.
     */
    public String getName() {
        return name;
    }
    /**
     * Retrieves the department to which the employee belongs.
     * Sets the department to which the employee belongs.
     */
    public Department getDepartment() {
        return department;
    }
    /**
     * Sets the department to which the employee belongs.
     */
    public void setDepartment(Department department) {
        this.department = department;
    }
}
Step 7: Create Department Entity
- Create the new Entity Java class named Department.
- Go to src > main > java > model > Department and put the below code.
package model;
import jakarta.persistence.*;
import java.util.List;
/**
 * Represents a department entity.
 */
@Entity
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    /** The list of employees belonging to this department. */
    @OneToMany(mappedBy = "department")
    private List<Employee> employees;
    // Constructors, getters, and setters
    /**
     * Retrieves the department ID.
     * Sets the ID of the department.
     */
    public Long getId() {
        return id;
    }
    /**
     * Retrieves the department name.
     * Sets the name of the department.
     */
    public String getName() {
        return name;
    }
    /**
     * Retrieves the list of employees belonging to this department.
     * Sets the list of employees belonging to this department.
     */
    public List<Employee> getEmployees() {
        return employees;
    }
    /**
     * Sets the list of employees belonging to this department.
     */
    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }
}
Step 8: Create JPA Utility Class
- Create the new Java package named as util. In that package, create a new Java class named JPAUtil.
- Go to src > main > java > util > JPAUtil and put the below code.
package util;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
/**
 * Utility class for managing JPA operations.
 */
public class JPAUtil {
    /** The name of the persistence unit. */
    private static final String PERSISTENCE_UNIT_NAME = "examplePU";
    /** The entity manager factory. */
    private static EntityManagerFactory entityManagerFactory;
    static {
        try {
            entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        } catch (Throwable ex) {
            System.err.println("Initial EntityManagerFactory creation failed: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    /**
     * Retrieves the entity manager factory.
     * @return The entity manager factory.
     */
    public static EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }
    /**
     * Shuts down the entity manager factory.
     */
    public static void shutdown() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
Step 9: Create Main Application
- Create the new Java class named MainApplication.
- Go to src > main > java > MainApplication and put the below code.
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Course;
import model.Department;
import model.Employee;
import model.Student;
import util.JPAUtil;
import java.util.List;
/**
 * Main class for demonstrating JPA operations.
 */
public class MainApplication {
    /**
     * Main method to execute JPA operations.
     * @param args Command-line arguments.
     */
    public static void main(String[] args) {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        // Add data to Department and Employee tables
        entityManager.getTransaction().begin();
        Department department1 = new Department();
        department1.setName("Engineering");
        entityManager.persist(department1);
        Department department2 = new Department();
        department2.setName("Marketing");
        entityManager.persist(department2);
        Employee employee1 = new Employee();
        employee1.setName("Syam");
        employee1.setDepartment(department1);
        entityManager.persist(employee1);
        Employee employee2 = new Employee();
        employee2.setName("Mikel Smith");
        employee2.setDepartment(department1);
        entityManager.persist(employee2);
        Employee employee3 = new Employee();
        employee3.setName("Eswar");
        employee3.setDepartment(department2);
        entityManager.persist(employee3);
        entityManager.getTransaction().commit();
        // Add data to Student and Course tables
        entityManager.getTransaction().begin();
        Student student1 = new Student();
        student1.setName("Mahesh");
        entityManager.persist(student1);
        Student student2 = new Student();
        student2.setName("Sirish");
        entityManager.persist(student2);
        Course course1 = new Course();
        course1.setName("Java Programming");
        course1.getStudents().add(student1);
        course1.getStudents().add(student2);
        entityManager.persist(course1);
        Course course2 = new Course();
        course2.setName("Database Management");
        course2.getStudents().add(student1);
        entityManager.persist(course2);
        entityManager.getTransaction().commit();
        // Print all data from Department and Employee tables
        printAllDepartments(entityManager);
        printAllEmployees(entityManager);
        // Print all data from Student and Course tables
        printAllStudents(entityManager);
        printAllCourses(entityManager);
        entityManager.close();
        JPAUtil.shutdown();
    }
    /**
     * Prints all departments.
     * @param entityManager The entity manager.
     */
    private static void printAllDepartments(EntityManager entityManager) {
        Query query = entityManager.createQuery("SELECT d FROM Department d");
        List<Department> departments = query.getResultList();
        System.out.println("Departments:");
        for (Department department : departments) {
            System.out.println(department.getId() + "\t" + department.getName());
        }
        System.out.println();
    }
    /**
     * Prints all employees.
     * @param entityManager The entity manager.
     */
    private static void printAllEmployees(EntityManager entityManager) {
        Query query = entityManager.createQuery("SELECT e FROM Employee e");
        List<Employee> employees = query.getResultList();
        System.out.println("Employees:");
        for (Employee employee : employees) {
            System.out.println(employee.getId() + "\t" + employee.getName() + "\t" + employee.getDepartment().getName());
        }
        System.out.println();
    }
    /**
     * Prints all students.
     * @param entityManager The entity manager.
     */
    private static void printAllStudents(EntityManager entityManager) {
        Query query = entityManager.createQuery("SELECT s FROM Student s");
        List<Student> students = query.getResultList();
        System.out.println("Students:");
        for (Student student : students) {
            System.out.println(student.getId() + "\t" + student.getName());
        }
        System.out.println();
    }
    /**
     * Prints all courses.
     * @param entityManager The entity manager.
     */
    private static void printAllCourses(EntityManager entityManager) {
        Query query = entityManager.createQuery("SELECT c FROM Course c");
        List<Course> courses = query.getResultList();
        System.out.println("Courses:");
        for (Course course : courses) {
            System.out.println(course.getId() + "\t" + course.getName());
            System.out.println("Students enrolled:");
            for (Student student : course.getStudents()) {
                System.out.println("\t- " + student.getName());
            }
        }
        System.out.println();
    }
}
Step 10: Run Application
- Run MainApplication
- Output: Departments & Employees , Students & Courses , Course-wise enrolled students.
If we follow the above procedure, then we can successfully build the JPA application of the demonstration of the creating the Collection Mapping of the entity of the JPA Application.

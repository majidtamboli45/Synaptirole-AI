# JPA Many-To-One Mapping

> Source: https://www.geeksforgeeks.org/advance-java/jpa-many-to-one-mapping

Java Persistence API (JPA) is a specification that simplifies database interaction in Java applications. A Many-To-One relationship represents an association where multiple instances of one entity are linked to a single instance of another entity.
For example, many students can belong to one university. Here, Student is the owning side of the relationship, while University is the referenced entity.
Many-to-One Mapping
In a Many-To-One relationship:
- Multiple child entities reference a single parent entity.
- The foreign key column is maintained in the child entity’s table.
- The mapping is achieved using the @ManyToOne annotation.
Example: Each Student belongs to one University, but one University can have many Students.
Project Implementation
Goal
The goal of this project is to demonstrate how to establish a Many-To-One relationship in JPA using annotations.
We will map multiple Student entities to a single University entity and persist this relationship in a relational database using Hibernate as the JPA provider.
Process Overview
The implementation involves the following steps:
- Set up a JPA project with Hibernate and MySQL dependencies.
- Configure the persistence unit using persistence.xml.
- Define entity classes University and Student.
- Establish a Many-To-One relationship using @ManyToOne and @JoinColumn.
- Persist and retrieve entities through an EntityManager.
Step 1: Create a JPA Project
Create a new Maven project named jpa-many-to-one-mapping-demo in your IDE (e.g., IntelliJ IDEA or Eclipse).
Project Structure:
Step 2: Add Dependencies (pom.xml)
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0"
         xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>org.example</groupId>
    <artifactId>jpa-many-to-one-mapping-demo</artifactId>
    <version>1.0-SNAPSHOT</version>
    <name>jpa-many-to-one-mapping-demo</name>
    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <junit.version>5.9.2</junit.version>
    </properties>
    <dependencies>
        <!-- Hibernate Core -->
        <dependency>
            <groupId>org.hibernate.orm</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>6.2.5.Final</version>
        </dependency>
        <!-- Jakarta Persistence API -->
        <dependency>
            <groupId>jakarta.persistence</groupId>
            <artifactId>jakarta.persistence-api</artifactId>
            <version>3.1.0</version>
        </dependency>
        <!-- MySQL Connector -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <version>8.3.0</version>
        </dependency>
        <!-- JAXB Runtime -->
        <dependency>
            <groupId>org.glassfish.jaxb</groupId>
            <artifactId>jaxb-runtime</artifactId>
            <version>3.0.2</version>
        </dependency>
        <!-- JUnit (Optional for testing) -->
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
    </dependencies>
</project>
Step 3: Configure Persistence Unit (persistence.xml)
Location: src/main/resources/META-INF/persistence.xml
<?xml version="1.0" encoding="UTF-8"?>
<persistence xmlns="https://jakarta.ee/xml/ns/persistence"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence https://jakarta.ee/xml/ns/persistence/persistence_3_0.xsd"
             version="3.0">
    <persistence-unit name="PU_NAME">
        <class>model.Student</class>
        <class>model.University</class>
        <properties>
            <property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/example"/>
            <property name="jakarta.persistence.jdbc.user" value="root"/>
            <property name="jakarta.persistence.jdbc.password" value=""/>
            <property name="jakarta.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.MySQLDialect"/>
            <property name="hibernate.hbm2ddl.auto" value="update"/>
            <property name="hibernate.show_sql" value="true"/>
        </properties>
    </persistence-unit>
</persistence>
Step 4: Create the University Entity
package model;
import jakarta.persistence.*;
@Entity
public class University {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    // Constructors
    public University() {}
    public University(String name) {
        this.name = name;
    }
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
Step 5: Create the Student Entity
package model;
import jakarta.persistence.*;
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "university_id") // Foreign key column
    private University university;
    // Constructors
    public Student() {}
    public Student(String name, University university) {
        this.name = name;
        this.university = university;
    }
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public University getUniversity() {
        return university;
    }
    public void setUniversity(University university) {
        this.university = university;
    }
}
- @ManyToOne: defines that many students belong to one university.
- @JoinColumn: specifies the foreign key column (university_id) in the student table.
Step 6: Create the Main Class
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Student;
import model.University;
public class MainApplication {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PU_NAME");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        // Create and persist a university
        University university = new University("Geek University");
        em.persist(university);
        // Create and persist students
        Student student1 = new Student("Mahesh", university);
        Student student2 = new Student("Eswar", university);
        em.persist(student1);
        em.persist(student2);
        em.getTransaction().commit();
        // Retrieve and display student with university details
        Student retrievedStudent = em.find(Student.class, student1.getId());
        System.out.println("Student: " + retrievedStudent.getName());
        System.out.println("University: " + retrievedStudent.getUniversity().getName());
        em.close();
        emf.close();
    }
}
- It creates an EntityManagerFactory and EntityManager to interact with the database.
- A University entity is created and persisted, followed by multiple Student entities linked to that university.
- The transaction is committed to save all records permanently in the database.
- Finally, a student is retrieved and its associated university is printed, demonstrating the Many-To-One relationship.
Step 7: Output
Console Output:
Database Tables will be created.

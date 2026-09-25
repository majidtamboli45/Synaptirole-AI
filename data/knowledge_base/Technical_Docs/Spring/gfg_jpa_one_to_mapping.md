# JPA One-to-One Mapping

> Source: https://www.geeksforgeeks.org/advance-java/jpa-one-to-one-mapping

JPA One-to-One mapping defines a relationship where one entity is associated with exactly one instance of another entity. It is commonly used when two tables share a direct and exclusive relationship.
- Uses @OneToOne annotation to map the relationship between entities
- Can be uni-directional or bi-directional depending on access requirements
- Often implemented using a foreign key or shared primary key in the database
Real World Example: A Person entity can have exactly one Address entity associated with it.
Types of One-to-One Mappings
- Shared Primary Key: In this mapping, the primary key of one entity also acts as the primary key of the associated entity. This ensures a strict one-to-one relationship where both entities share the same identifier.
- Foreign Key Association: In this approach, the associated entity maintains a foreign key column that references the primary key of the owning entity. It’s commonly used when the associated entity can exist independently.
Steps to Implement JPA One-to-One Mapping
Follow these steps to create and map a one-to-one relationship between two entities using JPA annotations in a Spring Boot application.
1. Define the Entities
Create two entities Person and Address and establish a one-to-one relationship between them using JPA annotations.
Person.java:
import jakarta.persistence.*;
@Entity
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToOne(mappedBy = "person", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Address address;
    public Person() {}
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Address getAddress() { return address; }
    public void setAddress(Address address) { this.address = address; }
}
Address.java:
import jakarta.persistence.*;
@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "person_id")
    private Person person;
    private String city;
    public Address() {}
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Person getPerson() { return person; }
    public void setPerson(Person person) { this.person = person; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
}
- The @OneToOne annotation defines the one-to-one relationship.
- The mappedBy attribute in the Person class indicates that Address owns the relationship.
- The @JoinColumn in the Address entity defines the foreign key column (person_id).
2. Handle the Foreign Key
The foreign key column (person_id) in the Address table refers to the primary key of the Person table. This establishes a direct association between the two entities.
3. Configure Database Connection (persistence.xml)
Place the following configuration inside the META-INF/persistence.xml file.
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence xmlns="https://jakarta.ee/xml/ns/persistence/"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence/ https://jakarta.ee/xml/ns/persistence/persistence_3_0.xsd"
             version="3.0">
    <persistence-unit name="jpa-example">
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
4. Add Dependencies (pom.xml)
Include the following dependencies in your Maven project:
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
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>5.9.2</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>5.9.2</version>
        <scope>test</scope>
    </dependency>
</dependencies>
5. Create the Main Application
import jakarta.persistence.*;
import model.Address;
import model.Person;
public class MainApplication {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-example");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Person person = new Person();
        person.setName("Mahesh");
        em.persist(person);
        Address address = new Address();
        address.setPerson(person);
        address.setCity("Hyderabad");
        em.persist(address);
        em.getTransaction().commit();
        Person retrievedPerson = em.find(Person.class, person.getId());
        if (retrievedPerson != null && retrievedPerson.getAddress() != null) {
            Address retrievedAddress = retrievedPerson.getAddress();
            System.out.println("Person: " + retrievedPerson.getName());
            System.out.println("Address: " + retrievedAddress.getCity());
        } else {
            System.out.println("Person or associated Address not found.");
        }
        em.close();
        emf.close();
    }
}
6. Run and Verify
Run the application. The console output should display the person’s name and associated address, verifying that the one-to-one mapping works correctly.
Expected Output:

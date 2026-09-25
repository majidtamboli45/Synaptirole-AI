# JPA Table-per-class Strategy

> Source: https://www.geeksforgeeks.org/advance-java/jpa-table-per-class-strategy

The Table Per Class strategy is an inheritance mapping approach in JPA where each concrete class has its own separate table. It is used to represent inheritance hierarchies by storing class data independently.
- Each subclass has its own table with all fields (including inherited ones)
- Avoids joins between parent and child tables
- Can lead to data duplication across tables
Syntax
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Subclass extends Superclass {   
 // Class definition}
Here: @Inheritance annotation maps each subclass to its own table, including inherited properties, based on the chosen inheritance strategy.
Implementation Steps of Table-per-class Strategy
Below are the steps to implement a Table-per-class Strategy in JPA.
Step 1. Create Project
Create a Maven project in IntelliJ IDEA named jpa-table-per-strategy-demo.
- Choose Java as the language
- Use Maven for dependency management
Step 2. Add Dependencies
Add required dependencies in pom.xml:
- Hibernate Core: for JPA implementation
- MySQL Connector: for database connectivity
- JAXB Runtime: for XML binding
Dependencies:
<dependency>
      <groupId>org.hibernate.orm</groupId>
      <artifactId>hibernate-core</artifactId>
      <version>6.0.2.Final</version>
    </dependency>
      <dependency>
          <groupId>mysql</groupId>
          <artifactId>mysql-connector-java</artifactId>
          <version>8.0.28</version>
      </dependency>
    <dependency>
      <groupId>org.glassfish.jaxb</groupId>
      <artifactId>jaxb-runtime</artifactId>
      <version>3.0.2</version>
    </dependency>
The project layout then looks like the image below:
Step 3. Configure persistence.xml
Define database and JPA configuration:
- Specify persistence unit name
- Register entity classes (Vehicle, Car, Bike)
- Configure DB URL, username, password
- Set Hibernate dialect and auto-update
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence xmlns="https://jakarta.ee/xml/ns/persistence/"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence/ https://jakarta.ee/xml/ns/persistence//persistence_3_0.xsd"
             version="3.0">
  <persistence-unit name="TablePerClassPU">
    <class>model.Car</class>
    <class>model.Bike</class>
    <class>model.Vehicle</class>
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
Step 4: Create Base Entity (Vehicle)
Create abstract class Vehicle:
- Annotate with @Entity
- Use @Inheritance(strategy = TABLE_PER_CLASS)
- Define common fields like id and manufacturer
package model;
import jakarta.persistence.*;
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Vehicle {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;
    private String manufacturer;
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getManufacturer() {
        return manufacturer;
    }
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}
Step 5: Create Subclass (Car)
Create Car class extending Vehicle:
- Annotate with @Entity
- Add specific field numberOfDoors
package model;
import jakarta.persistence.Entity;
@Entity
public class Car extends Vehicle {
    private int numberOfDoors;
    // Getters and Setters
    public int getNumberOfDoors() {
        return numberOfDoors;
    }
    public void setNumberOfDoors(int numberOfDoors) {
        this.numberOfDoors = numberOfDoors;
    }
}
Step 6: Create Subclass (Bike)
Create Bike class extending Vehicle:
- Annotate with @Entity
- Add specific field hasBasket
package model;
import jakarta.persistence.Entity;
@Entity
public class Bike extends Vehicle {
    private boolean hasBasket;
    // Getters and Setters
  
    public boolean isHasBasket() {
        return hasBasket;
    }
    public void setHasBasket(boolean hasBasket) {
        this.hasBasket = hasBasket;
    }
}
Step 7: Create Main Application
Write MainApplication class:
- Create EntityManagerFactory and EntityManager
- Begin transaction
- Create objects (Car, Bike)
- Persist them using entityManager.persist()
- Commit transaction
- Retrieve data using find()
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import model.Bike;
import model.Car;
public class MainApplication {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TablePerClassPU");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        // Persisting entities
        transaction.begin();
        Car car = new Car();
        car.setManufacturer("Toyota");
        car.setNumberOfDoors(4);
        Bike bike = new Bike();
        bike.setManufacturer("Honda");
        bike.setHasBasket(true);
        entityManager.persist(car);
        entityManager.persist(bike);
        transaction.commit();
        // Retrieving entities
        Car retrievedCar = entityManager.find(Car.class, car.getId());
        System.out.println("Retrieved Car: " + retrievedCar.getManufacturer());
        Bike retrievedBike = entityManager.find(Bike.class, bike.getId());
        System.out.println("Retrieved Bike: " + retrievedBike.getManufacturer());
        entityManager.close();
        entityManagerFactory.close();
    }
}
Step 8: Run the Application
Run the main class:
- Data will be stored in separate tables (Car, Bike)
- Output will display retrieved entity details
In the above example, we can demonstrate how to use the Table-per-class strategy to the map inheritance hierarchies to the databases using JPA in the JPA application.

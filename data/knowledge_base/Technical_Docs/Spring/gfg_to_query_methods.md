# Introduction to Query Methods

> Source: https://www.geeksforgeeks.org/advance-java/jpa-introduction-to-query-methods/

In JPA, query methods provide a way to fetch data from the database without writing explicit SQL queries. By following specific naming conventions, Spring Data JPA automatically generates queries at runtime, making development faster and more efficient.
- Eliminates the need to write boilerplate SQL queries.
- Uses method naming conventions to generate queries automatically.
- Improves readability and speeds up development.
Query Methods
Query methods are repository interface methods where the query is derived from the method name. Spring Data JPA parses the method name and creates the corresponding database query automatically.
Syntax
List<Entity> findByFieldName(DataType fieldName);
Step-by-Step Implementation
Step 1: Create Spring Boot Project
- Open IntelliJ IDEA
- Create a new project named jpa-query-method-demo
- Choose Maven Project
Step 2: Add Dependencies (pom.xml)
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
Once create the project then the file structure looks like the below image.
pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0"
         xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>org.example</groupId>
    <artifactId>jpa-query-method-demo</artifactId>
    <version>1.0-SNAPSHOT</version>
    <name>jpa-query-method-demo</name>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.target>11</maven.compiler.target>
        <maven.compiler.source>11</maven.compiler.source>
        <junit.version>5.9.2</junit.version>
    </properties>
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
    </dependencies>
    <build>
        <plugins>
        </plugins>
    </build>
</project>
Step 3: Configure persistence.xml
Open the persistence.xml and put the below code into the project and it can configure the database of the project.
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence xmlns="https://jakarta.ee/xml/ns/persistence/"
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://jakarta.ee/xml/ns/persistence/
                                 https://jakarta.ee/xml/ns/persistence//persistence_3_0.xsd"
             version="3.0">
    <persistence-unit name="default">
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
Step 4: Create Entity Class
- Create the new Entity Java class named as the Product.
- Go to src > main > java > Product and put the below code.
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private double price;
    // Getters and Setters
  
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
Step 5: Create Query Methods (Using EntityManager)
import jakarta.persistence.EntityManager;
import java.util.List;
public class ProductService{
    public static List<Product> findProductsByName(EntityManager em, String name) {
        return em.createQuery(
                "SELECT p FROM Product p WHERE p.name = :name", Product.class)
                .setParameter("name", name)
                .getResultList();
    }
    public static List<Product> findProductsByPriceLessThan(EntityManager em, double price) {
        return em.createQuery(
                "SELECT p FROM Product p WHERE p.price < :price", Product.class)
                .setParameter("price", price)
                .getResultList();
    }
    public static long countProductsByName(EntityManager em, String name) {
        return em.createQuery(
                "SELECT COUNT(p) FROM Product p WHERE p.name = :name", Long.class)
                .setParameter("name", name)
                .getSingleResult();
    }
}
Step 6: Create Main Class
- Create the new Java class named as the MainApp.
- Go to src > main > java > MainApp and put the below code.
import jakarta.persistence.*;
import java.util.List;
public class MainApp {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        // Insert Data
        em.persist(new Product(null, "Laptop", 800));
        em.persist(new Product(null, "Laptop", 650));
        em.persist(new Product(null, "Mobile", 500));
        em.getTransaction().commit();
        // Query Execution
        List<Product> laptops = ProductService.findProductsByName(em, "Laptop");
        System.out.println("Laptops: " + laptops);
        List<Product> affordable = ProductService.findProductsByPriceLessThan(em, 700);
        System.out.println("Affordable: " + affordable);
        long count = ProductService.countProductsByName(em, "Laptop");
        System.out.println("Count: " + count);
        em.close();
        emf.close();
    }
}
Step 7: Run Application
Once the project is completed, run the application then show the laptop name and its prices less that 700 as the count as output. Refer the below image for the better understanding of the concept.
In the above project, it can demonstrates the how to use the JPA Query methods in the non-Spring environment where the EntityManager is manually managed for the database interaction.

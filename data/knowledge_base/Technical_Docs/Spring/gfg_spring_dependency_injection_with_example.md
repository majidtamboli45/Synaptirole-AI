# Spring Dependency Injection with Example

> Source: https://www.geeksforgeeks.org/advance-java/spring-dependency-injection-with-example/

Spring Dependency Injection (DI) is a fundamental concept in the Spring Framework that allows objects to receive their dependencies from an external source rather than creating them internally.
- Eliminates the need for classes to create their own dependencies
- Makes code more reusable and modular
- Supports constructor, setter, and field injection
- Works with XML configuration, annotations, or Java-based configuration
In above Diagram:
- The IoC (Inversion of Control) Container is responsible for creating and managing objects (called Beans).
- Bean 1 and Bean 2 are created by the container instead of being manually instantiated.
- If Bean 1 depends on Bean 2, the container automatically injects Bean 2 into Bean 1 (this is Dependency Injection).
- The configuration for this process is defined using XML or Java Annotations.
Why Dependency Injection is Needed
Dependency Injection is necessary because directly creating dependencies inside classes can lead to several problems:
1. Tight Coupling
- Classes that create their own dependencies are tightly coupled to specific implementations.
- Changes in one class may break dependent classes.
2. Reduced Testability
- Directly created dependencies make unit testing difficult.
- DI allows injecting mock objects for testing individual components.
3. Poor Maintainability
- Updating or replacing a dependency requires changes in multiple classes.
- DI centralizes dependency management in the Spring container, simplifying maintenance.
4. Lack of Flexibility and Reusability
- Classes cannot easily switch to alternative implementations of a dependency.
- DI allows using interfaces or multiple implementations without modifying the dependent class.
5. Centralized Object Management
- Spring IoC container handles object creation, configuration, and lifecycle, reducing boilerplate code and ensuring consistency across the application.
Types of Spring Dependency Injection
There are two primary types of Spring Dependency Injection:
1. Setter Dependency Injection (SDI):
Setter DI involves injecting dependencies via setter methods. To configure SDI, the @Autowiredannotation is used along with setter methods and the property is set through the <property> tag in the bean configuration file.
package com.geeksforgeeks.org;
import com.geeksforgeeks.org.IGeek;
import org.springframework.beans.factory.annotation.Autowired;
public class GFG {
    // The object of the interface IGeek
    private IGeek geek;
    // Setter method for property geek with @Autowired annotation
    @Autowired
    public void setGeek(IGeek geek) {
        this.geek = geek;
    }
}
Bean Configuration:
<beans 
xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="
          http://www.springframework.org/schema/beans
          http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">
    <bean id="GFG" class="com.geeksforgeeks.org.GFG">
        <property name="geek"  ref ="CsvGFG" />
    </bean>
    
<bean id="CsvGFG" class="com.geeksforgeeks.org.impl.CsvGFG" />
<bean id="JsonGFG" class="com.geeksforgeeks.org.impl.JsonGFG" />
    
</beans>
This injects the CsvGFG bean into the GFG object using the setter method (setGeek). 
2. Constructor Dependency Injection (CDI):
Constructor DI involves injecting dependencies through constructors. To configure CDI, the <constructor-arg> tag is used in the bean configuration file.
package com.geeksforgeeks.org;
import com.geeksforgeeks.org.IGeek;
public class GFG {
    // The object of the interface IGeek
    private IGeek geek;
    // Constructor to set the CDI
    public GFG(IGeek geek) {
        this.geek = geek;
    }
}
Bean Configuration:
<beans 
xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="
          http://www.springframework.org/schema/beans
          http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">
    <bean id="GFG" class="com.geeksforgeeks.org.GFG">
        <constructor-arg>
            <bean class="com.geeksforgeeks.org.impl.CsvGFG" />
        </constructor-arg>
    </bean>
    
<bean id="CsvGFG" class="com.geeksforgeeks.org.impl.CsvGFG" />
<bean id="JsonGFG" class="com.geeksforgeeks.org.impl.JsonGFG" />
    
</beans>
This injects the CsvGFG bean into the GFG object via the constructor.
Setter Dependency Injection (SDI) vs. Constructor Dependency Injection (CDI)
| Setter DI | Constructor DI | 
|---|---|
| Creates mutable objects. Dependencies can be modified after creation. | Creates immutable objects. Dependencies can't be modified after creation. | 
| Dependencies can be injected later. | All dependencies must be provided at creation. | 
| Requires addition of @Autowired annotation. | @Autowired annotation is not needed. | 
| It results in circular dependencies or partial dependencies. | It too can have circular dependencies, it just fails faster and more explicitly. | 
| Requires framework or manual setter calls for dependency injection in tests. | Easier unit testing - can create objects directly with mock dependencies. | 
Steps to Create a Spring DI Project
Prerequisites
- Java JDK installed (8 or above)
- Eclipse IDE or IntelliJ IDEA
- Maven (optional, for dependency management)
- Spring Framework libraries (or use Maven/Gradle)
Step 1: Create a Java Project
- IntelliJ: New Project -> Java -> Add SDK -> Finish
Step 2: Add Spring Dependencies
Add Spring context dependency in pom.xml:
<!-- REQUIRED for ApplicationContext and DI container -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.3.30</version>
</dependency>
Note: The classes ApplicationContext and ClassPathXmlApplicationContext used in MainApp.java belong to the spring-context module. If this dependency is missing, you will get errors like:
"package org.springframework.context does not exist"
Make sure to add the spring-context dependency and reload your Maven project.
Step 3: Create Interfaces and Classes
Create interface and classes to define engine behavior and vehicle dependency.
1. Create an interface (IEngine.java)
public interface IEngine {
    void start();
}
2. Create implementation class (ToyotaEngine.java)
public class ToyotaEngine implements IEngine {
    public void start() {
        System.out.println("Toyota Engine started");
    }
}
3. Create dependent class (Vehicle.java)
public class Vehicle {
    private IEngine engine;
    // Constructor for Constructor DI
    public Vehicle(IEngine engine) { this.engine = engine; }
    // Setter for Setter DI
    public void setEngine(IEngine engine) { this.engine = engine; }
    public void drive() {
        engine.start();
        System.out.println("Vehicle is moving");
    }
}
Step 4: Configure Spring Beans
Configure Spring beans in XML to enable Dependency Injection for objects.
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
       http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">
    <!-- Engine bean -->
    <bean id="engine" class="ToyotaEngine"/>
    <!-- Vehicle using Constructor DI -->
    <bean id="vehicleConstructor" class="Vehicle">
        <constructor-arg ref="engine"/>
    </bean>
    <!-- Vehicle using Setter DI -->
    <bean id="vehicleSetter" class="Vehicle">
        <property name="engine" ref="engine"/>
    </bean>
</beans>
Step 5: Write Main Class to Test DI
Load Spring container and retrieve beans to test Dependency Injection.
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class MainApp {
    public static void main(String[] args) {
        // Requires spring-context dependency
ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        Vehicle vehicle1 = (Vehicle) context.getBean("vehicleConstructor");
        vehicle1.drive();
        Vehicle vehicle2 = (Vehicle) context.getBean("vehicleSetter");
        vehicle2.drive();
    }
}
Step 6: Run the Project
- Save all files.
- Run MainApp.java as a Java Application.
Output:
Toyota Engine started
Vehicle is moving
Toyota Engine started
Vehicle is moving

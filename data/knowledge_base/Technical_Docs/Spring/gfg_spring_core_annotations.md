# Spring Core Annotations

> Source: https://www.geeksforgeeks.org/advance-java/spring-core-annotations/

Spring Annotations are metadata in Java used to provide configuration and behavior information to the Spring Framework. They eliminate the need for XML-based configuration, making Spring applications more concise, readable, and easier to maintain.
In essence, annotations tell the Spring Container how to create, configure, and manage application components (beans). They are widely used for dependency injection, bean configuration, web components, and context management.
Types of Spring Framework Annotations
- Spring Core Annotations: Dependency injection, bean lifecycle, and context configuration.
- Spring Web Annotations: Used for building web and RESTful services.
- Spring Boot Annotations: Simplify auto-configuration and bootstrapping.
- Spring Scheduling Annotations: For task scheduling and asynchronous execution.
- Spring Data Annotations: For JPA, repositories, and data persistence.
- Spring Bean Annotations: For defining and managing beans.
Spring Core Annotations
Annotations in the org.springframework.beans.factory.annotation and org.springframework.context.annotation packages are collectively called Spring Core Annotations.
They can be divided into two main categories:
- Dependency Injection (DI)-Related Annotations
- Context Configuration Annotations
DI-Related Annotations
These annotations are used to perform dependency injection and define how beans are created and wired together in the Spring container.
1. @Autowired
Automatically injects dependencies by type. It can be used on constructors, fields, or setter methods.
Example (Field Injection):
@Component
public class Student {
    @Autowired
    private Address address;
}
Example (Constructor Injection):
@Component
public class Student {
    private final Address address;
    @Autowired
    public Student(Address address) {
        this.address = address;
    }
}
Example (Setter Injection):
@Component
public class Student {
    private Address address;
    @Autowired
    public void setAddress(Address address) {
        this.address = address;
    }
}
2. @Qualifier
Used with @Autowired to resolve conflicts when multiple beans of the same type exist. It specifies the exact bean name to be injected.
@Component
public class VehicleService {
    @Autowired
    @Qualifier("bike")
    private Vehicle vehicle;
}
3. @Primary
Specifies a default bean when multiple beans of the same type are available for autowiring.
@Configuration
public class Config {
    @Bean
    public Employee employee1() {
        return new Employee("Employee1");
    }
    @Bean
    @Primary
    public Employee employee2() {
        return new Employee("Employee2");
    }
}
4. @Bean
Indicates that a method produces a Spring-managed bean. Used inside @Configuration classes.
@Configuration
public class AppConfig {
    @Bean
    public MyService myService() {
        return new MyService();
    }
}
5. @Lazy
Delays the initialization of a bean until it is first requested.
@Component
@Lazy
public class MyService {
    // Initialized only when first accessed
}
6. @Value
Injects values from properties files, environment variables, or expression language.
@Component
public class MyService {
    @Value("${app.name}")
    private String appName;
}
7. @Scope
Defines the scope of a Spring bean. Common scopes:
- singleton (default)
- prototype
- request
- session
- application
@Component
@Scope("prototype")
public class MyService {
}
8. @Lookup
Used for method injection, it allows a method to return a new instance of a prototype-scoped bean each time it’s called.
@Component
public abstract class MyService {
    @Lookup
    public abstract MyBean getMyBean();
}
9. @Required (Deprecated)
Previously used to indicate that a property must be injected, now deprecated as of Spring 5.1.
public class Employee {
    @Required
    public void setName(String name) {
        this.name = name;
    }
}
Context Configuration Annotations
These annotations are used to define how Spring discovers, configures, and loads beans into the ApplicationContext.
1. @Configuration
Marks a class as a source of bean definitions. Beans within this class are defined using @Bean methods.
@Configuration
public class AppConfig {
    @Bean
    public MyService myService() {
        return new MyService();
    }
}
2. @ComponentScan
Specifies the base packages to scan for Spring-managed components like @Component, @Service, or @Repository.
@Configuration
@ComponentScan("com.example")
public class AppConfig {
}
3. @Import
Used to import additional @Configuration classes into another configuration class.
@Configuration
@Import({DatabaseConfig.class, SecurityConfig.class})
public class MainConfig {
}
4. @ImportResource
Imports legacy XML-based configurations into a Java-based configuration class.
@Configuration
@ImportResource("classpath:app-config.xml")
public class AppConfig {
}
5. @PropertySource
Imports legacy XML-based configurations into a Java-based configuration class.
@Configuration
@ImportResource("classpath:app-config.xml")
public class XmlConfig {
}
6. @Profile
Specifies that a bean should only be registered when a particular Spring profile is active.
@Component
@Profile("dev")
public class DevDataSource {
    // Bean will be loaded only if the "dev" profile is active
}
7. @PropertySource
Loads a .properties file into the Spring environment so that property values can be injected using @Value.
@Configuration
@PropertySource("classpath:application.properties")
public class PropertyConfig {
}
8. @Conditional
Conditionally registers a bean based on a custom condition class.
@Bean
@Conditional(MyCondition.class)
public MyService myService() {
    return new MyService();
}

# Spring Framework Annotations

> Source: https://www.geeksforgeeks.org/advance-java/spring-framework-annotations/

Spring Framework annotations are used to simplify configuration and reduce the need for XML in the Spring Framework. They make code more readable and help developers quickly define components and their behavior.
- Common annotations include @Component, @Autowired, @Service, and @Repository
- Enable automatic dependency injection and bean configuration
- Improve development speed by reducing boilerplate configuration
Types of Spring Framework Annotations
Spring Core Annotations
Located in org.springframework.beans.factory.annotation and org.springframework.context.annotation.
Dependency Injec0tion(DI)-Related Annotations
- @Autowired: Injects dependencies automatically via field, constructor, or setter.
- @Qualifier: Specifies which bean to inject when multiple beans of the same type exist.
- @Primary: Marks a bean as the default when multiple candidates exist.
- @Bean: Defines a bean explicitly in a configuration class.
- @Scope: Defines bean scope (singleton ,prototype , etc.).
- @Value: Injects values from property files.
- @Lazy: Defers bean initialization until first use.
- @Required: Marks a property as mandatory for dependency injection.
- @Lookup: Used for method injection to return prototype-scoped beans.
Context Configuration Annotations
- @Profile: Activates a bean or component only under a specific profile.
- @Import: Imports additional configuration classes.
- @ImportResource: Loads XML configuration files.
- @PropertySource: Specifies property file locations.
Spring Web Annotations
- @Controller : Marks a class as an MVC controller
- @RequestMapping : Maps HTTP requests to handler methods
- @RequestBody : Binds request body to a Java object
- @ResponseBody : Sends method return value as HTTP response
- @PathVariable : Extracts values from the URI
- @RequestParam : Extracts query parameters from URL
- @RestController : Combines @Controller and @ResponseBody for REST APIs
- @ExceptionHandler : Handles exceptions in controller methods
- @ResponseStatus : Defines HTTP status for responses
- @ModelAttribute : Binds method parameters or return values to the model
- @CrossOrigin : Enables CORS for controllers or specific endpoints
Example:
@RestController
@RequestMapping("/api")
class DemoController {
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello GeeksForGeeks";
    }
}
Spring Boot Annotations
Located in org.springframework.boot.autoconfigure and related packages.
- @SpringBootApplication: Combines @Configuration, @EnableAutoConfiguration, and @ComponentScan.
- @EnableAutoConfiguration: Enables automatic configuration based on dependencies.
- @ConditionalOnClass / @ConditionalOnMissingBean: Conditional bean registration.
- @ConfigurationProperties: Maps external configuration properties to POJOs.
Spring Scheduling Annotations
Located in org.springframework.scheduling.annotation.
- @EnableScheduling: Enables scheduling.
- @Scheduled: Schedules a task execution.
- @EnableAsync: Enables asynchronous method execution.
- @Async: Executes methods asynchronously.
Example:
@EnableScheduling
class SchedulerConfig {
    @Scheduled(fixedRate = 5000)
    void printTime() {
        System.out.println(LocalTime.now());
    }
}
Spring Data Annotations
Spring Data annotations provide an abstraction over data storage technologies. Some of the commonly used annotations in this category are:
- @Transactional: This annotation marks a method or class as transactional.
- @Id: This annotation marks a field in a model class as the primary key.
Spring Data /Persistence annotations
Used for persistence and transaction management.
- @Transactional: Defines transactional boundaries.
- @Id: Marks a field as the primary key.
- @Query: Defines custom queries for repositories.
- @Procedure: Calls stored procedures.
- @Modifying: Marks queries that modify data.
- @Lock: Specifies locking behavior.
- @EnableJpaRepositories: Enables JPA repositories.
MongoDB-specific:
- @Document: Marks a class as a MongoDB document.
- @Field: Maps document fields to class fields.
Example:
@Entity
class Student {
    @Id
    private Long id;
    private String name;
}
Spring Bean & Stereotype Annotations
Used for component scanning and bean definition.
- @Component: Generic annotation for any Spring-managed bean.
- @Service: Indicates a service-layer class.
- @Repository: Marks DAO or repository classes.
- @Controller: Marks presentation-layer controllers.
- @Configuration: Indicates a configuration class.
- @ComponentScan: Defines base packages for scanning annotated components.
Example:
@Service
public class UserService {}
@Repository
public class UserRepository {}
@Controller
public class UserController {}

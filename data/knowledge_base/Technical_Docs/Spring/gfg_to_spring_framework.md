# Introduction to Spring Framework

> Source: https://www.geeksforgeeks.org/advance-java/introduction-to-spring-framework/

The Spring Framework is a lightweight Java framework used to build scalable, maintainable enterprise applications. It offers a programming and configuration model for modern Java development.
- Reduces boilerplate code using Dependency Injection and AOP for faster, cleaner development.
- Promotes independent components, improving maintainability and ease of testing.
- Offers seamless integration with technologies like JDBC, JMS, and JPA.
Key Features of Spring Framework
- Dependency Injection: Dependency Injection is a design pattern where the Spring container automatically provides the required dependencies to a class, instead of the class creating them itself. This promotes loose coupling, easier testing and better maintainability by decoupling the object creation and usage.
- Aspect-Oriented Programming (AOP): AOP allows developers to separate cross-cutting concerns (such as logging, security and transaction management) from the business logic.
- Transaction Management: Spring provides a consistent abstraction for managing transactions across various databases and message services.
- Spring MVC: It is a powerful framework for building web applications that follow the Model-View-Controller pattern.
- Spring Security: Spring Security provides comprehensive security features including authentication, authorization and protection against common vulnerabilities.
- Spring Data: Spring Data is a part of the Spring Framework that simplifies database access by providing easy-to-use abstractions for working with relational and non-relational databases.
- Spring Batch: Spring Batch is a framework in Spring for handling large-scale batch processing, such as reading, processing and writing data in bulk.
- Integration with Other Frameworks: Spring integrates seamlessly with other technologies like Hibernate, JPA, JMS and more, making it versatile for various enterprise applications.
Architecture of Spring Framework
Spring Framework Modules
- Spring Core Module: The core component providing the IoC container for managing beans and their dependencies. It includes BeanFactory and ApplicationContext for object creation and dependency injection.
- Spring AOP Module: Implements Aspect-Oriented Programming to handle cross-cutting concerns like transaction management, logging and monitoring, using aspects defined with the @Aspect annotation.
- Spring ORM Module: Provides integration with ORM technologies such as Hibernate, JPA, and MyBatis, simplifying transaction management and exception handling for data access.
- Spring Web MVC Module: Implements the MVC architecture to create web applications. It separates model and view components, routing requests through the DispatcherServlet to controllers and views.
- Spring DAO Module: Provides data access support through JDBC, Hibernate or JDO, offering an abstraction layer to simplify database interaction and transaction management.
- Spring Application Context Module: Builds on the Core module, offering enhanced features like internationalization, validation, event propagation and resource loading via the ApplicationContext interface.
Core Concepts of Spring Framework
1. Dependency Injection
Dependency Injection is the mechanism through which the Spring container supplies required dependencies to an object instead of the object creating them itself. It promotes loose coupling, improves code reusability, and makes applications easier to test and maintain.
2. Inversion of Control (IOC) Container
Inversion of Control (IoC) is the core component of Spring that creates, configures, manages, and injects beans throughout the application lifecycle using BeanFactory or ApplicationContext. It centralizes object lifecycle management, reducing manual configuration and simplifying application development.
3. Spring Annotation
Spring Annotations are metadata used by the Spring Framework to define configuration, dependencies and behavior directly in Java code. They allow Spring to automatically detect, create and manage beans at runtime using component scanning and reflection.
Spring vs Java EE vs Hibernate
| Features | Spring | Java EE | Hibernate | 
|---|---|---|---|
| Types | It is a lightweight, modular framework for enterprise applications. | It is a heavyweight platform providing a comprehensive set of services. | It is a framework focuses on ORM(Object Relational Mapping) | 
| Modularity | Highly modular means we can use only the needed components. | It comes with a large predefine set of APIs | It entirely focuses on database interaction | 
| Focus Areas | Focuses on Dependency Injection, AOP and MVC for scalability. | Primarily focuses on enterprise-level services like messaging and transactions. | Simplifies database operations, mapping objects to tables. | 
| Transaction Management | Flexible, supports both declarative and programmatic transactions. | Centralized, relies on JTA for managing transactions. | Manages database transactions, but no broader transaction services. |

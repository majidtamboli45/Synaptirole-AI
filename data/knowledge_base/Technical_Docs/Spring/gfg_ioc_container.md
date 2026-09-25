# IoC Container

> Source: https://www.geeksforgeeks.org/advance-java/spring-ioc-container/

The Spring Inversion of Control (IoC) container is a core component of the Spring Framework, streamlining object creation and management. It promotes flexibility and maintainability by managing dependencies and configurations automatically, allowing developers to concentrate on core business logic.
- The container creates instances of beans as per the configuration.
- Automatically resolves and injects the necessary dependencies into beans.
- Manages bean initialization, destruction, and scope (singleton, prototype, etc.).
The following diagram illustrates how the IoC container manages the creation of beans and injects their dependencies in a Spring application
Types of Spring Containers
BeanFactory Container
The BeanFactory is the simplest and most lightweight container in Spring. It provides basic features for bean creation and management but lacks advanced functionalities such as event handling and AOP.
- Suitable for simple applications with minimal configuration.
- Beans are created lazily, meaning they are instantiated only when requested.
- Typically used for low-memory or resource-constrained environments.
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class BeanFactoryExample {
    public static void main(String[] args) {
        ApplicationContext context =
                new ClassPathXmlApplicationContext("beans.xml");
        MyBean myBean = context.getBean(MyBean.class);
        myBean.doSomething();
    }
}
ApplicationContext Container
The ApplicationContext is a more advanced and feature-rich container compared to BeanFactory. It extends BeanFactory and adds additional features such as event propagation, AOP support, and internationalization.
- More commonly used in production applications.
- In the ApplicationContext container, by default, beans are created eagerly during the container initialization process.
- It provides additional services like message resources, event handling, and more.
Syntax for ApplicationContext Ioc Container
1. Using XML Configuration
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class ApplicationContextExample {
    public static void main(String[] args) {
        // Load the Spring context (XML configuration)
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        // Access the bean from the application context
        MyBean myBean = (MyBean) context.getBean("myBean");
        // Use the bean
        myBean.doSomething();
    }
}
2. Using AnnotationBasedConfiguration
Step 1. Create Config Class
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class AppConfig {
    @Bean
    public MyBean myBean() {
        return new MyBean();
    }
}
Step 2. Create MainApp file by using Application Context Ioc Container
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
public class AnnotationContextExample {
    public static void main(String[] args) {
        // Load the Spring context using annotations
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        // Access the bean from the application context
        MyBean myBean = context.getBean(MyBean.class);
        // Use the bean
        myBean.doSomething();
    }
}
Spring IoC Container Managing Beans and Dependencies through Configuration Metadata
- The Spring IoC Container manages beans and their dependencies by utilizing configuration metadata, which defines how beans should be created and wired together.
- This enables automatic dependency injection and lifecycle management, promoting loose coupling and enhancing maintainability.
How It Work In Spring Application
1. Configuration Metadata
- Configuration metadata is the information that tells the Spring container how to create and configure beans.
- It can be provided in different forms, such as XML files, Java annotations, or Java-based configuration classes.
- This metadata defines bean definitions, dependencies, and how beans should be wired together.
2. Business Classes (POJOs)
- POJOs (Plain Old Java Objects) are regular Java objects that represent the business logic of the application.
- These classes are defined with no special requirements other than being simple Java objects with fields, methods, and constructors.
- Spring uses these POJOs as the "beans" that need to be managed, with dependencies injected as per the configuration metadata.
3. The Spring Container
- The Spring IoC (Inversion of Control) container is responsible for instantiating, configuring, and managing the lifecycle of beans.
- The container reads the configuration metadata to determine which beans to create and how to wire them.
- It resolves and injects dependencies automatically based on the defined configuration.
4. Fully Configured System Ready for Use
- Once the Spring container processes the configuration and POJOs, it provides a fully configured system.
- All beans are created, dependencies injected, and the application is now ready to run with all components correctly wired and ready for interaction.
- This system is now decoupled, flexible, and easier to maintain.
Why It used in Spring Framework?
- Modularity: Choose only the necessary modules for your application, reducing complexity.
- Flexibility: Supports different configuration styles (XML, annotations, Java code).
- Scalability: Ideal for both small projects and large enterprise applications.
- Community Support: Access to extensive community-driven resources and support.
- Comprehensive Ecosystem: A wide range of tools and libraries for various use cases, such as Spring Boot, Spring Security, and Spring Data.
BeanFactory vs ApplicationContext
The below table demonstrates the key difference between BeanFactory and ApplicationContext
| Feature | BeanFactory | ApplicationContext | 
|---|---|---|
| Annotation Support | No | Yes | 
| Bean Instantiation/Wiring | Yes | Yes | 
| Internationalization | No | Yes | 
| Enterprise Services | No | Yes | 
| ApplicationEvent Publication | No | Yes | 
| Automatic BeanPostProcessor Registration | No | Yes | 
| Loading Mechanism | Lazy Loading | Aggressive Loading | 
| Automatic BeanFactoryPostProcessor Registration | No | Yes |

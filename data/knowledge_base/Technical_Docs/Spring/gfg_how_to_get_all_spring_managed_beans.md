# How to Get All Spring-Managed Beans

> Source: https://www.geeksforgeeks.org/advance-java/how-to-get-all-spring-managed-beans/

In a Spring application, beans are core components created and managed by the Spring IoC (Inversion of Control) container. They are usually annotated with stereotypes like @Component, @Service, @Repository, or @Controller.
During debugging or analysis, it’s often useful to retrieve all managed beans to inspect which components are registered in the Spring context.
Prerequisites
- Basic understanding of Spring Boot
- Familiarity with Spring stereotypes annotations
- Good knowledge of Java and the Spring Framework
Ways to Retrieve All Managed Beans
Spring provides several ways to access all beans registered within the ApplicationContext.
One of the most straightforward approaches is using the getBeanDefinitionNames() method of the ApplicationContext interface. This method returns an array of all bean names managed by the Spring container.
Step-by-Step Implementation
Let’s build a simple Spring Boot application that lists all the beans managed by the Spring container.
Step 1: Create a Spring Boot Project
Use Spring Initializr to create a new Spring Boot project. Add the following dependencies:
- Spring Web
- Spring DevTools
- Lombok
Once, the project created, then the file structure will look like the below.
Step 2: Configure the Application
In the application.properties file, set the server port.
server.port= 8080
Step 3: Create Sample Beans
Create a package named bean and define three sample beans.
ExampleBean1.java:
package org.example.springgetallbeans.beans;
import org.springframework.stereotype.Component;
@Component("bean1")
public class ExampleBean1 {
    @Override
    public String toString() {
        return "This is ExampleBean1";
    }
}
ExampleBean2.java:
package org.example.springgetallbeans.beans;
import org.springframework.stereotype.Component;
@Component("bean2")
public class ExampleBean2 {
    @Override
    public String toString() {
        return "This is ExampleBean2";
    }
}
ExampleBean3.java:
package org.example.springgetallbeans.beans;
import org.springframework.stereotype.Component;
@Component("bean3")
public class ExampleBean3 {
    @Override
    public String toString() {
        return "This is ExampleBean3";
    }
}
Step 4: Create a Controller to Access the Beans
Create a new package named controller and define a controller class.
package org.example.springgetallbeans.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class BeanController {
    @Autowired
    private ApplicationContext applicationContext;
    // Retrieve all bean names managed by Spring container
    @GetMapping("/beans")
    public String getAllBeans() {
        StringBuilder result = new StringBuilder();
        String[] allBeans = applicationContext.getBeanDefinitionNames();
        for (String beanName : allBeans) {
            result.append(beanName).append("\n");
        }
        return result.toString();
    }
    // Retrieve specific beans by name
    @GetMapping("/bean1")
    public String getBean1() {
        return applicationContext.getBean("bean1").toString();
    }
    @GetMapping("/bean2")
    public String getBean2() {
        return applicationContext.getBean("bean2").toString();
    }
    @GetMapping("/bean3")
    public String getBean3() {
        return applicationContext.getBean("bean3").toString();
    }
}
Explanation:
- The /beans endpoint retrieves all bean names registered in the ApplicationContext.
- The /bean1, /bean2, and /bean3 endpoints return the string representation of the respective beans.
- The ApplicationContext is autowired to provide access to the managed beans.
Step 5: Define the Main Application Class
SpringGetAllBeansApplication.java
package org.example.springgetallbeans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SpringGetAllBeansApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringGetAllBeansApplication.class, args);
    }
}
This class bootstraps the Spring Boot application and enables component scanning and auto-configuration.
Step 6: Run the Application
Run the application as a Spring Boot Application. Once started, it will run on port 8080.
Endpoints Outputs:
Get the Bean1:
GET http://localhost:8080/bean1
Output in Postman:
Get the Bean2:
GET http://localhost:8080/bean2
Output in Postman:
Get the Bean3:
GET http://localhost:8080/bean3
Output in Postman:
Get All the Beans:
GET http://localhost:8080/beans
Note:
The list retrieved from /beans includes not only custom beans (bean1, bean2, bean3) but also internal Spring beans and auto-configuration components that Spring Boot registers automatically.

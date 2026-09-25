# Dependency Injection by Setter Method

> Source: https://www.geeksforgeeks.org/advance-java/spring-dependency-injection-by-setter-method/

Dependency Injection is a design pattern where the Spring IoC container is responsible for providing the required dependencies of a class rather than the class creating them itself.
Instead of manually instantiating objects, Spring automatically injects them at runtime, either through constructors or setter methods.
Why use Dependency Injection?
Without DI, classes are tightly coupled since they instantiate their dependencies directly:
class A {
    private B b = new B(); // Tight coupling
}
This approach makes testing and maintenance difficult.
With Spring DI, the container injects dependencies externally:
class A {
    private B b; // Dependency
    public void setB(B b) {
        this.b = b;
    }
}
Now, A and B are loosely coupled. The Spring container manages their lifecycle and relationships.
Types of Dependency Injection in Spring
There are two types of dependency injection in spring
- Constructor-Based Dependency Injection: Dependencies are injected using a constructor.
- Setter-Based Dependency Injection: Dependencies are injected using setter methods.
Types of Dependency Injection in Spring
- Constructor-Based Injection: Dependencies are injected via the class constructor.
- Setter-Based Injection: Dependencies are injected via setter methods after object creation.
Setter-Based Dependency Injection
In Setter-Based DI, the Spring container:
- Creates a bean using a no-argument constructor.
- Calls setter methods to inject dependencies.
XML-Based Setter Injection
Dependencies are injected into a bean using setter methods defined in the Spring configuration XML file. The Spring container creates the bean instance and assigns property values using <property> tags.
Step 1: Create a POJO Class
Student.java:
package com.spring;
public class Student {
    private String studentName;
    private String studentCourse;
    public Student() {
    }
    // Setter methods for DI
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public void setStudentCourse(String studentCourse) {
        this.studentCourse = studentCourse;
    }
    @Override
    public String toString() {
        return "Student{studentName=" + studentName + ", studentCourse=" + studentCourse + "}";
    }
}
Step 2: Create the Spring Configuration File (config.xml)
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd">
    <!-- Setter-Based Dependency Injection -->
    <bean id="studentBean" class="com.spring.Student">
        <property name="studentName" value="John" />
        <property name="studentCourse" value="Spring Framework" />
    </bean>
</beans>
Step 3: Main Application
package com.spring;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
        Student student = (Student) context.getBean("studentBean");
        System.out.println(student);
    }
}
Output:
Student{studentName=John, studentCourse=Spring Framework}
Annotation-Based Setter Injection
In modern Spring applications, annotations are preferred over XML. The same example can be implemented as follows:
Step 1: Enable Component Scanning
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
@Configuration
@ComponentScan(basePackages = "com.spring")
public class AppConfig {
}
Step 2: Annotate the Class
package com.spring;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component
public class Student {
    private String studentName;
    private String studentCourse;
    @Autowired
    public void setStudentName(@Value("John") String studentName) {
        this.studentName = studentName;
    }
    @Autowired
    public void setStudentCourse(@Value("Spring Framework") String studentCourse) {
        this.studentCourse = studentCourse;
    }
    @Override
    public String toString() {
        return "Student{studentName=" + studentName + ", studentCourse=" + studentCourse + "}";
    }
}
Step 3: Main Application
package com.spring;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        Student student = context.getBean(Student.class);
        System.out.println(student);
    }
}
Output:
Student{studentName=John, studentCourse=Spring Framework}
Java-Based Configuration
Java-based configuration replaces XML with annotations and Java classes.
Step 1: Configuration Class
package com.spring;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;
@Configuration
public class AppConfig {
    @Bean
    public Student student(@Value("John") String studentName,
                           @Value("Spring Framework") String studentCourse) {
        Student student = new Student();
        student.setStudentName(studentName);
        student.setStudentCourse(studentCourse);
        return student;
    }
}
Step 2: Main Application
package com.spring;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        Student student = context.getBean(Student.class);
        System.out.println(student);
    }
}
Output:
Student{studentName=John, studentCourse=Spring Framework}
Advantages of Setter-Based Dependency Injection
- Loose Coupling: Reduces dependencies between classes.
- Flexibility: Properties can be modified after bean creation.
- Ease of Testing: Allows mock dependencies to be injected easily.
- Configuration Simplicity: Beans and dependencies can be configured externally.

# POJO vs Java Beans

> Source: https://www.geeksforgeeks.org/advance-java/pojo-vs-java-beans/

In Java, POJOs (Plain Old Java Objects) and JavaBeans are two ways of defining objects to represent data. Both aim to make code more readable, reusable, and maintainable, but they differ in terms of conventions and restrictions.
POJO
A POJO (Plain Old Java Object) is a simple Java object that is not bound by any special restriction other than those enforced by the Java Language Specification. It does not require any specific framework or classpath dependency.
POJOs were introduced by Sun Microsystems with EJB 3.0 to simplify enterprise Java development by removing the heavy restrictions of earlier Enterprise JavaBeans (EJB) components.
Properties of a POJO
A class is considered a POJO if it does not:
- Extend any predefined class (e.g., HttpServlet, EntityBean, etc.)
- Implement any predefined interface (e.g., javax.ejb.EntityBean)
- Contain framework-specific annotations (e.g., @Entity, @Component)
POJOs are used to represent entities in business logic, for example:
// Employee POJO class
public class Employee {
    // default field
    String name;
    // public field
    public String id;
    // private field
    private double salary;
    // parameterized constructor
    public Employee(String name, String id, double salary) {
        this.name = name;
        this.id = id;
        this.salary = salary;
    }
    // getter methods
    public String getName() {
        return name;
    }
    public String getId() {
        return id;
    }
    public Double getSalary() {
        return salary;
    }
}
- There are no restrictions on access modifiers. Fields can be private, protected, public, or default.
- A constructor is optional.
- It can contain business logic and represent entities directly in the application.
JavaBean
A JavaBean is a special type of POJO that follows specific conventions. All JavaBeans are POJOs, but not all POJOs are JavaBeans.
Rules for a JavaBean
- Must implement the Serializable interface.
- Must have a no-argument constructor.
- All fields must be private.
- Each property should have corresponding getter and setter methods.
- Fields must be accessed only through these methods (not directly).
This design provides encapsulation and controlled access to object properties.
Example: JavaBean Implementation
import java.io.Serializable;
// Java program to illustrate JavaBeans
class Bean implements Serializable {
    // private property
    private Integer property;
    // no-argument constructor
    public Bean() {}
    // setter method
    public void setProperty(Integer property) {
        if (property == 0) {
            return;
        }
        this.property = property;
    }
    // getter method
    public Integer getProperty() {
        if (property == 0) {
            return null;
        }
        return property;
    }
}
// Class to test the Bean
public class GFG {
    public static void main(String[] args) {
        Bean bean = new Bean();
        bean.setProperty(0);
        System.out.println("After setting to 0: " + bean.getProperty());
        bean.setProperty(5);
        System.out.println("After setting to valid value: " + bean.getProperty());
    }
}
Output:
After setting to 0: null
After setting to valid value: 5
Explanation
- The class implements Serializable, allowing it to be converted to a byte stream.
- The no-argument constructor ensures frameworks (like JSP or Spring) can easily create instances.
- Private fields ensure encapsulation.
- Getters and setters allow controlled access to fields.
POJO vs Java Bean
| Feature | POJO | JavaBean | 
|---|---|---|
| Definition | A simple Java object without special restrictions. | A special POJO that follows specific conventions. | 
| Restrictions | No restrictions except Java syntax. | Must follow JavaBean conventions. | 
| Serialization | Can implement Serializable (optional). | Must implement Serializable. | 
| Field Access | Fields can be public, protected, or private. | Fields must be private. | 
| Access Methods | Fields can be accessed directly. | Fields must be accessed via getters and setters. | 
| Constructors | May or may not have a no-arg constructor. | Must have a no-arg constructor. | 
| Encapsulation | Provides limited control over data. | Provides full control through accessors and mutators. | 
| Usage | Used when flexibility and simplicity are preferred. | Used when encapsulation and framework compatibility are required. |

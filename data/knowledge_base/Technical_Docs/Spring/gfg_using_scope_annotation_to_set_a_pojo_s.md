# Using @Scope Annotation to Set a POJO's Scope

> Source: https://www.geeksforgeeks.org/advance-java/java-spring-using-scope-annotation-to-set-a-pojos-scope/

In the Spring Framework, each bean defined in the IoC container has a scope that determines its lifecycle and how many instances are created. By default, Spring creates only one instance of a bean (singleton scope), but it also supports other scopes that control how and when new bean instances are generated.
The @Scope annotation is used to define this behavior at either the class level (for components) or method level (for @Bean methods).
Bean Scopes in Spring
- singleton: Creates a single bean instance per Spring IoC container.
- prototype: Creates a new bean instance every time it is requested.
- request: Creates one bean instance per HTTP request (used in web applications).
- session: Creates one bean instance per HTTP session (used in web applications).
@Scope Annotation
The @Scope annotation defines the lifecycle scope of a bean. By default, every Spring bean is singleton, meaning the same instance is shared across the container.
Syntax
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Scope {
    String value() default "singleton";
}
Usage
- When used with @Component, it applies to all instances of that class.
- When used with @Bean, it applies to the specific bean returned by the method.
Example: Demonstrating Bean Scope
We’ll create a simple shopping application to demonstrate how singleton and prototype scopes work.
Project Structure:
Step 1: Define ShoppingList Bean (Default Singleton Scope)
package com.geeksforgeeks.shop;
import java.util.*;
import org.springframework.stereotype.Component;
@Component
public class ShoppingList {
    private List<Device> items = new ArrayList<>();
    public void addItem(Device item) {
        items.add(item);
    }
    public List<Device> getItems() {
        return items;
    }
}
Since we didn’t specify any scope, Spring treats this bean as a singleton.
Step 2: Create Device Class
package com.geeksforgeeks.shop;
public class Device {
    private String name;
    private double price;
    public Device() {}
    public Device(String name, double price) {
        this.name = name;
        this.price = price;
    }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public void setName(String name) { this.name = name; }
    public void setPrice(double price) { this.price = price; }
    public String toString() { return name + " " + price; }
}
This is a simple POJO representing a product with basic attributes.
Step 3: Create Product Classes
Laptop.java
package com.geeksforgeeks.shop;
public class Laptop extends Device {
    private boolean touchScreen;
    public boolean isTouchScreen() { return touchScreen; }
    public void setTouchScreen(boolean touchScreen) {
        this.touchScreen = touchScreen;
    }
}
Mobile.java:
package com.geeksforgeeks.shop;
public class Mobile extends Device {
    private int batteryCapacity;
    public int getBatteryCapacity() { return batteryCapacity; }
    public void setBatteryCapacity(int capacity) {
        this.batteryCapacity = capacity;
    }
}
Both classes extend Device and add specific attributes to represent product types.
Step 4: Configure Bean Definitions
package com.geeksforgeeks.shop.config;
import org.springframework.context.annotation.*;
import com.geeksforgeeks.shop.*;
@Configuration
@ComponentScan("com.geeksforgeeks.shop")
public class ShoppingListConfig {
    @Bean
    public Device lenovo() {
        Laptop d1 = new Laptop();
        d1.setName("LENOVO");
        d1.setPrice(65000);
        d1.setTouchScreen(true);
        return d1;
    }
    @Bean
    public Device dell() {
        Laptop d2 = new Laptop();
        d2.setName("DELL");
        d2.setPrice(57000);
        return d2;
    }
    @Bean
    public Device moto() {
        Mobile d3 = new Mobile();
        d3.setName("MOTOROLA");
        d3.setPrice(40000);
        d3.setBatteryCapacity(4000);
        return d3;
    }
    @Bean
    public Device iq() {
        Mobile d4 = new Mobile();
        d4.setName("iQOO");
        d4.setPrice(55000);
        d4.setBatteryCapacity(4700);
        return d4;
    }
}
This configuration file declares Device beans and enables component scanning for @Component classes.
Step 5: Testing the Application
package com.geeksforgeeks.shop;
import org.springframework.context.*;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.geeksforgeeks.shop.config.ShoppingListConfig;
public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(ShoppingListConfig.class);
        Device lenovo = context.getBean("lenovo", Device.class);
        Device dell = context.getBean("dell", Device.class);
        Device moto = context.getBean("moto", Device.class);
        Device iq = context.getBean("iq", Device.class);
        ShoppingList list1 = context.getBean(ShoppingList.class);
        list1.addItem(lenovo);
        list1.addItem(moto);
        System.out.println("List 1: " + list1.getItems());
        ShoppingList list2 = context.getBean(ShoppingList.class);
        list2.addItem(dell);
        System.out.println("List 2: " + list2.getItems());
        ShoppingList list3 = context.getBean(ShoppingList.class);
        list3.addItem(iq);
        System.out.println("List 3: " + list3.getItems());
    }
}
Here, each call to context.getBean(ShoppingList.class) fetches the same bean instance because the default scope is singleton.
Output (Singleton Scope):
All lists share the same instance, showing singleton behavior.
Changing Scope to prototype
To create a new instance each time, annotate the bean with @Scope("prototype").
Updated ShoppingList.java:
package com.geeksforgeeks.shop;
import java.util.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class ShoppingList {
    private List<Device> items = new ArrayList<>();
    public void addItem(Device item) {
        items.add(item);
    }
    public List<Device> getItems() {
        return items;
    }
}
Now, each getBean() call creates a separate instance.
Output (Prototype Scope):
Now if we rerun the Main.java class, we can see the three different shopping lists. The output will be as follows.
Each shopping list is now independent.

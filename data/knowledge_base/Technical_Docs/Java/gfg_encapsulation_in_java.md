# Encapsulation in Java

> Source: https://www.geeksforgeeks.org/java/encapsulation-in-java/

Encapsulation in Java is an object-oriented programming concept that bundles data and the methods that operate on that data into a single unit, such as a class. It also helps control access to the object's internal state by restricting direct access and providing controlled ways to read or modify it.
- Usually uses private fields to restrict direct access.
- Provides controlled access through methods such as getters and setters when required.
- Allows validation and other rules to be applied before changing data.
How Encapsulation is Achieved in Java
Encapsulation is commonly implemented by:
- Declaring fields as private .
- Providing public or appropriately accessible methods to read or modify the fields.
- Adding validation inside methods when necessary.
- Keeping the internal implementation hidden from code outside the class.
Rules:
- Declare data as private: Hide the class data so it cannot be accessed directly from outside the class.
- Use getters and setters: Keep variables private and provide public getter and setter methods for controlled access and safe modification, often with validation.
- Apply proper access modifiers: Use private for data hiding and public for methods that provide access.
class Programmer {
    private String name;
    // Getter method used to get the data
    public String getName() { return name; }
    // Setter method is used to set or modify the data
    public void setName(String name) {
        
        this.name = name;
    }
}
public class Geeks {
    public static void main(String[] args){
        
        Programmer p = new Programmer();
        p.setName("Geek");
        System.out.println("Name=> " + p.getName());
    }
}
Output
Name=> Geek
Explanation: In the above example, we use the encapsulation and use getter (getName) and setter (setName) method which are used to show and modify the private data. This encapsulation mechanism protects the internal state of the Programmer object and allows for better control and flexibility in how the name attribute is accessed and modified.
Advantages of Encapsulation
- Protects an object's internal data from direct access.
- Allows validation before data is modified.
- Makes code easier to maintain and modify.
- Keeps related data and methods together in one class.
- Reduces dependency on the internal implementation of a class.
- Provides better control over how an object's state can be accessed or changed.
Limitations of Encapsulation
- Can increase the amount of code when many accessor methods are required.
- May add unnecessary complexity for very simple classes.
- Requires careful design to decide which data and operations should be exposed.
- Excessive use of getters and setters can expose more of a class's internal state than necessary.
Data Hiding vs Encapsulation
| Aspect | Data Hiding | Encapsulation | 
|---|---|---|
| Meaning | Restricts direct access to internal data | Bundles data and related methods into a class | 
| Main focus | Controlling access to data | Organizing data and behavior together | 
| Purpose | Protects internal state from unwanted direct access | Provides a controlled and well-defined interface | 
| Commonly achieved using | Access modifiers such as private | Classes, access control, and methods | 
| Scope | Mainly concerned with restricting access | Broader concept that includes bundling and access control | 
| Example | private int balance; | class Account { private int balance; void deposit() {...} } |

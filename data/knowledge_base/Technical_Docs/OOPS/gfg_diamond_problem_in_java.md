# Diamond Problem in Java

> Source: https://www.geeksforgeeks.org/java/diamond-problem-in-java/

The Diamond Problem is a well-known issue in programming languages that support multiple inheritance, where a class inherits the same method from more than one parent class, creating ambiguity about which method should be executed. This article explains the problem, provides examples and shows how to solve it in Java.
Note: Java does not allow multiple inheritance of classes, so this exact scenario cannot happen with classes. However, starting Java 8+, interfaces can introduce a similar ambiguity when using default methods.
Why Java Avoids the Diamond Problem
- Java allows single inheritance for classes, avoiding ambiguity in method resolution.
- Multiple inheritance is achieved through interfaces, which only declare methods without implementations (unless using default methods).
- The implementing class must provide the actual method definition, resolving potential conflicts.
Diamond Problem with Default Methods (Java 8+)
Default methods in interfaces can introduce ambiguity
interface Parent1 {
    default void fun() { System.out.println("Parent1 fun"); }
}
interface Parent2 {
    default void fun() { System.out.println("Parent2 fun"); }
}
class Child implements Parent1, Parent2 {
    @Override
    public void fun() {
        Parent1.super.fun(); // Explicitly choose which default method to call
    }
}
public class Demo {
    public static void main(String[] args) {
        Child c = new Child();
        c.fun(); // Output: Parent1 fun
    }
}
Output
Parent1 fun
Explanation:
- Both interfaces have a default implementation of fun().
- The implementing class (Child) must explicitly choose which default method to call using InterfaceName.super.methodName().

# Java Functional Interfaces

> Source: https://www.geeksforgeeks.org/java/java-functional-interfaces/

A functional interface in Java is an interface that has only one abstract method, making it suitable for use with lambda expressions and method references (introduced in Java 8).
- Functional interfaces can contain multiple default and static methods.
- Lambda expressions can implement functional interfaces.
- Method references can also be used with functional interfaces.
public class Geeks {
  
    public static void main(String[] args) {
      
        // Using lambda expression to implement Runnable
        new Thread(() -> System.out.println("New thread created")).start();
    }
}
Output
New thread created
Explanation:
- Above program demonstrates use of lambda expression with the Runnable functional interface.
- Runnable has one abstract method run(), so it qualifies as a functional interface.
- Lambda ()-> System.out.println("New thread created") defines the run() method.
- new Thread().start() starts a new thread that executes the lambda body
Note: A functional interface can also extend another functional interface.
Syntax:
@FunctionalInterface
interface InterfaceName {
returnType methodName(parameters);
} 
Rules of Functional Interfaces
A functional interface follows these important rules:
- It must contain exactly one abstract method.
- It can contain any number of default methods and static methods.
- Methods inherited from Object, such as toString() or equals(), do not count as abstract methods for determining whether an interface is functional.
- The @FunctionalInterface annotation is not mandatory.
- A functional interface can extend another functional interface if the resulting interface still has only one abstract method
@FunctionalInterface Annotation
The @FunctionalInterface annotation tells the compiler that an interface is intended to be a functional interface. It helps detect accidental changes that introduce more than one abstract method.
@FunctionalInterface
interface Square {
    int calculate(int x);
}
class Geeks {
    public static void main(String args[]) {
        int a = 5;
        // lambda expression to define the calculate method
        Square s = (int x) -> x * x;
        // parameter passed and return type must be same as defined in the prototype
        int ans = s.calculate(a);
        System.out.println(ans);
    }
}
Output
25
Explanation:
- Square is a functional interface with a single method calculate(int x).
- A lambda expression (int x) -> x * x is used to implement the calculate method.
- Lambda takes x as input and returns x * x.
Note: @FunctionalInterface annotation is optional but it is a good practice to use. It helps catching the error in early stage by making sure that the interface has only one abstract method.
Functional Interfaces Before Java 8
Before Java 8, developers had to use anonymous inner classes to provide interface implementations. Here’s how the same Runnable example would look:
class Geeks {
    public static void main(String args[]) {
      
        // create anonymous inner class object
        new Thread(new Runnable() {
            @Override public void run()
            {
                System.out.println("New thread created");
            }
        }).start();
    }
}
Output
New thread created
Types of Functional Interfaces
Java 8 introduced four main functional interface types under the package java.util.function. These are widely used in Stream API, collections and lambda-based operations.
1. Consumer
Consumer interface of the functional interface is the one that accepts only one argument. It is used for performing an action, such as printing or logging. There are also functional variants of the Consumer DoubleConsumer, IntConsumer and LongConsumer.
Syntax:
Consumer<Integer> consumer = (value) -> System.out.println(value);
2. Predicate
Predicate interface represents a boolean-valued function of one argument. It is commonly used for filtering operations in streams. There are also functional variants of the Predicate IntPredicate, DoublePredicate and LongPredicate.
Syntax:
public interface Predicate<T> {
    boolean test(T t);
}
The Java predicate functional interface can also be implemented using Lambda expressions.
Predicate<Integer> predicate = (value) -> value != null;
3. Function
The function interface takes one argument and returns a result. It is commonly used for transforming data. Several variations exist:
- Bi-Function: Takes two arguments and returns a result.
- Unary Operator: Input and output are of the same type.
- Binary Operator: Like BiFunction but with same input/output type.
Syntax:
Function<Integer, Integer> function = (value) -> value * value;
4. Supplier
Supplier functional interface is also a type of functional interface that does not take any input or argument and yet returns a single output. The different extensions of the Supplier functional interface hold many other suppliers functions like BooleanSupplier, DoubleSupplier, LongSupplier and IntSupplier.
Syntax:
Supplier<String> supplier = () -> "Hello, World!";
Example: Using Predicate Interface to Filter Strings
import java.util.*;
import java.util.function.Predicate;
class Geeks {
    public static void main(String args[]) {
      
        // create a list of strings
        List<String> n = Arrays.asList("Geek", "GeeksQuiz", "g1", "QA", "Geek2");
        // declare the predicate type as string and use lambda expression to create object
        Predicate<String> p = (s) -> s.startsWith("G");
        // Iterate through the list
        for (String st : n) {
          
            // call the test method
            if (p.test(st))
                System.out.println(st);
        }
    }
}
Output
Geek
GeeksQuiz
Geek2
Functional Interface vs Normal Interface
| Feature | Functional Interface | Normal Interface | 
|---|---|---|
| Abstract methods | Exactly one | Can have multiple | 
| Lambda compatible | Yes | No, if it has multiple abstract methods | 
| @FunctionalInterface | Can be used | Cannot be used if multiple abstract methods exist | 
| Default methods | Allowed | Allowed | 
| Static methods | Allowed | Allowed | 
| Main use | Lambda and method references | General abstraction | 
Functional Interfaces Table
| Functional Interfaces | Description | Method | 
|---|---|---|
| Runnable | It represents a task that can be executed by a thread. | void run() | 
| Comparable | It compares two objects for ordering. | int compareTo(T o) | 
| ActionListener | It handles an action event in event-driven programming. | void actionPerformed(ActionEvent e) | 
| Callable | It represents a task that can return a result or throw an exception. | V call() throws Exception | 
| Consumer | It accepts a single input argument and returns no result. | void accept(T t) | 
| Predicate | It accepts a single argument and returns a boolean result. | boolean test(T t) | 
| Function | It accepts a single argument and returns a result. | R apply(T t) | 
| Supplier | It does not take any arguments but provides a result. | T get() | 
| BiConsumer | It accepts two arguments and returns no result. | void accept(T t, U u) | 
| BiPredicate | It accepts two arguments and returns a boolean result. | boolean test(T t, U u) | 
| BiFunction | It accepts two arguments and returns a result. | R apply(T t, U u) | 
| UnaryOperator | This is a special case of Function, where input and output types are the same. | T apply(T t) | 
| BinaryOperator | This is a special case of BiFunction, where input and output types are the same. | T apply(T t1, T t2) |

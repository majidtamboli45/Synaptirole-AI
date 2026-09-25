# Supplier Interface in Java with Examples

> Source: https://www.geeksforgeeks.org/java/supplier-interface-in-java-with-examples/

The Supplier<T> interface is a functional interface introduced in Java 8 and available in the java.util.function package. It represents a supplier of results that does not accept any input arguments but returns a value of a specified type.
- Represents a function with no input and one output.
- Useful for lazy value generation and object creation.
- Supports lambda expressions and method references.
import java.util.function.Supplier;
public class Main {
    public static void main(String[] args) {
        Supplier<String> message =
            () -> "Welcome to Java";
        System.out.println(message.get());
    }
}
Output
Welcome to Java
Explanation: In this example, the Supplier does not take any input. When the get() method is called, it returns the string "Welcome to Java".
Syntax
@FunctionalInterface
public interface Supplier<T>
Here,
- T :Type of the result supplied by the function.
Method of Supplier Interface
1. get() Method
The get() method is the functional method of the Supplier interface. It generates and returns a value without taking any input parameters.
- Takes no arguments.
- Returns a value of type T.
- Commonly used for lazy initialization and object creation.
Syntax:
T get()
Return Value: Returns a value of type T
import java.util.function.Supplier;
public class Main{
    public static void main(String args[])
    {
        // This function returns a random value.
        Supplier<Double> randomValue = () -> Math.random();
        // Print the random value using get()
        System.out.println(randomValue.get());
    }
}
Output
0.33157850608822403
Explanation: In this example, the Supplier generates a random double value whenever the get() method is called. Since no input is required, the value is produced directly by the supplier.
Example: Supplying an Object
import java.util.function.Supplier;
public class Main {
    public static void main(String[] args) {
        Supplier<StringBuilder> supplier =
            () -> new StringBuilder("Java");
        System.out.println(supplier.get());
    }
}
Output
Java
Explanation: Here, the Supplier creates and returns a new StringBuilder object whenever get() is invoked.
Supplier vs Function
| Feature | Supplier | Function<T, R> | 
|---|---|---|
| Input Arguments | None | One | 
| Return Value | Yes | Yes | 
| Functional Method | get() | apply() | 
| Generic Parameters | One (T) | Two (T, R) | 
| Common Use | Value Generation | Data Transformation | 
Advantages of Supplier Interface
- Does not require any input arguments.
- Useful for generating values on demand.
- Supports lazy initialization.
- Works seamlessly with lambda expressions.
- Reduces boilerplate code.
- Commonly used in streams, factories, and object creation patterns

# Java Method References

> Source: https://www.geeksforgeeks.org/java/java-method-references/

Java Method References are a shorthand way to refer to an existing method without invoking it. They were introduced in Java 8 to make lambda expressions shorter, cleaner, and more readable. Method references use the double colon (::) operator and are mainly used with functional interfaces.
- Introduced in Java 8 as an alternative to lambda expressions
- Improve code readability and reduce boilerplate
- Used when a lambda expression simply forwards its parameters to a single existing method (pass-through call).
import java.util.Arrays;
public class Geeks{
    
  	// Method
    public static void print(String s){
        System.out.println(s);
    }
    public static void main(String[] args){
        
        String[] names = {"Geek1", "Geek2", "Geek3"};
        // Using method reference to print each name
        Arrays.stream(names).forEach(Geeks::print);
    }
}
Output
Geek1
Geek2
Geek3
Explanation: In the above example, we are using method reference to print items. The print method is a static method which is used to print the names. In the main method we created an array of names and printing each one by calling the print method directly.
Syntax
ClassName::methodName
objectReference::methodName
ClassName::new
Types of Method References
There are four type method references that are as follows:
1. Reference to a Static Method
A static method reference is used to refer to a static method of a class. It replaces a lambda expression that simply calls a static method.
- Uses class name to access the method
- Method must be static
- Commonly used with utility methods
Syntax:
ClassName::staticMethodName
import java.util.*;
class MathUtil{
    static void square(int n) {
        System.out.println(n * n);
    }
}
class GFG{
    public static void main(String[] args) {
        List<Integer> list = Arrays.asList(2, 3, 4);
        list.forEach(MathUtil::square);
    }
}
Output
4
9
16
Explanation:
- square(int n) is a static method that prints the square of a number.
- forEach(MathUtil::square) passes each list element to the square() method.
- Internally, this works like:
list.forEach(n -> MathUtil.square(n));
2. Reference to an Instance Method of a Particular Object
This type of method reference refers to an instance method of a specific object. The object is already created, and its method is referenced directly.
- Uses an existing object
- Method must be non-static
- Suitable for object-specific operations
Syntax:
objectReference::instanceMethod
import java.util.*;
class Printer{
    void print(String msg) {
        System.out.println(msg);
    }
}
class GFG{
    public static void main(String[] args) {
        Printer printer = new Printer();
        List<String> data = Arrays.asList("Java", "Spring", "Boot");
        data.forEach(printer::print);
    }
}
Output
Java
Spring
Boot
Explanation:
- printer is an object of thePrinter class.
- printer::print refers to the instance methodprint() .
- Each element of the list is automatically passed to print() .
- Equivalent lambda expression:
data.forEach(msg -> printer.print(msg));
3. Reference to an Instance Method of an Arbitrary Object
This method reference refers to an instance method of any object of a particular class. The actual object is determined at runtime.
- Uses class name instead of object
- Mostly used with Stream API
- Method is called on each element
Syntax:
ClassName::instanceMethod
import java.util.*;
class GFG{
    
    public static void main(String[] args){
        List<String> names = Arrays.asList("java", "spring", "microservice");
        names.stream()
             .map(String::toUpperCase)
             .forEach(System.out::println);
    }
}
Output
JAVA
SPRING
MICROSERVICE
Explanation:
- String::toUpperCase calls toUpperCase() on each String object.
- map() transforms each element into uppercase.
- System.out::println prints the transformed values.
- Equivalent lambda expression:
map(name -> name.toUpperCase())
4. Reference to a Constructor
A constructor reference is used to create a new object using a functional interface. It replaces a lambda expression that calls a constructor.
- Uses new keyword
- Commonly used with Supplier, Function
- Helps in object creation logic
Syntax:
ClassName::new
import java.util.function.Supplier;
class Student {
    Student() {
        System.out.println("Student object created");
    }
}
class GFG{
    public static void main(String[] args) {
        Supplier<Student> supplier = Student::new;
        supplier.get();
    }
}
Output
Student object created
Explanation:
- Supplier<Student> is a functional interface with get() method.
- Student::new refers to the constructor of Student.
- When supplier.get() is called, a new Student object is created.
- Equivalent lambda expression:
Supplier<Student> supplier = () -> new Student();
Method References and Functional Interfaces
Method references work only with functional interfaces, which contain exactly one abstract method.
- Method signature must match abstract method
- Common functional interfaces include Consumer, Supplier, Function, Predicate
- Used heavily with Streams and Collections
Example:
List<String> list = Arrays.asList("Banana", "Apple", "Mango");
list.sort(String::compareToIgnoreCase);

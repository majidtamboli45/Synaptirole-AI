# Static Method vs Instance Method in Java

> Source: https://www.geeksforgeeks.org/java/static-methods-vs-instance-methods-in-java/

In Java, methods define the behavior of classes and objects. Understanding the difference between static methods and instance methods is essential for writing clean and efficient code.
Static Method
A static method belongs to the class rather than any specific object, allowing it to be called without creating an instance. It is commonly used for operations that do not depend on object state.
- Can be called using the class name without creating an object
- Can access only static variables and methods
- Cannot directly access non-static (instance) members
import java.io.*;
class Geeks {
    // static method
    public static void greet() {
        System.out.println("Hello Geek!");
    }
    public static void main(String[] args) {
        // calling the method directily
        greet();
        // using the class name
        Geeks.greet();
    }
}
Explanation: The above example shows a static method greet() inside the Geeks class, static methods can be called without creating an object. In the main method, we are not creating an object of Geeks class we are calling the method directly by the class name which is Geeks and then we are printing the output.
Instance Method
An instance method belongs to an object of a class and is used to operate on object-specific data. It requires creating an instance of the class to be called.
- Can access instance variables, other instance methods, and static members
- Requires an object to invoke the method
- Has access to the this reference, pointing to the current object
import java.io.*;
class Test {
    String n = "";
    // Instance method 
    public void test(String n) { 
      this.n = n; 
    }
}
class Geeks {
    public static void main(String[] args) {
        // create an instance of the class
        Test t = new Test();
        // calling an instance method in the class 'Geeks'
        t.test("GeeksforGeeks");
        System.out.println(t.n);
    }
}
Explanation: The above example shows how to use an instance method in Java. We are creating an object of the Test class and calling the test method to set a value and then we are printing the output.
Static Method Vs Instance Method
The following table lists the major differences between the static methods and the instance methods in Java.
| Features | Static method | Instance method | 
|---|---|---|
| Definition | Created using the static keyword and retrieved without creating an object. | Requires an object of its class to be invoked. | 
| Access | Access only static variables and methods. | Can access both static and instance members. | 
| this keyword | Cannot use the this keyword within static methods. | Can use the this keyword to refer to the current object. | 
| Override | Does not support runtime polymorphism | Supports runtime polymorphism | 
| Memory Allocation | Loaded once per class | Each object has its own copy |

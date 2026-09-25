# Abstract Class in Java

> Source: https://www.geeksforgeeks.org/java/abstract-classes-in-java/

An abstract class in Java is a class declared with the abstract keyword that cannot be instantiated directly. It is used to provide a common base for related classes and supports partial abstraction by allowing both abstract methods and methods with implementations. An abstract class can contain:
- Abstract methods, which do not have a method body.
- Concrete methods, which contain an implementation.
- Constructors, instance variables, static methods and final methods.
abstract class Shape {
    String color;
    // Constructor
    Shape(String color) {
        this.color = color;
    }
    // Abstract method
    abstract double area();
    // Concrete method
    void getColor() {
        System.out.println("Color: " + color);
    }
}
class Circle extends Shape {
    int radius;
    Circle(String color, int radius) {
        super(color);
        this.radius = radius;
    }
    double area() {
        return 3.14 * radius * radius;
    }
}
public class GFG{
    public static void main(String[] args) {
        Shape s = new Circle("Red", 5);
        s.getColor();
        System.out.println("Area: " + s.area());
    }
}
Output
Color: Red
Area: 78.5
Explanation: The abstract class contains both abstract and non-abstract methods. The child class implements the abstract method while inheriting the normal method.
Syntax:
abstract class ClassName {
    abstract void methodName();   // Abstract method
 void concreteMethod() {        // Concrete method
     System.out.println("Method implementation");
   }
}
Note: Abstract Class cannot be instantiated directly
Example 1: Abstract Class with Only Abstract Method.
abstract class Sunstar {
    abstract void printInfo();
}
// Abstraction performed using extends
class Employee extends Sunstar {
    void printInfo()
    {
        String name = "avinash";
        int age = 21;
        float salary = 222.2F;
        System.out.println(name);
        System.out.println(age);
        System.out.println(salary);
    }
}
// Base class
class Base {
    public static void main(String args[])
    {
        Sunstar s = new Employee();
        s.printInfo();
    }
}
Output
avinash
21
222.2
Explanation: This example defines an abstract class with only abstract methods, and the child class implementation. Object is created using child class reference.
Example 2: Abstract Class with Constructor and Methods.
import java.io.*;
abstract class Subject {
    Subject() { 
      System.out.println("Learning Subject"); 
    }
  
      abstract void syllabus();
  
      void Learn(){
          System.out.println("Preparing Right Now!");
    }
}
class IT extends Subject {
  void syllabus(){
    System.out.println("C , Java , C++");
  }
}
class GFG {
    public static void main(String[] args) {
        Subject x=new IT();
      
          x.syllabus();
          x.Learn();
    }
}
Output
Learning Subject
C , Java , C++
Preparing Right Now!
Explanation: Here, the abstract class has a constructor which is called when the child class object is created. It also contains methods used by the child class.
Properties of Abstract class
Let us elaborate on these observations and do justify them with help of clean java programs as follows.
1. An abstract class cannot be instantiated
We cannot create an object directly from an abstract class.
abstract class Base {
    abstract void fun();
}
// Class 2
class Derived extends Base {
    void fun()
    {
        System.out.println("Derived fun() called");
    }
}
// Class 3
// Main class
class Main {
    // Main driver method
    public static void main(String args[])
    {
        // Uncommenting the following line will cause
        // compiler error as the line tries to create an
        // instance of abstract class. Base b = new Base();
        // We can have references of Base type.
        Base b = new Derived();
        b.fun();
    }
}
Output
Derived fun() called
Explanation: Base is abstract, so new Base() is not allowed. However, a reference of type Base can refer to an object of its concrete subclass Derived. When b.fun() is called, the implementation provided by Derived executes. 
2. An abstract class can have a constructor
Although an abstract class cannot be instantiated, it can have a constructor. The constructor is called as part of creating an object of a subclass.
abstract class Base {
    // Constructor of class 1
    Base()
    {
        // Print statement
        System.out.println("Base Constructor Called");
    }
    // Abstract method inside class1
    abstract void fun();
}
// Class 2
class Derived extends Base {
    // Constructor of class2
    Derived()
    {
        System.out.println("Derived Constructor Called");
    }
    // Method of class2
    void fun()
    {
        System.out.println("Derived fun() called");
    }
}
// Class 3
// Main class
class GFG {
    // Main driver method
    public static void main(String args[])
    {
        // Creating object of class 2
        // inside main() method
        Derived d = new Derived();
        d.fun();
    }
}
Output
Base Constructor Called
Derived Constructor Called
Derived fun() called
Explanation: When the Derived object is created, the constructor of its parent class Base runs first, followed by the Derived constructor. After construction, fun() calls the implementation defined in Derived.
3. An abstract class may have no abstract methods
A class can be declared abstract even when it does not contain any abstract method. Such a class cannot be instantiated directly but can be inherited by other classes.
abstract class Base {
    // Demo method. This is not an abstract method.
    void fun()
    {
        // Print message if class 1 function is called
        System.out.println(
            "Function of Base class is called");
    }
}
// Class 2
class Derived extends Base {
    // This class only inherits the Base class methods and
    // properties
}
// Class 3
class Main {
    // Main driver method
    public static void main(String args[])
    {
        // Creating object of class 2
        Derived d = new Derived();
        // Calling function defined in class 1 inside main()
        // with object of class 2 inside main() method
        d.fun();
    }
}
Output
Function of Base class is called
Explanation: Base is declared abstract even though fun() is a concrete method. Therefore, Base cannot be instantiated directly. Derived inherits fun() and can create its own object to call the method.
4. An abstract class can contain final methods
An abstract class can contain a final method. A final method cannot be overridden by its subclasses.
abstract class Base {
    final void fun()
    {
        System.out.println("Base fun() called");
    }
}
// Class 2
class Derived extends Base {
  
}
// Class 3
// Main class
class GFG {
    // Main driver method
    public static void main(String args[])
    {
        {
            // Creating object of abstract class
            Base b = new Derived();
            // Calling method on object created above
            // inside main method
            b.fun();
        }
    }
}
Output
Base fun() called
Explanation: The fun() method is declared as final, so Derived inherits it but cannot provide another implementation for it. The method is called using a Base reference that refers to a Derived object.
5. An abstract class cannot be instantiated directly
The following code produces a compile-time error:
abstract class GFG {
    // Main driver method
    public static void main(String args[])
    {
        // Trying to create an object
        GFG gfg = new GFG();
    }
}
Explanation: GFG is declared as an abstract class, so Java does not allow new GFG(). An abstract class must be extended by another class before an object can be created.
Output:
6. An abstract class can contain static methods
Abstract classes can contain static methods. Static methods belong to the class and can be called using the class name without creating an object.
abstract class Helper {
    // Abstract method
    static void demofun()
    {
        // Print statement
        System.out.println("Geeks for Geeks");
    }
}
// Class 2
// Main class extending Helper class
public class GFG extends Helper {
    // Main driver method
    public static void main(String[] args)
    {
        // Calling method inside main()
        // as defined in above class
        Helper.demofun();
    }
}
Output
Geeks for Geeks
Explanation: demoFun() is a static method, so it can be called directly using Helper.demoFun(). Creating an object of the abstract class is not required.
7. Abstract inner classes are allowed
Java also allows an inner class to be declared as abstract.
import java.io.*;
abstract class B {
    // declaring inner class as abstract with abstract
    // method
    abstract class C {
        abstract void myAbstractMethod();
    }
}
class D extends B {
    class E extends C {
        // implementing the abstract method
        void myAbstractMethod()
        {
            System.out.println(
                "Inside abstract method implementation");
        }
    }
}
public class Main {
    public static void main(String args[])
    {
        // Instantiating the outer class
        D outer = new D();
        // Instantiating the inner class
        D.E inner = outer.new E();
        inner.myAbstractMethod();
    }
}
Output
Inside abstract method implementation
Explanation: C is an abstract inner class containing an abstract method. E extends C and implements that method. An object of D is created first because E is a non-static inner class, and then an object of E is created using the outer object.
8. A class containing an abstract method must be abstract
If a class contains at least one abstract method, the class itself must be declared abstract.
import java.io.*;
// here if we remove the abstract 
// keyword then we will get compile
// time error due to abstract method
abstract class Demo {
    abstract void m1();
}
class Child extends Demo {
    public void m1() 
    { 
      System.out.print("Hello"); 
    }
}
class GFG {
    public static void main(String[] args)
    {
        Child c = new Child();
        c.m1();
    }
}
Output
Hello
Explanation: Demo contains the abstract method m1(), so Demo must be declared abstract. Child provides the implementation of m1(), making Child a concrete class whose object can be created. 
9. A subclass can remain abstract
If a subclass does not implement all abstract methods inherited from its parent, that subclass must also be declared abstract.
import java.io.*;
abstract class Demo {
    abstract void m1();
    abstract void m2();
    abstract void m3();
}
abstract class FirstChild extends Demo {
    public void m1() {
      System.out.println("Inside m1"); 
    }
}
class SecondChild extends FirstChild {
    public void m2() {
      System.out.println("Inside m2"); 
    }
    public void m3() {
      System.out.println("Inside m3");
    }
}
class GFG {
    public static void main(String[] args)
    {
        // if we remove the abstract keyword from FirstChild
        // Class and uncommented below obj creation for
        // FirstChild then it will throw
        // compile time error as did't override all the
        // abstract methods
        // FirstChild f=new FirstChild();
        // f.m1();
        SecondChild s = new SecondChild();
        s.m1();
        s.m2();
        s.m3();
    }
}
Output
Inside m1
Inside m2
Inside m3
Explanation: Demo declares three abstract methods. FirstChild implements only m1(), so it must remain abstract because m2() and m3() are still unimplemented. SecondChild implements the remaining methods, so it becomes a concrete class and can be instantiated.

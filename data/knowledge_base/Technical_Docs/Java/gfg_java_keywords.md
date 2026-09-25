# Java Keywords

> Source: https://www.geeksforgeeks.org/java/java-keywords/

Java keywords are reserved words with predefined meanings used by the compiler to perform specific operations. They are part of the language syntax and cannot be modified.
- Keywords cannot be used as identifiers (variable, method, class, or object names).
- Examples include int, class, if, return, etc.
class Geeks {
    
    public static void main(String[] args)
    {
      	// Using final and int keyword
        final int x = 10;
      
      	// Using if and else keywords
      	if(x > 10){
           System.out.println("Failed");
        }
      	else {
           System.out.println("Successful demonstration"
                              +" of keywords.");
        }
    }
}
Output
Successful demonstration of keywords.
Hierarchy of Keywords
The following diagram represents the classification of reserved words available in Java 21, including keywords, unused keywords, and reserved literals.
What Happens if we use a Variable Name same as keyword?
Using a keyword as a variable name would give error as shown below.
class Geeks 
{
    public static void main(String[] args)
    {
        String this = "Hello World!";
        System.out.println(this);
    }
}
Output:
./Geeks.java:5: error: not a statement
String this = "Hello World!";
^
./Geeks.java:5: error: ';' expected
String this = "Hello World!";
2 errors
Important Points:
- The keywords const and goto are reserved, even though they are not currently used in Java.
- true, false, and null look like keywords, but in actuality they are literals. However, they still can't be used as identifiers in a program.
- In Java, keywords are case-sensitive, and writing Java keywords in upper case (like IF instead of if) will throw an error.
Java Keywords List (As of Java 21)
Java keywords are reserved words that have predefined meanings in the language. They cannot be used as identifiers (like variable or method names).
As of Java 21, there are 52 keywords, categorized below by their usage and purpose.
Data Type Keywords
Used to define variable types and specify the kind of data they can hold.
| Keyword | Usage | 
|---|---|
| boolean | Defines a variable that holds true orfalse . | 
| byte | Defines an 8-bit signed integer. | 
| char | Defines a 16-bit Unicode character. | 
| short | Defines a 16-bit signed integer. | 
| int | Defines a 32-bit signed integer. | 
| long | Defines a 64-bit signed integer. | 
| float | Defines a 32-bit floating-point number. | 
| double | Defines a 64-bit floating-point number. | 
| void | Specifies that a method does not return any value. | 
Control Flow Keywords
Used to control the execution flow of a program, including loops, branching, and jumps.
| Keyword | Usage | 
|---|---|
| if | Executes code when a condition is true. | 
| else | Defines an alternate block when an if condition is false. | 
| switch | Selects one block of code among multiple options. | 
| case | Defines an individual branch in a switch statement. | 
| default | Defines the block executed if no case matches. | 
| for | Starts a for loop. | 
| while | Starts a while loop. | 
| do | Starts a do-while loop. | 
| break | Terminates the nearest loop or switch . | 
| continue | Skips to the next iteration of a loop. | 
| return | Exits from a method and optionally returns a value. | 
Exception Handling Keywords
Used for handling and managing runtime errors in programs.
| Keyword | Usage | 
|---|---|
| try | Defines a block of code to test for exceptions. | 
| catch | Defines a block to handle exceptions thrown by try . | 
| finally | Defines a block that always executes after try andcatch . | 
| throw | Used to manually throw an exception. | 
| throws | Declares the exceptions a method can throw. | 
| assert | Tests assumptions during program execution for debugging. | 
Object-Oriented Keywords
Used to define classes, interfaces, and objects, as well as inheritance and encapsulation properties.
| Keyword | Usage | 
|---|---|
| class | Declares a class. | 
| interface | Declares an interface. | 
| extends | Indicates inheritance from a superclass. | 
| implements | Indicates that a class implements an interface. | 
| new | Creates new objects. | 
| this | Refers to the current object. | 
| super | Refers to the superclass of the current object. | 
| abstract | Declares a class or method that must be implemented in a subclass. | 
| final | Prevents inheritance, overriding, or modification. | 
| static | Declares class-level variables or methods. | 
| sealed | Restricts which classes can extend a given class. | 
| permits | Specifies the subclasses allowed to extend a sealed class. | 
| enum | Declares a fixed set of constants. | 
| record | Declares an immutable data class (Java 16+). | 
| instanceof | Checks whether an object is of a specific type. | 
Access Control Keywords
Define the visibility or accessibility of classes, methods, and variables.
| Keyword | Usage | 
|---|---|
| public | Accessible from anywhere in the program. | 
| protected | Accessible within the same package or by subclasses. | 
| private | Accessible only within the same class. | 
Package and Import Keywords
Used to organize classes and access external code.
| Keyword | Usage | 
|---|---|
| package | Defines a namespace for classes. | 
| import | Allows access to classes from other packages. | 
Multithreading and Synchronization Keywords
Used to handle concurrent execution of code and ensure thread safety.
| Keyword | Usage | 
|---|---|
| synchronized | Defines critical sections that only one thread can access at a time. | 
| volatile | Indicates that a variable may change asynchronously. | 
Memory Management and Object Serialization Keywords
Handle object persistence, garbage collection, and native method calls.
| Keyword | Usage | 
|---|---|
| transient | Excludes a variable from serialization. | 
| native | Specifies that a method is implemented in native (non-Java) code. | 
Modifier and Utility Keywords
Define additional behaviors and precision control.
| Keyword | Usage | 
|---|---|
| strictfp | Ensures consistent floating-point calculations across platforms. | 
Reserved (Unused) Keywords
These keywords are reserved but not currently used by Java.
| Keyword | Usage | 
|---|---|
| const | Reserved for future use; not currently implemented. | 
| goto | Reserved for future use; not currently implemented. | 
Special Literals
Special literals represent predefined constant values in Java and cannot be used as identifiers.
| Keyword | Usage | 
|---|---|
| true | Represents the boolean value true. | 
| false | Represents the boolean value false. | 
| null | Represents the absence of any reference value. | 
Keywords vs Identifiers in Java
| Feature | Keywords | Identifiers | 
|---|---|---|
| Definition | Reserved words with predefined meanings in Java | User-defined names used for variables, methods, classes, etc. | 
| Purpose | Define the syntax and structure of Java programs | Identify program elements | 
| Can be Modified | No | Yes | 
| Usage as Variable Name | Not allowed | Allowed | 
| Predefined by Java | Yes | No | 
| Examples | int, class, if, return | studentName, calculateSum, Employee | 
| Case Sensitive | Yes | Yes | 
| Compiler Meaning | Fixed meaning | Meaning defined by programmer |

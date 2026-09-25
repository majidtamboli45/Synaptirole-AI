# User

> Source: https://www.geeksforgeeks.org/java/user-defined-custom-exception-in-java/

A user-defined custom exception is an exception class created by the programmer to represent application-specific or business-specific error scenarios.
Examples of User-defined Exception:
- Invalid bank transaction
- Insufficient balance
- Age not eligible for registration
- Invalid login attempt
Problem Without Custom Exceptions
Consider the following example:
public class GFG{
    public static void main(String[] args) {
        int age = 15;
        if (age < 18) {
            System.out.println("Error");
        }
    }
}
Output
Error
Issues with This Approach:
- The error message is unclear
- No meaningful exception is thrown
- Difficult to debug in large applications
- Business logic and error handling are mixed
Solution: Using a User-Defined Custom Exception
Instead of printing vague messages, we can throw a meaningful custom exception.
- This clearly explains the problem
- Improves debugging
- Separates business logic from error handling
throw new InvalidAgeException("Age must be 18 or above");
Custom Exception
A custom exception in Java is an exception defined by the user to handle specific application requirements. These exceptions extend either the Exception class (for checked exceptions) or the RuntimeException class (for unchecked exceptions).
Why Use Java Custom Exceptions?
We use Java custom exception,
- To represent application-specific errors.
- To add clear, descriptive error messages for better debugging.
- To encapsulate business logic errors in a meaningful way.
Types of Custom Exceptions
There are two types of custom exceptions in Java.
- Checked Exceptions: It extends the Exception class. and it must be declared in the throws clause of the method signature.
- Unchecked Exceptions: It extend RuntimeException and are not checked by the compiler, so they don’t need to be declared or handled. They usually represent programming errors or invalid operations.
How to Create a User-Defined Custom Exception
- Create a class extending Exception or RuntimeException
- Provide constructors with custom messages
- (Optional) Add extra fields or methods
Example 1: Checked Custom Exception (Real-World Scenario)
// Custom Checked Exception
class InvalidAgeException extends Exception {
    public InvalidAgeException(String m) {
        super(m);  
    }
}
// Using the Custom Exception
public class Geeks {
    public static void validate(int age) 
      throws InvalidAgeException {
        if (age < 18) {
            throw new InvalidAgeException("Age must be 18 or above.");
        }
        System.out.println("Valid age: " + age);
    }
    public static void main(String[] args) {
        try {
            validate(12);
        } catch (InvalidAgeException e) {
            System.out.println("Caught Exception: " + e.getMessage());
        }
    }
}
Output
Caught Exception: Age must be 18 or above.
Explanation:
- InvalidAgeException is a checked exception
- The validate() method throws the exception if age is invalid
- The exception must be handled in the main() method
- This approach clearly separates validation logic and error handling
Example 2: Unchecked Custom Exception
// Custom Unchecked Exception
class DivideByZeroException extends RuntimeException {
    public DivideByZeroException(String m) {
        super(m);
    } 
}
// Using the Custom Exception
public class Geeks {
    public static void divide(int a, int b) {
        if (b == 0) {
            throw new DivideByZeroException("Division by zero is not allowed.");
        }
        System.out.println("Result: " + (a / b));
    }
    public static void main(String[] args) {
        try {
            divide(10, 0);
        } catch (DivideByZeroException e) {
            System.out.println("Caught Exception: " + e.getMessage());
        }
    }
}
Output
Caught Exception: Division by zero is not allowed.
Explanation:
- DivideByZeroException is an unchecked exception
- The compiler does not force handling
- Used for invalid operations and logic errors
Checked vs Unchecked Custom Exceptions
| Feature | Checked Exception | Unchecked Exception | 
|---|---|---|
| Parent Class | Exception | RuntimeException | 
| Compile-time Check | Yes | No | 
| Mandatory Handling | Yes | No | 
| Use Case | Recoverable errors | Programming errors |

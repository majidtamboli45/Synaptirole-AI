# Null Pointer Exception in Java

> Source: https://www.geeksforgeeks.org/java/null-pointer-exception-in-java/

A NullPointerException (NPE) is a runtime exception in Java that occurs when a program tries to access or use an object reference that has the value null. Since a null reference does not point to any actual object, calling its methods or accessing its fields causes the Java Virtual Machine (JVM) to throw a NullPointerException.
- Can occur while invoking methods, accessing fields, or using arrays.
- Helps identify improper object initialization or missing assignments.
- Can be prevented using null checks or Objects.requireNonNull().
public class Geeks {
  
    public static void main(String[] args) {
      
        // Reference set to null
        String s = null; 
        
        System.out.println(s.length()); 
    }
}
Output:
Exception in thread "main" java.lang.NullPointerException
at Geeks.main(Geeks.java:7)
Explanation: The variable s contains null, so it does not refer to a String object. When s.length() is called, Java cannot invoke the method on a non-existent object and throws NullPointerException.
Common Causes of NullPointerException
A NullPointerException can occur in several common situations:
- Calling a method using a null reference.
- Accessing an instance field through a null reference.
- Accessing an element using a null array reference.
- Using a method result without checking whether it is null.
- Passing null to a method that does not accept null values.
- Using an object returned from a collection, database, or API without checking whether it exists.
How to Avoid NullPointerException
The best way to avoid NullPointerException is to identify where a reference can be null and handle that case before performing an operation on it.
1. Check for null Before Using an Object
The simplest approach is to check whether a reference is null before calling a method or accessing a field.
public class Geeks {
    public static void main(String[] args) {
        String s = null;
        if (s != null) {
            System.out.println(s.length());
        } else {
            System.out.println("String is null");
        }
    }
}
Output
String is null
Explanation: The if condition checks whether s contains a reference to an object. Since s is null, the program does not call length() and instead executes the else block.
2. Validate Method Arguments
If a method does not accept null, validate its arguments before using them.
public class Geeks {
    public static void main(String[] args) {
        try {
            System.out.println(getLength(null));
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }
    public static int getLength(String s) {
        if (s == null) {
            throw new IllegalArgumentException(
                    "The argument cannot be null");
        }
        return s.length();
    }
}
Output
The argument cannot be null
Explanation:The getLength() method checks the argument before calling length(). When null is passed, the method throws an IllegalArgumentException with a meaningful message instead of allowing an NPE to occur.
3. Use Objects.requireNonNull()
Java provides Objects.requireNonNull() to explicitly reject null values.
import java.util.Objects;
public class Geeks {
    public static void main(String[] args) {
        String name = null;
        Objects.requireNonNull(name, "Name cannot be null");
        System.out.println(name.length());
    }
}
Output
Exception in thread "main" java.lang.NullPointerException:
Name cannot be null
Explanation: Objects.requireNonNull() checks whether the reference is null. If it is null, it immediately throws NullPointerException with the specified message. This is useful when null represents an invalid argument or object state and you want the failure to happen at the point where the invalid value enters the program.
4. Use the Ternary Operator
The ternary operator can be used when a simple alternative value is required for a potentially null reference.
public class Geeks {
    public static void main(String[] args) {
        String s = null;
        String result = (s == null) ? "" : s.substring(0, 5);
        System.out.println(result);
        s = "GeeksforGeeks";
        result = (s == null) ? "" : s.substring(0, 5);
        System.out.println(result);
    }
}
Output
Geeks
Explanation: When s is null, the ternary operator returns an empty string instead of calling substring(). When s contains "GeeksforGeeks", the substring() operation is performed safely.
5. Use Optional for Potentially Absent Values
Java 8 introduced the Optional class to represent a value that may or may not be present.
import java.util.Optional;
public class OptionalExample {
    public static void main(String[] args) {
        Optional<String> name = Optional.ofNullable(null);
        System.out.println(name.orElse("Default Name"));
    }
}
Output
Default Name
Explaination: Optional.ofNullable() creates an Optional that can contain a non-null value or be empty when the supplied value is null. 
6. Use Default Values When Appropriate
Sometimes a null value can be replaced with a meaningful default value. 
public class Geeks {
    public static void main(String[] args) {
        String name = null;
        String result = name != null ? name : "Unknown";
        System.out.println(result);
    }
}
Output
Unknown
Explanation: The program checks whether name is null. If it is, "Unknown" is used instead. This approach is useful when the application has a meaningful default value.

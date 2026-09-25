# String vs StringBuilder vs StringBuffer in Java

> Source: https://www.geeksforgeeks.org/java/string-vs-stringbuilder-vs-stringbuffer-in-java/

In Java, strings are widely used to store and manipulate text. However, Java provides three different classes for handling string-related operations, String, StringBuilder, and StringBuffer.
String
A String in Java is an immutable sequence of characters, meaning once a String object is created, it cannot be changed.
public class StringExample{
    
    public static void main(String[] args){
        
        String str = "Hello";
        // creates a new object
        str.concat(" World");
        System.out.println(str); 
    }
}
Output
Hello
Explanation: Here, str.concat(" World") does not modify the original string. Instead, it creates a new String object, and the old one remains unchanged.
StringBuilder
StringBuilder is a mutable sequence of characters introduced in Java 5. It allows modification of the string content without creating new objects
public class Geeks{
    
    public static void main(String[] args){
        
        StringBuilder sb = new StringBuilder("Hello");
        sb.append(" World");
        System.out.println(sb);
    }
}
Output
Hello World
Explanation: In the above example append() method modifies the existing object directly without creating a new one.
StringBuffer
StringBuffer is also a mutable sequence of characters, similar to StringBuilder, but it is thread-safe and synchronized.
public class Geeks{
    
    public static void main(String[] args){
        
        StringBuffer sb = new StringBuffer("Hello");
        sb.append(" World");
        System.out.println(sb);
    }
}
Output
Hello World
Explanation: In the above example append() modifies the existing object safely in a multi-threaded environment.
Use Cases of String, StringBuilder, and StringBuffer
Geeks now you must be wondering when to use which one, do refer below as follows:
- If a string is going to remain constant throughout the program, then use the String class object because a String object is immutable.
- If a string can change (for example: lots of logic and operations in the construction of the string) and will only be accessed from a single thread, using a StringBuilder is good enough.
- If a string can change and will be accessed from multiple threads, use a StringBuffer because StringBuffer is synchronous, so you have thread-safety.
- If you don't want thread-safety than you can also go with StringBuilder class as it is not synchronized.
StringBuilder vs String vs StringBuffer
The table below demonstrates the difference between String, StringBuilder and StringBuffer:
| Features | String | StringBuilder | StringBuffer | 
|---|---|---|---|
| Mutability | Strings are immutable(creates new objects on modification) | StringBuilder are mutable(modifies in place) | StringBuffer are mutable (modifies in place) | 
| Thread-Safe | It is thread-safe | It is not thread-safe | It is thread-safe | 
| Performance | It is slow because it creates an object each time | It is faster (no object creation) | it is slower due to synchronization overhead | 
| use Case | Fixed, unchanging strings | Single-threaded string manipulation | Multi-threaded string manipulation |

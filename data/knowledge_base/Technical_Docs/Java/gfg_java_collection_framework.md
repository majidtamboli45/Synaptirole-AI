# Java Collection Framework Tutorial

> Source: https://www.geeksforgeeks.org/java/java-collection-tutorial/

Java Collection Framework (JCF) is a set of classes and interfaces that provide ready-made data structures to store and manipulate groups of objects efficiently.
- Java provides collection interfaces like List, Set, Map, and Queue, with ready-made classes such as ArrayList, HashSet, HashMap, and PriorityQueue, so you don’t have to write data-handling code from scratch.
- The Collection Framework improves productivity by making code more reusable, maintainable and faster to develop.
Features of Java Collection Framework
- Provides ready-to-use data structures (e.g., ArrayList, HashSet, HashMap).9
- Offers interfaces (Collection, List, Set, Map, Queue) to define standard behaviors.
- Supports dynamic resizing, unlike arrays with a fixed size.
- Includes algorithms (sorting, searching, iteration) via the Collections utility class.
- Improves code reusability and performance by reducing boilerplate code.
Real World Example
Suppose you are managing a library where thousands of books need to be stored, searched and retrieved. Instead of arranging them manually in different shelves every time, you use a catalog system. Similarly, the Java Collection Framework acts as a catalog that organizes and manages objects efficiently.
Example
Java Program to illustrate the use of ArrayList (dynamic array) in the Collection Framework
import java.util.*;  
public class Geeks {
    public static void main(String[] args) {
        
        // Creating a List of Strings using ArrayList (dynamic array)
        List<String> list = new ArrayList<>();
        
        // Adding elements to the ArrayList
        list.add("Java");
        list.add("Python");
        list.add("C++");
        // Printing the elements of the ArrayList
        System.out.println("Programming Languages:");
        
        // Enhanced for-loop to iterate through the list
        for (String lang : list) {
            System.out.println(lang);
        }
    }
}
Output
Programming Languages:
Java
Python
C++
Core Interfaces
The foundation of the Collections Framework is built on interfaces like Collection, List, Set, Queue, Deque and Map.They define the behavior of different collection types and serve as a blueprint for implementations.
List Implementations
Lists represent ordered collections that allow duplicate elements and positional access. They include dynamic arrays, linked structures and legacy classes designed for sequential storage.
Set Implementations
Sets represent collections of unique elements, disallowing duplicates. They provide implementations with different ordering strategies like hashing, insertion order or sorting.
Queue / Deque Implementations
Queues store elements in a FIFO manner, while Deques allow operations at both ends. They are used for scheduling, buffering and producer-consumer applications.
Map Implementations
Maps store data as key-value pairs where keys are unique. Different implementations provide hashing, ordering, reference-based and concurrent behaviors.
Utility and Supporting Classes
Java provides helper classes and interfaces to enhance collection usage. They include Collections, Iterator, Comparator and other tools for iteration and sorting.
Concurrency Collections
Concurrent collections are designed for multi-threaded environments. They ensure thread-safe access without compromising performance.

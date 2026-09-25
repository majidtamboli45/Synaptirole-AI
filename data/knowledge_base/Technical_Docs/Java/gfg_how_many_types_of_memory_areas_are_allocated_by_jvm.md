# How Many Types of Memory Areas are Allocated by JVM?

> Source: https://www.geeksforgeeks.org/java/how-many-types-of-memory-areas-are-allocated-by-jvm/

The Java Virtual Machine (JVM) is responsible for managing memory during the execution of a Java program. To efficiently handle data, objects, method calls, and execution, JVM divides memory into different runtime memory areas, each serving a specific purpose.
public class GFG{
    // Stored in Method Area (Class Area)
    static int staticVar = 100;
    public static void main(String[] args) {
        // Stack Memory (local variables & method calls)
        int localVar = 10;
        // Heap Memory (object creation)
        Student student = new Student("Kadrun", 23);
        // Program Counter Register
        // JVM keeps track of which instruction is executing here
        display(student);
        // Native Method Stack
        // Native method call
        System.gc(); // Calls native code internally
    }
    static void display(Student s) {
        // Stack frame created for this method
        System.out.println(s.name + " - " + s.age);
    }
}
// Stored in Method Area
class Student {
    // Instance variables stored in Heap (inside object)
    String name;
    int age;
    Student(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
Output
Kadrun - 23
Explanation:
- The JVM divides memory into different runtime areas to efficiently manage program execution.
- Each memory area has a specific role, such as storing class data, objects, method calls, or execution instructions.
- Together, these memory areas help the JVM run Java programs smoothly and efficiently.
JVM Memory Areas
The JVM mainly allocates the following five types of memory areas:
1. Class (Method) Area
The Method Area stores class-level information that is loaded by the JVM. This includes class metadata, method details, and static variables, and it is shared among all threads.
- Stores class structure, methods, and static data
- Shared by all threads
- Created once when JVM starts
- Contains Runtime Constant Pool
2. Heap
The Heap Area is the runtime memory where objects and instance variables are stored. It is the largest memory area and is managed by the Garbage Collector.
- Stores objects created using new
- Shared across all threads
- Managed automatically by Garbage Collector
- Memory leaks mainly occur here
3. Stack
The Stack Area stores method execution information for each thread. Every method call creates a stack frame that holds local variables and references.
- Each thread has its own stack
- Stores local variables and method calls
- Memory is freed after method execution
- Faster than heap memory
4. Program Counter Register
The Program Counter Register keeps track of the current instruction being executed by a thread. It helps JVM resume execution after thread switching.
- One PC register per thread
- Stores address of current JVM instruction
- Undefined for native methods
- Supports thread scheduling
5. Native Method Stack
The Native Method Stack stores execution details of native methods written in languages like C or C++. It works alongside the Java Stack.
- Used for native (non-Java) methods
- Thread-specific memory area
- Depends on underlying OS
- Separate from Java Stack

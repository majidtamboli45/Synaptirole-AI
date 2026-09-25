# Java Memory Management

> Source: https://www.geeksforgeeks.org/java/java-memory-management/

Java Memory Management is the process by which the Java Virtual Machine (JVM) allocates and manages memory during program execution. It automatically handles memory allocation and deallocation, reducing the need for manual memory management.
- Prevents memory leaks and reduces manual memory handling.
- Uses Garbage Collection to remove unused objects automatically.
- Divides memory into different runtime areas for efficient execution.
JVM Memory Structure
The JVM divides memory into several runtime data areas. Some areas are common for the entire JVM, while others are created separately for each thread.
Components of JVM Memory Structure
Class Loader
- Loads Java .class files into JVM memory.
- Converts bytecode into a format understandable by JVM.
- Dynamically loads classes when required during execution.
JVM Memory Area
JVM memory is divided into different runtime areas:
Method Area
- Stores class-level information such as metadata, methods, and static variables.
- Shared among all threads.
- Created when JVM starts.
Heap Memory
- Stores objects and instance variables.
- Shared by all threads in the application.
- Garbage Collector removes unused objects from heap memory.
JVM Stacks
- Each thread has its own stack memory.
- Stores local variables, method calls, and partial results.
- Memory is automatically released after method execution.
PC Registers (Program Counter Registers)
- Stores the address of the currently executing instruction.
- Each thread has a separate PC register.
Native Method Stacks
- Stores information for native methods written in languages like C or C++.
- Used when Java interacts with native libraries.
Example: Program to demonstrate how java variables are stored in the different memory areas
import java.io.*;
class Geeks {
  
    // static variables are stored in the Method Area
    static int v = 100;
    // instance variables are stored in the Heap
    int i = 10;
    public void Display()
    {
        // local variables are stored in the Stack
        int s = 20;
        System.out.println(v);
        System.out.println(s);
    }
}
public class Main {
    public static void main(String[] args) {
        Geeks g = new Geeks();
      
        // Calling the Display method
        g.Display();
    }
}
Output
100
20
Note:
- Static variables are stored in the Method Area.
- Instance variables are stored in the Heap.
- Local variables are stored in the stack.
Execution Engine
- Executes the bytecode loaded into memory.
- Converts bytecode into machine-level instructions.
- Includes components like Interpreter and JIT Compiler.
Native Method Interface (JNI)
- Acts as a bridge between Java code and native applications.
- Allows Java programs to call C/C++ libraries.
Native Method Libraries
- Contains native libraries (.dll or.so files).
- Used by JNI for executing native methods.
Example: Understanding JVM Memory Areas
The following program demonstrates the relationship between class-level data, objects, and method execution.
class Geeks {
    static int v = 100;
    int i = 10;
    public void display() {
        int s = 20;
        System.out.println(v);
        System.out.println(i);
        System.out.println(s);
    }
}
public class Main {
    public static void main(String[] args) {
        Geeks g = new Geeks();
        g.display();
    }
}
Output
100
10
20
Explanation
- v is a static field associated with the Geeks class.
- g is a local reference variable in the main() method's stack frame.
- new Geeks() creates a Geeks object, generally on the heap.
- i is an instance field belonging to that object.
- s is a local variable belonging to the display() method's stack frame.
- When display() finishes, its stack frame is removed.
How Memory Is Managed During Program Execution
During execution:
- The Class Loader loads required classes.
- Class metadata is stored in the appropriate runtime area.
- Objects and arrays are allocated in the heap.
- Method calls create stack frames for the executing thread.
- The Execution Engine executes the bytecode.
- The Garbage Collector reclaims memory occupied by unreachable objects.
Heap vs Stack
| Heap | Stack | 
|---|---|
| Stores objects and instance variables. | Stores method calls and local variables. | 
| Larger but slower. | Smaller but faster. | 
| Random access. | LIFO (Last-In-First-Out). | 
| Allocation is manual (using 'new' keyword), but deallocation is automatic. | Allocation and deallocation both are automatic. | 
| Long-lived. | Short-lived (method duration). | 
| Shared among all threads (needs synchronization). | Each thread has its own stack (thread safe). |

# Java Multithreading Tutorial

> Source: https://www.geeksforgeeks.org/java/java-multithreading-tutorial/

Multithreading in Java is a feature that allows multiple tasks to run concurrently within the same program. Instead of executing one task at a time, Java enables parallel execution using lightweight threads. This makes applications more efficient, faster and responsive in real-world scenarios like servers, games and chat systems.
Key Features of Multithreading
- A thread is the smallest unit of execution in Java.
- Threads share the same memory space but run independently.
- Java provides the Thread class and Runnable interface to create threads.
- Multithreading ensures better CPU utilization by executing tasks simultaneously.
- Synchronization is needed to prevent data inconsistency when threads share resources.
Example: Suppose a restaurant kitchen where multiple chefs are working simultaneously on different dishes. This setup ensures faster service and better CPU (chef) utilization, just like threads in Java.
Example: Java Program to illustrate Creation and execution of a thread via start() and run() method in Single inheritance
class MyThread1 extends Thread {
    public void run()
    {
        System.out.println("Thread1 is running");
    }
}
class MyThread2 extends Thread {
    public void run()
    {
        System.out.println("Thread2 is running");
    }
}
class GFG {
    public static void main(String[] args)
    {
        MyThread1 obj1 = new MyThread1();
        MyThread2 obj2 = new MyThread2();
        obj1.start();
        obj2.start();
    }
}
Output
Thread1 is running
Thread2 is running
Introduction to Multithreading
Multithreading allows concurrent execution of two or more parts of a program for maximum CPU usage. It improves application performance and responsiveness.
Processes vs Threads
A process is an independent program in execution, while a thread is a lightweight sub-process. Understanding their differences is key to mastering concurrency.
Thread Class and Runnable Interface
In Java, threads can be created either by extending the Thread class or by implementing the Runnable interface. Both approaches have different use cases.
Thread Lifecycle
A thread passes through different states like New, Runnable, Running, Waiting and Terminated. The lifecycle is managed by the JVM and thread scheduler.
Thread Methods
Java provides built-in methods like start(), run(), sleep() and join() to manage thread execution and control its behavior.
Thread Priorities
Threads can be assigned priorities to influence scheduling decisions. Higher priority threads are given preference by the thread scheduler.
Synchronization
Synchronization ensures that multiple threads do not interfere with each other while accessing shared resources. It helps prevent data inconsistency and race conditions.
Inter-thread Communication
Threads can communicate using methods like wait(), notify() and notifyAll(). This enables coordination between multiple threads.
Deadlock
Deadlock occurs when two or more threads wait indefinitely for resources locked by each other. Java provides techniques to avoid and resolve deadlocks.
Thread Safety
Thread safety ensures correct program execution when multiple threads access shared data. Techniques include synchronized, volatile and ThreadLocal.
Daemon Threads
Daemon threads are background threads that run to support user threads and automatically terminate when all user threads finish execution.
Concurrency Utilities (java.util.concurrent)
The concurrency package provides tools like Executors, Callable, Future and Thread Pools. These simplify managing multithreaded applications.

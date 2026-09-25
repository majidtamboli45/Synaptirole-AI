# JVM Garbage Collectors

> Source: https://www.geeksforgeeks.org/java/types-of-jvm-garbage-collectors-in-java-with-implementation-details/

JVM Garbage Collectors are responsible for automatic memory management in Java. They free unused objects from the heap to prevent memory leaks and improve application performance. This process is handled by the JVM through garbage collection.
public class GFG {
    public static void main(String[] args) {
        String data = new String("Garbage Collection Demo");
        
        // Object becomes eligible for garbage collection
        data = null; 
    }
}
Explanation: When the reference is set to null, the object is no longer reachable and becomes eligible for garbage collection.
Threads in Garbage Collection
1. Controlling Garbage Collection Threads
To control the number of threads used by the garbage collector, we can use multi-threaded collectors like the Parallel Garbage Collector.
Implementation:
java -XX:+UseParallelGC -XX:ParallelGCThreads=NumberOfThreads -jar ApplicationJar.java
2. Limiting GC Pause Time
To limit the maximum pause time during garbage collection, we can use the MaxGCPauseMillis option:
Implementation:
java -XX:+UseParallelGC -XX:MaxGCPauseMillis=SecInMillisecond -jar ApplicationJar.java
Types of Garbage Collectors
1. Serial Garbage Collector
The Serial Garbage Collector is the simplest GC and uses a single thread for all garbage collection tasks. It pauses all application threads during GC and is best suited for small applications or systems with limited memory.
Implementation
java -XX:+UseSerialGC -jar ApplicationJar.java
2. Parallel Garbage Collector
The Parallel Garbage Collector (default in Java 8) uses multiple threads to perform garbage collection, improving throughput. It pauses the application during GC but provides better performance than Serial GC and is ideal for high-throughput applications.
Implementation:
java -XX:+UseParallelGC -jar ApplicationJar.java
3. Concurrent Mark-Sweep Collector
CMS is designed to minimize pause times by performing most GC work concurrently with application threads. It is suitable for low-latency applications like web servers but is deprecated in newer Java versions.
Implementation:
java -XX:+UseParNewGC -jar ApplicationJar.java
4. G1 Garbage Collector
G1 GC divides the heap into multiple regions and collects regions with the most garbage first. It provides predictable pause times, supports large heaps, and became the default GC in Java 9.
Implementation:
java -XX:+UseG1GC -jar ApplicationJar.java
5. Z Garbage Collector:
ZGC is a low-latency garbage collector introduced in Java 11. It handles very large heaps with pause times typically in milliseconds, making it suitable for performance-critical applications.
Implementation:
java-XX:+UseZGC -jar ApplicationJar.java
6. Shenandoah Garbage Collector
Shenandoah, introduced in Java 12, focuses on very low pause times by running garbage collection concurrently with application threads. It is ideal for latency-sensitive systems.
Implementation:
java-XX:+UseShenandoahGC -jar ApplicationJar.java
Garbage Collection JVM Options
JVM Arguments
Here’s a table describing the arguments that can be used to instruct the JVM:
| Option | Description | 
|---|---|
| -Xms<size> | Sets the initial heap size. | 
| -Xmx<size> | Sets the maximum heap size. | 
| -XX:MaxMetaspaceSize=<size> | Sets the maximum metaspace size. | 
| -XX:+HeapDumpOnOutOfMemoryError | Generates a heap dump when an OutOfMemoryError occurs. | 
| -XX:HeapDumpPath=<path> | Specifies the path to save the heap dump file. | 
| -XX:+PrintGCDetails | Prints detailed garbage collection information to the console. | 
| -XX:+UseG1GC | Enables the G1 Garbage Collector (default for most modern JVMs) | 
| -XX:+UseContainerSupport | Optimizes JVM behavior in containerized environments. | 
Garbage Collector Options
Here's a table describing the available garbage collections algorithms and optimization options in the JVM.
| Option | Description | 
|---|---|
| -XX:+UseSerialGC | Enables the Serial Garbage Collector | 
| -XX:+UseParallelGC | Enables the Parallel Garbage Collector | 
| -XX:+UseConcMarkSweepGC | Enables the CMS Garbage Collector | 
| -XX:ParallelCMSThreads=<n> | Sets the number of threads to use | 
| -XX:+UseG1GC | Enables the G1 Garbage Collector | 
| -XX:+UseZGC | Enables the Z Garbage Collector | 
| -XX:+UseShenandoahGC | Enables the Shenandoah Garbage Collector | 
| -XX:ParallelGCThreads=<n> | Sets the number of threads for Parallel and G1 Garbage Collectors. | 
| -XX:G1HeapRegionSize=<size> | Sets the size of regions for G1 Garbage Collector. |

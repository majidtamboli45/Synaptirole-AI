# Marker Interface in Java

> Source: https://www.geeksforgeeks.org/java/marker-interface-in-java/

A Marker Interface in Java is an interface that contains no methods or fields. It is used to mark a class so that the Java runtime or compiler can identify some special behavior or capability of that class.
Syntax:
public interface Serializable { }
Here, Serializable has no methods but if a class implements it, Java knows that objects of that class can be serialized.
Role of Marker Interfaces
Marker interfaces give information to the JVM or compiler about:
- How to treat the object
- What operation is allowed or disallowed
- What special behavior should be applied
They function like a flag for the runtime environment.
//Driver Code Starts
interface Serializable {
  	// Marker Interface
}
//Driver Code Ends
// Define Person class that implements the marker interface
class Person implements Serializable {
    public Person() {
        System.out.println("Person object created");
    }
}
// Define Animal class does not implement marker interface
class Animal {
    public Animal() {
        System.out.println("Animal object created");
    }
}
public class Geeks
{
    public static void main(String[] args) 
    {
        Person person = new Person();
//Driver Code Starts
        Animal animal = new Animal();
        if (person instanceof Serializable)
            System.out.println("Person is serializable");
        else 
            System.out.println("Person is not serializable");
       
        if (animal instanceof Serializable)
            System.out.println("Animal is serializable");
        else
            System.out.println("Animal is not serializable");
    }
}
//Driver Code Ends
Output
Person object created
Animal object created
Person is serializable
Animal is not serializable
Common Marker Interfaces in Java
There are some more real time examples of Marker Interface which are used in real-time applications. Like Cloneable Interface, Serializable interface, etc. Let us check one by one:
1. Cloneable Interface
Cloneable interface is a marker interface in java.lang that allows an object to be cloned using Object.clone(). If a class does not implement Cloneable, calling clone() on its object throws CloneNotSupportedException.
import java.lang.Cloneable;
// Making class A cloneable using cloneable interface
class A implements Cloneable
{
    int i;
  
    // A class constructor
    public A(int i) {
        this.i = i;
    }
    // Overriding clone() method by simply calling Object class clone() method.
    @Override
    protected Object clone() 
      throws CloneNotSupportedException
    {
        return super.clone();
    }
}
public class Geeks
{
    public static void main(String[] args)
        throws CloneNotSupportedException
    {
        A a = new A(20);
        // cloning 'a' and holding new cloned object reference in b
        // down-casting as clone() return type is Object
        A b = (A)a.clone();
        System.out.println(b.i);
    }
}
Output
20
2. Serializable Interface
Serializable interface is present in java.io package. It is used to make an object eligible for saving its state into a file. This is called Serialization. Classes that do not implement serializable will not have their state serialized or deserialized. All subtypes of a serializable class are themselves serializable.
import java.io.*;
class A implements Serializable
{
    int i;
    String s;
    // A class constructor
    public A(int i,String s)
    {
        this.i = i;
        this.s = s;
    }
}
public class Geeks
{
    public static void main(String[] args)
      throws IOException, ClassNotFoundException
    {
        A a = new A(20,"GeeksForGeeks");
        // Serializing 'a'
        FileOutputStream fos = new FileOutputStream("xyz.txt");
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(a);
        // De-serializing 'a'
        FileInputStream fis = new FileInputStream("xyz.txt");
        ObjectInputStream ois = new ObjectInputStream(fis);
        A b = (A)ois.readObject(); // down-casting object
        System.out.println(b.i+" "+b.s);
        // closing streams
        oos.close();
        ois.close();
    }
}
Output
20 GeeksForGeeks
3. Remote Interface
Remote interface (in java.rmi) is a marker interface that identifies objects whose methods can be invoked remotely from another JVM. Any class implementing Remote is eligible to be used in Java RMI, allowing distributed communication between systems.
import java.rmi.Remote;
import java.rmi.RemoteException;
// Remote interface must extend Remote
public interface Hello extends Remote{
    
    String sayHello() throws RemoteException;
}
Explanation: Extending Remote marks the interface as eligible for remote invocation. Each remote method must declare throws RemoteException.

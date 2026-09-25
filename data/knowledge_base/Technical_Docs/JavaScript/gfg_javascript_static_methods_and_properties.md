# JavaScript Static Methods and Properties

> Source: https://www.geeksforgeeks.org/javascript/js-static-methods/

JavaScript Static Methods and Properties are defined on a class itself rather than its instances, and are accessed using the class name. They are commonly used for utility functions or shared data that doesn’t depend on object instances.
- Declared using the static keyword inside a class.
- Accessed using the class name, not object instances.
- Useful for utility functions and shared class-level data.
Syntax
class ClassName {
static methodName() {
// method logic
}
}
class MathUtils {
    static add(a, b) {
        return a + b;
    }
    static multiply(a, b) {
        return a * b;
    }
}
// Calling static methods on the class
console.log(MathUtils.add(5, 3));
console.log(MathUtils.multiply(4, 6));
Here, the add and multiply methods can be called directly on the MathUtils class, without creating an instance.
Characteristics of Static Methods
- Class-Based: Static methods are invoked on the class itself, not on instances of the class.
- No Access to Instance Properties: Static methods have access to this, but it refers to the class itself, not an instance or instance-specific properties.
- Common Use Cases: Utility functions (e.g., mathematical operations, string manipulations), Factory methods for object creation, Shared logic that doesn’t depend on individual objects.
Use cases of Static Methods
1. Static Method Counter
Static methods can be used to manage class-level state, such as a counter, without creating individual instances.
class Count {
    static c = 0;
    static inc() {
        return ++Count.c;
    }
    
    static reset() {
        Count.c = 0;
    }
}
console.log(Count.inc()); 
console.log(Count.inc()); 
Count.reset();
console.log(Count.inc()); 
The Count class has a static property c, which keeps track of the number of times the inc() method is called. The reset() method allows resetting the counter.
2. Static Method Factory Pattern
Static methods can serve as factory methods to create instances of a class, simplifying object creation and initialization.
class User {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    static createUser(name, age) {
        return new User(name, age);
    }
}
const user = User.createUser('Ajay', 30);
console.log(user);
The createUser() static method is a factory method that returns a new instance of the User class.
3. Static Method Singleton Pattern
Static methods can be used to implement design patterns like the Singleton, where only one instance of the class is allowed.
class DB{
    static instance
    constructor()
    {
        if(DB.instance)
        {
            return DB.instance
        }
        DB.instance=this
    }
  static  getInstance()
    {
        if(!DB.instance)
        {
            DB.instance=new DB()
        }
        return DB.instance
    }
}
const obj1=new DB()
const obj2=new DB()
console.log(obj1===obj2)
In the DB class, the getInstance() method ensures that only one instance of the class is created. If an instance already exists, it returns the existing one. This is an implementation of the Singleton pattern, ensuring a single point of access to the class.
Static Properties
Static properties are variables that are attached to the class itself rather than to objects created from the class. This means all instances of the class share the same static property.
class Children {
    static ID = 1;
    constructor(name, age) {
        this.name = name;
        this.age = age;
        this.id = Children.ID++;
    }
}
let child1 = new Children("Emma", 11);
let child2 = new Children("James", 19);
let child3 = new Children("John", 9);
console.log(child1.id);
console.log(child2.id);
console.log(child3.id);
Here ID is a static property. It is used to assign a unique ID to each child object. Each time a new Children object is created, the ID property is incremented.
Accessing Static Properties and Methods
To access a static method or property, you use the class name itself, not an instance of the class:
console.log(Children.ID); // Accessing the static property
Children.sortByAge(child1, child2); // Accessing the static method

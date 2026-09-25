# Object Oriented Programming in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/introduction-object-oriented-programming-javascript/

Object-Oriented Programming (OOP) in JavaScript is a programming paradigm based on the concept of objects that contain data (properties) and behavior (methods). It focuses on designing software that closely represents real-world entities. It is used to:
- Improves code reusability
- Enhances maintainability and scalability
- Makes programs easier to understand and manage
- Closely models real-world entities
// Creating a class
class Student {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    displayInfo() {
        console.log("Name:", this.name);
        console.log("Age:", this.age);
    }
}
// Creating an object
const student1 = new Student("Rahul", 20);
// Calling method
student1.displayInfo();
Characteristics of OOP
The diagram below demonstrates the JavaScript OOP Concepts.
Class
A Class in JavaScript is a blueprint or template used to create objects. It defines the properties (data) and behaviors (methods) that objects of that class will have.
- A class is a user-defined blueprint for creating objects.
- It contains properties and methods.
- Multiple objects can be created from a single class.
Example: A Car represents a class (blueprint), while BMW, Mercedes, and Audi represent objects (instances) created from that class.
Object
An Object in JavaScript is an instance of a class that represents a real-world entity. It is used to access the properties and methods defined inside a class.
- State: Represents the current data or attributes of an object.
- Behavior: Represents the actions that an object can perform.
- Identity: Every object has a unique identity in memory that distinguishes it from other objects.
Example: Dog is a class, Tommy is an object of that class.
Abstraction
Abstraction in JavaScript is the process of hiding implementation details and showing only the essential features of an object. It helps users focus on what an object does rather than how it does it.
- Hides complexity from the user.
- Improves maintainability.
- Enhances flexibility and modularity.
Example: An ATM or a coffee machine represents abstraction, where the user interacts with simple operations while the internal implementation details remain hidden.
How to Achieve Abstraction
It is achieved in JavaScript using classes, closures, modules, and private fields.
- Classes provide a structured way to hide implementation details.
- Closures can restrict direct access to variables.
- Private fields (#) hide internal data from external access.
Encapsulation
Encapsulation is the process of wrapping data and methods into a single unit and restricting direct access to the data. It acts as a protective shield that prevents data from being accessed directly from outside the object.
- Data can be hidden using private fields (#).
- Access to data is provided through public methods.
- It improves data security, maintainability, and controlled access.
Inheritance
Inheritance is a core OOP concept in JavaScript that allows one class to acquire the properties and methods of another class using the extends keyword. It represents an "is-a" relationship between classes.
- The class being inherited is called the parent class, and the inheriting class is the child class.
- A child class can use existing features of the parent class and also add its own.
- Inheritance promotes code reusability and reduces redundancy.
Example: Dog, Cat, and Cow can be derived classes of the Animal parent class.
Types of Inheritance
JavaScript supports the following types of inheritance:
- Single Inheritance: One child class inherits from one parent class.
- Multilevel Inheritance: A class is derived from another derived class, forming a chain.
- Hierarchical Inheritance: Multiple child classes inherit from a single parent class.
- Multiple Inheritance (through Mixins): JavaScript does not directly support multiple inheritance using classes, but similar behavior can be achieved through mixins.
- Hybrid Inheritance (through Mixins): A combination of two or more inheritance types achieved using mixins.
Polymorphism
Polymorphism means "many forms", where a single entity can behave differently in different situations. In JavaScript, it allows the same method or object to show different behavior based on context.
- Same method, different behavior depending on the object.
- Achieved through method overriding.
- Supports flexibility and extensibility.
Example: Different animals represent polymorphism, where the same method speak() produces different outputs like Bark, Meow, and Moo depending on the object.
Types of Polymorphism
Polymorphism in JavaScript is mainly of the following types:
- Runtime Polymorphism (Method Overriding): Achieved when a child class provides its own implementation of a method already defined in its parent class. The method call is resolved at runtime based on the object.
- Pseudo Compile-Time Polymorphism: JavaScript does not support true method overloading like Java. Similar functionality can be achieved using default parameters, optional parameters, or rest parameters.
Association
Association is an OOP concept that defines a relationship between two or more objects that are connected to each other. It represents how objects interact with each other and communicate. In association, objects of one class are related to objects of another class, but they can exist independently.
- Represents a relationship between objects.
- Does not imply ownership.
- Objects are independent of each other.
Types of Association
Association in JavaScript can be further classified into the following types:
1. Aggregation (Weak Association)
Aggregation represents a "has-a" relationship where one object contains a reference to another object, but both can exist independently.
Example: A Company has Employees, but employees can exist independently even if the company no longer exists.
2. Composition (Strong Association)
Composition is a strong form of association where one object owns another object. If the parent object is destroyed, the child object also gets destroyed.
Example: A House is composed of Rooms, and if the house is destroyed, the rooms cannot exist independently.
Advantages of OOP
Object-Oriented Programming (OOP) offers several key advantages over procedural programming:
- Code reusability: Classes and objects allow reuse of existing code, reducing duplication and improving efficiency.
- Better structure and maintainability: Programs are organized into logical units, making code easier to understand, debug, and maintain.
- Supports DRY principle: Common functionality is written once and reused, leading to cleaner and more maintainable code.
- Faster development: Modular and reusable components help in quicker and scalable application development.

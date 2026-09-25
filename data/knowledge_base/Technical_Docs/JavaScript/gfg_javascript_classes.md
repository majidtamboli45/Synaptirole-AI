# JavaScript Classes

> Source: https://www.geeksforgeeks.org/javascript/javascript-classes/

A JavaScript class is a blueprint for creating objects. It allows developers to define properties and methods in a single structure, making code more organized, reusable, and easier to maintain.
- Introduced in ES6, classes provide a structured way to create objects with shared properties and methods.
- They support object-oriented programming concepts such as inheritance, encapsulation, and modularity.
Syntax
class ClassName {
    constructor() {
        // Initialize properties here
    }
    // Define methods here
    methodName() {
        // Method code
    }
}
- The class keyword is used to declare a class.
- The constructor() method is a special method that is automatically called when an instance of the class is created.
- You can define methods inside the class to provide behaviour for objects created from the class.
Key Features of JavaScript Classes
- Encapsulation: Bundles data (properties) and behaviour (methods) together.
- Constructor Method: Initializes properties when an object is created.
- Inheritance: Allows one class to inherit properties and methods from another.
- Code Reusability: Enables the creation of multiple instances with shared functionality.
- Simplicity & Clarity: Provides a clear structure for creating and managing objects.
Creating a Simple Class
A basic class that defines properties and methods. This example shows how to create an object with a constructor and method.
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    g() {
        console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
    }
}
let p1 = new Person("Pranjal", 20);
p1.g();
- The Person class has a constructor to set name and age, and a g method to log a greeting message.
- An instance (p1) is created with new, passing "Pranjal" and 20, then calls g to print the greeting.
Constructor to Initialize Objects
The constructor is used to initialize the properties of the object when an instance is created.
class Car {
    constructor(make, model, year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }
    d() {
        console.log(`${this.year} ${this.make} ${this.model}`);
    }
}
let my = new Car("Toyota", "Corolla", 2021);
my.d();
- The Car class has a constructor to initialize make, model, and year, and a d method to log the car's details.
- An instance (my) is created with new, passing "Toyota", "Corolla", and 2021, then calls d to print the car's information.
Inheritance in Classes
Inheritance allows one class to extend another, inheriting its properties and methods while adding or overriding functionality.
class Car {
    constructor(make, model, year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }
    di() {
        console.log(`${this.year} ${this.make} ${this.model}`);
    }
}
class ElectricCar extends Car {
    constructor(make, model, year, batteryLife) {
        super(make, model, year);
        this.batteryLife = batteryLife;
    }
    d() {
        console.log(`Battery life: ${this.batteryLife} hours`);
    }
}
let tesla = new ElectricCar("Tesla", "Model S", 2022, 24);
tesla.di()
tesla.d();
- ElectricCar inherits from Car, using super to set properties and adds batteryLife and d method.
- An instance (tesla) calls both di to display car details and d to show battery life.
Creating Multiple Objects from a Class
Using classes to create multiple objects with the same structure but different data.
class Car {
    constructor(make, model, year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }
    d() {
        console.log(`${this.year} ${this.make} ${this.model}`);
    }
}
let c1 = new Car("Toyota", "Corolla", 2021);
let c2 = new Car("Honda", "Civic", 2020);
c1.d();
c2.d(); 
- The Car class initializes car details and has a d method to display them.
- Two Car instances (c1 and c2) are created, and d is called on both to show their details.

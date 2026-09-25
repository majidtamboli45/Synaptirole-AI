# JavaScript Prototype

> Source: https://www.geeksforgeeks.org/javascript/js-prototype/

JavaScript uses a prototype-based object model where objects inherit properties and behavior from other objects.
- Functions, arrays, and strings are specialized objects.
- Inheritance is handled through prototypes rather than classes.
- Prototypes define how objects share properties and methods.
Prototype in JavaScript
In JavaScript, a prototype acts as a shared blueprint that stores common methods and properties for objects of the same type.
- Properties and methods added to a prototype are shared across all instances.
- This mechanism helps optimize memory usage and enables inheritance.
Object.prototype.print = function () {
    console.log('I am from object prototype')
}
let b = {
    name: 'Pranjal',
    age: 21
}
b.print()
- Most objects have a prototype, but objects created with Object.create(null) do not.
- Adding a method or property to an object’s prototype makes it accessible to all its instances.
- The print() method is added to Object.prototype, so any object (like b) can use it.
- Using prototypes avoids code duplication by defining shared methods once, making the code more efficient.
Working of Prototype in JavaScript
- Every JavaScript object has an internal [[Prototype]] that enables inheritance.
- When a property is accessed, JavaScript first checks the object itself, then looks up the prototype chain until the property is found or reaches null.
- Functions have a prototype property, which is used when they are called as constructors with the new keyword.
- Objects created using a constructor inherit properties and methods from the constructor’s prototype.
- Since all instances share the same prototype, methods are not duplicated, improving memory efficiency.
- Any update to a prototype is reflected in all existing and future instances.
Creating Constructor Functions
A constructor function in JavaScript is used to create and initialize objects using the new keyword.
- It defines properties and methods for the object.
- Allows creation of multiple object instances.
- Enables shared behavior through prototypes.
function Person(name) {
    this.name = name;
}
Person.prototype.sayHello = function () {
    console.log(`Hello, my name is ${this.name}.`);
};
const n = new Person("Sheema");
n.sayHello();
- Person is a constructor function that initializes objects using the name argument and this.
- The sayHello method is added to Person.prototype, making it available to all instances.
- new Person("Sheema") creates a new object with name set to "Sheema".
- Calling sayHello() prints "Hello, my name is Sheema."
Adding method to Prototype
Adding a method to a prototype allows all instances of an object to share the same functionality.
- The method is defined once on the prototype.
- All existing and future instances can access it.
let a1 = [1, 2, 3, 4, 5]
let a2 = [5, 6, 7, 8, 9]
Array.prototype.sum = function () {
    let sum = 0
    for (let i = 0; i < this.length; i++) {
        sum += this[i]
    }
    return sum
}
console.log(a1.sum())
console.log(a2.sum())
- The sum method is added to Array.prototype, making it available to all arrays.
- this refers to the array being processed inside the method.
- Calling sum() on a1 and a2 returns 15 and 35 respectively.
Prototype Inheritance
Prototype inheritance is a JavaScript mechanism where objects inherit properties and methods from other objects through the prototype chain.
- Enables shared behavior without duplicating code.
- Uses prototypes to link objects for inheritance.
function Animal(name) {
    this.name = name;
}
Animal.prototype.speak = function () {
    console.log(`${this.name} makes a noise.`);
};
function Dog(name) {
    Animal.call(this, name); // Call the parent constructor
}
Dog.prototype = Object.create(Animal.prototype); // Set up inheritance
Dog.prototype.constructor = Dog;
Dog.prototype.speak = function () {
    console.log(`${this.name} barks.`);
};
const dog = new Dog('Rex');
dog.speak(); // Rex barks.
- Animal is the parent class with a method speak.
- Dog is the child class, which inherits from Animal and overrides the speak method.
- Object.create(Animal.prototype) sets up inheritance so Dog can access Animal methods.
Advanced Prototype Use Cases
1. Extending Built-in Objects
JavaScript allows extending built-in objects by adding custom methods to their prototypes.
- Add custom methods to built-in objects such as Array and String.
- Makes new functionality available to all instances.
Array.prototype.first = function () {
    return this[0];
};
const arr = [10, 20, 30];
console.log(arr.first());
- The first() method is added to Array.prototype.
- All arrays can access this method.
- arr.first() returns the first element of the array.
2. Shared Methods for Performance Optimization
Using prototypes helps optimize JavaScript performance by sharing methods across object instance.
- Methods are defined once on the prototype, not per instance
- Reduces memory usage and improves efficiency
function Person(name, age) {
    this.name = name;
    this.age = age;
}
Person.prototype.introduce = function () {
    return `Hello, my name is ${this.name} and I am ${this.age} years old.`;
};
const person1 = new Person('Pranjal', 25);
const person2 = new Person('Ayaan', 30);
console.log(person1.introduce());
console.log(person2.introduce());
- The introduce method is added to Person.prototype, so all instances share it.
- The method is stored only once in the prototype, reducing memory usage.
- Both person1 and person2 use the same introduce method instance.
- Through the prototype chain, all Person objects inherit the same functionality.
3. Dynamic Method Assignment
Dynamic method assignment in JavaScript lets you add or update methods on objects or prototypes while the program is running.
- Methods can be added to objects or prototypes at runtime.
- Existing methods can be modified without redefining the object.
- Helps extend or change behavior dynamically as needed.
function Person(name, age) {
    this.name = name;
    this.age = age;
}
const person1 = new Person('Pranshi', 25);
person1.introduce = function () {
    return `Hi, I am ${this.name} and I am ${this.age} years old.`;
};
console.log(person1.introduce()); 
- The introduce is dynamically added to person1 after creation to extend its behavior.
- Methods can be customized per object without changing the constructor.
- The method exists only on person1, not other Person instances.
- Since it’s not on the prototype, other objects don’t inherit it.
Advantages of Prototypes
- Memory Efficiency: Shared methods avoid duplication across objects.
- Inheritance Support: Objects inherit properties and methods via prototypes.
- Flexibility: Methods and properties can be added or changed at runtime.
- Performance Optimization: Shared methods improve performance with many objects.
- Code Reusability: Common logic is reused, keeping code clean and maintainable.
Prototype chain in JavaScript
The prototype chain is a sequence of linked prototypes through which objects inherit properties and methods.
- JavaScript searches the object first, then its prototype, and continues up the chain until the property is found or null is reached.
- Functions, arrays, and strings inherit shared behavior through the prototype chain.
let o = {
    name: "Pranjal",
    age: 21
}
let a = [1, 2, 3, 4, 5]
let s = "Hello GFG"
function p() {
    console.log('My name is xyzabc')
}
Object.prototype.common = function () {
    console.log('I am a shared method from prototype')
}
o.common()
a.common()
s.common()
p.common()

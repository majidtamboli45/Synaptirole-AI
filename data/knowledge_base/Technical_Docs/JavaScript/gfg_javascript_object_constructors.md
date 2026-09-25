# JavaScript Object Constructors

> Source: https://www.geeksforgeeks.org/javascript/javascript-object-constructors/

An object in JavaScript is a collection of related data and functionality stored as key–value pairs, where values can be variables or functions (methods).
- Objects group related properties and behaviors into a single structure.
- JS has primitive and non-primitive types; objects are non-primitive.
const GFG = {
subject : "programming",
language : "JavaScript",
}
- GFG is an object created using object literal syntax.
- subject is a key with the value "programming".
- language is a key with the value "JavaScript".
- Each key–value pair represents a property of the GFG object.
Object Constructor
A constructor function in JavaScript is a special function used with the new keyword to create and initialize objects of a specific type, allowing multiple instances with similar structure but unique properties.
- Used with the new keyword to create object instances.
- Initializes object properties and methods.
- Helps create multiple objects of the same type efficiently.
- Each instance has its own separate data while sharing the same blueprint.
//Driver Code Starts
// Constructor function
//Driver Code Ends
function Person(name, age) {
    this.name = name;
    this.age = age;
    this.sayHello = function() {
        console.log(`My name is ${this.name} and I am ${this.age} years old.`);
    };
}
//Driver Code Starts
//Creating Instances with a Constructor
const p1 = new Person("Akash", 30);
const p2 = new Person("Anvesh", 25);
p1.sayHello();
p2.sayHello();
//Driver Code Ends
this keyword
The this keyword inside a constructor function refers to the newly created object instance. It is used to initialize the properties and methods of that object.
-  Inside a constructor, this refers to the newly created object.
- It is used to initialize object properties and methods.
- Its value depends on how the function is called.
Adding Properties in a Constructor Function
Here, subject is the property and "JavaScript" is its value, and properties in a constructor must be defined inside the constructor itself.
- subject acts as the key, while "JavaScript" is the assigned value.
- New properties can be added dynamically, but defining them inside the constructor is recommended
function GFG(a, b, c) {
this.A = a;
this.B = b;
this.C = c;
this.G = "GEEK";
}
Here, we add a property name G with value "GEEK", in this case the value "GEEK" is not passed as an argument.
Adding a Method to an Object
We can add a new method to an existing object.
GFG.n = function () {
return this.A + this.B;
};
Here, the object is GFG.
Adding a Method to Constructor
function GFG(a, b, c) {
this.A = a;
this.B = b;
this.C = c;
this.n = function () {
return this.A + this.B;
}
}
Here, in the last line a method is added to an object.
Instantiating an object constructor
There are two ways to instantiate object constructor,
function Person(name, age) {
this.name = name;
this.age = age;
}
const person1 = new Person("John", 25);
const person2 = new Person("Alice", 30);
- new Person() creates a new object instance.
- The constructor initializes the object's properties using the provided arguments.
- Multiple objects can be created from the same constructor with different values.
Note: Objects can also be created using object literals ({}) or the built-in Object() constructor, but these are different from creating objects using a custom constructor function.
Assigning properties to the objects: There are two ways to assign properties to the objects.
- Using dot (.) operator:
object_name.properties = value;
- Using square bracket:
object_name [ 'properties'] = value;
Example 1: Object creation by using new keyword and assigning properties to the object using dot(.) operator.
let gfg = new Object();
gfg.a = "JavaScript";
gfg.b = "GeeksforGeeks";
//Driver Code Starts
console.log("Subject: " + gfg.a);
console.log("Author: " + gfg.b );
//Driver Code Ends
Example 2: Object creation using curly braces and assigning properties to the object using third bracket "[]" operator.
let gfg = { };
gfg['a'] = "JavaScript";
gfg['b']= "GeeksforGeeks";
//Driver Code Starts
console.log("Subject: " + gfg.a);
console.log("Author: " + gfg.b );
//Driver Code Ends
Example 3: Adding Methods in a Constructor Function
function Car(brand, model) {
    this.brand = brand;
    this.model = model;
    this.getDetails = function () {
        return `${this.brand} ${this.model}`;
    };
}
//Driver Code Starts
const car1 = new Car("Toyota", "Camry");
console.log(car1.getDetails()); 
//Driver Code Ends

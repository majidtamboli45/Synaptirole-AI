# Constructor in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/what-is-a-constructor-in-javascript/

A constructor in JavaScript is a special function used to create and initialize objects. It defines how an object’s properties are set when a new instance is created. Constructors make object creation more efficient and structured.
- Automatically executes when a new object is created.
- Used to initialize object properties with given values.
- Defined using the constructor() keyword inside a class.
- Helps in creating multiple objects with similar structures easily.
function createUser(name) {
  return { name, greet() { console.log(`Hello, ${this.name}`); } };
}
const user = createUser("Alice");
user.greet(); 
Syntax
function User(name, age) {
this.name = name;
this.age = age;
}
where,
- User: Name of the constructor function.
- name ,age: Parameters passed when creating an object.
- this.name ,this.age: Properties assigned to the new object instance.
Use of the new Keyword to Create Object Instances
To create an object using a function constructor, we follow these steps:
- Define a function that acts as a constructor.
- Use the this keyword inside the constructor to set properties and methods.
- Use the new keyword to create an instance of the object.
When we use the new keyword, JavaScript creates a new object, sets its prototype to the constructor's prototype. After that it assigns this to the new object.
function Person(name, age) {
    this.name = name;
    this.age = age;
    this.greet = function () {
        return `Hello, my name is ${this.name} and I am ${this.age} years old.`;
    };
}
const person1 = new Person('Alice', 30);
console.log(person1.greet());
Output
Hello, my name is Alice and I am 30 years old.
Syntax:
function ConstructorName(parameter1, parameter2) {
this.property1 = parameter1;
this.property2 = parameter2;
// Additional properties or methods
}
This Keyword in Constructors
- In JavaScript, the 'this' keyword inside a constructor refers to the object that is being created by the constructor.
- It help us to set properties and methods for that object.
- The this keyword is automatically bound to the new object that is created when using the new keyword.
- When a constructor is called with the new keyword, this becomes a reference to the new object.
- We can use it to set properties and define methods that the object will have.
function Car(brand, model) {
    this.brand = brand;
    this.model = model;
    this.getDetails = function () {
        return `Car: ${this.brand} ${this.model}`;
    };
}
const car1 = new Car('Toyota', 'Corolla');
console.log(car1.getDetails());
Output
Car: Toyota Corolla
Built-in and Custom Constructors in JavaScript
JavaScript provides built-in constructors like Array(), Date(), and Object(). These constructors create instances of built-in object types. We can also create custom constructors to define our own object types.
Built-in Constructor
Built-in constructors are predefined functions in JavaScript that help us to create instances of native objects.
Example: Here, Array() and Date() are built-in constructors that create an array and a date object, respectively.
const myArray = new Array(1, 2, 3);
console.log(myArray); 
const myDate = new Date();
console.log(myDate); 
Output
[ 1, 2, 3 ]
2024-09-23T11:29:12.062Z
Creating Custom Constructors
Custom constructors allow us to define our own object types with specific properties and methods. They can also be written using JavaScript Constructor method patterns like default parameter values and prototype-based methods.
Example: In this example, the Book constructor creates a custom object with title and author properties.
function Book(title, author) {
    this.title = title;
    this.author = author;
}
const book1 = new Book('1984', 'George Orwell');
console.log(book1);
Output
Book { title: '1984', author: 'George Orwell' }
Classes and constructor() in ES6
- ES6 introduced the class keyword, which provides a clearer and more concise syntax for creating objects and deals with inheritance.
- The constructor() method inside a class is used to initialize object properties.
- In ES6, we define a constructor using the constructor() method inside a class.
- This method is automatically called when a new instance of the class is created.
Example: In this example, Person is a class, and the constructor() method initializes the name and age properties.
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    greet() {
        return `Hello, I am ${this.name} and I am ${this.age} years old.`;
    }
}
const person2 = new Person('Bob', 25);
console.log(person2.greet());
Output
Hello, I am Bob and I am 25 years old.
Constructor vs Factory Functions
Constructors are used to create objects using the new keyword while factory functions are regular functions that return an object without using new keyword. Factory functions can also include private variables and additional logic, improving security and modularity, and since they don't rely on prototypes, they are simpler to understand and modify.
Key Differences:
- Constructor Functions: Use new to create an object and set this to the new object. They are typically used for creating instances of a particular type.
- Factory Functions: Return an object directly without using new . They provide greater flexibility and don't require thenew keyword.
Example: Here, create Car is a factory function that returns a new object without using new.
function createCar(brand, model) {
    return {
        brand: brand,
        model: model,
        getDetails: function() {
            return `${this.brand} ${this.model}`;
        }
    };
}
const car3 = createCar('Ford', 'Mustang');
console.log(car3.getDetails()); // Output: Ford Mustang
Output
Ford Mustang
Common Mistakes with Constructors
Common mistakes that developers often make when working with constructors:
Forgetting the new Keyword
- One of the most frequent mistakes is forgetting to use the new keyword when creating an object with a constructor function.
- When we omit new, the constructor function doesn't behave as expected.
- Instead of creating a new object, the this keyword inside the function refers to the global object (or undefined in strict mode), which can cause unexpected results and bugs in our code.
Example: In this example, because we forgot the new keyword, Phone() does not create a new object. Instead, this.brand refers to the global object, and myPhone ends up being undefined. This can lead to unexpected behavior, as the global object is modified unintentionally.
function Phone(brand, model) {
    this.brand = brand;
    this.model = model;
}
const myPhone = Phone('Apple', 'iPhone 13');
console.log(myPhone);
console.log(window.brand);
// `brand` property is now
// set on the global object instead of a new object.
Correction: Here, we use the new keyword to correctly create a new Phone object. Now, myPhone is an instance of the Phone constructor, with its own brand and model properties.
function Phone(brand, model) {
    this.brand = brand;
    this.model = model;
}
const myPhone = new Phone('Apple', 'iPhone 13');
console.log(myPhone);
Output
Phone { brand: 'Apple', model: 'iPhone 13' }
Misplacing Methods Inside the Constructor
Another common mistake is defining methods inside the constructor function instead of using the prototype. This can lead to memory inefficiency, as each instance will have its own copy of the method.
Example: In this case, the greet method is redefined for every instance of Person, leading to unnecessary duplication of the same function.
function Person(name) {
    this.name = name;
    this.greet = function () {
        return `Hello, my name is ${this.name}`;
    };
}
const person1 = new Person('Alice');
const person2 = new Person('Bob');
console.log(person1.greet === person2.greet); 
Output
false
Correction: By using the prototype, both instances share the same greet method, making our code more efficient.
function Person(name) {
    this.name = name;
}
Person.prototype.greet = function () {
    return `Hello, my name is ${this.name}`;
};
const person1 = new Person('Alice');
const person2 = new Person('Bob');
console.log(person1.greet === person2.greet); 
Output
true
Incorrect Use of Arrow Functions as Constructor Methods
Arrow functions do not have their own this binding, so using them as methods inside a constructor can lead to unexpected results.
Example: In this example, the getBrand method is defined using an arrow function, so this.brand does not refer to the Car instance. Instead, it refers to the surrounding lexical context, which in this case is likely the global object.
function Car(brand) {
    this.brand = brand;
    this.getBrand = () => {
        return this.brand;
    };
}
const car1 = new Car('Toyota');
console.log(car1.getBrand()); 
Output
Toyota
Correction: By using a regular function, this correctly refers to the instance of the Car object.
function Car(brand) {
    this.brand = brand;
    this.getBrand = function () {
        return this.brand;
    };
}
const car1 = new Car('Toyota');
console.log(car1.getBrand()); 
Output
Toyota

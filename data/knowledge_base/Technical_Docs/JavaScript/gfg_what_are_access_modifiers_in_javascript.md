# What Are Access Modifiers In JavaScript ?

> Source: https://www.geeksforgeeks.org/javascript/what-are-access-modifiers-in-javascript/

Access modifiers in JavaScript play a significant role in controlling the visibility and accessibility of class members. Although JavaScript is not traditionally an object-oriented programming (OOP) language, the introduction of classes and access modifiers in ECMAScript 6 (ES6) allowed developers to implement OOP principles into their applications.
Purpose of Access Modifiers
- The main purpose of access modifiers is to control and restrict access to members of a class. This encapsulation ensures data integrity, security, and helps adhere to the principle of least privilege.
- Access modifiers also improve code maintainability and collaboration between team members. By explicitly defining who can access and modify class members, you minimize unexpected side effects and improve code clarity.
Types of Access Modifiers
- Public (default)
- Private
- Protected
Note: JavaScript does not have specific keywords for access modifiers like public, private, and protected in the same way that languages like Java or C# do. However, it provides mechanisms to simulate access control.
Public Access Modifier
Members marked as public can be accessed from anywhere. Public members are the default in JavaScript classes. They are accessible in and out of the classroom. For example, methods marked as public can be called from anywhere in your code.
Example:
class Person {
    constructor(name) {
        this.name = name; // Public member
    }
    introduce() {
        console.log(`Hello, my name is ${this.name}.`);
    }
}
const person = new Person('Alice');
person.introduce(); // Accessing a public method
console.log(person.name); // Accessing a public property
Output
Hello, my name is Alice.
Alice
Explanation: In the public access modifier example, a Person class is defined with a public member called name. Public members are directly accessible outside the class. The introduce method allows for the public property name to be accessed and displayed. An instance of the Person class is created, and both public methods and properties are accessed, demonstrating the concept of public access.
Private Access Modifier
Members marked as private are only accessible within the class itself. Private members are marked with the # symbol. These members are only accessible from within the class itself. They are invisible to external code. Private members provide encapsulation and ensure that the internals of a class remain hidden.
Example:
class Person {
    #name; // Private member
    constructor(name) {
        this.#name = name;
    }
    #sayHello() {
        console.log(`Hello, my name is ${this.#name}.`);
    }
    introduce() {
        // Accessing a private method
        this.#sayHello();
    }
}
const person = new Person('Bob');
// Accessing a public method that 
// accesses a private method
person.introduce();
// Error: Private member is not accessible
console.log(person.#name);
Output:
ERROR!
console.log(person.#name);
^
SyntaxError: Private field '#name' must be declared in an enclosing class
at wrapSafe (node:internal/modules/cjs/loader:1662:18)
at Module._compile (node:internal/modules/cjs/loader:1704:20)
at Object..js (node:internal/modules/cjs/loader:1895:10)
at Module.load (node:internal/modules/cjs/loader:1465:32)
at Function._load (node:internal/modules/cjs/loader:1282:12)
at TracingChannel.traceSync (node:diagnostics_channel:322:14)
at wrapModuleLoad (node:internal/modules/cjs/loader:235:24)
at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:171:5)
at node:internal/main/run_main_module:36:49
Explanation: In the private access modifier example, a Person class is defined with a private member #name. Private members are indicated by the # symbol and are not accessible from outside the class. The class also contains a private method #sayHello, which is invoked within the introduce method. Attempting to access the private property #name from outside the class results in an error, illustrating the private access modifier.
Protected Access Modifier
Members marked as protected are accessible within the class and its subclasses. Members marked as protected are accessible within the class and its subclasses. You can use the protected keyword to define protected members. These members maintain a level of encapsulation while allowing access to subclasses.
Example:
class Vehicle {
    constructor(speed) {
        if (this.constructor === Vehicle) {
            throw new Error("Abstract classes cannot be instantiated.");
        }
        this._speed = speed;
    }
}
class Car extends Vehicle {
    constructor(speed) {
        super(speed);
    }
    getSpeed() {
        // Accessing the protected member in a subclas
        return this._speed;
    }
}
const myCar = new Car(60);
console.log(myCar.getSpeed()); // Outputs: 60
console.log(myCar._speed); // Outputs: 60
Output:
60
60
Explanation: In this example, the Vehicle class is defined with a protected member, speed. While JavaScript doesn't natively support protected access modifiers, this code simulates the behavior by naming the variable _speed and using inheritance to access it. The Car class extends Vehicle and can access the _speed variable through the getSpeed method.
It's important to note, though, that since JavaScript does not have a true protected access modifier, the _speed variable is still accessible from outside the class, even though it was intended to be protected. This is because the concept of protected access does not exist in JavaScript in the same way it does in other languages like Java or C#.
The code also includes error handling to prevent the instantiation of the Vehicle class directly, as it is meant to be abstract. The output correctly showcases the retrieval of the speed value, demonstrating the concept of the protected access modifier in a simulated manner.
Conclusion: Access modifiers in JavaScript are essential to maintain data integrity, security, and code clarity in your applications. By controlling the visibility and availability of class members, you can effectively encapsulate data and behavior. Whether you use public, private, or protected access modifiers, they contribute to well-structured and maintainable code and improve your development process and collaboration with other team members.

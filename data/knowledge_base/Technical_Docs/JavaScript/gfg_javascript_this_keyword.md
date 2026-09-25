# JavaScript this Keyword

> Source: https://www.geeksforgeeks.org/javascript/javascript-this-keyword/

In JavaScript, this depends on how a function is called , it may refer to an object, global object, or be undefined (in strict mode), and its value is determined at runtime based on how the function is invoked.
- this dynamically refers to the calling object, not where the function is defined
- It is used to access an object’s properties and methods
- Enables flexible, reusable, and context-aware code
const person = {
    name: "GeeksforGeeks",
    greet() {
        return `Welcome To, ${this.name}`;
    }
};
console.log(person.greet()); 
Applications of this in JavaScript
The this keyword in JavaScript dynamically refers to the object that is executing the current function. Its value changes based on how and where it is used, not where it is written.
1. Using this in a Method
In an object method, the this keyword refers to the object itself, allowing the method to access, interact with, and modify the object’s properties and behavior within its scope.
- Refers to the object that owns the method.
- Used to access and manipulate object properties.
- Enables interaction with the object’s internal state.
const person = {
    name: 'John',
    age: 30,
    greet() {
        console.log('Hello, my name is ' +
            this.name + ' and I am '
            + this.age +
            ' years old.');
    }
};
person.greet(); 
2. Using this in a Function
In a JavaScript function, the behavior of the this keyword varies depending on how the function is invoked.
Syntax:
function exampleFunction() {  console.log(this); // Refers to the current execution context}
function greet() {
    console.log('Hello, my name is ' + this.name);
}
const person = {
    name: 'Amit',
    sayHello: greet
};
const anotherPerson = {
    name: 'Jatin'
};
//Driver Code Starts
greet(); 
person.sayHello(); 
greet.call(anotherPerson); 
//Driver Code Ends
3. Using this alone(Global Context)
In JavaScript, the value of this in the global context depends on where it is used and whether strict mode is enabled. In browsers, this usually refers to the global window object, while in strict mode it becomes undefined inside regular functions.
- In the global scope, this refers to the global object (window in browsers).
- Inside a regular function, this refers to the global object in non-strict mode.
- In strict mode, this inside a regular function is undefined.
// window (in browsers)
console.log(this); 
function verifyAge() {
    console.log(this);
}
// window in non-strict mode,
//undefined in strict mode
verifyAge(); 
4. Implicit Binding
When we call a function as a method of the object this keyword refers to the calling object.
const person = {
    name: "Ram",
    age: 22,
    greet: function () {
        return `Hello ${this.name}, you are ${this.age} years old`
    }
}
console.log(person.greet());
Here this keyword is referring to the person object so it can access name and age values.
5. Explicit Binding
When we explicitly bind this keyword using the call(), bind(), or apply() method then this keyword default reference is changed to the object called using the above-specified methods.
//Driver Code Starts
function ageVerify() {
    if (this.age > 18) {
        console.log("Yes you can drive");
    } else {
        console.log("No you cannot drive");
    }
}
const per1 = { age: 21 };
const per2 = { age: 16 };
//Driver Code Ends
ageVerify.call(per1);
ageVerify.call(per2);
6. Arrow Function Binding
Arrow functions do not have their own this. Instead, they inherit this from the surrounding (lexical) scope, which means the value of this is determined by where the function is defined, not how it is called.
const person = {
    name: "ram",
    age: 22,
    greet : () =>{
        return `Hello , you are ${this.age} years old`
    }
}
console.log(person.greet());
7. Precedence order of this keyword
The precedence of the this keyword in JavaScript follows a clear order: bind() has the highest priority, followed by call() and apply(), then object method invocation, and finally the global scope.
- JavaScript bind() Method: the bind() method permanently fixes the value of this to a specific object for a function,
- JavaScript call() and apply() Method: call() and apply() methods invoke a function immediately while explicitly assigning this to a chosen object.
- JavaScript Object Method: When a function is called as an object’s method, this refers to that object.
- JavaScript Global Scope: In the JavaScript global scope, when no specific execution context is provided, the this keyword refers to the global object (such as window in browsers), but in strict mode, it becomes undefined.

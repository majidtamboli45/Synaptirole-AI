# JavaScript Function Binding

> Source: https://www.geeksforgeeks.org/javascript/javascript-function-binding/

In JavaScript, function binding refers to the process of associating a function with a specific context (this value). The bind() method creates a new function that, when called, has its 'this' keyword set to the provided value.
- this Binding: Functions in JavaScript are executed in a context. By default, 'this' refers to the global object or is undefined in strict mode.
- Permanent Binding: When a function is bound to a specific object using bind(), it will always use that object as the context when invoked, no matter how it is called.
- Partial Application: Function binding can also allow you to pre-fill arguments, creating a partially applied function.
const person = {
    name: 'GFG',
    greet: function() {
        console.log('Hello, ' + this.name);
    }
};
const greet = person.greet;
greet(); 
When greet is called directly (without being bound to the person object), the value of this is not person anymore. Instead, it refers to the global object (in non-strict mode) or is undefined (in strict mode).
Methods of Function Binding
1. bind() Method
The bind() method is used to create a new function that, when called, has its this value set to a specified value, regardless of how the function is invoked.
const person = {
    name: 'GFG',
    greet: function() {
        console.log('Hello, ' + this.name);
    }
};
const greet = person.greet;
const boundGreet = greet.bind(person);
boundGreet(); 
This code defines a person object with a greet method, binds it to the person object using bind(), and then calls the bound function to correctly reference the person's name when executed.
2. call() Method
The call() method immediately invokes a function, allowing you to set the value of this and pass arguments to the function.
const person = {
    name: 'GFG',
    greet: function(city) {
        console.log('Hello, ' + this.name + ' from ' + city);
    }
};
person.greet('Delhi');
const greet = person.greet;
greet.call(person, 'Noida'); 
This code defines a greet method in the person object, calls it with 'Delhi' directly, and then uses call() to invoke the method with 'Noida', ensuring the this context is correctly bound to person.
3. apply() Method
Similar to call(), the apply() method invokes a function and allows you to set the value of this, but the difference is that the arguments are passed as an array (or an array-like object).
const person = {
    name: 'GFG',
    greet: function(city, country) {
        console.log('Hello, ' + this.name + ' from ' + city + ', ' + country);
    }
};
person.greet('Delhi', 'India'); 
const greet = person.greet;
greet.apply(person, ['Noida', 'Delhi']); 
This code defines a greet method in the person object, calls it with 'Delhi' and 'India', then uses apply() to invoke the method with 'Noida' and 'Delhi' by passing arguments as an array while maintaining the this context.
Arrow Functions and this Binding
Arrow functions behave differently when it comes to the this keyword. They do not have their own this context. Instead, arrow functions inherit the this value from the surrounding lexical context.
const person = {
    name: 'GFG',
    greet: function() {
        const arrowGreet = () => {
            console.log('Hello, ' + this.name); 
        };
        arrowGreet();
    }
};
person.greet();
This code defines a greet method in the person object, which contains an arrow function arrowGreet that logs the person's name using the this keyword from the enclosing greet method's context.

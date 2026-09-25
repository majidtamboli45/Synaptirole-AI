# Closure in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/closure-in-javascript/

A closure is the combination of a function and its lexical environment, allowing the function to access variables from its outer scope even after the outer function has finished executing.
- Retains access to outer function variables.
- Preserves the lexical scope.
- Allows data encapsulation and privacy.
- Commonly used in callbacks and asynchronous code.
function outer() {
    let outerVar = "I'm in the outer scope!";
    function inner() {
        console.log(outerVar);
    }
    return inner;
}
const closure = outer();
closure();
closure();
- The function inner() forms a closure by retaining access to outerVar, which is a variable in the scope of outer().
- Even though outer() has completed execution, inner() still has access to outerVar due to the closure.
Lexical Scoping
Closures rely on lexical scoping, which means a function’s scope is determined by where it is defined, not where it is executed.
- A function retains access to the scope where it was defined.
- Inner functions can access outer function variables.
- Enables closures to “remember” their environment.
Private Variables
Closures allow a function to keep variables private and accessible only within that function, which is commonly used in modules to protect data from being accessed or modified by other parts of the program.
- Helps achieve data encapsulation
- Creates private variables
- Prevents accidental data modification
function counter() {
    
    // Private variable
    let count = 0; 
    
    return function () {
        
        // Access and modify the private variable
        count++;
        return count;
    };
}
const increment = counter();
console.log(increment());
console.log(increment());
console.log(increment()); 
Closures and IIFE
IIFEs (Immediately Invoked Function Expressions) use closures to encapsulate data within a function, keeping it private and preventing access from the outside, which helps create self-contained modules.
- Data is scoped to the IIFE.
- Prevents global namespace pollution.
- Uses closures for data privacy.
- Useful for creating modular code.
const counter = (function () {
    let count = 0;
    return {
        increment: function () {
            count++;
            console.log(count);
        },
        reset: function () {
            count = 0;
            console.log("Counter reset");
        },
    };
})();
counter.increment(); 
counter.increment(); 
counter.reset();      
Closure and setTimeout
Closures are helpful in asynchronous programming because they preserve access to variables even after a function has finished executing, which is essential for delayed operations like timers or server requests.
- Retains state for delayed execution.
- Works well with callbacks and promises.
- Useful with timers (setTimeout, setInterval).
- Helps manage async data flow.
function createTimers() {
    for (let i = 1; i <= 3; i++) {
        setTimeout(function () {
            console.log(`Timer ${i}`);
        }, i * 1000);
    }
}
createTimers(); 
Closures with this keyword
Closures can be confusing with the this keyword because this is determined by how a function is called, not where it is defined, so inside a closure it may not refer to the expected object.
- this is determined by how a function is called, not by closures.
- Arrow functions inherit this from their surrounding scope.
- Use bind(), call(), or arrow functions when needed.
function Person(name) {
    this.name = name;
    
    this.sayName = function () {
        console.log(this.name);
    };
    setTimeout(function () {
        console.log(this.name); 
        // In non-strict mode, this refers to the global object.
        // In strict mode, this is undefined.
    }.bind(this), 1000); 
    // Fix with bind
}
const G = new Person("GFG");
G.sayName();
Common Pitfalls
- Memory Leaks: Excessive use of closures may retain unnecessary references to variables, causing memory issues.
- Performance Overhead: Overusing closures might lead to larger memory usage due to retained scopes.
- Issues Inside Loops: Using var inside loops may cause unexpected behavior because all closures share the same variable.
for (var i = 1; i <= 3; i++) {
    setTimeout(function () {
        console.log(i);
    }, 1000);
}

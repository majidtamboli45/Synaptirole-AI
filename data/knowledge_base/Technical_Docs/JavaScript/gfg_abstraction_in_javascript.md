# Abstraction in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/abstraction-in-javascript/

In JavaScript, Abstraction can be defined as the concept of hiding the inner complex workings of an object and exposing only the essential features to the user.
- Hiding Complexity: Implementation is hidden, it shows only the necessary details.
- Modularity: Code is organized in a reusable form, which improves maintainability and readability.
- Security: Important data cannot be directly accessed, they are hidden.
- Reusability: The code can be reused across different applications.
In JavaScript, abstraction is often achieved through functions, classes, and modules that encapsulate behaviour and expose only the necessary parts to the outside world.
class CoffeeMachine {
    makeCoffee() {
        this.#boilWater();
        this.#brewCoffee();
        console.log("Coffee is ready!");
    }
    #boilWater() {
        console.log("Boiling water...");
    }
    #brewCoffee() {
        console.log("Brewing coffee...");
    }
}
const coffee = new CoffeeMachine();
coffee.makeCoffee();
- The user only calls makeCoffee().
- Internal methods #boilWater() and #brewCoffee() are hidden.
- The implementation details are abstracted from the user.
Implementing Abstraction in JavaScript
JavaScript does not have explicit abstraction keywords, but abstraction can be achieved using functions, objects, classes, and modules.
Using Functions
Functions are one of the most simple ways to introduce abstraction in JavaScript. They allow you to wrap complex logic into a reusable block of code, exposing only the function name and parameters.
function a(radius) {
    return Math.PI * radius * radius;
}
console.log(a(5)); 
Using Objects and Methods
Classes and objects provide a more structured way to achieve abstraction by bundling related properties and methods into a single unit.
const car = {
    brand: "Toyota",
    start: function() {
        console.log("Car started");
    }
};
car.start();
The user only calls start() without knowing the internal mechanism of starting the car, which demonstrates abstraction.
Using Classes
Classes provide a structured way to achieve abstraction by exposing only the required methods while hiding internal implementation details from the user.
class CoffeeMachine {
    makeCoffee() {
        this.#boilWater();
        this.#brewCoffee();
        console.log("Coffee is ready!");
    }
    #boilWater() {
        console.log("Boiling water...");
    }
    #brewCoffee() {
        console.log("Brewing coffee...");
    }
}
const coffee = new CoffeeMachine();
coffee.makeCoffee();
Use Cases of Abstraction
- API Development: Abstraction can be used to create the APIs where the only necessary functionality is exposed and internal logic is hidden.
- Database Operations: Database interactions are abstracted using Object-Relational Mapping (ORM) frameworks, so developers work with high-level models instead of raw SQL queries.
- Middleware in Web Servers: Web servers use middleware functions to abstract authentication, logging, and error handling.
- Security and Encryption: Sensitive operations like password hashing and encryption are abstracted into reusable functions, preventing direct manipulation of security mechanisms.
Benefits of Abstraction in JavaScript
- Better Code Quality: Your code will be simpler and easier to read.
- No Repeated Code: You’ll store shared logic in one place instead of copying it everywhere.
- Easier Updates: Changing one piece of logic won’t break other parts of the application.
- Team-Friendly: Developers can work on different parts without needing to know every detail of the codebase.

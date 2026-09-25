# Polymorphism in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/polymorphism-in-javascript/

Polymorphism is the ability of the same method or function to perform different actions depending on the object or arguments.
In JavaScript, polymorphism works in two primary ways:
- Method Overriding: A child class overrides a method of its parent class.
- Method Overloading (simulated): A function behaves differently based on the number or type of its arguments.
Method Overriding
Method overriding occurs when a subclass provides its own specific implementation of a method that is already defined in its parent class. When you call this method, JavaScript will use the subclass's implementation instead of the parent's, which is a runtime decision.
class Animal {
    speak() {
        console.log("Animal makes a sound");
    }
}
class Dog extends Animal {
    speak() {
        console.log("Dog barks");
    }
}
class Cat extends Animal {
    speak() {
        console.log("Cat meows");
    }
}
const dog = new Dog();
dog.speak(); 
const cat = new Cat();
cat.speak();  
- Dog and Cat override the speak() method defined in the Animal class.
- Even though all of them are instances of Animal, each class provides its own behavior for the speak() method.
- This is an example of runtime polymorphism because JavaScript determines at runtime which method to call based on the object's type.
Method Overloading (Simulated)
JavaScript does not support true method overloading, but it can be simulated by handling different numbers or types of arguments within a single function.
class Calculator {
    add(a, b) {
        if (b === undefined) {
            return a + a; 
        }
        return a + b; 
    }
}
const calc = new Calculator();
console.log(calc.add(2)); 
console.log(calc.add(2, 3));
- The add() method behaves differently based on the number of arguments provided.
- If only one argument is passed, it doubles the value; if two arguments are passed, it adds them.
Note: While JavaScript doesn’t natively support method overloading with function signatures (as in Java or C++), we can still achieve similar functionality through manual argument checking.
Polymorphism with Functions and Objects
Polymorphism can also be implemented using functions and objects in JavaScript.
const dog = {
    speak() {
        console.log("Dog barks");
    }
};
const cat = {
    speak() {
        console.log("Cat meows");
    }
};
function makeSound(animal) {
    animal.speak();
}
makeSound(dog);
makeSound(cat);
- dog and cat both define a speak() method.
- makeSound() works with any object that has a speak() method.
- The same function produces different behavior depending on the object passed.
- This demonstrates polymorphism through functions and objects in JavaScript.
Use Cases of Polymorphism
- UI Components: Different types of UI elements like buttons, text fields, and checkboxes can have unique behaviors but have common interfaces.
- Database Operations: Methods for different database types can share a common interface while implementing specific logic.
- File Handling: Implementing the different behaviors but using the same method for reading, writing, and parsing different file formats.
- API Responses: Function can be used for handling the different types of API responses.

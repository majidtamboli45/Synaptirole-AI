# JavaScript Inheritance

> Source: https://www.geeksforgeeks.org/javascript/javascript-inheritance/

Inheritance in JavaScript is a mechanism that allows one object or class to acquire properties and methods from another. It helps in code reusability and creating hierarchical relationships between classes.
- Allows reuse of properties and methods from a parent class.
- Implemented using the extends keyword in ES6 classes.
- Supports method overriding in child classes.
Example: Animal is the base class and Dog, Cat and Cow are derived classes that extend the Animal class.
Common Types of Inheritance
1. prototype-based inheritance
JavaScript uses prototypes to share properties and methods among objects, enabling reuse across instances.
function Animal(name) {
    this.name = name;
}
Animal.prototype.speak = function () {
    console.log(`${this.name} makes a sound.`);
};
// Child constructor function
function Dog(name) {
    Animal.call(this, name); // Inherit properties
}
// Inherit methods from Animal
Dog.prototype = Object.create(Animal.prototype);
Dog.prototype.constructor = Dog;
// Adding a new method to Dog
Dog.prototype.bark = function () {
    console.log(`${this.name} barks: Woof!`);
};
// Creating an instance
const myDog = new Dog("Buddy");
myDog.speak(); 
myDog.bark();  
- Dog inherits from Animal using Object.create(Animal.prototype).
- Animal.call(this, name); ensures Dog gets the name property.
- Methods are checked in Dog.prototype, then Animal.prototype, then Object.prototype.
- Dog.prototype.bark() adds a new method while still inheriting speak().
To learn more about prototypes you can refer JavaScript Prototypes
2. ES6 Class-based Inheritance
This code demonstrates class inheritance in JavaScript, where a child class (two) extends a parent class (one). The child class inherits properties and methods from the parent class.
class one {
    constructor(name) {
        this.name = name
    }
    speaks() {
        return `my name is ${this.name}`
    }
}
class two extends one {
    constructor(name) {
        super(name)
    }
}
const o = new two('Pranjal')
console.log(o.speaks())
- Class one has a constructor that sets the name property and a speaks() method that returns a string using this.name.
- Class two extends one and calls super(name) in its constructor to inherit the name property from the parent class.
- When an instance of two (o) is created with 'Pranjal', it passes 'Pranjal' to the parent class (one).
- Calling o.speaks() returns "my name is Pranjal" because two inherits the speaks() method from one.
3. Mixins
This code demonstrates prototypal inheritance and object merging using Object.assign(), allowing a constructor function (Person) to inherit methods from multiple objects (one and two).
const one = {
    speak() {
        return `${this.name} walks`
    }
}
const two = {
    walks() {
        return `${this.name} walks`
    }
}
function Person(name) {
    this.name = name
}
Object.assign(Person.prototype, one, two)
const person1 = new Person('Pranjal')
console.log(person1.speak())
console.log(person1.walks())
- Objects one and two contain methods speak() and walks(), but they are separate objects.
- Person function is a constructor that assigns a name property to new instances.
- Object.assign(Person.prototype, one, two) merges methods from one and two into Person.prototype, so all instances of Person inherit these methods.
- Creating person1 with 'Pranjal' allows calling person1.speak() and person1.walks(), both returning "Pranjal walks", since this.name refers to the assigned name.
4. Inheritance with Object.create()
Object.create() in JavaScript creates a new object that uses another object as its prototype, allowing it to inherit all its properties and methods.
let obj = {
    name: 'Pranjal',
    age: 21,
    prints() {
        return `my name is ${this.name}`
    }
}
let obj1 = Object.create(obj)
obj1.name = 'Hello'
console.log(obj1.age)
console.log(obj1.prints())
- obj is an object with properties name, age, and a method prints() that returns a string using this.name.
- obj1 is created using Object.create(obj), meaning it inherits obj's properties and methods.
- obj1.name is set to 'Hello', but it still inherits age from obj since age is not directly defined in obj1.
- Calling obj1.prints() uses the overridden name property ('Hello'), so it prints "my name is Hello", while obj1.age still gets 21 from obj.
Other Ways to Achieve or Modify Inheritance
1. Inheritance with object.setPrototypeOf()
This code demonstrates prototypal inheritance using Object.setPrototypeOf(), which sets one object (two) as the prototype of another (one). This allows one to access properties from two.
const one = {
    speak() {
        return `${this.name} speaks`
    }
}
const two = {
    name: 'Pranjal'
}
Object.setPrototypeOf(one, two)
console.log(one.speak())
- Object one has a speak() method that uses this.name.
- Object two has a name property set to 'Pranjal'.
- Object.setPrototypeOf(one, two) makes two the prototype of one, so one can access name from two.
- Calling one.speak() returns "Pranjal speaks" because this.name now refers to two.name.
2. Factory functions for inheritance
Factory functions are a pattern for creating and returning objects without using the new keyword. They simplify object creation and can be combined with inheritance techniques such as Object.create().
function createPerson(name) {
    return {
        name: name,
        greet() {
            return `Hello my name is ${this.name}`
        }
    };
}
const one = createPerson('Pranjal')
const two = createPerson('Pranav')
console.log(one.greet())
console.log(two.greet())
- createPerson() returns an object with a name property and a greet() method.
- Each call creates a new object with its own data.
- one and two are separate objects created using the same factory function.
- Factory functions are an object creation pattern and do not provide inheritance by themselves.

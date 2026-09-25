# JavaScript Constructor Method

> Source: https://www.geeksforgeeks.org/javascript/js-constructor-method/

A constructor in JavaScript is a special function used to create and initialize objects. It sets up object properties and is typically invoked using the new keyword. Constructors allow for the creation of multiple instances with similar properties and methods.
Object.create() function in JavaScript
Object.create() in JavaScript is used to create a new object by setting an existing object as its prototype. Instead of copying properties directly or invoking a constructor, it establishes prototype-based inheritance, allowing the new object to access properties and methods from the specified prototype.
const obj={
    name:'Pranjal',
    age:21
}
const obj1=Object.create(obj)
obj1.class='10th'
console.log(obj1.name)
- In the above code, obj is the original object, andobj1 is created usingObject.create(obj) , which setsobj as the prototype ofobj1 .
- The properties of obj are not copied intoobj1 . Instead,obj1 inherits them through the prototype chain and can access them unless they are overridden by its own properties.
Constructor with default values
A constructor with default values allows you to specify default values for properties if no values are provided during object creation. This helps in ensuring that the object always has valid properties, even if some arguments are missing.
function Person(name = "Unknown", age = 0) {
    this.name = name;
    this.age = age;
}
const person1 = new Person("Pranjal", 30);
const person2 = new Person("Amar");  
const person3 = new Person();  
console.log(person1);  
console.log(person2); 
console.log(person3);  
- The Person constructor is defined with default values for name and age. If no values are passed when creating an object, these defaults are used.
- The parameters name = "Unknown" and age = 0 ensure that if no values are provided, the object will still have valid properties (name and age).
- When creating person1, both name and age are provided. For person2, only the name is provided, so age defaults to 0. For person3, both name and age use the default values.
- The console.log() statements print the objects, showing how default values are applied when arguments are missing.
Constructor with method on Prototypes
In JavaScript, you can add methods to the prototype of a constructor, allowing all instances created from that constructor to share the same method. This helps in optimizing memory usage, as the method is not recreated for each instance.
function Person(name, age) {
    this.name = name;
    this.age = age;
}
Person.prototype.greet = function() {
    console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
};
const person1 = new Person("Pranjal", 30);
const person2 = new Person("Amar", 25);
person1.greet();  
person2.greet();  
- The Person constructor initializes name and age properties when a new instance is created.
- The greet() method is added to the prototype of Person. This means the method is shared across all instances of Person, saving memory.
- Instances like person1 and person2 are created using the new keyword. They inherit the greet() method from the Person.prototype.
- The greet() method is called on each instance. Since the method is shared via the prototype, both person1 and person2 can use it, demonstrating the shared behavior.
Constructor with Inheritance
This code demonstrates how inheritance in classes allows a child class to inherit both properties and methods from a parent class constructor. The child class (two) inherits the name property from the parent class (one) using the super() keyword.
class one{
    constructor(name)
    {
        this.name=name
    }
    greet()
    {
        return `Hello ${this.name}`
    }
}
class two extends one{
    constructor(name,age)
    {
        super(name)
        this.age=age
    }
    greet1(){
        return `Your age is ${this.age}`
    }
}
const person1=new one('Pranjal')
const person2=new two('Pranav',21)
console.log(person2.greet())
- The two class inherits the name property from the one class using super(name) in its constructor.
- super(name) calls the one class's constructor, initializing the name property in the two class.
- The two class adds its own age property, which is not present in the one class.
- When creating an instance of person2 (the two class), it inherits the name property from the one class and has its own age property.
- This demonstrates how a child class can access properties from both the parent class and its own constructor.
Advantages of Constructor
- Reusable Code: Constructors allow creating multiple instances of objects with similar properties and methods, promoting code reuse.
- Encapsulation: They encapsulate the logic for setting up an object, keeping initialization clean and organized.
- Object Initialization: Constructors make it easy to initialize objects with specific values (via parameters) when creating new instances.
- Inheritance Support: Constructors enable inheritance, allowing child objects to inherit properties and methods from parent constructors.
- Cleaner and More Maintainable Code: Constructors keep object creation logic in one place, making the code more readable and easier to maintain, especially for complex objects.

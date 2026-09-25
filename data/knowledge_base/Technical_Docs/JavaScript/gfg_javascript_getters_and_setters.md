# JavaScript Getters and Setters

> Source: https://www.geeksforgeeks.org/javascript/javascript-getters-and-setters/

JavaScript getters and setters are special methods used to access and update object properties. They provide a controlled way to read and modify values.
- get is used to retrieve the value of a property.
- set is used to update or modify the property value.
- Helps in data validation and encapsulation of object properties.
JavaScript Getter (The get Keyword)
In JavaScript, the getter is the method that is used to get the value of the property. We can use the get keyword to get the value of the property.
- Getters are automatically called when the property is accessed.
- Getters provide controlled access to object properties.
class P {
    constructor(name) {
        this._name = name;
    }
    get name() {
        return this._name;
    }
}
const res = new P('Anjali');
console.log(res.name);
- The P class has a constructor that sets the _name property
- get method used to retrieve the value of _name when a name is accessed.
- When person.name is accessed, the getter name is automatically called, returning the value of _name.
Getter Vs Regular Function
In JavaScript, the getter and the regular functions both are used for the accessing the object properties but in the different ways. Getters allow properties to be accessed like regular object attributes while still executing logic in the background. On the other hand, regular functions require explicit method calls and do not provide direct property-like access.
| Getter (get) | Regular Function | 
|---|---|
| Accessed like a property (obj.prop) | Called explicitly (obj.method()) | 
| Improves readability & simplicity | Requires () which makes it look like a method call | 
| Can restrict direct access to properties | Properties can be easily accessed | 
JavaScript Setter (The set Keyword)
In JavaScript, the setter is the method that is used for setting the value of the property with the help of the set keyword.
- Setters provide controlled updates to object properties.
- Setters provide a way to control how data is stored by using internal variables, keeping the object's state secure.
class P {
    constructor(name) {
        this._name = name;
    }
    set name(newName) {
        this._name = newName;
    }
}
const res = new P('Anjali');
res.name = 'Ayushi'; // Using the setter to change the name
console.log(res._name); 
- The setter name is used to update the _name property when res.name = 'Ayushi' is called.
- The value of _name is updated to 'Ayushi'.
Implementing Getters and Setters in JavaScript
Using Getters and Setters in Objects
In objects, we can use the get and set keywords for defining the getter and setter in objects.
const p= {
    n1: "Anurag",
    n2: "Das",
    get Name() {
        return `${this.n1} ${this.n2}`;
    },
    set Name(name) {
        [this.n1, this.n2] = name.split(" ");
    }
};
console.log(p.Name);
p.Name = "Anuj Jain";
console.log(p.Name); 
Getters and Setters with Classes
Getters and setters are commonly used in ES6 classes to control access to private properties.
class R {
    constructor(width, height) {
        this.width = width;
        this.height = height;
    }
    get a() {
        return this.width * this.height;
    }
    set a(value) {
        console.log("Area cannot be set directly.");
    }
}
const rect = new R(10, 5);
console.log(rect.a);
rect.a = 60; 
The getter computes the area dynamically, and the setter prevents modification, enforcing encapsulation.
Using Getters and Setters with Private Fields
With ES2020, JavaScript introduced private fields (prefix _ is just a convention; # makes it truly private).
class B {
    #balance; // Private property
    constructor(balance) {
        this.#balance = balance;
    }
    get balance() {
        return this.#balance;
    }
    set balance(amount) {
        if (amount < 0) {
            console.log("Balance cannot be negative!");
        } else {
            this.#balance = amount;
        }
    }
}
const acc = new B(1000);
console.log(acc.balance);
acc.balance = -500;  // "Balance cannot be negative!"
The #balance field is private, ensuring external code cannot modify it directly.
Using Object.defineProperty() for Accessors
The Object.defineProperty() method can define getters and setters dynamically.
const u = { name: "Anjali" };
Object.defineProperty(u, "greeting", {
    get: function () {
        return `Hello, ${this.name}!`;
    },
    set: function (newName) {
        this.name = newName;
    }
});
console.log(u.greeting);
u.greeting = "Ayushi";
console.log(u.greeting);
This approach allows defining dynamic properties with controlled access.
Use Cases of Getters and Setters
- Data Validation: Ensures only valid data is assigned to a variable, preventing errors.
- Lazy Computation: Delays the calculation of a value until it's actually needed, improving efficiency.
- Encapsulation: Hides direct access to sensitive data, allowing controlled modifications through methods.
- Debugging & Logging: Helps track when and how a variable changes, making it easier to find bugs.
Getters and Setters Vs Direct Property Access
| Getters & Setters | Direct Property Access | 
|---|---|
| Special methods used to control the access and modification of object properties. | Directly assigning and retrieving values from an object's properties without any additional control. | 
| Used when validation, computed properties, encapsulation, or logging is required. | Used for simple data storage where additional logic is not needed. | 
| Slightly slower due to method calls. | Faster since it directly accesses properties. | 
| Provides encapsulation by restricting direct access to internal data. | No encapsulation; data can be freely modified. | 
| More complex as it requires defining getter/setter methods. | Easier to use since properties can be accessed directly. |

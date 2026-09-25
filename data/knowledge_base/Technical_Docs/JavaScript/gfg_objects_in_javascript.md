# Objects in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/objects-in-javascript/

An object is a dynamic data structure that stores related data as key-value pairs, where each key uniquely identifies its value.
- The values of properties can be primitives, objects, or functions (known as methods when defined inside an object).
- Objects are mutable and dynamic properties can be added, modified, or deleted at any time.
- Objects allow data grouping and encapsulation, making it easier to manage related information and behaviour together.
There are two primary ways to create an object in JavaScript:
1. Creation Using Object Literal
The object literal syntax allows you to define and initialize an object with curly braces {}, setting properties as key-value pairs.
let obj = {
    name: "Sourav",
    age: 23,
    job: "Developer"
};
console.log(obj);
2. Creation Using new Object() Constructor
let obj = new Object();
obj.name= "Sourav",
obj.age= 23,
obj.job= "Developer"
console.log(obj);
Basic Operations on JavaScript Objects
1. Accessing Object Properties
You can access an object’s properties using either dot notation or bracket notation
let obj = { name: "Sourav", age: 23 };
// Using Dot Notation
console.log(obj.name);
// Using Bracket Notation
console.log(obj["age"]);
2. Modifying Object Properties
Properties in an object can be modified by reassigning their values.
let obj = { name: "Sourav", age: 22 };
console.log(obj);
obj.age = 23;
console.log(obj);
3. Adding Properties to an Object
You can dynamically add new properties to an object using dot or bracket notation.
let obj = { model: "Tesla" };
obj.color = "Red";
console.log(obj);
4. Removing Properties from an Object
The delete operator removes properties from an object.
let obj = { model: "Tesla", color: "Red" };
delete obj.color;
console.log(obj);
5. Checking if a Property Exists
You can check if an object has a property using the in operator or hasOwnProperty() method.
let obj = { model: "Tesla" };
console.log("color" in obj);
console.log(obj.hasOwnProperty("model"));
6. Iterating Through Object Properties
Use for...in loop to iterate through the properties of an object.
let obj = { name: "Sourav", age: 23 };
for (let key in obj) {
    console.log(key + ": " + obj[key]);
}
7. Merging Objects
Objects can be merged using Object.assign() or the spread syntax { ...obj1, ...obj2 }.
let obj1 = { name: "Sourav" };
let obj2 = { age: 23};
let obj3 = { ...obj1, ...obj2 };
console.log(obj3);
8. Object Length
You can find the number of properties in an object using Object.keys().
let obj = { name: "Sourav", age: 23 };
console.log(Object.keys(obj).length);
Recognizing a JavaScript Object
To check if a value is an object, use typeof and verify it's not null.
let obj = { name: "Sourav" };
console.log(typeof obj === "object" && obj !== null);
Common Mistakes with JavaScript Objects
Let's dive into the differences between {} and new Object() in JavaScript, as this is an important concept when working with objects.
In JavaScript, there are two main ways to create objects
- Using Object Literal Syntax ({}): This is the most common and simple way to create objects.
- Using the Object Constructor (new Object()): This uses JavaScript's built-in Object constructor to create objects.
// Object literal
const obj1 = { key: "value" };
// Object constructor
const obj2 = new Object();
obj2.key = "value";
console.log(obj1);
console.log(obj2); 
At first glance, both approaches seem to achieve the same result. However, there are significant differences to understand.
Key Differences Between {} and new Object()
| Feature | {} (Object Literal) | new Object() (Object Constructor) | 
|---|---|---|
| Ease of Use | More concise and readable. | Less commonly used. | 
| Performance | Faster and more efficient. | Slightly slower due to the constructor call. | 
| Prototypal Inheritance | Directly inherits from Object.prototype. | Same, but adds an extra layer of abstraction. | 
| Customization | Literal syntax is sufficient for most use cases. | Useful only in rare scenarios. | 
Key Differences Between map and object
| Map | Object | 
|---|---|
| Stores key-value pairs and allows keys of any type (including objects). | Stores key-value pairs but keys are usually strings or symbols. | 
| Maintains the order of insertion. | Does not guarantee key order. | 
| Has a built-in size property to get the number of entries. | No built-in property for size; must be calculated manually. | 
| Iteration is easy using for...of or map.forEach(). | Iteration requires for...in or Object.keys()/Object.values(). | 
| Better performance for frequent additions and removals of key-value pairs. | May be slower for frequent additions/removals of properties. | 
| Can use any value (primitive or object) as a key. | Keys are always converted to strings (except symbols). | 
Reason Behind Using {}
- Simpler Syntax: The literal form is cleaner and easier to read.
- Performance: {} skips the overhead of calling a constructor function.
- Fewer Errors: Using new Object() may unintentionally override the constructor if the environment changes.
Understanding objects in JavaScript is essential for effective programming. They enable you to create complex data structures and perform a variety of operations. For more advanced JavaScript tutorials and examples, explore our JavaScript Tutorial and JavaScript Examples.

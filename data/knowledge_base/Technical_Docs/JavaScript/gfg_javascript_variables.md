# JavaScript Variables

> Source: https://www.geeksforgeeks.org/javascript/javascript-variables/

Variables in JavaScript are used to store data values. They can be declared in different ways depending on how the value should behave.
- Variables can be declared using var, let, or const.
- JavaScript is dynamically typed, so types are decided at runtime.
- You don’t need to specify a data type when creating a variable.
// Old style
var a = 10    
// Prferred for non-const
let b = 20;    
// Preferred for const (cannot be changed)
const c = 30;  
console.log(a);
console.log(b);
console.log(c);
Declaring Variables in JavaScript
- Before ES6 (2015): Variables were declared only with var, which is function-scoped and global-scoped, causing issues like hoisting and global pollution.
- ES6 Introduction:let and const were introduced to provide safer alternatives for declaring variables.
- Scope: let and const are block-scoped (limited to { } block) or global-scoped, reducing errors compared to var.
1. var keyword
var is a keyword in JavaScript used to declare variables and it is Function-scoped and hoisted, allowing redeclaration but can lead to unexpected bugs.
var a = "Hello Geeks";
var b = 10;
console.log(a);
console.log(b);
2. let keyword
let is a keyword in JavaScript used to declare variables and it is Block-scoped and not hoisted to the top, suitable for mutable variables
let a = 12
let b = "gfg";
console.log(a);
console.log(b);
3. const keyword
const is a keyword in JavaScript used to declare variables and it is Block-scoped, immutable bindings that can't be reassigned, though objects can still be mutated.
const a = 5
let b = "gfg";
console.log(a);
console.log(b);
Rules for Naming Variables
When naming variables in JavaScript, follow these rules
- Variable names must begin with a letter, underscore (_), or dollar sign ($).
- Subsequent characters can be letters, numbers, underscores, or dollar signs.
- Variable names are case-sensitive (e.g., age and Age are different variables).
- Reserved keywords (like function, class, return, etc.) cannot be used as variable names.
let userName = "Suman";  // Valid
let $price = 100;         // Valid
let _temp = 0;            // Valid
let 123name = "Ajay";    // Invalid
let function = "gfg"; // Invalid
Interesting Facts about Variables in JavaScript
1. let or const are preferred over var: Initially, all the variables in JavaScript were written using the var keyword but in ES6 the keywords let and const were introduced. The main issue with var is, scoping.
if (true) {
    var x = 10;
    let y = 20;
}
console.log(x);  // 10 (var is function-scoped)
console.log(y);  // Error (let is block-scoped)
2. var is function scoped: Can be accessed outside block if within the function.
if (true) {
  var x = 10; 
}
// Accessible outside the block
// because we are in same function
console.log(x);
3. let and const are block scoped : Cannot be accessed outside block even if inside the same function
if (true) {
  let y = 20;
  const z = 30;
}
console.log(y, z); // ReferenceError
4. var can be redeclared in the same scope, but let and const cannot be
var x = 10;
var x = 20; // Allowed
let y = 30;
let y = 40; // SyntaxError
const z = 50;
const z = 60; // SyntaxError
5. We can change elements of array or objects even if declared as const.
const ob = { a: 10 };
ob.a = 20; // Allowed
const arr = [10, 20, 30]
arr[2] = 40
console.log(arr)  // Allowed
/* TypeError in the below lines
obj = { b: 30 }; 
arr = [50, 100] */

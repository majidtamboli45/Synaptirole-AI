# JavaScript Arrays

> Source: https://www.geeksforgeeks.org/javascript/javascript-arrays/

In JavaScript, an array is an ordered list of values. Each value, known as an element, is assigned a numeric position in the array called its index.
- The indexing starts at 0, so the first element is at position 0, the second at position 1, and so on.
- Arrays can hold any type of data-such as numbers, strings, objects, or even other arrays-making them a flexible and essential part of JavaScript programming.
// Creating array
let numbers = [2, 4 , 8, 12, 16];
//Printing array
console.log(numbers);
- An array holds multiple elements in a single variable using index-based storage.
- Array elements are stored in a specific sequence and can be accessed by their index (starting from 0 ).
1. Create Array using Literal
Creating an array using array literal involves using square brackets [] to define and initialize the array.
// Creating an Empty Array
let a = [];
console.log(a);
// Creating an Array and Initializing with Values
let b = [10, 20, 30];
console.log(b);
2. Create using new Keyword (Constructor)
The "Array Constructor" refers to a method of creating arrays by invoking the Array constructor function.
// Creating and Initializing an array with values
let a = new Array(10, 20, 30);
console.log(a);
Note: Both the above methods do exactly the same. Use the array literal method for efficiency, readability, and speed.
Basic Operations on JavaScript Arrays
1. Accessing Elements of an Array
Any element in the array can be accessed using the index number. The index in the arrays starts with 0.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Accessing Array Elements
console.log(a[0]);
console.log(a[1]);
2. Accessing the First Element of an Array
The array indexing starts from 0, so we can access first element of array using the index number.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Accessing First Array Elements
let fst = a[0];
console.log("First Item: ", fst);
3. Accessing the Last Element of an Array
We can access the last array element using [array.length - 1] index number.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Accessing Last Array Elements
let lst = a[a.length - 1];
console.log("Last Item: ", lst);
Output
Last Item:  JS
4. Modifying the Array Elements
Elements in an array can be modified by assigning a new value to their corresponding index.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
console.log(a);
a[1]= "Bootstrap";
console.log(a);
5. Adding Elements to the Array
Elements can be added to the array using methods like push() and unshift().
- The push() method add the element to the end of the array.
- The unshift() method add the element to the starting of the array.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Add Element to the end of Array
a.push("Node.js");
// Add Element to the beginning
a.unshift("Web Development");
console.log(a);
6. Removing Elements from an Array
To remove the elements from an array we have different methods like pop(), shift(), or splice().
- The pop() method removes an element from the last index of the array.
- The shift() method removes the element from the first index of the array.
- The splice() method removes or replaces the element from the array.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
console.log("Original Array: " + a);
// Removes and returns the last element
let lst = a.pop();
console.log("After Removing the last: " + a);
// Removes and returns the first element
let fst = a.shift();
console.log("After Removing the First: " + a);
// Creating an array for splice example
let b = ["HTML", "CSS", "JS"];
// Removes 2 elements starting from index 1
b.splice(1, 2);
console.log("After Removing 2 elements starting from index 1: " + b);
7. Array Length
We can get the length of the array using the array length property.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
let len = a.length;
console.log("Array Length: " + len);
8. Increase and Decrease the Array Length
We can increase and decrease the array length using the JavaScript length property.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"]
// Increase the array length to 7
a.length = 7;
console.log("After Increasing Length: ", a);
// Decrease the array length to 2
a.length = 2;
console.log("After Decreasing Length: ", a)
9. Iterating Through Array Elements
We can iterate array and access array elements using for loop and forEach loop.
Example: It is an example of for loop.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Iterating through for loop
for (let i = 0; i < a.length; i++) {
    console.log(a[i])
}
Example: It is the example of Array.forEach() loop.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Iterating through forEach loop
a.forEach(function myfunc(x) {
    console.log(x);
});
10. Array Concatenation
Combine two or more arrays using the concat() method. It returns new array containing joined arrays elements.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS", "React"];
let b = ["Node.js", "Express.js"];
// Concatenate both arrays
let concateArray = a.concat(b);
console.log("Concatenated Array: ", concateArray);
11. Conversion of an Array to String
We have a built-in method toString() to converts an array to a string.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Convert array ot String
console.log(a.toString());
12. Check the Type of an Arrays
The JavaScript typeof operator is used to check the type of an array. It returns "object" for arrays.
// Creating an Array and Initializing with Values
let a = ["HTML", "CSS", "JS"];
// Check type of array
console.log(typeof a);
Recognizing a JavaScript Array
There are two methods by which we can recognize a JavaScript array:
- By using Array.isArray() method
- By using instanceof method
Below is an example showing both approaches:
const courses = ["HTML", "CSS", "Javascript"];
console.log("Using Array.isArray() method: ", Array.isArray(courses))
console.log("Using instanceof method: ", courses instanceof Array)
A common error is faced while writing the arrays:
const a = [5]
// and
const a = new Array(5)
The above two statements are not the same.
This statement creates an array with an element " [5] ". Try with the following examples
// Example 1
const a1 = [5]
console.log(a1)
// Example 2
const a2 = new Array(5) 
console.log(a2)

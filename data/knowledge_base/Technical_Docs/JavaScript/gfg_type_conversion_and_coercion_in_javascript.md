# Type Conversion and Type Coercion in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/type-conversion-and-type-coercion-in-javascript/

Data types in JavaScript are flexible due to which the type of the variables can be changed when the program runs. Type Conversion and Type Coercion are the two ways through which we can change the data type of the variables from one type to the other.
Type Conversion
Type Conversion is the process in JavaScript in which the data type of the variables is converted from one type to another type manually. This is also known as explicit type casting.
- Performed manually by the programmer.
- Uses built-in JavaScript methods like Number(), String(), and Boolean().
- Ensures control over data types in code.
Performing type conversion-
Performing type conversion means changing a value from one data type to another, such as converting strings, numbers, or booleans when needed in a program.
1. String to Number
We can convert a string into numbers using the Number() function, parseInt(), and parseFloat() methods.
let s = "123";
let n = Number(s);  // Converts string to number
console.log(n);  
2. Number to String
We can convert a number into a string using String() function or we can concatenate it with an empty string("").
let n = 123;
let s = String(n);  //Converts number to string
console.log(s);  
3. Boolean to Number
We can convert a boolean into a number using Number(), so true becomes 1 and false becomes 0.
let bool = true;
let n = Number(bool);  //Converts boolean to number
console.log(n);
4. Boolean to String
We can convert boolean into string using String() or by concatenating it with an empty string.
let bool = true;
let s = String(bool);  //Converts boolean to string
console.log(s);  
For more details read this article - Type Conversion
Type Coercion
Type coercion is the automatic conversion of one data type to another by JavaScript during operations. This is also known as implicit type casting.
- Performed automatically by JavaScript.
- Happens mostly in comparison and arithmetic operations.
- Can lead to unexpected results if not handled properly.
Examples of Type Coercion
1. String + Number
JavaScript will automatically or implicitly convert the number to a string if there is the string present in the arithmetic operation.
let n = 5;
let s = "5";
let res = n + s;  // JavaScript converts num to string
console.log(res); 
console.log(typeof(res))
2. Boolean + Number
JavaScript converts the boolean value into a number, true becomes 1 and false becomes 0, when we perform the arithmetic operations.
let bool = true;
let n = 10;
let res = bool + n;  // JavaScript converts boolean to number
console.log(res);  
3. Comparison of Different Types
JavaScript convert the two value of data type into the common type when we compare their values.
let s = "10";
let n = 10;
console.log(s == n);  // true, JavaScript converts str to number
4. Boolean Context
Javascript converts non-boolean value into the boolean value when the value is in the if statement.
let s = "";
if (s) {
    console.log("This won't print");  // Empty string is falsy
} else {
    console.log("This will print");  // Empty string is coerced to false
}
For more details read this article - Type Coercion
Difference Between Type Conversion and Type Coercion
| Feature | Type Conversion | Type Coercion | 
| Performed by | Programmer | JavaScript Engine | 
| Type | Explicit | Implicit | 
| Control | Full control | Happens automatically | 
| Examples | Number("5") → 5 | "5" - 2 → 3 | 
Best Practices for Handling Type Conversion and Coercion
- Always use explicit type conversion where possible to avoid unexpected results.
- Use === instead of == to prevent unintended type coercion in comparisons.
- Convert inputs explicitly before performing operations.
- Use typeof to check data types before processing values.

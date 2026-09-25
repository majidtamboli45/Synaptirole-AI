# JavaScript Number Reference

> Source: https://www.geeksforgeeks.org/javascript/javascript-number-reference/

In JavaScript, all numbers are stored using the double-precision 64-bit binary format defined by the IEEE 754 standard. JavaScript supports multiple ways to represent number literals for flexibility and readability.
- Decimal: Standard base-10 numbers (e.g., 10, 3.14).
- Binary & Octal: Base-2 and base-8 numbers using prefixes 0b and 0o (e.g., 0b1010, 0o12).
- Hexadecimal: Base-16 numbers using the 0x prefix (e.g., 0xA, 0xFF).
function func() {  
    // Original string
    let a = true;
    
    let value = Number(a);
    console.log(value);
}
func();
Syntax: Number(object)
JavaScript Number Constructor
In JavaScript, a constructor gets called when an object is created using the new keyword.
- Number(): Number() constructor returns the number format for any type of JavaScript variable.
JavaScript Number Properties
A JavaScript property is a member of an object that associates a key with a value. There are two types of Number properties in JavaScript.
1. Static Property: A static property is a property that has the same value for the entire class.
- EPSILON: Number.EPSILON property shows the difference between 1 and the smallest floating-point number greater than 1.
- MAX_SAFE_INTEGER: Number.MAX_SAFE_INTEGER property represents the maximum safe integer value in javaScript.
- MAX_VALUE: Number.MAX_VALUE property represents the maximum numeric value that javaScript can handle.
- MIN_SAFE_INTEGER: Number.MIN_SAFE_INTEGER property represents the minimum safe integer value in JavaScript.
- MIN_VALUE: Number.MIN_VALUE property represents the smallest positive numeric value greater than zero.
- NaN: Number.NaN property represents a value that is not a valid number.
- NEGATIVE_INFINITY: Number.NEGATIVE_INFINITY property represents the largest negative value, known as negative infinity.
- POSITIVE_INFINITY: Number.POSITIVE_INFINITY property represents the largest positive value, known as positive infinity.
2. Instance Property: An instance property is a property that has a new copy for every new instance of the class.
- constructor: Return the number constructor function for the object.
JavaScript Number Methods
JavaScript methods are the actions that can be performed on objects. There are types of Number methods in JavaScript.
1. Static Method: If the method is called using the Number class itself then it is called a static method.
- isNaN(): Number.isNaN() method determines whether the passed value is NaN and of the type Number.
- isFinite(): Number.isFinite() method checks whether the passed value is a finite number.
- isInteger(): Number.isInteger() method returnstrue if the passed value is an integer; otherwise, it returnsfalse .
- isSafeInteger(): Number.isSafeInteger() method checks whether the provided value is a safe integer.
- parseFloat():  parseFloat() method accepts a string and converts it into a floating-point number.
- parseInt(): parseInt() method accepts a string and converts it into an integer value.
2. Instance Method: If the method is called on an instance of a number then it is called an instance method.
- toExponential(): toExponential() method returns a string representing the number in exponential notation.
- toFixed(): toFixed() method formats a number using fixed-point notation.
- toLocaleString(): toLocaleString() method converts a number into a string using locale-specific formatting.
- toPrecision(): toPrecision() method formats a number to a specified precision or length.
- toString(): toString() method returns a string representing the specified Number object.
- valueOf(): valueOf() method returns the primitive value of a Number object.

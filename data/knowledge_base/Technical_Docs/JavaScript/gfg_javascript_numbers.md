# JavaScript Numbers

> Source: https://www.geeksforgeeks.org/javascript/javascript-numbers/

JavaScript numbers are primitive data types, and unlike other programming languages, you don't need to declare different numeric types like int, float, etc. JavaScript numbers are always stored in double-precision 64-bit binary format IEEE 754. This format stores numbers in 64 bits:
- 0-51 bits store the value (fraction)
- 52-62 bits store the exponent
- 63rd bit stores the sign
let number = 42;
console.log(number)
console.log(typeof number);
- The variable number is assigned the value42 , andconsole.log(number) prints it to the console.
- typeof number returns"number" , confirming that the variable is of the number data type in JavaScript.
Numeric Types in JavaScript
In JavaScript, numbers play an important role, and understanding their behavior is essential for effective programming. Let’s explore the various aspects of numeric types in JavaScript.
1. The Only Numeric Type
As we know, JavaScript has only one numeric type: the double-precision 64-bit binary format IEEE 754, which means that it doesn’t differentiate between integers and floating-point numbers explicitly. Instead, it uses a unified approach for all numeric values.
- Integers and floating-point numbers are both represented using this format.
- The numeric precision is 53 bits, allowing for an accurate representation of integer values ranging from -2^53 + 1 to 2^53 - 1.
2. Scientific Notation
JavaScript allows writing extra-large or extra-small numbers using scientific (exponent) notation.
Note: represents powers of 10 (e.g., 156e5 = 156 × 10⁵).
let a  =  156e5;
let b =   156e-5;
console.log(a);
console.log(b);
3. Integer Precision
Integers (numbers without a period or exponent notation) are accurate up to 15 digits.
let a = 999999999999999;
let b = 9999999999999999;
console.log(a);
console.log(b);
4. Floating Point Precision
Floating point arithmetic is not always 100% accurate due to binary representation limitations.
Example:
let x = 0.22 + 0.12;   //x will be 0.33999999999999997
To solve this problem, multiply and divide:
let x = (0.22 * 10 + 0.12 * 10) / 10;    // x will be 0.34
let x = 0.22 + 0.12;
let y = (0.22 * 10 + 0.12 * 10) / 10;
console.log(x);
console.log(y);
5. NaN and Infinity
NaN (Not-a-Number) is returned when a numeric operation fails or produces an undefined result. Infinity is returned when a number exceeds the maximum representable value.
console.log(0 / 0);         
console.log(isNaN("hello")); 
console.log(1 / 0);         
console.log(-1 / 0);        
console.log(isFinite(100));
6. Adding Numbers and Strings
- JavaScript uses the `+` operator for both addition and concatenation.
- Numbers are added, when strings are concatenated.
// Adding two numbers
let x = 10;
let y = 15;
let z = x + y;
console.log(z);
// Concatenating two strings:
let a = "10";
let b = "30";
let c  = a + b;
console.log(c);
7. Numeric Strings
JavaScript automatically converts the numeric strings to numbers in most operations like.
let x  = "100" / "10";
let y  = "100" * "10";
let z = "100" - "10";
console.log(x);
console.log(y);
console.log(z);
Number Literals
The types of number literals You can use decimal, binary, octal, and hexadecimal.
1. Decimal Numbers
JavaScript Numbers does not have different types of numbers(ex: int, float, long, short) which other programming languages do. It has only one type of number and it can hold both with or without decimal values.
let a=33;
let b=3.3;
console.log(a);
console.log(b);
2. Octal Number
If the number starts with 0 and the following digits are smaller than 8. It will be parsed as an Octal Number.
let x = 0o562;
console.log(x);
3. Binary Numbers
They start with 0b or 0B followed by 0's and 1's.
let x = 0b11; 
let y = 0B0111;
console.log(x);
console.log(y);
4. Hexadecimal Numbers
They start with 0x or 0X followed by any digit belonging (0123456789ABCDEF)
let x = 0xfff;
console.log(x);
Number Coercion in JavaScript
In JavaScript, coercion refers to the automatic or implicit conversion of values from one data type to another. When different types of operators are applied to values, JavaScript performs type coercion to ensure that the operation can proceed. Let’s explore some common examples of coercion:
1. Undefined to NaN
When you perform an operation involving undefined, JavaScript returns NaN (Not-a-Number).
const res = undefined + 10;
console.log(res); // NaN
2. Null to 0
The value null is coerced to 0 when used in arithmetic operations.
const total = null + 5;
console.log(total); // 5
3. Boolean to Number
Boolean values (true and false) are converted to numbers: 1 for true and 0 for false.
const n1 = true + 10;
const n2 = false + 10;
console.log(n1);
console.log(n2);
4. String to Number
When performing arithmetic operations, JavaScript converts strings to numbers. If the string cannot be parsed as a valid number, it returns NaN.
const s1 = '42';
const s2 = 'hello';
const strToNum1 = Number(s1);
const strToNum2 = Number(s2);
console.log(strToNum1);
console.log(strToNum2);
Integer Conversion
Some operations such as those which work with an array, string indexes, or date/time expect integers. After performing the coercion if the number is greater than 0 it is returned as the same and if the number NaN or -0, it is returned as 0. The result is always an integer.
Fixed-width number Conversion
In Javascript, there are some functions that deal with the binary encoding of integers such as bitwise operators and typedArray objects. The bitwise operators always convert the operands to 32-bit integers.
JavaScript Number Methods
Now, we will use Number methods such as toString(), toExponential(), toPrecision(), isInteger(), and toLocaleString() method. Let's see the examples of these Number methods.
let x = 21
console.log(x.toString());
console.log(x.toExponential());
console.log(x.toPrecision(4));
console.log(Number.isInteger(x));
console.log(x.toLocaleString("bn-BD"));
Some Facts About Numbers in JavaScript
- String Concatenation with Numbers: When you add a string and a number in JavaScript, the result will be a string concatenation.
- Javascript numbers which are primarily primitive values can also be defined as objects using a new keyword.
- Constants preceded by 0x are interpreted as hexadecimal in JavaScript.
- Javascript numbers are of base 10 by default, but we can use the toString() method to get output in the required base from base 2 to base 36.
- Apart from regular numbers, Javascript has BigInt numbers which are integers of arbitrary length.

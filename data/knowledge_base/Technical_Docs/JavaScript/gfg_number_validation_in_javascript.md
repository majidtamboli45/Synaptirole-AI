# Number Validation in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/number-validation-in-javascript/

Number validation in JavaScript ensures that user input contains only valid numeric values. It is commonly used in forms to prevent incorrect or unwanted data entry.
- Checks whether input is a valid number using methods like isNaN() or RegExp.
- Helps restrict inputs such as phone numbers, age, or numeric fields.
- Improves data accuracy and prevents invalid submissions.
Here are the various methods to validate numbers in JavaScript
1. Check if a Value is a Number
Use typeof and isNaN() to determine if a value is a valid number.
const isNum = n =>
	typeof n === 'number' && !isNaN(n);
console.log(isNum(42)); 
console.log(isNum('42'));
console.log(isNum(NaN));
- typeof n === 'number' checks if the type of n is a number.
- !isNaN(n) ensures the value is not NaN (Not a Number).
- It ensures both type and value validity.
2. Check if a String is Numeric
Use regular expressions or isFinite() to validate numeric strings.
const isNumStr = s => 
	!isNaN(s) && isFinite(s);
console.log(isNumStr('123'));
console.log(isNumStr('123abc')); 
console.log(isNumStr('1.23')); 
- !isNaN(s) ensures the string can be parsed as a number.
- isFinite(s) ensures the value is not infinite.
- This works for integers and decimals.
3. Validate Integer
Check if a number is an integer using Number.isInteger().
const isInt = n => Number.isInteger(n);
console.log(isInt(42)); 
console.log(isInt(3.14));
console.log(isInt('42'));
- Number.isInteger(n) directly validates if n is an integer.
- It doesn't convert strings or other types to numbers.
- The function is simple and precise.
4. Validate Floating-Point Numbers
Use a combination of checks to ensure a number is a float.
const isFloat = n =>
	typeof n === 'number' && !Number.isInteger(n);
console.log(isFloat(3.14));
console.log(isFloat(42));
console.log(isFloat('3.14'));
- typeof n === 'number' ensures the value is a number.
- !Number.isInteger(n) confirms it's not an integer.
- This validates numbers with decimal points.
5. Range Validation
Ensure a number falls within a specific range.
const inRange = (n, min, max) =>
	n >= min && n <= max;
console.log(inRange(10, 5, 15));
console.log(inRange(20, 5, 15));
console.log(inRange(5, 5, 15));
- The function checks if n is greater than or equal to min and less than or equal to max.
- It’s a quick way to validate ranges.
6. Regex for Strict Validation
Use regular expressions for specific number formats.
const isStrict = s => /^-?\d+(\.\d+)?$/.test(s);
console.log(isStrict('123'));
console.log(isStrict('-123.45'));
console.log(isStrict('abc123')); 
- The regex ^-?\d+(\.\d+)?$ checks for optional negative signs, digits, and decimals.
- This ensures strict numeric validation for strings.
7. Validate Positive Numbers
Check if a number is positive.
const isPos = n => 
    typeof n === 'number' && n > 0;
console.log(isPos(42));
console.log(isPos(-42));
console.log(isPos(0));
- typeof n === 'number' ensures the input is a number.
- n > 0 validates that the number is positive.
- It excludes zero and negative numbers.
8. Validate Negative Numbers
Check if a number is negative.
const isNeg = n => 
    typeof n === 'number' && n < 0;
console.log(isNeg(-42));
console.log(isNeg(42));
console.log(isNeg(0));
- typeof n === 'number' ensures the input is a number.
- n < 0 checks if the number is negative.
- It excludes zero and positive numbers.
9. Validate Even Numbers
Determine if a number is even.
const isEven = n => 
    typeof n === 'number' && n % 2 === 0;
console.log(isEven(4));
console.log(isEven(7));
console.log(isEven(-2));
- typeof n === 'number' ensures the input is a number.
- n % 2 === 0 checks if the remainder is zero when divided by 2.
- It works for both positive and negative numbers.
10. Validate Odd Numbers
Check if a number is odd.
const isOdd = n => 
    typeof n === 'number' && n % 2 !== 0;
console.log(isOdd(7));
console.log(isOdd(4));
console.log(isOdd(-3));
- typeof n === 'number' ensures the input is a number.
- n % 2 !== 0 checks if the remainder is not zero when divided by 2.
- It works for both positive and negative numbers.

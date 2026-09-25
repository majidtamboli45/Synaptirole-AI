# Mathematical functions in MySQL

> Source: https://www.geeksforgeeks.org/mysql/mathematical-functions-in-mysql/

MySQL provides various mathematical functions to perform calculations and mathematical operations on numeric values.
- Perform mathematical calculations on numeric values.
- Round, truncate and modify numbers.
- Calculate powers, square roots and absolute values.
- Useful for numerical and data analysis operations.
Functions
| Function | Description | 
|---|---|
| ABS() | Returns the absolute value of a number. | 
| CEIL() | Returns the smallest integer greater than or equal to a number. | 
| FLOOR() | Returns the largest integer less than or equal to a number. | 
| ROUND() | Rounds a number to the specified number of decimal places. | 
| TRUNCATE() | Truncates a number to the specified decimal places. | 
| POWER() | Returns a number raised to a specified power. | 
| SQRT() | Returns the square root of a number. | 
| MOD() | Returns the remainder of a division. | 
| RAND() | Returns a random floating-point value. | 
| SIGN() | Returns the sign of a number. | 
ABS()
The ABS() function returns the absolute value of a number.
Syntax:
ABS(number);
Example:
SELECT ABS(-25) AS result;
Output:
CEIL()
The CEIL() function returns the smallest integer greater than or equal to a number.
Syntax:
CEIL(number);
Example:
SELECT CEIL(12.34) AS result;
Output:
FLOOR()
The FLOOR() function returns the largest integer less than or equal to a number.
Syntax:
FLOOR(number);
Example:
SELECT FLOOR(12.78) AS result;
Output:
ROUND()
The ROUND() function rounds a number to the specified number of decimal places.
Syntax:
ROUND(number, decimals);
Example:
SELECT ROUND(15.678, 2) AS result;
Output:
TRUNCATE()
The TRUNCATE() function removes decimal places without rounding the number.
Syntax:
TRUNCATE(number, decimals);
Example:
SELECT TRUNCATE(15.678, 2) AS result;
Output:
POWER()
The POWER() function returns a number raised to the specified power.
Syntax:
POWER(number, power);
Example:
SELECT POWER(2, 3) AS result;
Output:
SQRT()
The SQRT() function returns the square root of a number.
Syntax:
SQRT(number);
Example:
SELECT SQRT(64) AS result;
Output:
MOD()
The MOD() function returns the remainder after dividing one number by another.
Syntax:
MOD(number1, number2);
Example:
SELECT MOD(17, 5) AS result;
Output:
RAND()
The RAND() function generates a random floating-point value between 0 and 1.
Syntax:
RAND();
Example:
SELECT RAND() AS random_number;
Output:
SIGN()
The SIGN() function returns the sign of a number.
- Returns 1 for positive numbers.
- Returns -1 for negative numbers.
- Returns 0 for zero.
Syntax:
SIGN(number);
Example:
SELECT SIGN(-25) AS result;
Output:

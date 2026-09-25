# Numeric Functions in SQL

> Source: https://www.geeksforgeeks.org/sql/sql-numeric-functions/

SQL Numeric Functions are built-in operations used to perform mathematical calculations on numeric data. They simplify tasks in reporting, finance and data analysis by handling numbers efficiently.
ABS() – Absolute Value
The ABS() function returns the absolute value of a number, which is the number without its sign (i.e., it converts negative numbers to positive).
Syntax:
SELECT ABS(number);
Example:
SELECT ABS(-25);
Output:
25
CEIL() or CEILING() – Round Number Up
The CEIL() (or CEILING()) function rounds a number up to the nearest integer, regardless of whether the decimal part is greater than or less than 0.5.
Syntax:
SELECT CEIL(number);
Example:
SELECT CEIL(12.34);
Output:
13
FLOOR() – Round Number Down
The FLOOR() function rounds a number down to the nearest integer, ignoring the decimal part.
Syntax:
SELECT FLOOR(number);
Example:
SELECT FLOOR(12.98);
Output:
12
ROUND() – Round a Number to a Specified Decimal Place
The ROUND() function rounds a number to a specified number of decimal places. It is very useful for financial calculations or whenever precise rounding is necessary.
Syntax:
SELECT ROUND(number, decimal_places);
Example:
SELECT ROUND(15.6789, 2);
Output:
15.68
TRUNCATE() – Remove Decimal Places
The TRUNCATE() function is used to remove the decimal portion of a number without rounding. It truncates the number to the specified number of decimal places.
Syntax:
SELECT TRUNCATE(number, decimal_places);
Example:
SELECT TRUNCATE(12.98765, 2);
Output:
12.98
MOD() – Modulo or Remainder
The MOD() function returns the remainder of a division operation (i.e., it computes the modulus). This function is useful for tasks like determining even/odd numbers or finding remainders in mathematical operations.
Syntax:
SELECT MOD(dividend, divisor);
Example:
SELECT MOD(10, 3);
Output:
1
POWER() – Raise a Number to the Power of Another
The POWER() function is used to raise a number to the power of another number. It is often used in mathematical calculations like compound interest or growth rate.
Syntax:
SELECT POWER(base, exponent);
Example:
SELECT POWER(2, 3);
Output:
8
SQRT() – Square Root
The SQRT() function returns the square root of a number. This is useful for mathematical calculations involving geometry or statistical analysis.
Syntax:
SELECT SQRT(number);
Example:
SELECT SQRT(16);
Output:
4
EXP() – Exponential Function
The EXP() function returns the value of e raised to the power of a specified number, where e is the base of the natural logarithm (approximately 2.71828).
Syntax:
SELECT EXP(number);
Example:
SELECT EXP(1);
Output:
2.718281828459045
LOG() – Logarithm
The LOG() function returns the natural logarithm (base e) of a number. You can also use LOG(base, number) to calculate the logarithm of a number with a custom base.
Syntax:
SELECT LOG(number);
SELECT LOG(base, number);
Example:
SELECT LOG(100);
Output:
4.605170186
RAND() – Random Number
The RAND() function generates a random floating-point number between 0 and 1. This function is commonly used for simulations, lotteries or generating random samples.
Syntax:
SELECT RAND();
Example:
SELECT RAND();
Output:
0.287372

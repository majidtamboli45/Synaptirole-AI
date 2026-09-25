# UCASE() or UPPER() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/ucase-or-upper-function-in-mysql/

The UCASE() and UPPER() functions in MySQL convert all lowercase letters in a string to uppercase.
- Both functions return the same result.
- They are useful for standardizing text data.
- They do not change numbers or special characters.
Syntax
UCASE(string);
or
UPPER(string);
Example
SELECT UCASE('hello world') AS result;
Output:
Using UPPER():
SELECT UPPER('hello world') AS result;
Output:
Example with Table
Consider an employees table:
To convert employees names to uppercase:
SELECT employee_id, UPPER(employee_name) AS employee_name
FROM employees;
Output:
Note: UCASE() and UPPER() are equivalent in MySQL.

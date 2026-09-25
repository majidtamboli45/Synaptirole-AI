# Conversion Function in SQL

> Source: https://www.geeksforgeeks.org/sql/sql-conversion-function/

SQL provides data type conversion functions to transform data between different formats such as numbers, text and dates. These functions help ensure accurate query results and proper data handling.
- Converts data between different types like string, numeric and date.
- Ensures accurate and compatible query results.
Types of Data Type Conversion
There are two main types of data type conversion in SQL.
- Implicit Data Type Conversion: Automatic conversion of one data type to another by SQL during query execution.
- Explicit Data Type Conversion: Done by the user when SQL can’t convert automatically or when precise control is needed.
Implicit Data-Type Conversion
Implicit data type conversion, also known as automatic type casting, occurs when SQL automatically converts one data type to another without requiring any intervention from the user.
| From | To | 
|---|---|
| VARCHAR2 or CHAR | NUMBER | 
| VARCHAR2 or CHAR | DATE | 
| DATE | VARCHAR2 | 
| NUMBER | VARCHAR2 | 
Example of Implicit Data Type Conversion
First, we create a demo SQL database and table, on which we can demonstrate the Implicit Data Type Conversion.
Query 1: Using a Numeric Value
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > 15000;
Output:
- Retrieves employee_id, first_name and salary from the employees table.
- Filters and shows only records where salary is greater than 15000.
Query 2: Using a String Value
In this query, we provide the value '15000' as a string and SQL automatically converts it to an integer to match the column data type.
SELECT employee_id,first_name,salary
FROM employees
WHERE salary > '15000';
Output:
- Retrieves employee_id, first_name and salary from the employees table.
- Filters to include only employees with salary greater than 15,000.
- The string '15000' is automatically converted to a number for comparison.
Explicit Data-Type Conversion
Explicit data type conversion (type casting) is the manual conversion of a value from one data type to another. It is used when automatic conversion isn’t possible or when precise control over how data is processed is required.
SQL provides several functions for explicit type conversion, including:
- TO_CHAR(): Converts numbers or dates to a string.
- TO_NUMBER(): Converts a string to a numeric type.
- TO_DATE(): Converts a string to a date.
Example of Explicit Data Type Conversion
These conversion functions (TO_CHAR, TO_NUMBER, TO_DATE) ensure data is stored in one format but can be displayed, compared or processed in another as per the requirement. Consider this table for the examples below:
TO_CHAR Function
TO_CHAR function is used to typecast a numeric or date input to a character type with a format model (optional).
TO_CHAR(expression, 'format_model')
Using the TO_CHAR Function with Dates
TO_CHAR(date, 'format_model')
The format model:
- Must be enclosed in single quotation marks and is case sensitive
- Can include any valid date format element in the query
- Has an fm element to remove padded blanks or suppress leading zeros
- Is separated from the date value by a comma
Query:
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') Month_Hired
FROM employees
WHERE last_name = 'Higgins';
Output :
- Explicitly converts the hire_date from DATE to TEXT using TO_CHAR().
- Displays only records where last_name = 'Higgins'.
Elements of the Date Format Model
They are format codes (like DD, MM, YYYY) used to control how date parts such as day, month and year are displayed or interpreted in SQL.
| Format | Description | 
|---|---|
| YYYY | Full-year in Numbers | 
| YEAR | Year spelled out | 
| YY | Two-digit value of year | 
| MM | Two-digit value for the month | 
| MONTH | Full name of the month | 
| MON | Three Letter abbreviation of the month | 
| D | Number of Days in a Week | 
| DY | Three-letter abbreviation of the day of the week | 
| DAY | Full Name of the Day | 
| DD | Numeric day of the month | 
Date Format Elements - Time Formats
Use the formats listed in the following tables to display time information and literals and to change numerals to spelled numbers.
| ELEMENT | DESCRIPTION | 
|---|---|
| AM or PM | Meridian indicator | 
| A.M. or P.M. | Meridian indicator with periods | 
| HH or HH12 or HH24 | Hour of day or hour (1-12) or hour (0-23) | 
| MI | Minute 0-59 | 
| SS | Second 0-59 | 
| SSSSS | Second past Mid Night 0-86399 | 
Other Formats
Some other formats are shown below:
| ELEMENT | DESCRIPTION | 
|---|---|
| / . , | Punctuation is reproduced in the result | 
| "of the" | The quoted string is reproduced in the result | 
Specifying Suffixes to Influence Number Display
These suffixes control how numbers are displayed, such as showing ordinal or spelled-out formats.
| ELEMENT | DESCRIPTION | 
|---|---|
| TH | Ordinal Number (for example DDTH for 4TH) | 
| SP | Spelled outnumber (for example DDSP for FOUR) | 
| SPTH or THSP | spelled out ordinal numbers (for example DDSPTH for FOURTH) | 
Query:
SELECT last_name,
TO_CHAR(hire_date, 'fmDD Month YYYY')
AS HIREDATE
FROM employees;
Output :
- Converts hire_date into a readable text format like “25 January 2005” using explicit type conversion.
- Displays each employee’s last name with the formatted hire date.
Using the TO_CHAR Function with Numbers
The TO_CHAR() function is used to convert numeric values into formatted text, allowing control over number display such as decimals, commas and currency symbols.
Syntax:
TO_CHAR(number, 'format_model')
These are some of the format elements you can use with the TO_CHAR function to display a number value as a character :
| Format | Description | 
|---|---|
| 9 | Represent a number | 
| 0 | Forces a zero to be displayed | 
| $ | places a floating dollar sign | 
| L | It uses the floating local currency symbol | 
| . | Print a decimal point | 
| , | Prints a Thousand indicator | 
Query:
SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM employees
WHERE last_name = 'Clark';
Output:
- Formats salary with currency symbols using TO_CHAR().
- Displays result only for employee with last name 'Clark'.
Using the TO_NUMBER and TO_DATE Functions
Convert a character string to a number format using the TO_NUMBER function :
TO_NUMBER(char, 'format_model')
Convert a character string to a date format using the TO_DATE function:
TO_DATE(char, 'format_model')
These functions have an fx modifier. This modifier specifies the exact matching for the character argument and date format model of a TO_DATE function.
Query:
SELECT last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('June 20, 2004', 'fxMonth DD, YYYY');
Output:
- TO_NUMBER() converts a text (character) value into a numeric format.
- TO_DATE() converts a text value into a date using a specified format and the fx modifier enforces an exact date format match.

# String Functions

> Source: https://www.geeksforgeeks.org/mysql/mysql-string-functions/

MySQL provides String Functions to perform operations on text values, such as combining, modifying, searching and extracting strings.
- Used to manipulate and process text data.
- Help combine, extract and modify string values.
- Can be used with SELECT queries.
- Useful for data cleaning and formatting.
Common MySQL String Functions
| Function | Description | 
|---|---|
| CONCAT() | Combines two or more strings. | 
| CONCAT_WS() | Combines strings using a separator. | 
| LENGTH() | Returns the length of a string in bytes. | 
| CHAR_LENGTH() | Returns the number of characters in a string. | 
| UPPER() | Converts a string to uppercase. | 
| LOWER() | Converts a string to lowercase. | 
| TRIM() | Removes leading and trailing spaces. | 
| LTRIM() | Removes leading spaces. | 
| RTRIM() | Removes trailing spaces. | 
| SUBSTRING() | Extracts a part of a string. | 
| LEFT() | Returns characters from the beginning of a string. | 
| RIGHT() | Returns characters from the end of a string. | 
| REPLACE() | Replaces part of a string with another value. | 
| REVERSE() | Reverses a string. | 
| INSTR() | Finds the position of a substring. | 
CONCAT()
The CONCAT() function combines two or more strings into a single string.
Syntax:
CONCAT(string1, string2, ...);
Example:
SELECT CONCAT('Hello', ' ', 'World') AS result;
Output:
CONCAT_WS()
The CONCAT_WS() function combines strings using a specified separator.
Syntax:
CONCAT_WS(separator, string1, string2, ...);
Example:
SELECT CONCAT_WS('-', '2026', '08', '13') AS result;
Output:
LENGTH()
The LENGTH() function returns the length of a string in bytes.
Syntax:
LENGTH(string);
Example:
SELECT LENGTH('MySQL') AS length;
Output:
CHAR_LENGTH()
The CHAR_LENGTH() function returns the number of characters in a string.
Syntax:
CHAR_LENGTH(string);
Example:
SELECT CHAR_LENGTH('MySQL') AS characters;
Output:
UPPER()
The UPPER() function converts all characters in a string to uppercase.
Syntax:
UPPER(string);
Example:
SELECT UPPER('mysql') AS result;
Output:
LOWER()
The LOWER() function converts all characters in a string to lowercase.
Syntax:
LOWER(string);
Example:
SELECT LOWER('MYSQL') AS result;
Output:
TRIM()
The TRIM() function removes leading and trailing spaces from a string.
Syntax:
TRIM(string);
Example:
SELECT TRIM('  MySQL  ') AS result;
Output:
LTRIM()
The LTRIM() function removes spaces from the beginning of a string.
Syntax:
LTRIM(string);
Example:
SELECT LTRIM('  MySQL') AS result;
Output:
RTRIM()
The RTRIM() function removes spaces from the end of a string.
Syntax:
RTRIM(string);
Example:
SELECT RTRIM('MySQL  ') AS result;
Output:
SUBSTRING()
The SUBSTRING() function extracts a portion of a string.
Syntax:
SUBSTRING(string, start, length);
Example:
SELECT SUBSTRING('MySQL Database', 1, 5) AS result;
Output:
LEFT()
The LEFT() function returns a specified number of characters from the beginning of a string.
Syntax:
LEFT(string, number);
Example:
SELECT LEFT('MySQL Database', 5) AS result;
Output:
RIGHT()
The RIGHT() function returns a specified number of characters from the end of a string.
Syntax:
RIGHT(string, number);
Example:
SELECT RIGHT('MySQL Database', 8) AS result;
Output:
REPLACE()
The REPLACE() function replaces a specified part of a string with another value.
Syntax:
REPLACE(string, old_string, new_string);
Example:
SELECT REPLACE('MySQL Database', 'MySQL', 'SQL') AS result;
Output:
REVERSE()
The REVERSE() function reverses a string.
Syntax:
REVERSE(string);
Example:
SELECT REVERSE('MySQL') AS result;
Output:
INSTR()
The INSTR() function returns the position of the first occurrence of a substring in a string.
Syntax:
INSTR(string, substring);
Example:
SELECT INSTR('MySQL Database', 'Database') AS position;
Output:

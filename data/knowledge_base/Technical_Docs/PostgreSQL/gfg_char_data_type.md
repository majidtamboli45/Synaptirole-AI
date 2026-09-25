# CHAR Data Type

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-char-data-type/

The CHAR data type in PostgreSQL is one of the essential character data types for storing fixed-length strings. Unlike VARCHAR, which stores variable-length data, CHAR is used when we need to store a fixed-length string.
This article will explain the CHAR data type in PostgreSQL, its syntax, common use cases, and practical examples with outputs, making sure you understand how to use it effectively.
What is CHAR in PostgreSQL?
The CHAR data type in PostgreSQL stores fixed-length character strings. When we define a CHAR(n) column, n specifies the maximum number of characters the column can store. If the input string is shorter than the defined length, PostgreSQL will pad the string with spaces to match the specified length. 
However, any attempt to store a string longer than the specified length will result in an error unless the string is padded with spaces, which PostgreSQL will trim. The CHAR type is best used when we need data that follows a consistent length or when we need to ensure fixed-width formatting for specific data types like country codes and currency symbols.
Syntax
variable_name CHAR(n)
Key Terms
- n : Specifies the fixed length of the character field.n must be a positive integer. Ifn is not specified, it defaults to 1.
- Default: If the length n is not mentioned, the default value isCHAR(1) , meaning it stores a single characte
Examples of PostgreSQL CHAR Data Type
Let us take a look at some of the practical examples of using the CHAR Data Type in PostgreSQL to better understand the concept and how this data type works.
Example 1: Creating a Table with CHAR Columns
We will create a char_test table with two columns: x (a fixed-length character column with a length of 1) and y (a fixed-length character column with a length of 10). The following SQL query demonstrates this:
Query:
CREATE TABLE char_test (
id serial PRIMARY KEY,
x CHAR (1),
y CHAR(10)
);
Example 2: Inserting Data That Exceeds the Defined Length
Let’s try inserting data into the char_test table that exceeds the defined lengths of the x and y columns using below command. 
Query:
INSERT INTO char_test (x, y)
VALUES
(
'Geeks',
'This is a test for char'
);
At this stage PostgreSQL will raise an error as the data type of the x column is 'CHAR(1)' and we tried to insert a string with three characters into this column as shown below:
Output
ERROR:  value too long for type character(1)
Fixing the Error for Column 'x'
To correct the errors and insert valid data, we can fix the string lengths. This below query works because the x column is defined as CHAR(1), and we are only inserting one character.
Query:
INSERT INTO char_test (x, y)
VALUES
(
'G',
'This is a test for char'
);
Example 3: Inserting Data That Exceeds the Defined Length for Column y
Let’s try inserting data into the char_test table that exceeds the defined lengths of the x and y columns. Now, we will get the same error for the y column as the number of characters entered is greater than 10 as shown below: 
Query:
INSERT INTO char_test (x, y)
VALUES
('G', 'This is a test for char');
Output
ERROR:  value too long for type character(10)
Fixing the Error for Column 'y'
To correct the errors and insert valid data, we can fix the string lengths. Here, we have inserted a string of exactly 10 characters into the y column, including trailing spaces to meet the CHAR(10) requirement.
Query:
INSERT INTO char_test (x, y)
VALUES
(
'G',
'hello Geek'
);
Now that we have managed to successfully assign the values to the character data type, check it by running the below command:
SELECT * FROM char_test;
Output
Important Points About PostgreSQL CHAR Data Type
- If no length (n ) is specified, 'CHAR' defaults to'CHAR(1)' , meaning it will store only a single character.
- While CHAR(n) can have marginally better performance for fixed-length data due to its predictable size, the performance difference betweenCHAR andVARCHAR is typically negligible for most applications.
- Carefully choose CHAR(n) lengths to balance between storage efficiency and the need for consistent data formatting.
- String comparisons in CHAR columns include trailing spaces, which can lead to unexpected results.
Conclusion
The CHAR data type in PostgreSQL is a powerful tool for storing fixed-length character strings. Understanding how to define CHAR(n) columns and handle string lengths effectively is important for efficient database management. While CHAR may not be as commonly used as VARCHAR, it provides a predictable structure that can be helpful in certain situations.

# CONVERT( ) Function

> Source: https://www.geeksforgeeks.org/mysql/mysql-convert-function/

The MySQL CONVERT() function is used for converting a value from one datatype to a different datatype. The MySQL CONVERT() function is also used for converting a value from one character set to another character set. It accepts two parameters which are the input value and the type to be converted in.
The CONVERT() function returns the value in the specified datatype or character set.
Syntax for converting datatypes:
CONVERT( input_value, data_type )
Syntax for converting character sets:
CONVERT( input_value USING character_set )
Parameters Used:
input_value - It is used to specify the input value.
data_type - It is used to specify the desired datatype to be converted in.
character_set - It is used to specify the desired character set to be converted in.
Return Value:
The CONVERT() function returns the value in the specified datatype or character set.
Supported Versions of MySQL:
SELECT CONVERT(198, CHAR); 
Output:
198 
Example-2: Implementing CONVERT() function to convert a value to datetime datatype.
2019-11-19 00:00:00 
Example-3: Implementing CONVERT() function to convert a value to UNSIGNED type.
SELECT CONVERT(2-5, UNSIGNED); 
Output:
18446744073709551613 
Example-4: Implementing CONVERT() function to convert a string value to utf8 character set.
geeksforgeeks 
CONVERT( input_value, data_type )
CONVERT( input_value USING character_set )
- MySQL 5.7
- MySQL 5.6
- MySQL 5.5
- MySQL 5.1
- MySQL 5.0
- MySQL 4.1
- MySQL 4.0
- MySQL 3.23
SELECT CONVERT(198, CHAR); 
198 
SELECT CONVERT('2019-11-19', DATETIME); 
Output:
2019-11-19 00:00:00 
SELECT CONVERT(2-5, UNSIGNED); 
18446744073709551613 
SELECT CONVERT('geeksforgeeks' USING utf8); 
Output:
geeksforgeeks

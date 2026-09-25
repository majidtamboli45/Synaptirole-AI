# INSERT() function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/insert-function-in-mysql/

INSERT() :
This function in MySQL is used for inserting a string within a string, removing a number of characters from the original string.
Syntax :
INSERT(str, pos, len, newstr)
Parameters :
This method accepts four parameter.
Example-2 :
The following MySQL statement returns Original string, the actual string itself. This happens because the position of insertion, which is specified as -5, is out of range, so no insertion takes place.
Example-3 :
The following MySQL statement returns a completely new string. This happens because the position of insertion is 1 and length is number of character in previous string.
INSERT(str, pos, len, newstr)
- str - Original string in which we want to insert another string.
- pos - The position where we want to insert another string.
- len - The number of characters to replace.
- newstr - The string to be inserted.
SELECT INSERT("geeksforgeeks", 9, 5, "MySQL") 
AS NewString ;
Output :
| NEWSTRING | 
|---|
| geeksformysql | 
SELECT INSERT("geeksforgeeks", -5, 5, "MySQL") 
AS NewString ;
Output :
| NEWSTRING | 
|---|
| geeksforgeeks | 
SELECT INSERT("geeksforgeeks", 1, 13, "stackoverflow") 
AS NewString ;
Output :
| NEWSTRING | 
|---|
| stackoverflow |

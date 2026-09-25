# LOWER function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-lower-function/

The LOWER() function in PostgreSQL converts all uppercase letters in a string to lowercase based on the database's locale rules.
- Convert text to lowercase.
- Standardize string values.
- Perform case-insensitive searches.
- Format text consistently.
Syntax
LOWER(string)
Where:
- string: The text or column value to convert to lowercase. It can be of type CHAR, VARCHAR or TEXT.
Working
Consider the following Books table for the examples below:
Example 1: Convert a String to Lowercase
The following query converts the string 'PostgreSQL' to lowercase.
Query:
SELECT LOWER('PostgreSQL') AS LowerText;
Output:
- The LOWER() function converts all uppercase letters in the string to lowercase.
Example 2: Convert Book Titles to Lowercase
The following query converts the book titles to lowercase.
Query:
SELECT
LOWER(BookTitle) AS LowerBookTitle
FROM
Books
ORDER BY
BookTitle;
Output:
- The LOWER() function converts all characters in the BookTitle column to lowercase.
Example 3: Using LOWER() in the WHERE Clause
The following query retrieves books in the Programming category by comparing the lowercase value.
Query:
SELECT
BookTitle,
Category
FROM
Books
WHERE
LOWER(Category) = 'programming';
Output:
- The LOWER() function converts the Category value to lowercase before comparison, allowing a case-insensitive search.

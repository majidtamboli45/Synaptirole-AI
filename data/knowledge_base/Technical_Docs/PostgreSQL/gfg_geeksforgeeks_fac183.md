# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-in-operator/

The IN operator in PostgreSQL is used to check whether a value matches any value in a specified list. It provides a simple way to compare a column against multiple values without using multiple OR conditions.
- Can be used with SELECT, UPDATE and DELETE statements.
- Can also be used with a subquery.
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE column_name IN (value1, value2, value3, ...);
Where:
- column_name: The column to compare.
- value1, value2, ...: The list of values to match.
Examples
Consider the following Books table:
Example: Using the PostgreSQL IN Operator with a List of Numbers
The following query retrieves books whose IDs are 101, 103 and 105.
SELECT BookID,
BookTitle
FROM Books
WHERE BookID IN (101, 103, 105);
Output:
The following query produces the same result using the = and OR operators.
SELECT BookID,
BookTitle
FROM Books
WHERE BookID = 101
OR BookID = 103
OR BookID = 105;
The query using the IN operator is shorter and easier to read than using multiple OR conditions.
Example: Using the PostgreSQL IN Operator with a List of Strings
The following query retrieves books that belong to the Programming and AI categories.
SELECT BookTitle,       CategoryFROM BooksWHERE Category IN ('Programming', 'AI')ORDER BY Category;
Output:
The IN operator simplifies comparisons with multiple string values.
Example: Using IN with NOT
The following query retrieves books except those in the Programming and AI categories.
SELECT BookID,
BookTitle,
Category
FROM Books
WHERE Category NOT IN ('Programming', 'AI');
Output:

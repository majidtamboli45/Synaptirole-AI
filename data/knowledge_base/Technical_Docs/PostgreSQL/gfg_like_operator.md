# LIKE operator

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-like-operator/

The PostgreSQL LIKE operator searches for a specified pattern in a text value. It is commonly used with wildcard characters to perform flexible string matching in SQL queries.
- Matches text based on a specified pattern.
- Supports wildcard characters (% and _) for flexible searches.
Syntax
SELECT column_name
FROM table_name
WHERE column_name LIKE pattern;
Where:
- LIKE: Matches a column value against a specified pattern.
- pattern: A combination of text and wildcard characters used for matching.
Wildcard Characters
- % : Matches zero or more characters.
- _ : Matches exactly one character.
Examples
Consider the following Customers table for the examples below:
Example 1: Find Names Starting with 'Jen'
Query:
SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'Jen%';
Output:
- % wildcard matches zero or more characters after Jen, so it returns all names that begin with Jen.
Example 2: Find Names Containing 'es'
Query:
SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%es%';
Output:
- % wildcard before and after es matches any characters, so the query returns names containing es anywhere in the string.
Example 3: Use Both % and _ Wildcards
Query:
SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '_e%';
Output:
- _ wildcard matches exactly one character, followed by e, while % matches any remaining characters.
Example 4: Find Names That Do Not Start with 'Jen'
Query:
SELECT FirstName, LastName
FROM Customers
WHERE FirstName NOT LIKE 'Jen%';
Output:
- NOT LIKE operator returns rows whose FirstName does not begin with Jen.

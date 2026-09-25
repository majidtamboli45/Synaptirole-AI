# MySQL LIKE Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-like-operator/

The LIKE operator in MySQL is used to search for a specified pattern in a column. It is commonly used with the WHERE clause in SELECT statements to filter rows based on partial matches.
- Uses wildcard character '%' to match any number of characters to define search patterns.
- Uses '_' to match exactly one character to define search patterns.
- Helps in flexible searching, such as finding names starting with a letter, ending with a word, or containing specific text.
Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
- column1, column2, ...: The columns you want to retrieve.
- table_name: The table from which you are getting data.
- columnN: The column to search.
- pattern: The pattern you're looking for.
Working with the LIKE Operator
To understand the MySQL LIKE operator, we will first create a sample table and then run some queries to see how it works:
Example 1: Search for Names Starting with 'J'
This example retrieves all employees whose names begin with the letter 'J' using the % wildcard.
Query:
SELECT * FROM employees
WHERE name LIKE 'J%';
Output:
- This query filters all employees whose names start with 'J'.
- The % wildcard matches any number of characters after 'J'.
Example 2: Search for Names Ending with 'a'
This example finds employees whose names end with the letter 'a' using a wildcard at the beginning.
Query:
SELECT * FROM employees
WHERE name LIKE '%a';
Output:
- This query retrieves employees whose names end with 'a'.
- The % wildcard matches any characters before 'a'.
Example 3: Search for Names Containing 'ia'
This example filters employees whose names contain the substring 'ia' anywhere in the text.
Query:
SELECT * FROM employees
WHERE name LIKE '%ia%';
Output:
- This query finds employees whose names contain 'ia' anywhere in the string.
- The % wildcard matches any characters before and after 'ia'.
Example 4: Search for Names with 'i' as the Second Character
This example selects employees whose names have 'i' as the second character using _ wildcard.
Query:
SELECT * FROM employees
WHERE name LIKE '_i%';
Output:
- This query selects employees whose names have 'i' as the second character.
- The _ wildcard matches exactly one character before 'i'.

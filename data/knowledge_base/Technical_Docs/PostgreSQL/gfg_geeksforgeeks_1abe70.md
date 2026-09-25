# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-where-clause/

The WHERE clause in PostgreSQL is used to filter rows based on a specified condition. It returns only the records that satisfy the condition, making it easier to retrieve specific data from a table.
- Can be used with SELECT, UPDATE and DELETE statements.
- Supports comparison, logical and special operators.
- Allows multiple conditions using AND, OR and NOT.
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition;
Where:
- column1, column2, ... : The columns to retrieve.
- table_name: The table from which data is retrieved.
- condition: The condition used to filter rows.
Working
First, create the following Movie table, which will be used in the examples below.
Example 1: Using WHERE with a Comparison Operator
The following query retrieves movies with a rating greater than 8.5.
SELECT MovieTitle, Rating
FROM Movies
WHERE Rating > 8.5;
Output:
Example 2: Using WHERE with a String Condition
The following query retrieves movies from the Sci-Fi genre.
SELECT *
FROM Movies
WHERE Genre = 'Sci-Fi';
Output:
Example 3: Using WHERE with Multiple Conditions
The following query retrieves Sci-Fi movies with a rating greater than 8.7.
SELECT MovieTitle, Rating
FROM Movies
WHERE Genre = 'Sci-Fi'
AND Rating > 8.7;
Output:
Example 4: Using WHERE with UPDATE
The following query updates the rating of the movie Inception to 9.0.
UPDATE Movies
SET Rating = 9.0
WHERE MovieTitle = 'Inception';
Output:
- The UPDATE statement modifies existing records in the Movies table.
- The WHERE clause ensures that only the row where MovieTitle is 'Inception' is updated.
- Without the WHERE clause, the Rating value of all movies would be updated.

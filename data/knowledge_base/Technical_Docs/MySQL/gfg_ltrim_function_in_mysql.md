# LTRIM() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/ltrim-function-in-mysql/

The LTRIM() function in MySQL removes leading spaces from the left side of a string.
- Removes leading spaces from text
- Useful for cleaning string data.
- Helps standardize text values in databases.
Syntax
LTRIM(string);
- string: The string from which leading spaces are removed.
Example:
SELECT LTRIM('     GeeksforGeeks') AS trimmedString;
Output:
Example: LTRIM() on a Table Column
Create a table with names containing leading spaces:
CREATE TABLE users (
    name VARCHAR(45)
);
INSERT INTO users (name) VALUES
('   Alice'),
('   Bob'),
('   Charlie'),
('   David'),
('   Eve');
To remove the leading spaces:
SELECT LTRIM(name) AS trimmedName
FROM users;
Output:
- Here, LTRIM() removes the leading spaces from the name column.

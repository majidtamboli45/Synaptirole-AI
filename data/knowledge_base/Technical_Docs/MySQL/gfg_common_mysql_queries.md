# Common MySQL Queries

> Source: https://www.geeksforgeeks.org/mysql/mysql-common-mysql-queries/

MySQL Server is an open-source relational database management system widely used for web applications to store and manage data efficiently. It powers many modern websites by enabling reliable data storage and seamless data exchange.
- Supports key data operations like querying, sorting, filtering, grouping, modifying, and joining tables.
- Forms the backbone of dynamic applications where structured data handling is essential.
- Preferred for web apps due to its performance, scalability, and ease of use.
Queries
Queries are commands used to interact with database tables and manipulate data. Some commonly used MySQL queries, operators, and functions are listed below:
1. SHOW DATABASES
Displays all the databases available on the MySQL server, allowing users to view and verify existing databases before performing any operations.
Syntax:
SHOW DATABASES;
- Includes both user-created and system databases like mysql and information_schema.
- Commonly used as a first step to check available databases in the server.
2. USE database_name
Sets a specific database as the active database so that all subsequent queries are executed within that database.
Syntax:
USE database_name;
SELECT DATABASE();
- Essential before performing operations like creating tables or fetching data.
- SELECT DATABASE() helps confirm which database is currently selected.
3. DESCRIBE table_name
Provides detailed information about the structure of a table, including column names, data types, and constraints.
Syntax:
DESCRIBE table_name;
- Displays important metadata such as field type, null values, keys, and defaults.
- Useful when analyzing or debugging table structure.
4. SHOW TABLES
Lists all the tables present in the currently selected database, helping users understand the database structure.
Syntax:
SHOW TABLES;
- Works only after selecting a database using USE.
- Helps quickly verify whether required tables exist.
5. SHOW CREATE TABLE table_name
Displays the complete SQL statement used to create a specific table, including all constraints and settings.
Syntax:
SHOW CREATE TABLE table_name;
- Useful for recreating tables or understanding schema design.
- Shows engine type, keys, and full column definitions.
6. SELECT NOW()
Returns the current date and time from the MySQL server, which is useful for time-based operations.
Query:
SELECT NOW();
Output:
- Commonly used in logging, auditing, and timestamp-related queries.
- Reflects server time, not client system time.
7. SELECT (Expressions)
Allows execution of calculations or evaluation of expressions without referencing any table.
Query:
SELECT 2 + 4;
SELECT 2 + 4, CURDATE();
Output :
- Can be used to test expressions or built-in functions.
- Helpful for quick calculations and debugging queries.
8. Comments
Used to include notes or explanations inside SQL queries, improving readability and maintainability of code.
Example:
/* Multi-line comment */
# Single-line comment
-- Single-line comment
- Does not affect query execution.
- Useful for documenting complex queries or disabling parts of code.
9. CREATE DATABASE
Creates a new database where tables and data can be stored and managed.
Syntax:
CREATE DATABASE database_name;
- Used at the initial stage of application development.
- Helps organize data into separate logical containers.
10. DROP DATABASE
Deletes an existing database along with all its tables and data permanently.
Syntax:
DROP DATABASE database_name;
- Should be used carefully as data cannot be recovered after deletion.
- Often restricted to admin-level users for safety.
11. CREATE TABLE
Creates a new table in the database with specified columns, data types, and constraints. It defines how data will be structured and stored in the database.
Syntax:
CREATE TABLE table_name (
column1 datatype constraints,
column2 datatype constraints,
....,
columnN datatype constraints
);
Query:
CREATE TABLE employee(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
profile VARCHAR(40) DEFAULT 'engineer'
) ENGINE = InnoDB;
- Constraints like PRIMARY KEY, NOT NULL, and DEFAULT help maintain data integrity.
- InnoDB storage engine supports transactions and foreign key relationships.
12. AUTO_INCREMENT
Used to automatically generate unique sequential values for a column, typically for primary keys in a table.
Syntax:
column_name INT AUTO_INCREMENT
- Ensures each record gets a unique identifier without manual input.
- Commonly used in ID columns to avoid duplication issues.
13. DROP TABLE
Deletes an existing table from the database along with all its data and structure permanently.
Syntax:
DROP TABLE table_name;
- Removes both table structure and stored records permanently.
- Should be used carefully as data cannot be recovered after deletion.
14. RENAME TABLE
Renames an existing table to a new name without affecting its data or structure.
Syntax:
RENAME TABLE old_table_name TO new_table_name;
- Useful for improving naming conventions or restructuring databases.
- Does not impact existing data or relationships.
15. ALTER TABLE (ADD COLUMN)
Adds one or more new columns to an existing table, allowing modification of table structure after creation.
Syntax:
ALTER TABLE table_name ADD column_name datatype;
- Helps extend table structure when new data requirements arise.
- Does not affect existing data in other columns.
16. ALTER TABLE (DROP COLUMN)
Removes a column from an existing table along with all its stored data.
Syntax:
ALTER TABLE table_name DROP COLUMN column_name;
- Permanently deletes both the column and its data, so it should be used carefully.
- Useful for cleaning up unused or redundant fields to keep the database optimized.
17. INSERT INTO
Inserts new records into a table by specifying column names and corresponding values. It is one of the most commonly used queries to add data into a database.
Syntax:
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
Query:
INSERT INTO employee (name, profile)
VALUES ('John', 'Developer');
Output:
- Multiple rows can be inserted in a single query by adding multiple value sets.
- Specifying column names ensures correct data insertion even if table structure changes.
- id is auto-generated using AUTO_INCREMENT, so no need to insert it manually.
18. UPDATE
Updates existing records in a table based on specified conditions, allowing modification of stored data without deleting it.
Syntax:
UPDATE table_name
SET column1 = value1
WHERE condition;
Query:
UPDATE employee
SET profile = 'Manager'
WHERE id = 1;
Output:
- The WHERE clause is crucial to target specific rows; otherwise, all rows will be updated.
- Useful for correcting or modifying existing data in a controlled way.
19. DELETE
Deletes records from a table based on a given condition. It is used to remove unwanted or outdated data from the database.
Syntax:
DELETE FROM table_name WHERE condition;
- If the WHERE clause is omitted, all records in the table will be deleted.
- Helps maintain clean and relevant data in the database.
20. SELECT with WHERE
Retrieves specific records from a table that satisfy a given condition, making it possible to filter data effectively.
Syntax:
SELECT column1 FROM table_name WHERE condition;
Query:
SELECT name FROM employee WHERE profile = 'Manager';
Output:
- Allows precise data retrieval instead of fetching all records.
- Commonly used with operators like AND, OR, IN, and BETWEEN.
21. SELECT *
Fetches all columns and all records from a table without specifying individual column names.
Syntax:
SELECT * FROM table_name;
Query:
SELECT * FROM Student;
Output:
- Simple and useful for quick data retrieval or debugging.
- Not recommended for large tables as it may impact performance.
22. COUNT()
Returns the total number of rows in a table or the number of rows that match a specific condition.
Syntax:
SELECT COUNT(*) FROM table_name;
Query:
SELECT COUNT(*) FROM Student;
Output:
- Works as an aggregate function for summarizing data.
- Can be combined with WHERE clause to count filtered records.
23. MAX()
Returns the maximum (highest) value from a specified column, useful for identifying top values in a dataset.
Syntax:
SELECT MAX(column_name) FROM table_name;
Query:
SELECT MAX(marks) FROM Student;
Output:
- Works with numeric as well as string values.
- Often used in reporting and analytical queries.
24. MIN()
Returns the minimum (lowest) value from a specified column, helping identify the smallest value in a dataset.
Syntax:
SELECT MIN(column_name) FROM table_name;
- Useful for comparisons and statistical analysis.
- Can be combined with conditions for more refined results.
Query:
SELECT MIN(marks) FROM Student;
-- Nested Query
SELECT MIN(marks)
FROM Student
WHERE marks > ( SELECT MIN(marks) from Student);
Output:
- The first query returns the lowest marks from the Student table, i.e., the minimum value present in the marks column.
- The nested query returns the second lowest marks, by selecting the minimum marks that are greater than the overall minimum.
25. LIMIT
Restricts the number of rows returned in a query result, helping control output size and improve performance.
Syntax:
SELECT * FROM table_name LIMIT number;
Query:
SELECT * FROM Student LIMIT 2;
Output:
- Commonly used in pagination to display limited records per page.
- Can also include offset to skip a specific number of rows.
26. BETWEEN
Filters records where a column value falls within a specified range, including both lower and upper limits.
Syntax:
SELECT * FROM table_name WHERE column BETWEEN value1 AND value2;
Query:
SELECT * FROM Student WHERE grade BETWEEN 4 AND 6;
Output:
- Works with numbers, dates, and even text values.
- Simplifies range-based conditions compared to multiple comparisons.
27. DISTINCT
Returns only unique values from a column by removing duplicate entries from the result set.
Syntax:
SELECT DISTINCT column_name FROM table_name;
Query:
SELECT DISTINCT city FROM Student;
Output:
- Helps identify unique records in a dataset.
- Useful in reporting and eliminating redundant data.
28. IN
Checks whether a column value matches any value from a specified list, simplifying multiple OR conditions.
Syntax:
SELECT * FROM table_name WHERE column IN (value1, value2);
Query:
SELECT * FROM Student WHERE grade IN (6, 7, 8, 9);
- Improves readability compared to multiple OR conditions.
- Efficient for matching against a predefined set of values.
29. AND
Combines multiple conditions where all conditions must be true for a record to be included in the result.
Syntax:
SELECT * FROM table_name WHERE condition1 AND condition2;
Query:
SELECT * FROM Student WHERE marks > 90 AND grade = 7;
Output:
- Produces a more filtered and precise result set.
- Commonly used with WHERE clause for strict filtering.
30. OR
Returns records if at least one of the specified conditions is true, allowing broader filtering.
Syntax:
SELECT * FROM table_name WHERE condition1 OR condition2;
Query:
SELECT * FROM Student WHERE city = 'London' OR city = 'Berlin';
Output:
- Expands result set compared to AND condition.
- Useful when multiple alternative conditions are acceptable.
31. IS NULL
Checks whether a column contains NULL (missing or undefined) values in the table.
Query:
SELECT * FROM Student WHERE city IS NULL;
- Important for handling incomplete or missing data.
- NULL values cannot be compared using = operator.
32. FOREIGN KEY
Defines a relationship between two tables by linking a column to the primary key of another table.
Syntax:
FOREIGN KEY (column_name) REFERENCES parent_table(column_name);
- Ensures referential integrity between related tables.
- Prevents insertion of invalid or inconsistent data.
33. LIKE
Searches for records that match a specified pattern in a column, commonly used with text data.
Syntax:
SELECT * FROM table_name WHERE column LIKE pattern;
Query:
-- Matches names with "m" as the second character
SELECT * FROM Student WHERE name LIKE '_m%';
-- Matches names containing "ia" anywhere in the string
SELECT * FROM Student WHERE name LIKE '%ia%';
Output:
- % represents any number of characters, while _ represents a single character.
- Useful for flexible and partial matching in search operations.
34. JOINS
Joins are used to combine data from two or more tables based on a common column, allowing retrieval of related information stored across multiple tables.
Syntax:
SELECT columns
FROM table1
JOIN table2 ON condition;
INNER JOIN (Regular Join):
Returns only the records that have matching values in both tables based on the given condition.
SELECT student.name, department.name 
FROM student
JOIN department ON student.department = department.name;
- Only matching records from both tables are included.
- Unmatched rows from either table are excluded.
LEFT JOIN:
Returns all records from the left table and the matching records from the right table. If no match is found, NULL values are returned for the right table.
SELECT student.name, department.name 
FROM student
LEFT JOIN department ON student.department = department.name;
- Includes all rows from the left table regardless of matches.
- Non-matching rows from the right table appear as NULL.
RIGHT JOIN:
Returns all records from the right table and the matching records from the left table. If no match is found, NULL values are returned for the left table.
SELECT student.name, department.name 
FROM student
RIGHT JOIN department ON student.department = department.name;
- Includes all rows from the right table regardless of matches.
- Non-matching rows from the left table appear as NULL.

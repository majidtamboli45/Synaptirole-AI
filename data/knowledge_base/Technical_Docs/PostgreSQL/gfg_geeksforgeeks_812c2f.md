# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-limit-clause/

The LIMIT clause in PostgreSQL is used to restrict the number of rows returned by a query. It is commonly used to retrieve only a specific number of records from a table, making query results easier to manage and improving performance when working with large datasets.
- Commonly used with the ORDER BY clause to retrieve the top or bottom records.
- Helps improve performance by limiting the result set.
- Can be combined with the OFFSET clause for pagination.
Syntax
SELECT column1, column2, ...
FROM table_name
LIMIT number_of_rows;
Where:
- column1, column2, ... : The columns to retrieve.
- table_name: The name of the table.
- LIMIT: Restricts the number of rows returned.
- number_of_rows: The maximum number of rows to display.
Examples
Firstly, create a Student table and insert some records into it.
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Course VARCHAR(50),
    Age INT
);
INSERT INTO Student (StudentID, FirstName, LastName, Course, Age)
VALUES
(101, 'John', 'Smith', 'Computer Science', 20),
(102, 'Emma', 'Johnson', 'Mathematics', 21),
(103, 'Michael', 'Brown', 'Physics', 22),
(104, 'Olivia', 'Davis', 'Chemistry', 20),
(105, 'William', 'Wilson', 'Biology', 23);
Output:
Example 1: Retrieve the First Three Rows
The following query returns only the first three rows from the Student table.
Query:
SELECT * FROM StudentLIMIT 3;
Output:
Example 2: Retrieve the Two Oldest Students
The following query sorts students by age in descending order and returns the first two rows.
SELECT * FROM Student
ORDER BY Age DESC
LIMIT 2;
Output:
Example 3: Use LIMIT with a WHERE Clause
The following query retrieves the first two students whose age is greater than 20.
Query:
SELECT * FROM Student
WHERE Age > 20
LIMIT 2;
Output:
Example 4: Use LIMIT with OFFSET
The following query skips the first two rows and returns the next two rows.
Query:
SELECT * FROM Student
ORDER BY StudentID
LIMIT 2 OFFSET 2;
Output:
Example 5: Retrieve the Youngest Student
The following query sorts students by age in ascending order and returns only the first row.
Query:
SELECT * FROM Student
ORDER BY Age ASC
LIMIT 1;
Output:
Troubleshooting LIMIT Clause Issues
- Unexpected rows returned: Use the ORDER BY clause to ensure the results are returned in the desired order before applying LIMIT.
- Need pagination: Combine LIMIT with the OFFSET clause to retrieve different sets of rows.
- Large result sets: Using LIMIT reduces the amount of data returned, improving query performance.
- Non-deterministic results: Without an ORDER BY clause, PostgreSQL does not guarantee the order of returned rows, so the rows returned by LIMIT may vary.

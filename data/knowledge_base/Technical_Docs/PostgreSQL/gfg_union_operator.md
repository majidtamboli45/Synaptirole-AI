# UNION operator

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-union-operator/

The UNION operator in PostgreSQL is used to combine the results of two or more SELECT statements into a single result set. It automatically removes duplicate rows from the combined result.
- Each SELECT statement must return the same number of columns.
- Corresponding columns must have compatible data types.
Syntax
SELECT column1, column2, ...FROM table1UNIONSELECT column1, column2, ...FROM table2;
Where:
- table1 and table2: The tables whose results are combined.
- column1, column2, ...: The columns to retrieve. Each SELECT statement must have the same number of columns with compatible data types.
- UNION: Combines the result sets and removes duplicate rows.
Examples
Firstly, create two tables and insert some records into them.
CREATE TABLE SectionA (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
Course VARCHAR(50)
);
INSERT INTO SectionA (StudentID, StudentName, Course)
VALUES
(101, 'John', 'Computer Science'),
(102, 'Emma', 'Mathematics'),
(103, 'Michael', 'Physics');
CREATE TABLE SectionB (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
Course VARCHAR(50)
);
INSERT INTO SectionB (StudentID, StudentName, Course)
VALUES
(103, 'Michael', 'Physics'),
(104, 'Olivia', 'Chemistry'),
(105, 'William', 'Biology');
Output:
Example 1: Combine Results Using UNION
Query:
SELECT StudentID, StudentName, Course
FROM SectionA
UNION
SELECT StudentID, StudentName, Course
FROM SectionB;
Output:
Example 2: Use UNION with ORDER BY
Query:
SELECT StudentID, StudentName, Course
FROM SectionA
UNION
SELECT StudentID, StudentName, Course
FROM SectionB
ORDER BY StudentName;
Output:
Example 3: UNION with WHERE Clause
Query:
SELECT StudentName, Course
FROM SectionA
WHERE Course <> 'Physics'
UNION
SELECT StudentName, Course
FROM SectionB
WHERE Course <> 'Physics';
Output:
Troubleshooting UNION Operator Issues
- Different number of columns: Ensure that each SELECT statement returns the same number of columns.
- Incompatible data types: Corresponding columns in each SELECT statement must have compatible data types.
- Unexpected duplicate removal: UNION removes duplicate rows automatically. Use UNION ALL if you want to keep duplicates.
- ORDER BY error: Place the ORDER BY clause only after the final SELECT statement in the UNION query.

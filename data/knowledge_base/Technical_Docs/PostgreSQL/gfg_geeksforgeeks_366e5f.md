# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-joins/

A PostgreSQL JOIN combines rows from two or more tables based on a related column. It helps in:
- Matching records using common columns.
- Simplifying data retrieval from relational databases.
- Creating meaningful result sets by combining information from different tables.
Types of PostgreSQL JOIN
PostgreSQL supports different types of joins based on how rows from multiple tables are matched and combined.
INNER JOIN
INNER JOIN returns only the rows that have matching values in both tables. It helps in:
- Retrieving only matching records from both tables.
- Combining related data using a common column.
- Excluding rows without matching values.
- Maintaining accurate relationships between tables.
Syntax
SELECT table1.column1, table1.column2, table2.column1, ...
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
Note: In PostgreSQL, JOIN and INNER JOIN are equivalent. You can use either syntax.
Example of INNER JOIN
Firstly, create the Students and Enrollments tables and insert some records.
Students Table
Enrollments Table
The following query displays the student names along with their enrolled courses.
Query:
SELECT
    e.CourseID,
    s.StudentName,
    s.Age
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID;
Output:
LEFT JOIN
LEFT JOIN returns all rows from the left table and matching rows from the right table. It helps in:
- Returning all records from the left table.
- Displaying matching records from the right table.
- Showing NULL values when no matching record exists.
- Retrieving complete data from the left table.
Syntax
SELECT table1.column1, table2.column1
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
Example
The following query returns all students along with their enrolled courses.
Query:
SELECT
    s.StudentName,
    e.CourseID
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID;
Output:
RIGHT JOIN
RIGHT JOIN returns all rows from the right table and the matching rows from the left table. It helps in:
- Returning all records from the right table.
- Displaying matching records from the left table.
- Showing NULL values where no match exists.
- Retrieving complete data from the right table.
Syntax
SELECT table1.column1, table2.column1
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
Note: RIGHT JOIN and RIGHT OUTER JOIN are the same in PostgreSQL.
Example
The following query returns all course enrollments along with student names.
Query:
SELECT
    s.StudentName,
    e.CourseID
FROM Students s
RIGHT JOIN Enrollments e
ON s.StudentID = e.StudentID;
Output:
FULL JOIN
FULL JOIN combines the results of both LEFT JOIN and RIGHT JOIN. It helps in:
- Returning all rows from both tables.
- Displaying matching records from both tables.
- Showing NULL values where no match exists.
- Retrieving complete information from both tables.
Syntax
SELECT table1.column1, table2.column1
FROM table1
FULL JOIN table2
ON table1.common_column = table2.common_column;
Example
The following query returns all students and all enrollments.
Query:
SELECT
    s.StudentName,
    e.CourseID
FROM Students s
FULL JOIN Enrollments e
ON s.StudentID = e.StudentID;
Output:
NATURAL JOIN
A NATURAL JOIN automatically joins two tables based on columns having the same name and compatible data types. It returns only the rows where the common column values match.
- Automatically joining tables using common column names.
- Returning matching rows from both tables.
- Displaying the common column only once in the result.
- Reducing the need to specify the join condition explicitly.
Syntax
SELECT column_list
FROM table1
NATURAL JOIN table2;
Example
The following query displays students and their enrolled courses using NATURAL JOIN.
Query:
SELECT
    StudentName,
    CourseID
FROM Students
NATURAL JOIN Enrollments;
Output:

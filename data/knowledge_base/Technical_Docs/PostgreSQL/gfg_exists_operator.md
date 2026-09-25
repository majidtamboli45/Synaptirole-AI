# EXISTS Operator

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-exists-operator/

The EXISTS operator in PostgreSQL is used to check whether a subquery returns any rows. It returns TRUE if the subquery returns one or more rows; otherwise, it returns FALSE.
- Commonly used with correlated subqueries.
- Stops evaluating the subquery as soon as a matching row is found.
Syntax
SELECT column1, column2, ...FROM table_nameWHERE EXISTS (    SELECT 1    FROM another_table    WHERE condition);
Where:
- table_name: The table from which data is retrieved.
- SELECT 1 : Returns a constant value (1) and is commonly used with EXISTS to check if matching rows exist.
- another_table: The table used in the subquery.
condition: The condition used to check for matching rows.
Examples
Consider the following Students and Enrollments tables, which store student and course enrollment details:
Student Table:
Enrollment Table:
Example 1: EXISTS with SELECT
The following query returns students who are enrolled in at least one course.
SELECT StudentID, StudentName
FROM Students s
WHERE EXISTS (
SELECT 1
FROM Enrollments e
WHERE s.StudentID = e.StudentID
);
Output:
Example 2: EXISTS with UPDATE
The following query increases the fees by 2,000 for students who are enrolled in at least one course.
UPDATE Students s
SET Fees = Fees + 2000
WHERE EXISTS (
SELECT 1
FROM Enrollments e
WHERE s.StudentID = e.StudentID
);
Output:
Example 3: EXISTS with DELETE
The following query deletes students who are enrolled in at least one course.
Query:
DELETE FROM Students sWHERE EXISTS (    SELECT 1    FROM Enrollments e    WHERE s.StudentID = e.StudentID);
Output:

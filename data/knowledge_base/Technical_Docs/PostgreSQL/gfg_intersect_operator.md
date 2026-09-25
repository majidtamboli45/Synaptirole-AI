# INTERSECT Operator

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-intersect-operator/

The INTERSECT operator in PostgreSQL is used to return the rows that are common to the results of two or more SELECT queries.
- Removes duplicate rows automatically.
- Requires corresponding columns to have compatible data types.
- Can be used with the ORDER BY clause to sort the final result.
Syntax
SELECT column1, column2, ...FROM table1INTERSECTSELECT column1, column2, ...FROM table2;
Where:
- column1, column2, ...:The columns to retrieve.
- table1, table2....: The tables whose common records are returned.
Working
Firstly, create a Online_courses and Offline-courses table and insert some records.
Example 1: Basic INTERSECT
The following query returns courses that are available in both the online_courses and offline_courses tables.
SELECT * FROM online_courses
INTERSECT
SELECT * FROM offline_courses;
Output:
- The first query retrieves courses from the online_courses table.
- The second query retrieves courses from the offline_courses table.
- INTERSECT returns the common courses from both tables.
Example 2: INTERSECT with ORDER BY
The following query returns courses that are available in both the online_courses and offline_courses tables. The result is sorted alphabetically by course name.
SELECT *
FROM online_courses
INTERSECT
SELECT *
FROM offline_courses
ORDER BY course_name;
Output:
- The ORDER BY clause sorts the common courses in ascending alphabetical order by course name.

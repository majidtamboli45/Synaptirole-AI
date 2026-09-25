# Full Outer Join in MySQL

> Source: https://www.geeksforgeeks.org/mysql/how-to-use-full-outer-join-in-mysql/

A FULL OUTER JOIN returns all rows from both tables, including matching and non-matching rows.
- Shows NULL for unmatched records.
- Useful for finding matched and unmatched records between two tables.
Syntax
MySQL does not directly support FULL OUTER JOIN. It can be achieved using LEFT JOIN, RIGHT JOIN and UNION.
SELECT columnsFROM table1LEFT JOIN table2ON table1.column_name = table2.column_nameUNIONSELECT columnsFROM table1RIGHT JOIN table2ON table1.column_name = table2.column_name;
Example
Consider the following two tables: students and courses.
students Table:
courses Table:
FULL OUTER JOIN using UNION
SELECT students.student_name,
students.course_id,
courses.course_name
FROM students
LEFT JOIN courses
ON students.course_id = courses.course_id
UNION
SELECT students.student_name,
courses.course_id,
courses.course_name
FROM students
RIGHT JOIN courses
ON students.course_id = courses.course_id;
Output:
- The LEFT JOIN returns all students, while the RIGHT JOIN returns all courses. UNION combines both results, giving the effect of a FULL OUTER JOIN in MySQL.

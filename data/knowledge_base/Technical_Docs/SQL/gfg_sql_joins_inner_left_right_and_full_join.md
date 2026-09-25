# SQL Joins (Inner, Left, Right and Full Join)

> Source: https://www.geeksforgeeks.org/sql/sql-join-set-1-inner-left-right-and-full-joins/

SQL Joins are used to combine data from two or more tables based on a related column. They help in:
- Retrieving connected data stored across multiple tables.
- Matching records using common columns.
- Improving data analysis by combining related information.
- Creating meaningful result sets from separate tables.
Types of SQL Joins
SQL joins are categorized into different types based on how rows from two tables are matched and combined. Consider the student and student_course tables, which share the roll_no column. SQL joins combine their related data.
student table:
student_course table:
1. INNER JOIN
INNER JOIN is used to retrieve rows where matching values exist in both tables. It helps in:
- Combining records based on a related column.
- Returning only matching rows from both tables.
- Excluding non-matching data from the result set.
- Ensuring accurate data relationships between tables.
Syntax:
SELECT table1.column1, table1.column2, table2.column1, .... FROM table1  INNER JOIN
table2 ON table1.matching_column = table2.matching_column;
Note: We can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN.
Example of INNER JOIN:
To find students enrolled in different courses
Query:
SELECT student_course.course_id, student.name, student.age
FROM student
INNER JOIN student_course
ON student.roll_no = student_course.roll_no;
Output:
2. LEFT JOIN
LEFT JOIN is used to retrieve all rows from the left table and matching rows from the right table. It helps in:
- Returning all records from the left table.
- Showing matching data from the right table.
- Displaying NULL values where no match exists in the right table.
- Performing outer joins, also known as LEFT OUTER JOIN.
Syntax:
SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
LEFT JOIN table2
ON table1.matching_column = table2.matching_column;
Note: We can also use LEFT OUTER JOIN instead of LEFT JOIN, both are the same.
Example: In this example, the LEFT JOIN retrieves all rows from the student table and the matching rows from the student_course table based on the roll_no column.
Query:
SELECT student.name, student_course.course_id
FROM student
LEFT JOIN student_course
ON student_course.roll_no = student.roll_no;
Output:
3. RIGHT JOIN
RIGHT JOIN is used to retrieve all rows from the right table and the matching rows from the left table. It helps in:
- Returning all records from the right-side table.
- Showing matching data from the left-side table.
- Displaying NULL values where no match exists in the left table.
- Performing outer joins, also known as RIGHT OUTER JOIN.
Syntax:
SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
RIGHT JOIN table2
ON table1.matching_column = table2.matching_column;
Note: We can also use RIGHT OUTER JOIN instead of RIGHT JOIN, both are the same
Example: In this example, the RIGHT JOIN retrieves all rows from the StudentCourse table and the matching rows from the Student table based on the roll_no column.
Query:
SELECT student.name, student_course.course_id
FROM student
RIGHT JOIN student_course
ON student_course.roll_no = student.roll_no;
Output:
4. FULL JOIN
FULL JOIN is used to combine the results of both LEFT JOIN and RIGHT JOIN. It helps in:
- Returning all rows from both tables.
- Showing matching records from each table.
- Displaying NULL values where no match exists in either table.
- Providing complete data from both sides of the join.
Syntax:
SELECT table1.column1,table1.column2,table2.column1,....
FROM table1
FULL JOIN table2
ON table1.matching_column = table2.matching_column;
Example: This example uses a FULL JOIN to return all rows from both tables. Matching records appear together, while non-matching records still show up with NULL values for the missing fields.
Query:
SELECT student.name, student_course.course_id
FROM student
FULL JOIN student_course
ON student_course.roll_no = student.roll_no;
Output :
Note: MySQL does not support FULL OUTER JOIN directly. It cab be simulated using UNION of LEFT JOIN and RIGHT JOIN.
5. Natural Join
A Natural Join is a type of INNER JOIN that automatically joins two tables based on columns with the same name and data type. It returns only the rows where the values in the common columns match.
- It joins tables using common columns with the same name.
- It returns only rows where values in those columns match.
- The common column appears only once in the result.
Syntax:
SELECT column_names
FROM table1
NATURAL JOIN table2;
Example:
SELECT student.name, student_course.course_id
FROM student
NATURAL JOIN student_course;
Output:

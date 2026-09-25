# MySQL DELETE JOIN

> Source: https://www.geeksforgeeks.org/mysql/mysql-delete-join/

MySQL provides the DELETE JOIN statement to delete records from one table based on matching conditions with another table. It is useful for removing related or unwanted data efficiently.
- It deletes data using a JOIN between two tables.
- It is useful for removing related records based on conditions.
- It helps in efficient data cleanup and management.
Syntax:
DELETE  target_table FROM table1
JOIN table2 ON table1.joining_column = table2.joining_column
WHERE some_condition;
Delete Vs Delete Join
The difference between DELETE and DELETE JOIN is as follows:
| DELETE | DELETE JOIN | 
|---|---|
| Deletes data from a single table | Deletes data using multiple tables | 
| Uses only WHERE condition | Uses JOIN withWHERE condition | 
| Simple and straightforward syntax | Slightly complex syntax | 
| Does not depend on other tables | Depends on related tables | 
| Used for direct data removal | Used for conditional deletion based on relationships | 
Working with DELETE JOIN
Let's create two tables, the first is employees and the other is salaries, which contain the following data, and perform a delete operation using JOIN.
Table employees:
Table salaries:
Now, if we execute the DELETE JOIN query from the previous response
Example 1:
Query:
DELETE emp FROM employees emp
JOIN salaries sal ON emp.employee_id = sal.employee_id
WHERE sal.salary < 50000;
Output:
Example 2:
Let's have some tables, students, courses, enrollments, and grades, that contain the following data:
Table students:
Table courses:
Table enrollments:
Table grades:
Now, if we execute the DELETE JOIN query from the Example 2 tables:
Query:
DELETE st FROM students st
RIGHT JOIN enrollments en ON st.student_id = en.student_id
LEFT JOIN grades gd ON en.enrollment_id = gd.enrollment_id
WHERE gd.grade_id IS NULL;
It will delete those rows corresponding to students with neither enrollment nor grades.After the deletion, the employees table will look like this -
Output:
DELETE Statement with INNER JOIN
Now, if we again execute the DELETE INNER JOIN query from the Example 2 tables:
Query:
DELETE FROM students
WHERE NOT EXISTS (
SELECT 1
FROM enrollments en
INNER JOIN grades gd ON en.enrollment_id = gd.enrollment_id
WHERE students.student_id = en.student_id
);
It will delete those rows from the students table with no associated enrollments and grades.After the deletion, the employees table will look like this -
Output:
Using Subquery With INNER JOIN
Now, if we again execute the DELETE JOIN in subquery from the Example 2 tables:
Query:
DELETE FROM students
WHERE student_id IN (
SELECT student_id
FROM (
SELECT st.student_id
FROM students st
LEFT JOIN enrollments en ON st.student_id = en.student_id
LEFT JOIN grades gd ON en.enrollment_id = gd.enrollment_id
WHERE en.enrollment_id IS NULL AND gd.grade_id IS NULL
) AS subquery
);
It will delete those rows from the students table who do not have any associated enrollments and grades.After the deletion, the employees table will look like this -
Output:

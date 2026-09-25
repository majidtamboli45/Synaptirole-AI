# MySQL UNION Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-union-operator/

The UNION operator in MySQL combines the results of multiple SELECT statements into a single result set. It ensures consistent structure by requiring the same number of columns with compatible data types.
- Removes duplicate records from the final combined result.
- Uses column names from the first SELECT statement for the output.
Syntax:
SELECT column1, column2, ...
FROM table1
WHERE condition
UNION
SELECT column1, column2, ...
FROM table2
WHERE condition;
- column1, column2, ...: Columns selected from each SELECT statement must be the same in number and compatible in data type.
- table1, table2, ...: The tables or views from which data is selected.
- condition: Optional conditions to filter rows in each SELECT statement.
Note: UNION removes duplicate records by default.
Working with the MySQL UNION Operator
Let’s explore how the MySQL UNION operator works using examples. These examples demonstrate how to combine results from multiple tables. First, let’s create two tables on which the UNION operator will be applied:
Example 1: Combining Names from Students and Teachers Table
This example shows how to merge names from two tables into a single result. It also adds a label to identify the source of each record.
Query:
SELECT name, 'Student' AS type
FROM students
UNION
SELECT name, 'Teacher' AS type
FROM teachers;
Output:
- Combines names from both tables into one result set.
- Adds a type column to distinguish between students and teachers.
Example 2: Combining Names with Conditions
This example demonstrates combining filtered data from both tables. It helps retrieve only relevant records based on conditions.
Query:
SELECT name, 'Student' AS type
FROM students
WHERE age > 15
UNION
SELECT name, 'Teacher' AS type
FROM teachers
WHERE years_of_experience > 8;
Output:
- Filters students and teachers based on specified conditions.
- Combines only the qualifying records into a single result.

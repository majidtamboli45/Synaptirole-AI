# AND ,OR ,NOT Operators in MySQL

> Source: https://www.geeksforgeeks.org/mysql/queries-using-and-or-not-operators-in-mysql/

The AND, OR, and NOT operators in MySQL are logical operators used to filter records based on one or more conditions. They are mainly used with the WHERE clause to control how data is retrieved from a table.
- AND returns records only when all conditions are TRUE.
- OR returns records when at least one condition is TRUE.
- NOT excludes records that match a given condition.
First, we will create a demo table on which the logical operators will be used:
AND Operator
The AND operator is used to combine multiple conditions in a query and returns records only when all conditions are TRUE.
- If all specified conditions evaluate to TRUE, the record is included in the result.
- If even one condition is FALSE, the record is excluded.
Syntax:
SELECT * 
FROM table_name
WHERE condition1 AND condition2;
Example: Find students who belong to CSE branch and are from CALIFORNIA:
SELECT *
FROM students
WHERE branch = 'CSE' AND state = 'CALIFORNIA';
Output:
- The query checks both conditions (branch and state) together.
- Only students satisfying both conditions simultaneously are returned.
OR Operator
The OR operator is used to combine multiple conditions and returns records when at least one condition is TRUE.
- A record is included if it satisfies any one of the given conditions.
- It is useful for retrieving data that matches multiple possible values.
Syntax:
SELECT * 
FROM table_name
WHERE condition1 OR condition2;
Example: Find students who belong to CSE or ECE branch:
SELECT *
FROM students
WHERE branch = 'CSE' OR branch = 'ECE';
Output:
- The query checks if any one of the conditions is TRUE.
- Students from either CSE or ECE branch are included in the result.
NOT Operator
The NOT operator is used to negate a condition and returns records where the condition is FALSE.
- It selects rows that do not satisfy the specified condition.
- It is commonly used to exclude specific values from the result set.
Syntax:
SELECT * 
FROM table_name
WHERE NOT condition;
Example: Find students who are not from TEXAS:
SELECT *
FROM students
WHERE NOT state = 'TEXAS';
Output:
- The query excludes all records where the state is Texas.
- Only students from other states are returned.

# SQL IS NULL

> Source: https://www.geeksforgeeks.org/sql/sql-is-null-operator/

The SQL IS NULL operator checks whether a column contains a NULL (missing or unknown) value. Since NULL is not the same as zero or an empty string.
- Check multiple columns using OR.
- Filter rows before applying UPDATE or DELETE.
Example: First, we create a demo SQL database and table, on which we will use the IS NULL command.
Query:
SELECT * FROM customers
WHERE email IS NULL;
Output:
Syntax
SELECT column_name
FROM table_name
WHERE column_name IS NULL;
Note: COUNT(column) ignores NULL values, while COUNT(*) counts rows filtered using IS NULL.
Working
First, we will create a demo SQL database and table, on which we will use the IS NULL operator.
Example 1: IS NULL Operator on Multiple Columns
We need to filter rows where either email or coding_score is NULL, use the OR operator:
Query:
SELECT * 
FROM geeksforgeeks
WHERE email IS NULL OR coding_score IS NULL;
Output:
Example 2: IS NULL with COUNT() Function
In this Query, count how many rows have a NULL value in the coding_score column.
SELECT COUNT(*) AS count_empty_coding_score
FROM geeksforgeeks
WHERE coding_score IS NULL;
Output:
Example 3: IS NULL with UPDATE Statement
In this Query, we set a default email for all users with a NULL value in the email column
Query:
UPDATE geeksforgeeks
SET email = 'default@gmail.com'
WHERE email IS NULL;
Output:
Example 4: IS NULL with DELETE Statement
We can also use the IS NULL operator to delete rows where a column contains NULL values. For example, to delete rows where coding_score is NULL
Query:
DELETE FROM geeksforgeeks
WHERE coding_score IS NULL;
Output:
Note: A NULL value is different from a Zero Value and Blank Spaces. A field that has NULL value means the field was left blank.

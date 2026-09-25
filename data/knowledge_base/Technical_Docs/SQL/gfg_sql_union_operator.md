# SQL UNION Operator

> Source: https://www.geeksforgeeks.org/sql/sql-union-operator/

The SQL UNION operator is used to combine the result sets of two or more SELECT queries into a single output. It removes duplicate rows and returns only unique records from all combined queries.
- UNION ALL includes all rows, even duplicates.
- Queries must have matching columns and data types.
- Helpful for combining data from different sources.
Example: First, we create a demo SQL database and tables, on which we will use the UNION Operator command.
Query:
SELECT city FROM Table1
UNION
SELECT city FROM Table2;
Output:
Syntax
SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;
Examples
Let's look at an example of UNION operator in SQL to understand it better. Let's create two tables "emp1" and "emp2";
Example: SQL UNION Operator
In this example, we find the countries (only unique values) from both the "emp1" and the "emp2" tables:
Query:
SELECT country FROM emp1
UNION
SELECT country FROM emp2
ORDER BY country;
Output:
Note: The UNION operator combines the results of two queries and removes duplicate rows, while UNION ALL includes all rows from both queries without eliminating duplicates.

# MySQL EXISTS Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-exists-operator/

The MySQL EXISTS operator is a boolean operator used to check whether a subquery returns any records. It helps efficiently control query execution, especially when working with large datasets.
- Returns TRUE if the subquery produces one or more rows, otherwise FALSE.
- Works with a parent query (main query) and a child query (subquery).
- The parent query executes only when the subquery returns at least one result.
Note: The EXISTS operator can be combined with NOT (NOT EXISTS) to check if a subquery returns no records, which is useful for finding unmatched or missing data.
Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE EXISTS (subquery);
Working with the MySQL EXISTS Operator
To understand how to use the EXISTS operator in MySQL, let's go through a practical example step by step. First, we create two demo tables on which the EXISTS operator will be applied.
Example 1: EXISTS Operator with Simple Subquery
In this example, we display the id and name from the geeksforgeeks table only if matching IDs exist in the courses table.
Query:
SELECT id, name
FROM geeksforgeeks 
WHERE EXISTS (SELECT courses.id FROM courses 
    WHERE courses.id = geeksforgeeks.id);
Output:
- Filters records based on the presence of related entries in another table.
- Ensures only those rows are included that have a valid relationship across tables.
Example 2: EXISTS Operator with a Complex Subquery
In this example, we display records from the geeksforgeeks table where a matching record exists in the courses table where duration is 30.
Query:
SELECT id, name
FROM geeksforgeeks 
WHERE EXISTS (SELECT courses.id FROM courses 
    WHERE courses.id = geeksforgeeks.id and courses.duration = 30 );
Output:
- Applies an additional condition within the subquery to refine the result set.
- Returns only those rows that satisfy both the relationship and the specified constraint.
Example 3: MySQL EXISTS with DELETE Statement
In this example, we delete all records from the geeksforgeeks table where a matching record exists in the courses table with duration 50 using DELETE statement with EXISTS.
Query:
DELETE FROM geeksforgeeks
WHERE EXISTS (SELECT courses.id FROM courses 
    WHERE courses.id = geeksforgeeks.id and courses.duration = 50 );
    
SELECT * from geeksforgeeks;
Output:
- Identifies rows eligible for deletion based on a dependent condition in another table.
- Removes only those records that meet the specified criteria, leaving others unaffected.
MySQL EXISTS Operator Vs IN Operator
Although both the IN and EXISTS operators are used with subqueries, they differ in behavior and performance.
| EXISTS Operator | IN Operator | 
|---|---|
| EXISTS operator checks for the existence of a subquery. | IN operator is used to search for data in the table that matches the data within the specified set or subquery | 
| EXISTS operators are efficient for large datasets as they stop execution when matching data is found. | IN may be less efficient for large datasets as it continues to execute until it traverses the whole. | 
| Comparisons between parent queries and subqueries happen. | Comparisons between parent queries and subqueries do not happen. | 
| The EXISTS operator is used to check for the existence of a subquery with more complex conditions than the IN operator conditions. | IN operator allows matching a value against a set of multiple values. | 
| It checks for the existence of a row matching specific complex conditions. | It checks for the existence of specific values from a finite set or small set. |

# MySQL EXCEPT Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-except-operator/

The EXCEPT operator in MySQL returns the rows from the first SELECT query that are not present in the second SELECT query. It compares the result sets of two queries and returns only the distinct rows from the first query that do not exist in the second query.
- Compare the results of two queries.
- Find records present in one table but not another.
- Remove common rows between two result sets.
- Simplify set-based data comparisons.
Syntax
SELECT column_listFROM table1EXCEPTSELECT column_listFROM table2;
Where:
- EXCEPT: Returns distinct rows from the first query that are not present in the second query.
- Result Set: The collection of rows returned by a SELECT statement.
- Compatible Queries: Both queries must return the same number of columns with compatible data types.
Working
Example 1: Find Records Present in One Table Only
The following query returns students who are currently enrolled but have not graduated.
Query:
SELECT StudentID, StudentName
FROM CurrentStudents
EXCEPT
SELECT StudentID, StudentName
FROM GraduatedStudents;
Output:
- The EXCEPT operator returns rows that exist in CurrentStudents but not in GraduatedStudents.
Example 2: Use EXCEPT with a WHERE Clause
The following query returns students with IDs greater than 101 that are not in the GraduatedStudents table.
Query:
SELECT StudentID, StudentNameFROM CurrentStudentsWHERE StudentID > 101EXCEPTSELECT StudentID, StudentNameFROM GraduatedStudents;
Output:
- The WHERE clause filters the first result set before applying the EXCEPT operator.
Advantages of the EXCEPT Operator
- Simplifies comparison between two result sets.
- Eliminates duplicate rows automatically.
- Improves the readability of set-based queries.
- Useful for identifying missing or unmatched records.

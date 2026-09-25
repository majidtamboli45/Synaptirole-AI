# MySQL UNION ALL Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-union-all-operator/

The UNION ALL operator in MySQL combines the results of multiple SELECT statements while retaining duplicate rows. It is faster and more efficient when duplicate removal is not required.
- Combines result sets from two or more SELECT statements.
- Retains all duplicate records in the final output.
- Performs better than UNION since it skips duplicate elimination.
Syntax:
SELECT column1, column2, ...
FROM table1
UNION ALL
SELECT column1, column2, ...
FROM table2;
- Retrieves the same columns from both queries.
- Combines results using UNION ALL, including duplicates.
- Returns a single combined result set.
Note: Each SELECT statement can include optional WHERE conditions.
Working with the UNION ALL Operator
It demonstrates how the MySQL UNION ALL operator is used to combine results from multiple queries. First, we create a demo table on which the UNION ALL operator will be used:
Example 1: Return Single Field using UNION ALL Operator
This example retrieves a combined list of employee names based on different conditions. It includes duplicate values if they satisfy both conditions.
Query:
SELECT name FROM employees 
WHERE department = 'HR'
UNION ALL
SELECT name FROM employees 
WHERE position = 'Developer';
Output:
- Combines names from both conditions into a single result.
- Includes duplicate names if they appear in both queries.
Example 2: UNION ALL Operator with ORDER BY Clause
This example combines filtered data and sorts the final result. It demonstrates ordering after merging results.
Query:
SELECT name, position FROM employees 
WHERE department = 'HR'
UNION ALL
SELECT name, position FROM employees 
WHERE position = 'Developer'
ORDER BY position;
Output:
- Combines filtered records from both queries.
- Sorts the final result using ORDER BY.
UNION ALL Vs UNION Operator
Here are some key differences between UNION ALL and UNION operator:
| UNION ALL | UNION | 
|---|---|
| Combines results of SELECT statements and includes all duplicates. | Combines results of SELECT statements and removes duplicate rows. | 
| Faster, as it does not perform duplicate removal. | Slower, as it performs a distinct operation to remove duplicates. | 
| Useful when you need to include every row from the combined queries, including duplicates. | Useful when you need to eliminate duplicate rows and only see unique results. | 
| More efficient for large datasets with duplicates. | Less efficient due to the overhead of duplicate checking. | 
Advantages
The UNION ALL operator offers performance and efficiency benefits when working with combined datasets.
- Better Performance: Faster than UNION as it does not remove duplicates.
- Complete Data Inclusion: Retains all records, including duplicates, which is useful for full data analysis.
- Simpler Query Logic: No need to add extra conditions to eliminate duplicates.
- Efficient Resource Usage: Uses fewer system resources compared to UNION.
- Suitable for Incremental Data: Ideal when combining datasets where all records must be preserved.

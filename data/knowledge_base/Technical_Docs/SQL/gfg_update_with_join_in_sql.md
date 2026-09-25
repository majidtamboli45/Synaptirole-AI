# UPDATE with JOIN in SQL

> Source: https://www.geeksforgeeks.org/sql/sql-update-with-join/

SQL UPDATE with JOIN allows updating records in one table using related data from another table through a join condition. It is useful for syncing data, correcting values or modifying columns based on matching rows across tables.
Example: First, we create a demo SQL database and tables, on which we will use the UPDATE with JOIN command.
employee Table:
department Table:
Query:
UPDATE employee e
JOIN department d
ON e.dept_id = d.dept_id
SET e.salary = e.salary + d.bonus;
Output:
Syntax
UPDATE target_table
SET column_name = source_table.column_name
FROM target_table
INNER JOIN source_table
ON target_table.id = source_table.id
WHERE condition;
- source_table: Table containing new values.
- SET: Specifies the columns to update.
- INNER JOIN: Matches rows from both tables.
- ON: Defines the join condition.
- WHERE: Optional condition to filter rows.
Example: SQL UPDATE with JOIN Using Two Tables
Let us assume we have two tables geeks1 and geeks2, each containing data about different attributes. In this example, we will update geeks1 by joining it with geeks2 based on a common column col1.
geeks1 table:
geeks2 table:
Query:
UPDATE geeks1  
SET col2 = geeks2.col2,
col3 = geeks2.col3
FROM geeks1
INNER JOIN geeks2
ON geeks1.col1 = geeks2.col1
WHERE geeks1.col1 IN (21, 31);
Output
- Uses an INNER JOIN to match rows in geeks1 and geeks2 based on the common column col1.
- Updates col1 and col2 in geeks1 using related data fetched from geeks2.
- Modifies only the matched rows specified by the WHERE condition (col1 = 21 or 31).
SQL UPDATE with JOIN Using LEFT JOIN
Sometimes you may need to update records in the target table even if there is no match in the source table. In such cases, we can use LEFT JOIN.
Syntax
UPDATE target_table
SET target_table.column_name = source_table.column_name
FROM target_table
LEFT JOIN source_table
ON target_table.column_name = source_table.column_name;
Query:
Let’s say we want to update the geeks1 table but only change col2 where a match exists; otherwise, set it to a default value.
UPDATE geeks1
SET col2 = ISNULL(geeks2.col2, 0)
FROM Goknlm,eeks1
LEFT JOIN geeks2
ON geeks1.col1 = geeks2.col1;
Output:
- Rows with matches are updated with values from geeks2.
- Rows with no match in geeks2 have col2 set to 0 (default value).
Note: RIGHT JOIN can also be used similarly by swapping the table order, though LEFT JOIN is more commonly preferred for readability.

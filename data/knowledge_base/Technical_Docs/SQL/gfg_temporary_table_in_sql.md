# Temporary Table in SQL

> Source: https://www.geeksforgeeks.org/sql/what-is-temporary-table-in-sql/

A temporary table in SQL is a special table used to store data temporarily during query execution. It helps hold intermediate results without affecting permanent tables.
- Stored in the system’s temporary database (like TempDB in SQL Server).
- Automatically deleted when the session ends.
- Useful for calculations or data processing without changing permanent data.
Syntax
- To Create a Temporary Table
CREATE TABLE #emp_details (
id INT,
name VARCHAR(25)
) ;
- To Insert Values Into a Temporary Table
INSERT INTO #emp_details 
VALUES (1, 'James'), (2, 'Mike');
- To Select Values from the Temporary Table
SELECT * FROM #emp_details;
Output:
Types of Temporary Tables in SQL
1. Local Temporary Table
A Local Temporary Table is a temporary table used to store intermediate data during query execution or processing. It is created using a single # prefix (e.g., #temp_table).
Query:
CREATE PROCEDURE proc_temp
AS
BEGIN
CREATE TABLE #emp_details(
emp_id INT,
emp_name VARCHAR(50)
);
INSERT INTO #emp_details (emp_id, emp_name)
VALUES (1, 'Emily'), (2, 'Steve');
SELECT * FROM #emp_details;
END;
GO
EXEC proc_temp ;
Output:
2. Global Temporary Table
A Global Temporary Table is a temporary table used to store temporary data that can be shared across multiple operations. It is created using a double ## prefix (e.g., ##temp_table).
Query:
CREATE TABLE ##emp_details (
emp_id INT,
emp_name VARCHAR(50)
);
Local vs. Global Temporary Tables
| Local Temporary Table | Global Temporary Table | 
|---|---|
| Accessible only to the session that created it. | Accessible to multiple sessions. | 
| Automatically dropped when the session ends. | Dropped when the creating session ends and no other session is referencing it. | 
| Used for session-specific data storage. | Used for shared temporary data storage across multiple sessions. | 
| Use when temporary data is needed only by one user or session. | Use when temporary data needs to be shared among multiple users or sessions. |

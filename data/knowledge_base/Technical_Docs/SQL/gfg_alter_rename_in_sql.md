# ALTER (RENAME) in SQL

> Source: https://www.geeksforgeeks.org/sql/sql-alter-rename/

Renaming tables is a common structural change required during database maintenance or schema updates. SQL provides the ALTER TABLE command to rename tables without affecting existing data.
- Allows changing the table name while preserving all data and constraints.
- Useful when table names need to be updated to match new application or business requirements.
Example: First, create a sample student table to demonstrate the ALTER command:
Query:
ALTER TABLE students 
RENAME TO learners;
Output:
Syntax
Here are the common syntax formats for using the ALTER TABLE command:
1. Renaming a Table
ALTER TABLE table_name
RENAME TO new_table_name;
2. Renaming a Column
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
3. Adding a New Column
ALTER TABLE table_name
ADD column_name datatype;
4. Modifying a Column Data Type
ALTER TABLE table_name
MODIFY COLUMN column_name new_datatype;
Examples
Consider the student table below:
Example 1: Rename a Column
Change the name of column name to first_name in table student.
Query:
ALTER TABLE student
RENAME COLUMN name TO first_name;
Output:
Example 2: Rename a Table
In this example, we want to rename the table from student to student_details using the ALTER TABLE command, making the name more descriptive and relevant to its content.
Query:
ALTER TABLE student 
RENAME TO student_details;
Output:
Example 3: Add a New Column
To add a new column, use ALTER TABLE with the table name, followed by ADD with the new column name and data type.
Query:
ALTER TABLE student_details ADD marks INT;
Output:
Example 4: Modify a Column Data Type
In this example, the marks column is updated from INT to DECIMAL to store numeric values more precisely, allowing fractional marks and improving data accuracy.
Query:
ALTER TABLE student_details
MODIFY COLUMN marks DECIMAL(5,2);
- The marks column is now of type DECIMAL, making it suitable for storing values with a decimal point.
Additional ALTER Command Use Cases
The ALTER command can also be used for various other table modifications beyond renaming.
1. Removing a Column: In some cases, we might need to remove a column. To do that, you can use the DROP COLUMN syntax:
ALTER TABLE student_details
DROP COLUMN marks;
This command deletes the marks column entirely from the table
2. Changing a Column's Default Value: We can also modify a column’s default value using the SET DEFAULT clause:
ALTER TABLE student_details
ALTER COLUMN age SET DEFAULT 18;
3. Renaming a Table or Column in Different Databases: Note that SQL syntax can vary across different database systems. Here’s how we would rename a table or column in MySQL, MariaDB and Oracle:
- MySQL / MariaDB: The syntax for renaming a column is similar, but you must also use the CHANGE COLUMN command, which requires specifying the new column name along with its complete definition (data type and constraints).
ALTER TABLE student
CHANGE COLUMN old_column_name new_column_name datatype;
- Oracle: Oracle supports the RENAME COLUMN syntax but requires different syntax for renaming a table:
ALTER TABLE student 
RENAME COLUMN old_column_name TO new_column_name;

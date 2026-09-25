# SQL ALTER TABLE

> Source: https://www.geeksforgeeks.org/sql/sql-alter-add-drop-modify/

The SQL ALTER TABLE statement is used to modify an existing table’s structure without deleting it. It helps update the design of a database as requirements change.
- Can add, delete or modify columns in a table.
- Can also rename a table or change data types and constraints.
- Useful for adjusting database structure without losing data.
Example: First, we will create a demo SQL database and employees table, on which we will use the ALTER TABLE command.
Query:
ALTER TABLE employees RENAME TO staff; Syntax
ALTER TABLE table_name
ADD column_name datatype;
- table_name: name of the table you want to modify.
- ADD: used to add a new column.
- DROP: used to remove an existing column.
- ALTER COLUMN: used to change the data type or definition of an existing column.
Use Cases for SQL ALTER TABLE
Here are several usages of SQL ALTER TABLE
ADD
The ADD clause is used to add a new column to an existing table. You must specify the name of the new column and its data type.
Syntax:
ALTER TABLE table_name
ADD column_name datatype;
Query:
ALTER TABLE staff
ADD email VARCHAR(100);
- Here, we are adding a column named email to staff
ALTER COLUMN
The ALTER COLUMN clause is used to modify the definition of an existing column, such as changing its data type or size.
Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name datatype;
Query:
ALTER TABLE staff
ALTER COLUMN address VARCHAR(100);
Here, we are modifying the column named address datatype that is VARCHAR(100).
DROP
The DROP clause allows you to remove a column from a table. Be cautious when using this command as it will permanently remove the column and its data.
Syntax:
ALTER TABLE table_name
DROP COLUMN column_name;
Query:
ALTER TABLE staff
DROP COLUMN grade;
- Here, we are removing a column named grade from staff table
RENAME COLUMN
We can rename an existing column using RENAME COLUMN clause. This allows you to change the name of a column while preserving its data type and content.
Syntax:
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
Query:
ALTER TABLE staff
RENAME COLUMN name TO employee_name;
Output:
- This renames the column Name to employee_name in the staff table.
RENAME TO
We can rename an entire table using the RENAME TO clause. This changes the name of the table while preserving its structure and data.
Syntax:
ALTER TABLE table_name
RENAME TO new_table_name;
Query:
ALTER TABLE staff
RENAME TO employees;
- This renames the table from staff to employees.

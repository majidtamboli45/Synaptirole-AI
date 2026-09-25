# MySQL ALTER TABLE Statement

> Source: https://www.geeksforgeeks.org/mysql/mysql-alter-table-statement/

The ALTER TABLE statement in MySQL is used to modify the structure of an existing table without deleting or recreating it. It helps update database tables efficiently as requirements change while preserving existing data.
- It allows developers to add, modify, or delete columns and constraints as needed.
- It eliminates the need to recreate tables when changes are required, saving time and effort.
- It is an important Data Definition Language (DDL) command that helps adapt database design over time.
Syntax:
ALTER TABLE table_name
action;
Here, the action defines what kind of modification you want to perform, such as adding a column, modifying a column, or removing a constraint.
Working with ALTER TABLE Statement
ALTER TABLE is used to perform different structural modifications on an existing table such as adding, modifying, renaming, or deleting elements.
1. Adding New Columns
One of the most common uses of ALTER TABLE is adding new columns to an existing table. This is useful when new data requirements arise.
Syntax:
ALTER TABLE table_name
ADD COLUMN column_name data_type;
Query:
ALTER TABLE students
ADD COLUMN email VARCHAR(100);
- Adds a new column email to the table without affecting existing data.
- Existing rows will have NULL values unless a default value is specified.
2. Modifying Existing Columns
Modifying columns helps update data types or properties to match new requirements.
Syntax:
ALTER TABLE table_name
MODIFY COLUMN column_name new_data_type;
Query:
ALTER TABLE students
MODIFY COLUMN age VARCHAR(3);
- Changes the data type of the age column.
- Ensure existing data is compatible with the new format.
3. Renaming Columns
In certain cases, column names may need to be updated to better reflect their purpose. The CHANGE keyword allows both renaming and redefining a column.
Syntax:
ALTER TABLE table_name
CHANGE COLUMN old_name new_name data_type;
Query:
ALTER TABLE students
CHANGE COLUMN name full_name VARCHAR(100);
- Renames the column to full_name and also requires specifying its data type.
- Unlike MODIFY, the CHANGE command needs both the old and new column names.
4. Removing Columns
If a column is no longer needed, it can be removed using the DROP COLUMN clause.
Syntax:
ALTER TABLE table_name
DROP COLUMN column_name;
Query:
ALTER TABLE students
DROP COLUMN phone;
- Permanently removes the phone column and its data.
- Should be used carefully as data cannot be recovered.
5. Renaming a Table
Renaming a table helps reflect changes in its purpose or usage.
Syntax:
ALTER TABLE old_table_name
RENAME TO new_table_name;
Query:
ALTER TABLE students
RENAME TO student_details;
- Changes the table name without affecting its data.
- Useful when updating naming conventions or structure.
6. Working with Constraints
Constraints are rules applied to table columns to maintain data integrity. Using ALTER TABLE, you can add or remove these constraints as needed.
Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_type (column_name);
Query:
ALTER TABLE students
ADD CONSTRAINT unique_email UNIQUE (email);
- Adds a UNIQUE constraint to prevent duplicate email values.
- Ensures data integrity and consistency in the table.
Best Practices
ALTER TABLE operations should be used carefully as they directly impact table structure and existing data.
- Data Impact: Changes like dropping columns or modifying data types can lead to data loss or inconsistencies.
- Performance Issues: Altering large tables may take time and can temporarily lock the table.
- Backup Recommendation: Always take backups before making major structural changes.
- Constraint Conflicts: Adding constraints may fail if existing data violates the defined rules.

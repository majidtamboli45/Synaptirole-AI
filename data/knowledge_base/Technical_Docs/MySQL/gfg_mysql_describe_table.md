# MySQL Describe Table

> Source: https://www.geeksforgeeks.org/mysql/mysql-describe-table/

The DESCRIBE TABLE statement, also written as DESC or DESCRIBE, is used in MySQL to view the structure of a table. It displays important details about table columns and their properties such as data types, nullability, default values, and key constraints.
- Shows column details such as data type, nullability, and default values.
- Displays key information, including primary and foreign keys.
- Helps developers understand table structure for better database management.
- Acts as a Data Definition Language (DDL) command used to inspect table metadata like columns and constraints.
Syntax:
DESCRIBE table_name;
This command returns information about the structure of the specified table.
Output Columns of DESCRIBE Statement
The output of the DESCRIBE statement includes the following columns:
- Field: Name of the column in the table.
- Type: Data type of the column.
- Null: Indicates whether the column allows NULL values.
- Key: Shows index information such as PRI, UNI, or MUL.
- Default: Default value assigned to the column.
- Extra: Additional information about the column, such as AUTO_INCREMENT.
Display Table Information in MySQL Workbench
MySQL Workbench also allows users to view table structure through a graphical interface.
Follow these steps to inspect a table:
Step 1: Open MySQL Workbench
Launch MySQL Workbench and connect to your database server.
Step 2: Locate the Database
In the Navigator panel on the left side, expand the database that contains the table.
Step 3: Open the Tables Section
Click on the Tables section to display all tables available in the selected database.
Step 4: Inspect the Table
Right-click the table you want to inspect and select Table Inspector to view detailed table information.
This will display column details, indexes, and other structural information about the table.
Working with DESCRIBE TABLE
Assume we have two tables named students and fees with several columns. We can use the DESCRIBE command to view the structure of these tables.
1. DESCRIBE Students Table
Run the following query:
Query:
DESCRIBE students;
Output:
The output provides detailed information about each column in the table.
- student_id: An INT column that cannot be NULL. It is the primary key (PRI) and uses auto_increment to generate values automatically.
- first_name: A VARCHAR(50) column that stores up to 50 characters and does not allow NULL values.
- last_name: Similar to first_name, this column stores up to 50 characters and cannot be NULL.
- date_of_birth: A DATE column that allows NULL values.
- email: A VARCHAR(100) column that allows NULL values and has a unique constraint (UNI).
- registration_date: A TIMESTAMP column with CURRENT_TIMESTAMP as its default value, automatically storing the current date and time.
- is_active: A TINYINT(1) column used to represent active status, with a default value of 1.
2. DESCRIBE Fees Table
Now run the following query to view the structure of the fees table:
Query:
DESCRIBE fees
Output:
The output provides the following details about the table columns.
- fee_id: An INT column that does not allow NULL values. It is the primary key (PRI) and uses AUTO_INCREMENT.
- student_id: An INT column that allows NULL values. The MUL key indicates it is part of an index and acts as a foreign key referencing student_id in the students table.
- amount: A DECIMAL(8,2) column that stores numeric values with up to 8 digits in total and 2 digits after the decimal point. It cannot be NULL.
- payment_date: A DATE column that allows NULL values and is part of an index (MUL).
MySQL SHOW COLUMNS Command
Another way to retrieve table structure information in MySQL is by using the SHOW COLUMNS command.
Query:
SHOW COLUMNS FROM student;
- Returns table structure information similar to the DESCRIBE statement.
- Displays details such as column name, data type, null values, keys, and default values.
- SHOW COLUMNS presents the information in a tabular format.
- DESCRIBE provides a simplified listing of the same table details.
- In most cases, both commands return similar results, and users can use either based on preference.

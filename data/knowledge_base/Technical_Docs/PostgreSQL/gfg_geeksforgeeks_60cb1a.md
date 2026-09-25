# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-add-column/

In PostgreSQL, the ADD COLUMN statement is a powerful command used to modify an existing database table by adding one or more new columns. This feature is important for adapting table structures to meet evolving data requirements, and it plays a key role in database management and optimization.
In this article, we will explain how to effectively use the ADD COLUMN statement in PostgreSQL, with practical examples, detailed explanations, and tips for optimizing its use. We’ll also discuss common scenarios and best practices to help us get the most out of this command.
What is PostgreSQL ADD COLUMN?
The ADD COLUMN statement is part of the ALTER TABLE command in PostgreSQL, allowing us to add new columns to an existing table. Once added, the new column will be appended to the end of the table, and we can specify attributes such as the column's data type, default value, and constraints. However, it’s important to note that PostgreSQL doesn’t support directly setting the position of the new column within the table.
Syntax
ALTER TABLE table_name
ADD COLUMN new_column_name data_type;
Parameters
- table_name: The name of the table to which the column is being added.
- new_column_name: The name of the new column.
- data_type: The data type for the new column (e.g., VARCHAR, INTEGER, DATE, etc.).
- constraint: Optional. Constraints like NOT NULL, UNIQUE, or DEFAULT can be applied to the new column.
Key Points
- The ADD COLUMN statement always appends the new column at the end of the table.
- PostgreSQL does not support specifying the position of the new column within the table (i.e., columns can’t be inserted at a specific position).
- We can add multiple columns in a single ALTER TABLE statement by separating them with commas.
Examples of PostgreSQL ADD COLUMN
Let us take a look at ADD COLUMN Statement in PostgreSQL to better understand the concept and explore how it can be applied to real-world database scenarios effectively
Example 1: Adding a Column to the Village Table
First, create a table named 'village' which contains two columns 'village_id' and 'village_name' columns:
Step 1: Create the table
CREATE TABLE village(
village_id SERIAL PRIMARY KEY,
village_name VARCHAR NOT NULL
);
Step 2: Add a new column to the table
To add a district column of type VARCHAR, we use the following ALTER TABLE statement:
ALTER TABLE village
ADD COLUMN district VARCHAR;
Step 3: Verify the changes
Now we can verify if the column has been added using the below statement:
SELECT * FROM village;
Output
Explanation:
- The district column has been successfully added to the village table.
- Since no DEFAULT value was specified, the value for the new column is NULL for all existing rows.
Example 2: Adding a Column to the Cars Table
First, create a table named 'cars' with 'car_id' and 'car_name' columns:
Step 1: Create the table
CREATE TABLE cars(
car_id SERIAL PRIMARY KEY,
car_name VARCHAR NOT NULL
);
Step 2: Add a new column with a default value
Now we add a model column with a default value of 'Unknown' to the table as below 
ALTER TABLE cars
ADD COLUMN model VARCHAR;
Step 3: Verify the changes
Now we can verify if the column has been added using the below statement:
SELECT * FROM cars;
Output
Explanation:
- The model column has been added to the cars table.
- All existing rows have been assigned the default value of 'Unknown' for the new column.
Important Points About ALTER TABLE ADD COLUMN Statement
- When a new column is added to a table, PostgreSQL appends it at the end. PostgreSQL does not allow setting the position of the new column within the table.
- We can specify default values for the new column. If not specified, the default is 'NULL'.
- Adding a column can lock the table, preventing other operations. This lock is typically brief but can be longer for large tables or complex operations.
- Columns can be added based on expressions or existing columns. However, the initial value for all rows will be the same unless updated afterward.
Conclusion
The PostgreSQL ADD COLUMN statement is a powerful and flexible tool for modifying the structure of our database tables. By using this command, we can easily add new columns to adapt evolving data needs. While PostgreSQL appends new columns to the end of the table, we can manage column attributes like default values, unique constraints, and data types to meet our specific requirements.

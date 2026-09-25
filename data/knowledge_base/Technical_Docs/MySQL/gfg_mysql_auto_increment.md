# MySQL AUTO_INCREMENT

> Source: https://www.geeksforgeeks.org/mysql/mysql-autoincrement/

In MySQL, the AUTO_INCREMENT attribute automatically generates a unique numeric value for each new row in a table. It is commonly used with primary key columns to ensure every record can be uniquely identified.
- AUTO_INCREMENT assigns a sequential ID to each new record automatically.
- It is typically used with the PRIMARY KEY to maintain uniqueness.
- Helps in efficient data retrieval and ensures no duplicate identifiers exist.
Syntax:
CREATE TABLE table_name (
    column1 datatype AUTO_INCREMENT,
    column2 datatype,
    ...
    PRIMARY KEY (column1)
);
For an existing table, you can add AUTO_INCREMENT using:
ALTER TABLE table_name MODIFY column_name datatype AUTO_INCREMENT;
Working with MySQL AUTO_INCREMENT
Let's create a table named 'employees' with an AUTO_INCREMENT column.
CREATE TABLE employees (    
id INT AUTO_INCREMENT,   
name VARCHAR(50),    
position VARCHAR(50),    
PRIMARY KEY (id)
);
Inserting Data into the Table
Now, let's insert some data into the 'employees' table and observe how the AUTO_INCREMENT column behaves.
INSERT INTO employees (name, position) VALUES ('Alice', 'Manager');
INSERT INTO employees (name, position) VALUES ('Bob', 'Developer');
INSERT INTO employees (name, position) VALUES ('Charlie', 'Designer');
Viewing the Table Data
To verify the inserted data and see the AUTO_INCREMENT values, execute:
SELECT * FROM employees;
Output:
This query will retrieve all records from the employees table. The expected output will look like this:
Modifying AUTO_INCREMENT Values
You can set a specific starting value for the 'AUTO_INCREMENT' column using the 'ALTER TABLE' statement:
ALTER TABLE employee AUTO_INCREMENT = 1000;
Inserting Additional Data
Now, let's insert a new row into the employees table to see the effect of setting the AUTO_INCREMENT value to 1000:
INSERT INTO employees (name, position) VALUES ('Dave', 'Tester');
Viewing the Table Data Again
SELECT * FROM employees;
Output:
By setting the AUTO_INCREMENT value to 1000, the next inserted row after setting this value receives an id of 1000, as shown in the table.
Deleting Rows and AUTO_INCREMENT
When you delete rows from a table, the 'AUTO_INCREMENT' value does not automatically reset. For example, if you delete the last row, the next insert will continue with the next incremented value. Here is an example to illustrate this:
- Suppose the table initially has the following rows:
- If you delete the last row:
DELETE FROM employees WHERE id = 3;
- The table will now look like this:
- Inserting a new row will result in the following:
INSERT INTO employees (name, position) VALUES ('Dave', 'Tester');
Output:
Considerations
Important points to keep in mind while using AUTO_INCREMENT in MySQL:
- Primary Key Requirement: The AUTO_INCREMENT column must be defined as a key (typically the primary key) for the table.
- Only One AUTO_INCREMENT Column: Each table can have only one AUTO_INCREMENT column.
- Integer Data Type: The AUTO_INCREMENT attribute can be used only with integer types.
- Handling Duplicates: Ensure that the AUTO_INCREMENT column is unique and not manually set to a value that might cause duplicates

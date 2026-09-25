# MySQL Triggers

> Source: https://www.geeksforgeeks.org/mysql/different-types-of-mysql-triggers-with-examples/

A trigger in MySQL is a special database object that automatically executes when an INSERT, UPDATE or DELETE operation occurs on a table. Triggers help automate database actions and maintain data consistency.
- Runs automatically when a specified event occurs.
- Executes before or after INSERT, UPDATE or DELETE.
- Helps automate database operations.
- Useful for validation, logging and updating related data.
Syntax
CREATE TRIGGER trigger_name
BEFORE | AFTER INSERT | UPDATE | DELETE
ON table_name
FOR EACH ROW
trigger_body;
Example: Automatically Update Timestamp
Step 1: Create Table
CREATE TABLE users (    id INT PRIMARY KEY,    name VARCHAR(50),    email VARCHAR(100),    updated_at TIMESTAMP);
Step 2: Create Trigger
CREATE TRIGGER update_timestampBEFORE UPDATE ON usersFOR EACH ROWSET NEW.updated_at = CURRENT_TIMESTAMP;
This trigger automatically updates updated_at whenever a user record is updated.
Step 3: Insert Data
INSERT INTO users (id, name, email)VALUES (1, 'John', 'john@example.com');
Output:
Step 4: Update Record
UPDATE usersSET email = 'john_new@example.com'WHERE id = 1;
Output:
- The trigger automatically sets updated_at when the record is updated.
Types of MySQL Triggers
MySQL triggers are mainly classified based on when they execute:
BEFORE Trigger
A BEFORE trigger runs before an INSERT, UPDATE or DELETE operation. It is commonly used for validating or modifying data before the operation is completed.
AFTER Trigger
An AFTER trigger runs after an INSERT, UPDATE or DELETE operation. It is commonly used for logging changes or updating related tables.
MySQL supports six trigger types based on the event and timing:
| Trigger Type | Description | 
|---|---|
| BEFORE INSERT | Runs before a new row is inserted. | 
| AFTER INSERT | Runs after a new row is inserted. | 
| BEFORE UPDATE | Runs before an existing row is updated. | 
| AFTER UPDATE | Runs after an existing row is updated. | 
| BEFORE DELETE | Runs before an existing row is deleted. | 
| AFTER DELETE | Runs after an existing row is deleted. | 
Viewing Triggers
To view triggers in the current database:
SHOW TRIGGERS;
To view the definition of a specific trigger:
SHOW CREATE TRIGGER update_timestamp;
Dropping a Trigger
Syntax
DROP TRIGGER trigger_name;
Example
DROP TRIGGER update_timestamp;
This removes the update_timestamp trigger from the database.

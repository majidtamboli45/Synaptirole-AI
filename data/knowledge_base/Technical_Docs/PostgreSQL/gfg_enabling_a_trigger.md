# Enabling a Trigger

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-enabling-a-trigger/

A PostgreSQL trigger is a function that is automatically invoked whenever a specified event occurs on a table, such as an insert, update, or delete operation. Triggers are powerful tools for enforcing business rules, maintaining data integrity, and automating system tasks. PostgreSQL provides the option to enable or disable triggers as needed. When a trigger is disabled, it does not fire during the triggering event. To ensure a trigger fires, it must be enabled.
In PostgreSQL, we use the ALTER TABLE ENABLE TRIGGER statement to enable a trigger.
Syntax
ALTER TABLE table_name
ENABLE TRIGGER trigger_name |  ALL;
Parameters
If we analyze the above syntax:
- table_name: Specify the name of the table associated with the trigger you want to enable.
- trigger_name: Specify the name of the trigger to be enabled.
- ALL: Use this option to enable all triggers associated with the specified table.
PostgreSQL Enabling a Trigger Example
Suppose we have a trigger 'check_fullname_before_insert' which is used to check whether the given employee name is empty or not and only insert when it is non-empty.
Defining the Trigger Function
The 'checkempty' function related to the trigger is defined as:
Defining the Trigger
The 'check_fullname_before_insert' trigger is defined as follows:
In this function, we raise a notice and do not return anything when the entered employee name has length 0, but when it is not of 0 lengths, then the contents are inserted into the table.
Before enabling the trigger, the table looks like this:
Enabling the Trigger
The following query will enable the trigger on the employees table :
ALTER TABLE employees
ENABLE TRIGGER check_fullname_before_insert;
Testing the Trigger
Suppose we use the following statement to test the trigger :
INSERT INTO employees (
 employee_id,
 full_name,
 manager_id
)
VALUES
(21, '', NULL); 
Output:
When we tried to insert the employee, the 'check_fullname_before_insert' trigger was fired and as the length of the employee name was 0, nothing was inserted into the table and a notice was also issued.
Enabling All Triggers on a Table
Now, Suppose we have multiple triggers with different functionalities on the students table. The following query will enable all the triggers that exist on this table:
ALTER TABLE students
ENABLE TRIGGER ALL;
This command enables all triggers defined on the 'students' table, ensuring that each one functions as expected during their respective events.
Conclusion
PostgreSQL triggers are invaluable for maintaining data integrity and automating database tasks. By understanding how to enable and use triggers effectively, you can enhance the functionality and reliability of your PostgreSQL database. These tools provide robust solutions for managing and enforcing business logic within your database.

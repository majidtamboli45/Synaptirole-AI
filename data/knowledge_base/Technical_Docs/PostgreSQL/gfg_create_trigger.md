# CREATE TRIGGER

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-create-trigger/

Triggers in PostgreSQL are powerful tools that allow you to automate actions in your database whenever certain events occur, like inserting, updating, or deleting data. From this article, we will better understand the CREATE TRIGGER Statement in PostgreSQL.
Steps to Create Triggers in PostgreSQL
To create a new trigger in PostgreSQL, you follow these steps:
- First, create a trigger function using the CREATE FUNCTION statement.
- Second, bind the trigger function to a table using the CREATE TRIGGER statement.
A trigger function is similar to an ordinary function. However, a trigger function does not take any argument and has a return value with the trigger type.
Syntax
The following illustrates the syntax of creating a trigger function:
CREATE FUNCTION trigger_function() 
   RETURNS trigger AS
A trigger function receives data about its calling environment through a special structure called TriggerData, which contains a set of local variables. Once you define a trigger function, you can bind it to one or more triggers events such as INSERT, UPDATE, and DELETE.
PostgreSQL - CREATE TRIGGER Example
Let’s take a look at an example of creating a new trigger.
Step 1: Create the Tables
In this example, we will create a new table named COMPANY as follows.
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
When the name of an employee changes, we log the changes in a separate table named 'AUDIT':
CREATE TABLE AUDIT(
   EMP_ID INT NOT NULL,
   ENTRY_DATE TEXT NOT NULL
);
Step 2: Define the Trigger Function
Now, we create a trigger function called 'auditlog()' that will insert a log entry into the AUDIT table whenever an employee's name changes:
CREATE OR REPLACE FUNCTION auditlog()
RETURNS TRIGGER AS $example_table$
   BEGIN
      INSERT INTO AUDIT(EMP_ID, ENTRY_DATE) 
      VALUES (new.ID, current_timestamp);
      RETURN NEW;
   END;
$example_table$ LANGUAGE plpgsql;
The function inserts the old last name into the 'AUDIT' table including employee id, last name, and the time of change if the last name of an employee changes.
Step 3: Create the Trigger
Bind the trigger function to the employees table. With the function in place, we bind it to the COMPANY table so that it triggers whenever an INSERT occurs. Before the value of the name column is updated, the trigger function is automatically invoked to log the changes.
CREATE TRIGGER example_trigger 
AFTER INSERT ON COMPANY
FOR EACH ROW EXECUTE PROCEDURE auditlog();
Step 4: Insert Sample Data
Insert some sample data for testing. We insert two rows into the employees table.
INSERT INTO COMPANY (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (1, 'Raju', 25, 'New-Delhi', 33000.00 );
Step 5: Verify the Trigger
To examine the employees table use the below query:
SELECT * FROM COMPANY;
Output:
Points to remember for PostgreSQL Triggers
- 'AFTER' triggers are commonly used to maintain data integrity by enforcing business rules or logging changes.
- Keep the logic inside trigger functions simple to avoid performance overhead.
- Determine whether the trigger should run before or after the event (INSERT, UPDATE, DELETE). This affects how data is handled and can impact performance.

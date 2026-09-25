# Disabling a Trigger

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-disabling-a-trigger/

Triggers in PostgreSQL are powerful tools that automatically execute predefined functions whenever specific events like INSERT, UPDATE, or DELETE occur on a table. However, there are times when you may need to temporarily disable a trigger, such as during bulk inserts, data migrations, or testing phases.
In this article, we’ll learn how to disable triggers in PostgreSQL using the ALTER TABLE statement, along with an example.
Syntax
ALTER TABLE table_name
DISABLE TRIGGER trigger_name | ALL
Parameters:
Let's analyze the above syntax:
- table_name: The name of the table containing the trigger.
- trigger_name: The name of the specific trigger you want to disable.
- ALL: Use this option to disable all triggers on the specified table.
PostgreSQL Disabling a Trigger Example
To better understand how to disable triggers, let us look at an example.
Step 1: Creating a Sample Table
First, we create a staff table for demonstration with the below statement:
CREATE TABLE staff(
    user_id serial PRIMARY KEY,
    username VARCHAR (50) UNIQUE NOT NULL,
    password VARCHAR (50) NOT NULL,
    email VARCHAR (355) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
);
This staff table is used to store employee details such as 'username', 'password', and 'email'.
Step 2: Creating a Trigger Function
Create a function that validates the username of a staff. The username of staff must not be null and its length must be at least 8.
CREATE FUNCTION check_staff_user()
    RETURNS TRIGGER
AS $$
BEGIN
    IF length(NEW.username) < 8 OR NEW.username IS NULL THEN
        RAISE EXCEPTION 'The username cannot be less than 8 characters';
    END IF;
    IF NEW.NAME IS NULL THEN
        RAISE EXCEPTION 'Username cannot be NULL';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
Step 3: Creating a Trigger
Create a new trigger on the staff table to check the username of a staff. This trigger will fire whenever you insert or update a row in the staff table.
CREATE TRIGGER username_check 
    BEFORE INSERT OR UPDATE
ON staff
FOR EACH ROW 
    EXECUTE PROCEDURE check_staff_user();
Step 4: Disabling the Trigger
Now we can disable the 'username_check' triggered using the below statement:
ALTER TABLE staff
DISABLE TRIGGER username_check;
Output:
Important Points About PostgreSQL Disabling a Trigger
- Disabling a trigger does not delete it; the trigger remains in the system catalog but becomes inactive.
- The ALL option is useful when you need to temporarily disable all triggers during maintenance operations like bulk loading data.
- Only superusers or table owners can disable triggers using the ALTER TABLE statement.

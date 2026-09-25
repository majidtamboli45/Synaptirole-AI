# Stored Procedures

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-introduction-to-stored-procedures/

A stored procedure in PostgreSQL is a database object that contains a set of SQL and procedural statements stored in the database. Stored procedures are executed using the CALL statement and can accept parameters, perform calculations, and execute SQL statements.
- Reuse SQL logic across multiple operations.
- Automate repetitive database tasks.
- Organize complex database logic into reusable units.
Syntax
CREATE PROCEDURE procedure_name(parameters)
LANGUAGE plpgsql
AS $$
BEGIN
statements;
END;
$$;
Where:
- procedure_name: The name of the stored procedure.
- parameters: Optional input values passed to the procedure.
- LANGUAGE plpgsql: Specifies the procedure language.
- CALL: Executes the stored procedure.
Working
Example 1: Create a Simple Stored Procedure
The following procedure displays a message.
Query:
CREATE OR REPLACE PROCEDURE show_message()
LANGUAGE plpgsql
AS $$
BEGIN
RAISE NOTICE 'Welcome to PostgreSQL!';
END;
$$;
The procedure is created successfully and can be executed using the CALL statement.
Example 2: Execute a Stored Procedure
The following statement executes the show_message procedure.
Query:
CALL show_message();
Output:
NOTICE: Welcome to PostgreSQL!
The CALL statement executes the stored procedure and displays the message.
Example 3: Stored Procedure with Parameters
The following procedure accepts two numbers, calculates their sum, and displays the result.
Query:
CREATE OR REPLACE PROCEDURE add_numbers(
num1 INT,
num2 INT
)
LANGUAGE plpgsql
AS $$
BEGIN
RAISE NOTICE 'Sum = %', num1 + num2;
END;
$$;
Execute the procedure:
CALL add_numbers(25, 15);
Output:
NOTICE: Sum = 40
The procedure accepts two input parameters, computes their sum, and displays the result using RAISE NOTICE.

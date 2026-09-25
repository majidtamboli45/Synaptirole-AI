# Block Structure

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-block-structure/

A block in PostgreSQL is the basic unit of a PL/pgSQL program. It contains declarations, executable statements and optional exception handling. Blocks are commonly used in anonymous blocks, functions, procedures and triggers.
- Organize PostgreSQL code into logical sections.
- Declare variables and constants within a block.
- Execute multiple statements together.
- Handle runtime errors using exception blocks.
Syntax
[<<label>>]
DECLARE
declarations;
BEGIN
statements;
EXCEPTION
exception_handling;
END;
Where:
- DECLARE: Declares variables, constants and cursors.
- BEGIN: Starts the executable section.
- EXCEPTION: Handles runtime errors (optional).
- END: Ends the block.
Working
Example 1: Basic Block Structure
The following block declares a variable and displays its value.
Query:
DO $$
DECLARE
message VARCHAR(30) := 'Welcome to PostgreSQL';
BEGIN
RAISE NOTICE '%', message;
END;
$$;
Output:
Example 2: Block with Variables and Calculations
The following block calculates the total of two numbers.
Query:
DO $$
DECLARE
num1 INT := 15;
num2 INT := 25;
total INT;
BEGIN
total := num1 + num2;
RAISE NOTICE 'Total = %', total;
END;
$$;
Output:
Example 3: Block with Exception Handling
The following block catches a division-by-zero error.
Query:
DO $$
DECLARE
result INT;
BEGIN
result := 100 / 0;
EXCEPTION
WHEN division_by_zero THEN
RAISE NOTICE 'Division by zero is not allowed.';
END;
$$;
Output:

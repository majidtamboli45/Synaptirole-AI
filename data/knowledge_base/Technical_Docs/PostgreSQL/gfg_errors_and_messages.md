# Errors and Messages

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-errors-and-messages/

Errors and messages in PostgreSQL provide information about the execution of SQL statements and PL/pgSQL programs. Messages are commonly used for debugging and displaying information, while errors indicate problems that prevent successful execution.
- Identify and troubleshoot SQL and PL/pgSQL issues.
- Display informative messages during program execution.
- Debug functions, procedures and anonymous blocks.
- Improve error handling and code reliability.
Syntax
Display a message:
RAISE NOTICE 'message';
Raise an error:
RAISE EXCEPTION 'error message';
Where:
- RAISE: Displays messages or generates errors in PL/pgSQL.
- NOTICE: Displays an informational message without stopping execution.
- WARNING: Displays a warning message while allowing execution to continue.
- EXCEPTION: Raises an error and immediately stops execution.
- SQLSTATE: A standard error code that identifies a specific database error.
Working
Example 1: Display a Notice Message
The following block displays an informational message.
Query:
DO $$BEGIN    RAISE NOTICE 'Welcome to PostgreSQL!';END;$$;
Output:
NOTICE: Welcome to PostgreSQL!
The RAISE NOTICE statement displays a message without interrupting program execution.
Example 2: Display a Warning Message
The following block displays a warning message.
Query:
DO $$BEGIN    RAISE WARNING 'Salary value is unusually high.';END;$$;
Output:
WARNING: Salary value is unusually high.
The RAISE WARNING statement displays a warning while allowing the block to continue executing.
Example 3: Raise an Exception
The following block raises an exception.
Query:
DO $$BEGIN    RAISE EXCEPTION 'Employee ID does not exist.';END;$$;
Output:
ERROR: Employee ID does not exist.
The RAISE EXCEPTION statement generates an error and immediately terminates the execution of the block.

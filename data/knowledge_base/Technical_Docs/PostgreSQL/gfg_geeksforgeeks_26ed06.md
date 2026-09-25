# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-while-loops/

The PostgreSQL WHILE loop is a control structure in PL/pgSQL that repeatedly executes a block of statements as long as a specified condition evaluates to TRUE. It is commonly used to perform repetitive tasks until a condition becomes FALSE.
- Control loop execution using Boolean expressions.
- Automate repetitive tasks in PL/pgSQL.
- Improve code readability by reducing repetitive statements.
Syntax
WHILE condition LOOP
    statements;
END LOOP;
Where:
- condition: A Boolean expression that is evaluated before each iteration.
- statements: The SQL or PL/pgSQL statements executed while the condition is TRUE .
Note: If the condition evaluates to FALSE before the first iteration, the WHILE loop does not execute.
Working
Example 1: Basic WHILE Loop
The following block prints numbers from 1 to 5.
Query:
DO $$DECLARE    counter INT := 1;BEGIN    WHILE counter <= 5 LOOP        ...    END LOOP;END $$;
Output:
- The loop starts with counter = 1.
- The condition counter <= 5 is checked before each iteration.
- The counter is incremented after every iteration.
- The loop stops when the condition becomes FALSE.
Example 2: WHILE Loop with Multiplication Table
The following block displays the multiplication table of 5.
Query:
DO $$DECLARE    num INT := 1;BEGIN    WHILE num <= 10 LOOP        RAISE NOTICE '5 x % = %', num, 5 * num;        num := num + 1;    END LOOP;END $$;
Output:
- The loop starts with num = 1.
- During each iteration, PostgreSQL calculates and displays the multiplication result.
- The loop terminates after printing the table up to 10.
Example 3: WHILE Loop to Display Movie IDs
The following block displays movie IDs from 101 to 104.
Query:
DO $$DECLARE    movie_id INT := 101;BEGIN    WHILE movie_id <= 104 LOOP        RAISE NOTICE 'Movie ID: %', movie_id;        movie_id := movie_id + 1;    END LOOP;END $$;
Output:
- The loop starts with movie_id = 101.
- It displays the current movie ID during each iteration.
- The value is incremented by 1.
- The loop ends after displaying Movie ID 104.

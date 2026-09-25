# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-continue/

The PostgreSQL CONTINUE statement is used to skip the remaining statements in the current iteration of a loop and proceed directly to the next iteration. It can be used with LOOP, WHILE, FOR and FOREACH loops to control the flow of execution based on specified conditions. The CONTINUE statement allows users to:
- Skip the current iteration of a loop.
- Continue execution with the next iteration.
- Execute statements conditionally within loops.
- Improve loop control and readability in PL/pgSQL.
Syntax
Basic CONTINUE Statement
CONTINUE;
CONTINUE with a Condition
CONTINUE WHEN condition;
Where:
- condition: A Boolean expression that determines whether the current iteration should be skipped.
Note: The CONTINUE statement skips only the current iteration of the loop. It does not terminate the loop like the EXIT statement.
Working
Example 1: Basic CONTINUE Statement
The following block skips the number 3 and prints the remaining numbers.
Query:
DO $$
DECLARE
    counter INT := 0;
BEGIN
    LOOP
        counter := counter + 1;
        IF counter = 3 THEN
            CONTINUE;
        END IF;
        RAISE NOTICE 'Counter: %', counter;
        EXIT WHEN counter = 5;
    END LOOP;
END $$;
Output:
- The loop increments the counter in each iteration.
- When the counter becomes 3, the CONTINUE statement skips the remaining statements for that iteration.
- The loop continues with the next iteration until the counter reaches 5.
Example 2: CONTINUE WHEN Statement
The following block prints only odd numbers from 1 to 5.
Query:
DO $$
DECLARE
    counter INT := 0;
BEGIN
    LOOP
        counter := counter + 1;
        CONTINUE WHEN counter % 2 = 0;
        RAISE NOTICE 'Odd Number: %', counter;
        EXIT WHEN counter = 5;
    END LOOP;
END $$;
Output:
- The CONTINUE WHEN statement skips all even numbers.
- Only odd numbers are displayed.
- The loop terminates when the counter reaches 5.
Example 3: CONTINUE with a FOR Loop
The following block prints numbers from 1 to 10, but skips 5 using the CONTINUE statement.
Query:
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..10 LOOP
        IF i = 5 THEN
            CONTINUE;
        END IF;
        RAISE NOTICE 'Number: %', i;
    END LOOP;
END $$;
Output:
- FOR i IN 1..10 loops from 1 to 10.
- When i = 5, the CONTINUE statement skips the remaining statements in the current iteration.
- The loop continues with the next value (6), so 5 is not printed.
Example 4: CONTINUE with Loop Labels
The following block uses nested FOR loops. When the inner loop variable is 2, CONTINUE outer_loop skips the current outer loop iteration and starts the next one.
Query:
DO $$
DECLARE
    i INT;
    j INT;
BEGIN
    <<outer_loop>>
    FOR i IN 1..3 LOOP
        RAISE NOTICE 'Outer Loop: %', i;
        FOR j IN 1..3 LOOP
            IF j = 2 THEN
                CONTINUE outer_loop;
            END IF;
            RAISE NOTICE '  Inner Loop: %', j;
        END LOOP;
    END LOOP;
END $$;
Output:
- The outer_loop label is assigned to the outer FOR loop.
- When the inner loop reaches j = 2, CONTINUE outer_loop skips the remaining iterations of the inner loop and immediately starts the next iteration of the outer loop.
- As a result, Inner Loop: 2 and Inner Loop: 3 are never printed for any outer loop iteration.

# Loop Statement

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-loop-statement/

The PostgreSQL LOOP statement is used to execute a block of statements repeatedly until the loop is explicitly terminated using the EXIT statement. It is commonly used in PL/pgSQL functions, procedures and anonymous blocks to perform repetitive tasks.
- Perform repetitive tasks efficiently.
- Implement custom looping logic in PL/pgSQL.
Syntax
LOOP
statements;
EXIT WHEN condition;
END LOOP;
Where:
- statements: The SQL or PL/pgSQL statements executed repeatedly.
- condition: A Boolean expression that determines when the loop should terminate.
Working
The examples below show how the LOOP statement performs repetitive tasks and terminates using the EXIT statement.
Example 1: Basic LOOP Statement
The following block displays numbers from 1 to 5 using the LOOP statement.
Query:
DO $$
DECLARE
counter INT := 1;
BEGIN
LOOP
RAISE NOTICE 'Counter: %', counter;
EXIT WHEN counter = 5;
counter := counter + 1;
END LOOP;
END $$;
Output:
Example 2: LOOP with EXIT WHEN
The following block displays movie IDs until the last movie is reached.
Query:
DO $$
DECLARE
movie_id INT := 101;
BEGIN
LOOP
RAISE NOTICE 'Movie ID: %', movie_id;
EXIT WHEN movie_id = 104;
movie_id := movie_id + 1;
END LOOP;
END $$;
Output:
- The loop starts with MovieID 101.
- After each iteration, the value is incremented by 1.
- The EXIT WHEN statement terminates the loop when MovieID becomes 104.
Example 3: LOOP with IF Statement
To following block displays release years until it reaches 2023.
Query:
DO $$
DECLARE
release_year INT := 2020;
BEGIN
LOOP
IF release_year = 2023 THEN
EXIT;
END IF;
RAISE NOTICE 'Release Year: %', release_year;
release_year := release_year + 1;
END LOOP;
END $$;
Output:

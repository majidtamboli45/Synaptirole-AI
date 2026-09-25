# Exit Statement

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-exit/

The PostgreSQL EXIT statement is used to terminate a loop before it completes all its iterations. It can be used with LOOP, WHILE, FOR and FOREACH loops.
- Exit a loop when a specified condition is met.
- Improve loop control in PL/pgSQL blocks.
- Avoid unnecessary iterations and improve efficiency.
Syntax
Basic EXIT Statement
EXIT;
EXIT with a Condition
EXIT WHEN condition;
Where:
- condition: A Boolean expression that determines when the loop should terminate.
Working
Firstly, create a Flights table and insert some records.
Example 1: Basic EXIT Statement
The following block prints numbers from 1 and exits the loop when the counter reaches 5.
Query:
DO $$
DECLARE
    counter INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Counter: %', counter;
        IF counter = 5 THEN
            EXIT;
        END IF;
        counter := counter + 1;
    END LOOP;
END $$;
Output:
- The loop starts with counter = 1.
- During each iteration, the current value of the counter is displayed.
- When the counter becomes 5, the EXIT statement terminates the loop.
Example 2: EXIT WHEN Statement
The following block displays numbers until the counter reaches 4.
Query:
DO $$
DECLARE
    counter INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Counter: %', counter;
        EXIT WHEN counter = 4;
        counter := counter + 1;
    END LOOP;
END $$;
Output:
- The EXIT WHEN statement checks the condition after each iteration.
- The loop terminates immediately when the counter reaches 4.
Example 3: EXIT Statement with FOR Loop
The following block displays flight IDs and exits when FlightID becomes 103.
Query:
DO $$
DECLARE
    flight RECORD;
BEGIN
    FOR flight IN
        SELECT FlightID
        FROM Flights
        ORDER BY FlightID
    LOOP
        RAISE NOTICE 'Flight ID: %', flight.FlightID;
        EXIT WHEN flight.FlightID = 103;
    END LOOP;
END $$;
Output:
- The FOR loop processes each row returned by the query.
- After displaying FlightID 103, the EXIT WHEN condition becomes TRUE.
- The loop terminates without processing the remaining records.

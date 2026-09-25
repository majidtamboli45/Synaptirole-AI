# Drop Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-drop-function/

In PostgreSQL, the DROP FUNCTION statement is essential for removing functions from your database. Let us learn more about the syntax and the detailed examples to ensure you understand how to use this statement effectively.
Syntax
DROP FUNCTION [IF EXISTS] function_name(argument_list)
[CASCADE | RESTRICT];
Parameters:
Let's analyze the above syntax:
- function_name: Specify the name of the function you wish to remove after the DROP FUNCTION keywords.
- IF EXISTS Option: Use the IF EXISTS option to instruct PostgreSQL to issue a notice instead of an error if the function does not exist.
- argument_list: Specify the argument list of the function. PostgreSQL needs this information to identify which function to remove, especially if functions are overloaded (multiple functions with the same name but different parameters).
- CASCADE Option: Use the CASCADE option to drop the function and its dependent objects. This will recursively remove the function, its dependent objects, and objects that depend on those objects.
- RESTRICT Option: By default, PostgreSQL uses the RESTRICT option, which prevents the removal of a function if it has any dependent objects.
When a function has any dependent objects such as operators or triggers, you cannot drop that function. To drop the function and its dependent objects, you need to specify the cascade option. The drop function with the cascade option will recursively remove the function, its dependent objects, and the objects that depend on those objects, and so on.
By default, the drop function statement uses the restrict option that rejects the removal of a function when it has any dependent objects.
To drop multiple functions using a single drop function statement, you specify a comma-separated list of function name after the drop function keyword like this:
DROP FUNCTION [IF EXISTS] function1, function2, ...;
PostgreSQL Drop Function Example
For the sake of example, we will use the sample database ie, dvdrental.
Creating Functions
1. Function without Parameters:
The following statement uses the create function statement to define a function that returns a set of films including 'film_id', 'title', and 'actor':
CREATE OR REPLACE FUNCTION get_film_actors()
    RETURNS SETOF RECORD
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT film_id, title, (first_name || ' ' || last_name)::VARCHAR
        FROM film
        INNER JOIN film_actor USING(film_id)
        INNER JOIN actor USING(actor_id)
        ORDER BY title
    LOOP
        RETURN NEXT rec;
    END LOOP;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;
2. Function with Parameters:
The following statement defines a function with the same name 'get_film_actors'. However, it accepts a film id as the argument:
CREATE OR REPLACE FUNCTION get_film_actors(p_film_id INT)
    RETURNS SETOF RECORD
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT film_id, title, (first_name || ' ' || last_name)::VARCHAR
        FROM film
        INNER JOIN film_actor USING(film_id)
        INNER JOIN actor USING(actor_id)
        WHERE film_id = p_film_id
        ORDER BY title
    LOOP
        RETURN NEXT rec;
    END LOOP;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;
Dropping Functions
The following statement attempts to drop the 'get_film_actors' function:
DROP FUNCTION get_film_actors();
Output:
Explanation: Since there are multiple functions named 'get_film_actors', PostgreSQL requires the argument list to identify which function to drop.
The following statement drops the 'get_film_actors' function that has zero parameters:
DROP FUNCTION get_film_actors();
Now, there is only one 'get_film_actors' function left. Since it is unique in the database, you can drop it without specifying its argument list like this:
DROP FUNCTION get_film_actors;
Or if you want to specify the exact function, you can use the following statement:
DROP FUNCTION get_film_actors(int);
If the function has dependent objects, use the CASCADE option to drop them along with the function:
DROP FUNCTION get_film_actors(int) CASCADE;
Important Points About PostgreSQL Drop Function
- Use the DROP FUNCTION statement to remove a function.
- Specify the argument list in the function if the function is overloaded.
- Always use the
IF EXISTS option to avoid errors when the function does not exist.- Use the DROP FUNCTION statement with the CASCADE option to drop a function and its dependent objects and objects that depends on those objects, and so on.

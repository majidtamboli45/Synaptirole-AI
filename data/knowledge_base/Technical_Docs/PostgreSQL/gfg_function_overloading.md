# Function Overloading

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-function-overloading/

In PostgreSQL, it's possible to create multiple functions with the same name, provided that each function has different arguments. This feature, known as function overloading, allows you to define functions that perform similar operations but handle different types or numbers of inputs. PostgreSQL determines which function to execute based on the provided arguments.
What is Function Overloading?
Function overloading occurs when more than one function shares the same name but has different parameters. PostgreSQL supports this feature, allowing you to define multiple versions of a function that can handle different types of input. This is particularly useful when you need to perform similar operations with varying inputs.
PostgreSQL Function Overloading Examples
Let’s take a look at the following 'get_rental_duration()' function applied to the sample dvdrental database.
Example 1: Basic Function to Get Rental Duration
Here's how you can create a function to achieve this:
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER)
    RETURNS INTEGER AS $$
    
DECLARE 
    rental_duration INTEGER; 
BEGIN
    -- get the rate based on film_id
    SELECT INTO rental_duration SUM( EXTRACT( DAY FROM return_date - rental_date)) 
    FROM rental 
    WHERE customer_id=p_customer_id;
    RETURN rental_duration;
END; $$
LANGUAGE plpgsql;
Function Explanation:
- Parameter: 'p_customer_id' is an integer representing the customer ID.
- Return Value: The function returns the total number of days the customer has rented DVDs.
SELECT get_rental_duration(278);
It returns the following:
Example 2: Overloaded Function with Additional Parameters
Suppose, we want to know the rental duration of a customer from a specific date up to now. We can add one more parameter 'p_from_date' to the 'get_rental_duration()' function, or we can develop a new function with the same name but have two parameters as follows:
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER, p_from_date DATE)
    RETURNS INTEGER AS $$
DECLARE 
    rental_duration integer;
BEGIN
    -- get the rental duration based on customer_id and rental date
    SELECT INTO rental_duration
                SUM( EXTRACT( DAY FROM return_date + '12:00:00' - rental_date)) 
    FROM rental 
    WHERE customer_id= p_customer_id AND 
          rental_date >= p_from_date;
     
    RETURN rental_duration;
END; $$
LANGUAGE plpgsql;
Function Explanation:
- Parameters: 'p_customer_id' is the customer ID, and 'p_from_date' is the date from which to start calculating the rental duration.
- Return Value: The function returns the total number of days the customer has rented DVDs starting from the specified date.
SELECT get_rental_duration(278, '2005-07-01');
It will result in the following:
Important Points About Function Overloading
- In PostgreSQL, function overloading is based on the function’s signature, which includes the function name and the number and types of parameters.
- Different parameter types or numbers in overloaded functions allow you to handle various use cases with functions of the same name.
- Ensure that the function calls are made with the correct number and type of arguments to avoid errors.
- Overloading functions can simplify maintenance by allowing related operations to be grouped under the same function name.

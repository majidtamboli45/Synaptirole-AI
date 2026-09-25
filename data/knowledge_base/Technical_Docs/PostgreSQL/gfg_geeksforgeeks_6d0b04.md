# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-constants/

Constants in PostgreSQL are fixed values that cannot be changed after they are declared. They help make code more readable, reduce repeated hard-coded values, and simplify maintenance.
- Store values that remain unchanged during execution.
- Replace hard-coded values with meaningful names.
- Improve code readability and maintainability.
- Reduce updates by defining fixed values in one place.
Syntax
constant_name CONSTANT data_type := value;
Where:
- constant_name: The name of the constant.
- CONSTANT: Specifies that the value cannot be modified.
- data_type: The data type of the constant.
- value: The fixed value assigned during declaration.
Working
Example 1: Declare and Use a Constant
The following block declares a constant and uses it to calculate the selling price.
Query:
DO $$
DECLARE
vat CONSTANT NUMERIC := 0.10;
net_price NUMERIC := 200;
BEGIN
RAISE NOTICE 'Selling Price: %',
net_price * (1 + vat);
END;
$$;
Output:
Example 2: Attempt to Modify a Constant
The following block attempts to change the value of a constant.
Query:
DO $$
DECLARE
vat CONSTANT NUMERIC := 0.10;
BEGIN
vat := 0.05;
END;
$$;
Output:
Example 3: Initialize a Constant with the Current Time
The following block initializes a constant with the current time.
Query:
DO $$
DECLARE
started_at CONSTANT TIME := clock_timestamp();
BEGIN
PERFORM pg_sleep(2);
RAISE NOTICE 'Current Time: %', clock_timestamp();
RAISE NOTICE 'Started At: %', started_at;
END;
$$;
Output:

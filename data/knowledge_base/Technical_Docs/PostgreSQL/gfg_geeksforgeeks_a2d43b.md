# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-variables/

Variables in PostgreSQL are used to store and manage data temporarily within a block. They support different data types and make database programs more flexible and efficient.
- Declare and initialize values.
- Store query results for further processing.
- Perform calculations and data manipulation.
- Write cleaner and more maintainable code.
Syntax
DECLARE
variable_name data_type [:= initial_value];
Where:
- variable_name: The name of the variable.
- data_type: The data type of the variable, such as INTEGER, VARCHAR or NUMERIC.
- initial_value: An optional value assigned when the variable is declared.
Working
Example 1: Declare and Initialize Variables
The following block declares variables and initializes them with values.
Query:
DO $$
DECLARE
counter INTEGER := 1;
first_name VARCHAR(50) := 'John';
last_name VARCHAR(50) := 'Doe';
salary NUMERIC(10,2) := 50000.00;
BEGIN
RAISE NOTICE '% % % earns $%',
counter,
first_name,
last_name,
salary;
END;
$$;
Output:
Example 2: Assign a Value to a Variable
The following block assigns a value to a variable after declaration.
Query:
DO $$
DECLARE
city VARCHAR(30);
BEGIN
city := 'New York';
RAISE NOTICE 'City: %', city;
END;
$$;
Output:
Example 3: Copy a Data Type Using %TYPE
The following block declares a variable using the data type of a table column.
Query:
DO $$
DECLARE
employee_name Employees.EmployeeName%TYPE;
BEGIN
SELECT EmployeeName
INTO employee_name
FROM Employees
WHERE EmployeeID = 101;
RAISE NOTICE 'Employee Name: %', employee_name;
END;
$$;
Output:
Example 4: Variables in Nested Blocks
The following block demonstrates variable scope in nested blocks.
Query:
DO $$
<<outer_block>>
DECLARE
counter INTEGER := 1;
BEGIN
RAISE NOTICE 'Outer Counter: %', counter;
DECLARE
counter INTEGER := 10;
BEGIN
RAISE NOTICE 'Inner Counter: %', counter;
RAISE NOTICE 'Outer Counter: %', outer_block.counter;
END;
END outer_block;
$$;
Output:

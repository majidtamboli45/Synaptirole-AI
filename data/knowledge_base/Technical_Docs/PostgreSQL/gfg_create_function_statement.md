# CREATE FUNCTION Statement

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-create-function-statement/

PostgreSQL allows developers to create user-defined functions to encapsulate reusable logic, making database operations more efficient and modular. The CREATE FUNCTION statement is used to define a new function, supporting various procedural languages, with plpgsql being the most commonly used in PostgreSQL.
In this article, we will explain PostgreSQL CREATE FUNCTION Statement with its syntax, structure, and practical usage of the CREATE FUNCTION statement, using examples from the dvdrental sample database.
Introduction to PostgreSQL CREATE FUNCTION
The CREATE FUNCTION statement in PostgreSQL is a powerful tool for defining custom functions that can be reused throughout our database operations. These functions can accept parameters, perform operations, and return values. Functions are especially useful for simplifying complex queries and centralizing logic that can be executed multiple times without rewriting the code.
Syntax
CREATE [OR REPLACE] FUNCTION function_name(param_list)
RETURNS return_type
LANGUAGE plpgsql
AS
$$
DECLARE
-- variable declaration
BEGIN
-- logic
END;
$$;
Key terms
- Function Name: Specify the name of the function after the CREATE FUNCTION keywords. UseOR REPLACE to update an existing function.
- Parameter List: Provide the function parameters within parentheses. A function can have zero or many parameters.
- Return Type: Specify the data type of the returned value after the RETURNS keyword.
- Language: Indicate the procedural language of the function using LANGUAGE plpgsql . PostgreSQL supports several languages, butplpgsql is commonly used for its rich feature set.
- Dollar-Quoted String: Use $$ to define the function body, containing the declaration and logic.
Example of PostgreSQL CREATE FUNCTION
Let us explain an example of CREATE FUNCTION Statement in PostgreSQL to better understand the concept. For the purpose of example, we will use the sample database ie, dvdrental. The following statement creates a function that counts the films whose length between the 'len_from' and 'len_to' parameters:
Query:
CREATE FUNCTION get_film_count(len_from INT, len_to INT)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
film_count INTEGER;
BEGIN
SELECT COUNT(*)
INTO film_count
FROM film
WHERE length BETWEEN len_from AND len_to;
RETURN film_count;
END;
$$;
The function 'get_film_count' has two main sections: header and body.
Header Section
- Function Name: 'get_film_count' follows the 'CREATE FUNCTION' keywords.
- Parameters: The function accepts two integer parameters: 'len_from' and 'len_to' .
- Return Type: The function returns an integer, specified by 'RETURNS INT' .
- Language: The function uses 'plpgsql' as its procedural language.
Body Section
- Dollar-Quoted String: The function body is enclosed in '$$' .
- Variable Declaration: A variable 'film_count' is declared to store the count of films.
- Logic: The 'SELECT INTO' statement counts films whose length is between 'len_from' and 'len_to' , storing the result in 'film_count' . The 'RETURN' statement returns the 'film_count' value.
Output
Running the Function
To create the function, follow these steps:
1. Using pgAdmin: Open pgAdmin, navigate to the dvdrental database, and enter the function code into the query editor. Click Execute to run the query
CREATE FUNCTION
2. Using psql: Open psql, connect to the dvdrental database, and run the function creation script. Once executed, we should see:
CREATE FUNCTION
3. Listing Functions: Finally, use the below command to list all user-defined in the current database:
\df
This will show you all the user-defined functions in the database as shown below:
Calling the Function
Once the function is created, we can call it using different notations:
1. Positional Notation
In this example, the function counts films with lengths between 40 and 90.
Query:
SELECT get_film_count(40, 90);
Output
 get_film_count 
----------------
325
(1 row)
2. Named Notation
Named notation makes it clearer which parameters are being passed to the function.
Query:
SELECT get_film_count(len_from => 40, len_to => 90);
Output
 get_film_count 
----------------
325
(1 row)
Important Points About PostgreSQL CREATE FUNCTION Statement
- Function Overloading: PostgreSQL supports function overloading, meaning we can create multiple functions with the same name but different parameter lists. 
- Immutable, Stable, Volatile: Functions can be marked as IMMUTABLE ,STABLE , orVOLATILE . Immutable functions always return the same result given the same input. Stable functions return the same result within a single table scan, and volatile functions can return different results even within a single table scan. This helps the optimizer to plan queries more efficiently.
- Security Features: By default, functions execute with the privileges of the user calling the function. We can use the SECURITY DEFINER clause to have the function execute with the privileges of the user who created the function.
Conclusion
Mastering the PostgreSQL CREATE FUNCTION statement opens the door to writing reusable and efficient database logic. Functions help simplify complex queries, improve performance, and keep our code organized. Whether we are writing a function to calculate values dynamically or retrieve specific data.
Using functions in PostgreSQL adds an extra layer of flexibility to our database management. Functions in PostgreSQL are not just limited to simple queries; they can be used in various advanced scenarios, making PostgreSQL a robust and versatile database system for developers.

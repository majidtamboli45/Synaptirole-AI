# CASE Statement

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-case-statement/

In PostgreSQL, CASE statements provide a way to implement conditional logic within SQL queries. Using these statements effectively can help streamline database functions, optimize query performance, and provide targeted outputs.
This guide will break down the types of CASE statements available in PostgreSQL, with detailed examples and explanations.
Introduction to PostgreSQL CASE Statements
CASE statements in PostgreSQL enable us to evaluate conditions and return results based on whether these conditions are true or false. PostgreSQL CASE is flexible, allowing for decision-making directly within queries, essential for building efficient functions and creating streamlined workflows
Types of CASE Statements
In PostgreSQL, there are two primary forms of the CASE statement:
- Simple CASE Statement
- Searched CASE Statement
1. Simple CASE Statement
The Simple CASE statement evaluates a search expression against a set of expressions using the equality operator (=).  If a match is found, the corresponding block of code is executed. If no match is found, the ELSE block (if provided) is executed; otherwise, PostgreSQL raises 
Syntax:
CASE search-expression
WHEN expression_1 [, expression_2, ...] THEN
when-statements
[ ... ]
[ELSE
else-statements ]
END CASE;
Key Terms
- 'search-expression' : The expression to be evaluated.
- 'WHEN expression' : The expressions to be matched against thesearch-expression .
- 'THEN when-statements' : The statements executed if theWHEN expression matches thesearch-expression .
- 'ELSE else-statements' : The statements executed if no match is found. This clause is optional.
Simple CASE statement Example
Here we will create a new function named 'get_price_segment' that accepts 'p_film_id' as the argument. Based on the rental rate of the film, it returns the price segment: mass, mainstream, high end. In case the price is not 0.99, 2.99 or 4.99, the function returns unspecified.
Query:
CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
RETURNS VARCHAR(50) AS $$
DECLARE
rate NUMERIC;
price_segment VARCHAR(50);
BEGIN
-- get the rate based on film_id
SELECT INTO rate rental_rate
FROM film
WHERE film_id = p_film_id;
CASE rate
WHEN 0.99 THEN
price_segment = 'Mass';
WHEN 2.99 THEN
price_segment = 'Mainstream';
WHEN 4.99 THEN
price_segment = 'High End';
ELSE
price_segment = 'Unspecified';
END CASE;
RETURN price_segment;
END; $$
LANGUAGE plpgsql;
Testing the Function: Now test the get_price_segment() function using the statement:
SELECT get_price_segment(123) AS "Price Segment";
Output
2. Searched CASE statement
The Searched CASE statement evaluates Boolean expressions in each WHEN clause sequentially from top to bottom. The first true Boolean expression triggers the execution of the corresponding statements. If no true expression is found and an ELSE clause is present, its statements are executed. If the ELSE clause is omitted and no match is found, PostgreSQL raises the 'CASE_NOT_FOUND' exception.
Syntax:
CASE
WHEN boolean-expression-1 THEN
statements
[ WHEN boolean-expression-2 THEN
statements
... ]
[ ELSE
statements ]
END CASE;
Key Terms
- 'boolean-expression' : A Boolean expression evaluated in sequence.
- 'THEN statements' : The statements executed if the Boolean expression is true.
- 'ELSE statements' : The statements executed if no Boolean expression is true. This clause is optional.
Searched CASE statement Example
The 'get_customer_service' function accepts 'p_customer_id' as the argument. It first gets the total payment paid by the customer from the payment table. Then based on the total payment, the function uses the searched CASE statement to return the service level platinum, gold, and silver.
Query:
CREATE OR REPLACE FUNCTION get_customer_service (p_customer_id INTEGER) 
RETURNS VARCHAR (25) AS $$
DECLARE
total_payment NUMERIC ;
service_level VARCHAR (25) ;
BEGIN
-- get the rate based on film_id
SELECT INTO total_payment SUM (amount)
FROM
payment
WHERE
customer_id = p_customer_id ;
CASE
WHEN total_payment > 200 THEN
service_level = 'Platinum' ;
WHEN total_payment > 100 THEN
service_level = 'Gold' ;
ELSE
service_level = 'Silver' ;
END CASE ;
RETURN service_level ;
END ; $$
LANGUAGE plpgsql;
Testing the Function: Now let's test the above function using the below statement:
SELECT 148 AS customer, get_customer_service(148)
UNION
SELECT 178 AS customer, get_customer_service(178)
UNION
SELECT 81 AS customer, get_customer_service(81);
Output:
Important Points About PostgreSQL CASE Statement
- Simple CASE vs. Searched CASE: The Simple CASE statement matches expressions using equality, while the Searched CASE statement evaluates Boolean expressions.
- Error Handling: Both CASE statements can raise a 'CASE_NOT_FOUND' exception if no match is found and the ELSE clause is omitted.
- Practical Use Cases: Use CASE statements to streamline decision-making logic within your PostgreSQL functions and queries.
Conclusion
PostgreSQL CASE statements are a valuable tool for adding conditional logic to SQL queries, allowing us to make decisions within your database operations. By using Simple CASE for direct matches and Searched CASE for evaluating conditions, we can handle data more efficiently and improve query performance. These statements are especially useful for organizing complex queries, making them essential for anyone looking to manage data effectively in PostgreSQL.

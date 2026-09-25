# NUMERIC Data Type

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-numeric-data-type/

In PostgreSQL, the NUMERIC data type is designed for high-precision number storage by making it ideal for financial and scientific applications where accuracy is critical. It supports a large number of digits both before and after the decimal point, minimizing rounding errors.
Understanding the nuances of these types is essential for effective database design and management. In this article, We will learn about the PostgreSQL NUMERIC type by understanding it's difference, syntax, use cases, and examples.
PostgreSQL NUMERIC Type
- NUMERIC data type in PostgreSQL is designed to store numbers with a large number of digits by offering a high degree of precision and accuracy. 
- This makes it suitable for financial data and other applications where rounding errors cannot be tolerated.
- The NUMERIC value can have up to 131,072 digits before the decimal point and up to 16,383 digits after the decimal point. It is possible to have a zero or positive scale.
Syntax:
NUMERIC(precision, scale)
Parameters:
- Precision: Total number of digits.      
- Scale: Number of digits in terms of a fraction.
Examples of NUMERIC Syntax
1. With Precision and Scale:
Syntax:
NUMERIC(precision, scale)
For example, 'NUMERIC(5, 2)' allows up to 5 digits in total, with 2 digits after the decimal point.
2. With Precision Only:
Syntax:
NUMERIC(precision)
This syntax sets the precision but assumes a scale of zero.
3. Without Precision and Scale:
Syntax:
NUMERIC
This syntax allows unlimited precision and scale.
NUMERIC vs. DECIMAL
Here’s a comparison of the NUMERIC and DECIMAL data types in PostgreSQL presented in a table format:
| Feature | NUMERIC | DECIMAL | 
|---|---|---|
| Definition | Stores numbers with a defined precision and scale. | Equivalent to NUMERIC, with the same functionality. | 
| Precision | Up to 131,072 digits before the decimal point. | Up to 131,072 digits before the decimal point. | 
| Scale | Up to 16,383 digits after the decimal point. | Up to 16,383 digits after the decimal point. | 
| Use Case | Ideal for financial data where precision is critical. | Used for exact numeric values; often interchangeable with NUMERIC. | 
| Performance | Generally slower than integer, float, and double precision due to high precision. | Generally slower than integer, float, and double precision due to high precision. | 
| Rounding Behavior | Rounds values to fit the specified scale when inserting. | Rounds values to fit the specified scale when inserting. | 
| Default Scale | Scale can be specified or left out, assuming a scale of zero. | Scale can be specified or left out, assuming a scale of zero. | 
| Storage Requirement | Requires more storage space than integer and floating-point types. | Requires more storage space than integer and floating-point types. | 
Examples of PostgreSQL NUMERIC Data Type
Let us take a look at some of the examples of NUMERICE Data type in PostgreSQL to better understand the concept.
Example 1: Storing numeric values
Create a new table named products with the below commands:
CREATE TABLE IF NOT EXISTS products (
id serial PRIMARY KEY,
name VARCHAR NOT NULL,
price NUMERIC (5, 2)
);
INSERT INTO products (name, price)
VALUES
('Phone', 100.2157),
('Tablet', 300.2149);
SELECT
*
FROM
products
Output:
Explanation: PostgreSQL rounds the values based on the scale defined.
- '100.2157' is rounded to '100.22'
- '300.2149' is rounded to '300.21'
Example 2: Using PostgreSQL NUMERIC Type with NaN
Step 1: Create a Table to Store NUMERIC Values
CREATE TABLE test_nan (
value NUMERIC
);
Step 2: Insert a Valid NUMERIC Value and NaN
INSERT INTO test_nan (value) VALUES (123.45);  -- Valid NUMERIC value
INSERT INTO test_nan (value) VALUES (NaN); -- Inserting NaN
Step 3: Query the Table to See the Results
SELECT * FROM test_nan;
Output:
| value | 
|---|
| 123.45 | 
| NaN | 
Explanation: The table displays two rows: one with the valid numeric value 123.45 and another with NaN, demonstrating the handling of both standard numeric values and NaN in PostgreSQL.
Important Points About PostgreSQL NUMERIC Data Type
- PostgreSQL's NUMERIC type can handle a precision of up to 131,072 digits before the decimal point and up to 16,383 digits after the decimal point.
- When inserting a value into a NUMERIC column with a defined scale, PostgreSQL automatically rounds the value to fit the specified scale.
- If no precision and scale are specified, PostgreSQL allows NUMERIC to hold any number of digits.
- While NUMERIC provides high precision, it is computationally more expensive than integer, floating-point, or double precision types.
Conclusion
In conclusion, the NUMERIC data type in PostgreSQL offers a robust solution for storing numbers that require high precision, making it particularly suitable for financial transactions. While it is functionally similar to the DECIMAL type, understanding their difference can help database designers make informed decisions based on the needs of their applications. By leveraging the capabilities of NUMERIC and DECIMAL, users can ensure data integrity and accuracy, ultimately enhancing the overall performance of their PostgreSQL databases.

# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-cast/

The CAST operator in PostgreSQL is used to convert a value from one data type to another. It helps perform operations on compatible data types and improves the readability of SQL queries.
- Perform calculations on converted values.
- Format query results in the required data type.
- Ensure compatibility between different data types.
Syntax
CAST(expression AS data_type)
or
expression::data_type
Where:
- expression: The value or column to be converted.
- data_type: The target data type.
Working
Firstly, create a Products table and insert some records.
CREATE TABLE Products (    ProductID INT PRIMARY KEY,    ProductName VARCHAR(50),    Price VARCHAR(20));INSERT INTO Products VALUES(101, 'Laptop', '75000'),(102, 'Keyboard', '2500'),(103, 'Mouse', '1200');
Example 1: Basic CAST
The following query converts the Price column from text to an integer.
Query:
SELECT ProductName,       CAST(Price AS INTEGER) AS PriceFROM Products;
Output:
- The CAST() function converts the Price column from VARCHAR to INTEGER.
- The converted values are returned as integers.
Example 2: CAST with Arithmetic Operation
The following query converts the Price column into an integer and adds 500 to each product price.
Query:
SELECT ProductName,       CAST(Price AS INTEGER) + 500 AS UpdatedPriceFROM Products;
Output:
- The CAST() function converts the Price column into an integer.
- PostgreSQL performs the arithmetic operation after the conversion.
- The query returns the updated price for each product.
Example 3: Using the :: Type Cast Operator
The following query converts the Price column into an integer using PostgreSQL's :: type cast operator.
Query:
SELECT ProductName,
Price::INTEGER AS Price
FROM Products;
Output:
- The :: operator is PostgreSQL's shorthand syntax for type conversion.
- It produces the same result as the CAST() function while using a shorter syntax.

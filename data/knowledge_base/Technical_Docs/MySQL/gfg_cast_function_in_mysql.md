# CAST( ) Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/mysql-cast-function/

The MySQL CAST() function is used to convert a value from one data type to another. It is useful when you need to change the data type of a value while performing calculations, comparisons or other SQL operations.
- Helps perform operations using the required data type.
- Can be used with numbers, strings and date/time values.
- Returns the converted value in the specified data type.
Syntax
CAST(value AS data_type)
Where:
- value: The value that needs to be converted.
- data_type: The data type to which the value is converted.
Working
Example 1
Implementing CAST() function to convert a value to DATE datatype.
SELECT CAST("2023-04-19" AS DATE); Output:
Example 2
Implementing CAST() function to convert a value to CHAR datatype.
SELECT CAST(121 AS CHAR); Output:
Example 3
Implementing CAST() function to convert a value to the SIGNED datatype.
SELECT CAST(2-4 AS SIGNED); Output:
Example 4
Implementing CAST() function to convert a value to the UNSIGNED datatype.
SELECT CAST(2-4 AS UNSIGNED); Output:
Example 5
Suppose we have an Orders table containing order details such as OrderID, CustomerName and OrderDate.
Now, we will apply some operations to see how the output changes according to the given condition.
Query:
SELECT OrderID, CustomerName, OrderDate
FROM Orders
WHERE CAST(OrderDate AS YEAR) = 2022
ORDER BY OrderDate DESC;
Output:

# RTRIM() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/rtrim-function-in-mysql/

The RTRIM() function in MySQL removes trailing spaces from the right side of a string. It is useful for cleaning text data that contains unnecessary spaces at the end.
- Can be used with both string values and table columns.
- Does not remove spaces from the beginning of a string.
Syntax
RTRIM(string);
- string: The text value from which trailing spaces are removed.
Example
SELECT RTRIM('Hello World   ') AS result;
Output:
- RTRIM() removes the extra spaces from the right side of the string.
Working
Consider a customer table containing names with trailing spaces.
SELECT customer_id, RTRIM(customer_name) AS customer_name
FROM customers;
Output:
- Here, RTRIM() removes the unnecessary spaces from the right side of each employee name.

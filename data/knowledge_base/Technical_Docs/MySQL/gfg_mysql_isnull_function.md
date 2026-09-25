# MySQL ISNULL( ) Function

> Source: https://www.geeksforgeeks.org/mysql/mysql-isnull-function/

The MySQL ISNULL() function is used for checking whether an expression is NULL or not.
This function returns 1 if the expression passed is NULL; otherwise, it returns 0. The ISNULL() function in MySQL accepts the expression as a parameter and returns an integer with a value of a value 0 or 1 depending on the parameter passed.
Syntax
MySQL ISNULL() function syntax is:
ISNULL(expression)
Parameters:
- expression - It is used to specify the expression.
Supported Versions of MySQL
The MySQL ISNULL function is supported on following versions:
- MySQL 5.7
- MySQL 5.6
- MySQL 5.5
- MySQL 5.1
- MySQL 5.0
- MySQL 4.1
- MySQL 4.0
- MySQL 3.23
MySQL ISNULL( ) Function Example
Let's look at some examples of the ISNULL() function in MySQL. Learning the ISNULL() function with examples will help in understanding the concept better.
Example 1
Implementing ISNULL() function.
SELECT ISNULL(NULL); Output:
1 Example 2
Implementing ISNULL() function on a string.
SELECT ISNULL("gfg"); Output:
0 Example 3
Implementing ISNULL() function on an integer value.
SELECT ISNULL(123); Output:
0 Important Points About MySQL ISNULL() Function
- The ISNULL() function is used to check if a value is NULL or not.
- It returns 1 if the expression is NULL, otherwise it returns 0.
- It can be used in SELECT, WHERE, and other clauses.
- It is different from the IFNULL() function, which is the MySQL equivalent of SQL Server's ISNULL().
- It is useful for handling NULL values in queries and filtering rows where a column is NULL or not NULL.

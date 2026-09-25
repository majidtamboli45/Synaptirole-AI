# MySQL BETWEEN Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-between-operator/

The BETWEEN operator in MySQL is used to filter results within a specified range, including both boundary values. It helps simplify queries by defining lower and upper limits in a concise way.
- Supports filtering for numbers, dates, and even text values within a defined range.
- Improves query readability and efficiency compared to using multiple conditions.
Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
- column_name: The column on which the range condition is applied.
- value1: The starting value (lower limit) of the range.
- value2: The ending value (upper limit) of the range.
Working with MySQL BETWEEN Operator
Let’s look at some examples of the MySQL BETWEEN operator to understand how it works in real queries. First, we create a demo table on which the BETWEEN operator will be used:
Example 1: Salary Between 70000 and 80000
In this example, we retrieve employees whose salaries fall between 70,000 and 80,000.
Query:
SELECT * FROM employees 
WHERE salary BETWEEN 70000 AND 80000;
Output:
- Filters employees whose salary lies within the specified range, including both 70,000 and 80,000.
- Useful for identifying employees within a particular salary bracket.
Example 2: Employee Names Between 'A' and 'M'
In this example, we use the BETWEEN operator on a text column to retrieve employees whose names fall alphabetically between 'A' and 'M'.
Query:
SELECT * FROM employees 
WHERE name BETWEEN 'A' AND 'M';
Output:
- Retrieves employees whose names fall alphabetically between 'A' and 'M'.
- Demonstrates that BETWEEN can also be applied to string values based on lexicographical order.
Example 3: Salary NOT Between 70000 and 80000
In this example, we use NOT BETWEEN to retrieve employees whose salaries fall outside the range of 70,000 to 80,000.
Query:
SELECT * FROM employees 
WHERE salary NOT BETWEEN 70000 AND 80000;
Output:
- Selects employees whose salary falls outside the specified range.
- Helps exclude a specific range of values while retrieving remaining records.

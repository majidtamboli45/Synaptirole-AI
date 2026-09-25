# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-any-operator/

The ANY operator in PostgreSQL is used to compare a value with a set of values returned by a subquery or an array. The condition evaluates to TRUE if at least one value in the set satisfies the comparison.
- Supports comparison operators such as =, >, <, >=, <= and <>.
- Commonly used with subqueries.
Syntax
SELECT column1, column2, ...
FROM table_name
WHERE expression comparison_operator ANY (
subquery
);
Where:
- expression: The value to compare.
- comparison_operator: Operators such as =, >, <, >=, <= or <>.
- ANY: Returns TRUE if at least one comparison is true.
- subquery: Returns a single-column result set.
Examples
Firstly, create the Department and Employee tables and insert some records.
Example 1: Basic Use with an Array
SELECT *
FROM Employee
WHERE Salary = ANY (ARRAY[45000, 65000]);
Output:
Example 2: Use with a Subquery
SELECT EmployeeName
FROM Employee
WHERE Salary > ANY (
SELECT MinSalary
FROM Department
);
Output:
This query returns employees whose salary is greater than at least one department's minimum salary.
Example 3: Use with NOT ANY
SELECT *
FROM Employee
WHERE NOT (Salary = ANY (ARRAY[45000, 65000]));
Output:
This query retrieves employees whose salary is not equal to 45000 or 65000.
Example 4: Combining Conditions
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ANY (ARRAY[40000, 60000])
AND EmployeeID > 101;
Output:
This query returns employees whose salary is greater than at least one value in the array and whose EmployeeID is greater than 101.

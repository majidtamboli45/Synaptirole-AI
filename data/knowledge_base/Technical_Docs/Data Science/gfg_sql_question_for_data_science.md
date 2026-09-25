# SQL Question For Data Science

> Source: https://www.geeksforgeeks.org/data-science/top-sql-question-for-data-science-interview/

In the field of data science, SQL knowledge is often tested through a range of interview questions designed to assess both fundamental and advanced skills. These questions cover various aspects of SQL, including basic queries, data manipulation, aggregation functions, subqueries, joins, and performance optimization. Understanding these topics not only helps in tackling interview questions but also in applying SQL to real-world data challenges.
SQL Question For Data Science Interview
This comprehensive list of SQL interview questions and answers aims to provide data science professionals with a solid foundation in SQL, ensuring they are well-prepared to handle a variety of scenarios encountered in both interviews and practical applications. Whether you are a novice looking to build your SQL skills or an experienced practitioner seeking to refresh your knowledge, this guide offers valuable insights and examples to enhance your SQL proficiency.
Table of Content
Basic SQL Queries
1. What is SQL?
SQL (Structured Query Language) is a standard language used for managing and manipulating relational databases. It allows users to perform tasks such as querying data, updating records, and managing schemas.
2. Explain the difference between SQL and NoSQL databases.
SQL databases are relational and use structured query language for defining and manipulating data. They are suitable for complex queries and transactions. NoSQL databases are non-relational and are used for unstructured data, offering flexibility in data storage and scalability.
3. What are the main SQL data types?
Common SQL data types include:
- INT : Integer
- VARCHAR(length) : Variable-length string
- DATE : Date
- FLOAT : Floating-point number
- BOOLEAN : True or False value
4. Write a query to select all columns from a table named employees.
Example: "SELECT * FROM employees;"
5. How do you filter records in SQL? Provide an example.
Use the WHERE clause to filter records. Example: "SELECT * FROM employees WHERE department = 'Sales';"
6. What is the purpose of the GROUP BY clause? Give an example.
GROUP BY is used to group rows that have the same values into summary rows. Example: "SELECT department, COUNT(*) FROM employees GROUP BY department;"
7. Explain the difference between INNER JOIN and LEFT JOIN.
INNER JOIN returns only rows with matching values in both tables. LEFT JOIN returns all rows from the left table and matched rows from the right table; unmatched rows from the right table are filled with NULLs.
- INNER JOIN Example:"SELECT employees.name, departments.department FROM employees INNER JOIN departments ON employees.dept_id = departments.dept_id;"
- LEFT JOIN Example:"SELECT employees.name, departments.department FROM employees LEFT JOIN departments ON employees.dept_id = departments.dept_id;"
8. How do you sort the results of a query?
Use the ORDER BY clause. Example: "SELECT * FROM employees ORDER BY salary DESC;"
9. What is the purpose of the HAVING clause? How does it differ from WHERE?
HAVING is used to filter records after GROUP BY has been applied, while WHERE is used to filter records before grouping. Example using HAVING: "SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 50000;"
Aggregation and Functions
10. Write a query to find the top 5 highest salaries from a table named salaries.
Example: "SELECT salary FROM salaries ORDER BY salary DESC LIMIT 5;"
11. How do you calculate the average of a column?
Use the AVG() function. Example: "SELECT AVG(salary) FROM employees;"
12. What is the difference between COUNT(*) and COUNT(column_name)?
COUNT(*) counts all rows, including those with NULLs. COUNT(column_name) counts only rows where the specified column is not NULL.
- Example with COUNT(*) :"SELECT COUNT(*) FROM employees;"
- Example with COUNT(column_name) :"SELECT COUNT(salary) FROM employees;"
13. How do you find the maximum and minimum values in a column?
Use MAX() and MIN() functions.
- Example with MAX() :"SELECT MAX(salary) FROM employees;"
- Example with MIN() :"SELECT MIN(salary) FROM employees;"
14. Explain how the CASE statement works in SQL.
The CASE statement allows for conditional logic in SQL queries. Example: "SELECT name, CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END AS salary_status FROM employees;"
15. Write a query to find the number of employees in each department.
Example: "SELECT department, COUNT(*) FROM employees GROUP BY department;"
16. What is a window function? Provide an example.
Window functions perform calculations across a set of table rows related to the current row. They are used for running totals, rankings, etc. Example: "SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank FROM employees;"
17. Explain the use of the RANK() function with an example.
The RANK() function assigns a rank to each row within a partition of the result set, with gaps in rank values if there are ties. Example: "SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank FROM employees;"
18. How do you perform date arithmetic in SQL?
Use date functions and operators to add or subtract time intervals. Example: "SELECT CURRENT_DATE - INTERVAL '30' DAY AS past_date;"
Subqueries and Joins
19. What is a CROSS JOIN and when would you use it?
CROSS JOIN returns the Cartesian product of two tables, meaning every row of the first table is combined with every row of the second table. It is rarely used but useful in some scenarios. Example: "SELECT * FROM employees CROSS JOIN departments;"
20. Write a query to calculate the running total of sales by month.
Example: "SELECT month, SUM(sales) OVER (ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM sales_data;"
21. What is a subquery? Provide an example.
A subquery is a query within another query used to perform operations that depend on the results of the outer query. Example: "SELECT name FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'Sales');"
22. How do you use a subquery in the WHERE clause?
Subqueries in the WHERE clause are used to filter results based on the results of another query. Example: "SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);"
23. What is a correlated subquery? Provide an example.
A correlated subquery refers to a subquery that references columns from the outer query. It is evaluated once for each row processed by the outer query. Example: "SELECT name FROM employees e1 WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.department_id = e2.department_id);"
24. Explain the difference between UNION and UNION ALL.
UNION combines the results of two queries and removes duplicates. UNION ALL combines results without removing duplicates.
- UNION Example:"SELECT name FROM employees UNION SELECT name FROM managers;"
- UNION ALL Example:"SELECT name FROM employees UNION ALL SELECT name FROM managers;"
25. Write a query to find employees who have a higher salary than the average salary.
Example: "SELECT name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);"
26. How do you join three tables? Provide a query example.
You can join three tables using multiple JOIN operations. Example: "SELECT e.name, d.department_name, p.project_name FROM employees e INNER JOIN departments d ON e.department_id = d.department_id INNER JOIN projects p ON e.project_id = p.project_id;"
27. What is a self-join and when would you use it?
A self-join is a join where a table is joined with itself. It is useful for hierarchical data or comparing rows within the same table. Example: "SELECT e1.name AS Employee, e2.name AS Manager FROM employees e1 LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;"
28. How do you handle duplicate records in a query result?
Use the DISTINCT keyword to remove duplicate rows. Example: "SELECT DISTINCT department FROM employees;"
29. What is the purpose of the EXISTS clause?
The EXISTS clause is used to check if a subquery returns any results. It returns TRUE if the subquery returns one or more rows. Example: "SELECT name FROM employees WHERE EXISTS (SELECT * FROM departments WHERE departments.department_id = employees.department_id);"
30. Write a query to find customers who have made more than 3 orders.
Example: "SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 3;"
Data Manipulation and Transactions
31. How do you insert a new record into a table?
Use the INSERT INTO statement. Example: "INSERT INTO employees (name, department, salary) VALUES ('John Doe', 'Marketing', 60000);"
32. What is the purpose of the UPDATE statement?
The UPDATE statement modifies existing records in a table. Example: "UPDATE employees SET salary = 70000 WHERE name = 'John Doe';"
33. How do you delete records from a table?
Use the DELETE FROM statement. Example: "DELETE FROM employees WHERE name = 'John Doe';"
34. Explain the concept of transactions in SQL.
Transactions are sequences of operations performed as a single unit of work. They ensure that a series of operations either all succeed or all fail, maintaining database integrity.
35. What are COMMIT and ROLLBACK?
COMMIT makes all changes made in the transaction permanent. ROLLBACK undoes all changes made in the transaction.
- Example with COMMIT :"COMMIT;"
- Example with ROLLBACK :"ROLLBACK;"
36. How do you handle errors during transactions?
Use ROLLBACK to revert changes if an error occurs, ensuring the database remains consistent.
37. What is an ACID property in the context of SQL?
ACID stands for Atomicity, Consistency, Isolation, and Durability, which are properties that guarantee reliable transactions in a database system.
38. How can you prevent SQL injection attacks?
Use parameterized queries or prepared statements to avoid SQL injection by ensuring that user inputs are properly escaped and treated as data rather than executable code.
39. Write a query to update the salary of employees in a specific department.
Example: "UPDATE employees SET salary = salary * 1.1 WHERE department = 'Sales';"
Performance and Optimization
40. How do you perform a bulk insert of data into a table?
Use the INSERT INTO ... VALUES statement with multiple value sets or use the LOAD DATA command for large datasets.
- Example with multiple values: "INSERT INTO employees (name, department, salary) VALUES ('Alice', 'HR', 55000), ('Bob', 'IT', 60000);"
- Example with LOAD DATA (MySQL):"LOAD DATA INFILE 'file_path.csv' INTO TABLE employees FIELDS TERMINATED BY ',';"
41. What is an index? Why is it important?
An index is a database object that improves the speed of data retrieval operations on a table. It is crucial for optimizing query performance, especially with large datasets.
42. How do you create an index on a table?
Use the CREATE INDEX statement. Example: "CREATE INDEX idx_salary ON employees(salary);"
43. What are some common strategies for optimizing SQL queries?
Common strategies include:
- Using indexes appropriately
- Writing efficient queries
- Avoiding unnecessary columns in SELECT statements
- Using EXISTS instead ofIN for subqueries
44. Explain the difference between clustered and non-clustered indexes.
A clustered index determines the physical order of data in the table and there can be only one per table. A non-clustered index creates a logical order of data but does not affect the physical storage, and multiple non-clustered indexes can exist per table.
45. What is query execution plan and how can it help in optimization?
A query execution plan is a detailed description of how the database engine executes a query. It helps identify performance bottlenecks and optimize queries by showing how data retrieval is performed.
46. How do you handle large datasets and improve query performance?
Strategies include:
- Using indexing to speed up searches
- Partitioning tables to manage large datasets
- Optimizing queries to reduce resource consumption
- Implementing data compression techniques
47. What is normalization and why is it important?
Normalization is the process of organizing data to reduce redundancy and improve data integrity. It is important to ensure data consistency and efficient data management.
48. Explain the concept of denormalization with an example.
Denormalization involves merging tables or introducing redundancy to improve read performance. For example, storing aggregated data in a summary table to speed up queries. Example: "CREATE TABLE sales_summary AS SELECT department, SUM(sales) FROM sales GROUP BY department;"
49. What are the potential drawbacks of over-normalization?
Over-normalization can lead to excessive joins, which may degrade performance. It can also make the database schema complex and harder to manage.
50. How can you use SQL to analyze and debug performance issues?
Use tools like EXPLAIN or EXPLAIN ANALYZE to review query execution plans and identify slow-running queries. Analyze indices, examine query patterns, and optimize based on findings.

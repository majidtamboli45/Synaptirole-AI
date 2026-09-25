# MySQL INTERSECT Operator

> Source: https://www.geeksforgeeks.org/mysql/mysql-intersect-operator/

In MySQL, the INTERSECT operator is used to find common records between two result sets. However, MySQL does not support the INTERSECT operator natively. To achieve similar functionality, you can use alternative methods such as INNER JOINs or subqueries.
These techniques allow you to retrieve the intersection of data from multiple tables, enabling you to filter out unique records and focus on shared data. This guide will explore how to simulate the INTERSECT operator in MySQL with practical examples.
MySQL INTERSECT
MySQL does not support the INTERSECT operator natively, unlike some other SQL databases such as PostgreSQL and Oracle. However, you can achieve the same functionality using a combination of INNER JOIN or subqueries with DISTINCT.
The INTERSECT operator in other SQL databases is used to return the common records from two or more SELECT statements. These SELECT statements must have the same number of columns in the result sets with similar data types.
Syntax:
The syntax for using INTERSECT in SQL is as follows:
SELECT column1, column2, ...
FROM table1
INTERSECT
SELECT column1, column2, ...
FROM table2;
Parameters:
- column1, column2, ... : Columns to be selected fromtable1 andtable2 .
- table1 : The first table from which to retrieve data.
- table2 : The second table from which to retrieve data.
This syntax is used to find the intersection of rows between table1 and table2 based on the columns selected in both queries. MySQL does not support the INTERSECT operator directly; alternatives like INNER JOIN or subqueries with IN are used instead.
Example of MySQL INTERSECT
-- Create the table name, customers.
CREATE TABLE customers (
customer_id INT,
name VARCHAR(50)
);
-- Putting in an example data in the 'customers' column
INSERT INTO customers (customer_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');
-- Make the 'premium_customers' table now
CREATE TABLE premium_customers (
customer_id INT,
name VARCHAR(50)
);
-- Inserting sample data into the '"premium_customers" table
INSERT INTO premium_customers (customer_id, name) VALUES
(2, 'Bob'),
(3, 'Charlie'),
(5, 'Emma'),
(6, 'Frank');
customers table:
+-------------+---------+
| customer_id | name |
+-------------+---------+
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |
| 4 | David |
+-------------+---------+
premium_customers table:
+-------------+---------+
| customer_id | name |
+-------------+---------+
| 2 | Bob |
| 3 | Charlie |
| 5 | Emma |
| 6 | Frank |
+-------------+---------+
Examples of MySQL INTERSECT
Example 1: INTERSECT Operator using DISTINCT and INNER JOIN Clause
- INNER JOIN Clause: The  INNER JOIN is used to combine rows from either two or more tables as they are related by one column between them. This involves customer_id between customers and premium_customers tables.
- DISTINCT Keyword: The DISTINCT keyword plays a critical role in eliminating duplicate rows in the outcome set. It allows only such pairs of customer_id and name to exist which are unique and different from the others.
SELECT DISTINCT customers.customer_id, customers.name
FROM customers
INNER JOIN premium_customers ON customers.customer_id= premium_customers.customer_id;
Output Explanation:
This query determines the customer IDs and names from the customers table which are in the premium_customers table by comparing them with each other on the customer_id column. With the DISTINCT keyword comes the assurance of only having unique rows selected in the result set.
Output:
+-------------+---------+
| customer_id | name |
+-------------+---------+
| 2 | Bob |
| 3 | Charlie |
+-------------+---------+
Example 2: INTERSECT Operator using IN and Subquery
- Subquery: A subquery, or the query nestled within another query, is known as an inner or nested query. Here, the subquery gets out the customer_id values from the table premium customers.
- IN Operator: The IN operator is applied to check the suitability of a value against any value of the subquery; It removes customers rows with data that matches those found by the subquery.
SELECT customer_id, name
FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM premium_customers
);
Output Explanation:
This query finds the customers' IDs and names from the customers table where the customers' IDs are within the result set of the subquery, which assumes the customer IDs from the premium_customers table.
Output:
+-------------+---------+
| customer_id | name |
+-------------+---------+
| 2 | Bob |
| 3 | Charlie |
+-------------+---------+
Conclusion
MySQL INTERSECT operator is an effective means of identifying similar data features throughout multiple datasets thus facilitating comparative operations and data analysis. It does not matter if a developer decodes the data with the INNER JOIN clauses, subqueries, or other options. The INTERSECT is a tool to optimize and put together different approaches offered by the developers.

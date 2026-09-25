# SQL DELETE JOIN

> Source: https://www.geeksforgeeks.org/sql/sql-delete-join/

The SQL DELETE JOIN statement allows you to delete rows from one table based on matching conditions in another related table. It is useful for managing linked data across multiple tables while ensuring database consistency.
- Deletes rows from only one table even when multiple tables are joined.
- Uses joins to apply conditions based on related table data.
- Supports INNER JOIN, LEFT JOIN and USING to match rows.
- Allows precise deletion using the WHERE clause.
Example: First, we create a demo SQL database and tables, on which we use the DELETE JOIN command.
Query:
DELETE employees
FROM employees
JOIN departments
ON employees.dept_id = departments.dept_id
WHERE departments.dept_name = 'HR';
- Joins the employees table with the departments table using dept_id.
- Deletes employees whose department name is HR.
Syntax
DELETE table_1 
FROM table_1
JOIN table_2
ON table1.attribute_name = table2.attribute_name
WHERE condition;
- table_1: The primary table from which rows will be deleted
- table_2: The table used for comparison or condition.
- ON: Specifies the condition for the JOIN.
- WHERE: Optional; filters which rows to delete.
Example of DELETE JOIN
In this example, we demonstrate the implementation of DELETE JOIN. Consider the following tables for the example below:
Query:
DELETE orders
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.status = 'inactive';
SELECT *
FROM orders;
Output:
- Joins the orders table with customers using the customer_id column.
- Deletes rows from orders where the customer status is inactive.
- Displays the remaining records in the orders table using SELECT *.

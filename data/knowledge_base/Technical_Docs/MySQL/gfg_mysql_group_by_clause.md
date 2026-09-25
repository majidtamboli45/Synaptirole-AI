# MySQL Group By Clause

> Source: https://www.geeksforgeeks.org/mysql/mysql-group-by-clause/

MySQL provides the GROUP BY clause to group rows with similar values into summary rows. It is useful for performing calculations on grouped data using aggregate functions.
- It groups rows based on one or more columns.
- It is used with aggregate functions like SUM, COUNT, AVG, MIN, and MAX.
- It helps in summarizing data into meaningful results.
- It is commonly used for analysis such as total sales or count of records.
Syntax:
SELECT column1, aggregate_function(column2)
FROM table_name
WHERE condition
GROUP BY column1;
Where,
- column1: Columns by which you want to group the result set.
- aggregate_function: Functions like SUM, COUNT, AVG, etc., to perform calculations on the grouped data.
- table_name: The table name from which you are fetching the data.
- condition: Conditions to filter rows before grouping. This is optional if you are going to perform just a raw and simple query
Examples of MySQL Group By Clause
Let’s create a table employees with columns employee_id, name, department, and salary.
Example 1: Grouping by a Single Column
Let’s find the average salary in each department in Employees Table.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
Output:
Example 2: Grouping by Multiple Columns
Consider the same employees table , here we will find the average salary for each employee within their department. We can use the GROUP BY clause with multiple columns: department and name.
SELECT department, name, AVG(salary) AS average_salary
FROM employees
GROUP BY department , name;
Output:
Lets see the working of GROUP BY Clause along with the aggregate functions such as SUM, AVG,COUNT,MIN and MAX.
Example 3: Using the COUNT() Function
In this example, we will find the count of employees in each department or we can say how many employees are there in each department. We can use the COUNT() function to count the number of rows for each department.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
Output:
Example 4: Using the SUM() Function
Let us calculate the total salary paid to employees in each department. We use the SUM() function in this query:
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
Output:
Example 5: Using the MIN() Function
Here, in this example we will calculate the minimum salary in each department using the MIN() function.
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;
Output:
Example 6: Using the MAX() Function
Here in this example, we will calculate the maximum salary in each department using the MAX() function.
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;
Output:
Example 7: MySQL GROUP BY Clause with AVG Function
Let us calculate the average salary in each department again to reinforce the use of the AVG() function.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
Output:

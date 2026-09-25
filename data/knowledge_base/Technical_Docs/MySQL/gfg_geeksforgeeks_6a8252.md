# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/mysql/mysql-update-view/

The MySQL UPDATE statement can be used to modify data through an updatable view. Changes made through the view are also reflected in the underlying table.
- Updates existing data through a view.
- The WHERE clause can be used to update specific records.
- Multiple columns can be updated using a single UPDATE statement.
Syntax
UPDATE view_name
SET column1 = value1, column2 = value2
WHERE condition;
Example
First, create a customers table:
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50),
age INT
);
Insert records:
INSERT INTO customers
VALUES
(1, 'John', 'New York', 25),
(2, 'Emily', 'London', 30),
(3, 'Michael', 'Sydney', 28);
Create a View
CREATE VIEW customer_view AS
SELECT customer_id, customer_name, city, age
FROM customers;
To view the records:
SELECT * FROM customer_view;
Output:
Update a View
To update John's age through the view:
UPDATE customer_view
SET age = 26
WHERE customer_id = 1;
Now, verify the original table:
SELECT * FROM customers;
Output:
- Here, updating customer_view also updates the corresponding record in the customers table.
Update Multiple Columns
Multiple columns can be updated through a view:
UPDATE customer_view
SET city = 'Toronto', age = 27
WHERE customer_id = 1;
Output:
Update Multiple Rows
The WHERE clause can also be used to update multiple records:
UPDATE customer_view
SET city = 'Paris'
WHERE age > 27;
- This updates the city of all customers whose age is greater than 27.

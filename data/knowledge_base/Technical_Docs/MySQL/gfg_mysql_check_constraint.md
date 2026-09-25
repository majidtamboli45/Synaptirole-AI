# MYSQL CHECK Constraint

> Source: https://www.geeksforgeeks.org/mysql/mysql-check-constraint/

MySQL provides the CHECK constraint to restrict the values that can be inserted or updated in a table.
- Ensures that values satisfy a specific condition.
- Prevents invalid data from being inserted.
- Can be defined while creating a table.
- Can also be added to an existing table.
CHECK Constraint Using CREATE TABLE
Syntax:
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    CHECK (condition)
);
Example:
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    CHECK (price > 0)
);
Here, the CHECK constraint ensures that the product price must be greater than 0.
Insert Records
INSERT INTO products (product_id, product_name, price)
VALUES
(101, 'Laptop', 55000),
(102, 'Keyboard', 1500);
These records are inserted successfully because both prices satisfy the condition.
To display the records:
SELECT * FROM products;
Output:
Invalid Value
INSERT INTO products (product_id, product_name, price)
VALUES (103, 'Mouse', -500);
Output:
CHECK Constraint Using ALTER TABLE
Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
CHECK (condition);
Example:
ALTER TABLE products
ADD CONSTRAINT check_price
CHECK (price > 0);
This ensures that the price column cannot contain values less than or equal to 0.

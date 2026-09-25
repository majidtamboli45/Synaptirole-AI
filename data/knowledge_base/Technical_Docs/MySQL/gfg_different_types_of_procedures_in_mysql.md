# Different types of Procedures in MySQL

> Source: https://www.geeksforgeeks.org/mysql/different-types-of-procedures-in-mysql/

A stored procedure in MySQL is a set of SQL statements stored in the database and executed whenever required. It is useful for performing repetitive database operations.
- Stores multiple SQL statements under a single name.
- Can accept input and output parameters.
- Can be executed whenever needed.
- Useful for performing database operations such as inserting, updating and retrieving data.
Syntax
DELIMITER //
CREATE PROCEDURE procedure_name()
BEGIN
    -- SQL statements
END //
DELIMITER ;
Example
Consider the following products table:
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
Insert some records:
INSERT INTO products VALUES
(1, 'Laptop', 75000),
(2, 'Keyboard', 2500),
(3, 'Monitor', 18000);
Create a Procedure
The following procedure displays all products:
DELIMITER //
CREATE PROCEDURE get_products()
BEGIN
SELECT *
FROM products;
END //
DELIMITER ;
Call the Procedure
CALL get_products();
Output:
- The CALL statement executes the stored procedure and returns all records from the products table.
Procedure with Input Parameter
A procedure can accept parameters to make it more useful.
DELIMITER //
CREATE PROCEDURE get_product(IN p_id INT)
BEGIN
    SELECT *
    FROM products
    WHERE product_id = p_id;
END //
DELIMITER ;
Call the procedure
CALL get_product(2);
Output:
Drop a Procedure
To remove a stored procedure:
DROP PROCEDURE get_products;
- This deletes the get_products procedure from the database.

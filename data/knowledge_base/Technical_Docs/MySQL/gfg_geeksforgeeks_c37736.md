# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/mysql/mysql-drop-view/

The DROP VIEW statement in MySQL is used to remove an existing view from the database.
- Deletes the view from the database.
- Does not delete the underlying table or its data.
- Can be used to remove views that are no longer required.
Syntax
DROP VIEW view_name;
Where:
- view_name: The name of the view to be removed.
Working
Suppose we have an existing view named product_view:
CREATE VIEW product_view AS
SELECT product_id, product_name, price
FROM products;
DROP VIEW product_view;
Output:
- This removes the product_view from the database, while the original products table remains unchanged.
Drop View If It Exists
To avoid an error when the view does not exist, use IF EXISTS:
DROP VIEW IF EXISTS product_view;
Output:
- This removes the view if it exists; otherwise, MySQL does not return an error.

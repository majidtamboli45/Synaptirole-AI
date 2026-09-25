# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-drop-column/

In PostgreSQL, there are instances where you might need to remove unnecessary or obsolete columns from your database tables. The DROP COLUMN clause in the ALTER TABLE statement allows you to do this with ease. When you drop a column from a table, PostgreSQL automatically removes any associated indexes and constraints.
In this article, we’ll learn how to use the DROP COLUMN clause in PostgreSQL with examples.
Syntax
ALTER TABLE table_name 
DROP COLUMN column_name;
Parameters
- table_name: The name of the table from which you want to remove the column.
- column_name: The name of the column you want to drop.
You can drop multiple columns in one command by separating the column names with commas:
ALTER TABLE table_name 
DROP COLUMN column_name_1, 
DROP COLUMN column_name_2;
PostgreSQL DROP COLUMN Example
Now let's look into an example of the DROP COLUMN Statement in PostgreSQL to better understand the concept.
First, we create a few tables (say, 'books', 'categories', and 'publishers') for demonstration having the below depicted relationships:  
We create the above tables using the below statements:
CREATE TABLE publishers (
    publisher_id serial PRIMARY KEY,
    name VARCHAR NOT NULL
);
CREATE TABLE categories (
    category_id serial PRIMARY KEY,
    name VARCHAR NOT NULL
);
CREATE TABLE books (
    book_id serial PRIMARY KEY,
    title VARCHAR NOT NULL,
    isbn VARCHAR NOT NULL,
    published_date DATE NOT NULL,
    description VARCHAR,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);
In addition, we create a view based on the books and publishers tables as follows: 
CREATE VIEW book_info AS 
SELECT
    book_id,
    title,
    isbn,
    published_date,
    name
FROM
    books b
INNER JOIN publishers P ON P .publisher_id = b.publisher_id
ORDER BY
    title;
If we want to remove the 'category_id' column of the books table, we use the following statement: 
ALTER TABLE books 
DROP COLUMN category_id;
Now we check the books table using the below statement:
SELECT * FROM books;
Output:
Conclusion
The ALTER TABLE DROP COLUMN feature in PostgreSQL can effectively remove unnecessary columns while keeping your data structure clean and optimized. The ability to drop columns is an essential part of database administration if you’re restructuring your database for better performance or cleaning up obsolete data.

# CREATE SEQUENCE

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-create-sequence/

In database management, generating unique identifiers is vital for data integrity, and PostgreSQL provides a powerful feature called CREATE SEQUENCE to solve this. This command allows developers to create a sequence that automatically generates unique numeric values.
In this article, we will explore how to create a sequence in PostgreSQL and utilize the nextval function to fetch the next number in the sequence by ensuring efficient data handling in our PostgreSQL databases.
What is a CREATE SEQUENCE in PostgreSQL?
- The CREATE SEQUENCE command in PostgreSQL is utilized to establish a sequence, which is a specialized database object specifically designed to produce a series of unique numeric values.
- Sequences are especially valuable for generating primary keys and other unique identifiers within a database table by ensuring that each entry maintains its uniqueness and integrity.
- They ensure that each value is unique, even in a concurrent environment where multiple users or processes may be inserting data at the same time.
Syntax
CREATE SEQUENCE sequence_name
[INCREMENT BY increment]
[START WITH start]
[MINVALUE min]
[MAXVALUE max]
[CYCLE | NO CYCLE]
[CACHE cache_size]
[OWNED BY { table_name.column_name | NONE }];
Explanation:
- sequence_name : The name of the sequence to be created.
- INCREMENT BY : The value by which the sequence will increase (default is 1).
- START WITH : The first value to be generated (default is 1).
- MINVALUE : The minimum value the sequence can generate.
- MAXVALUE : The maximum value the sequence can generate.
- CYCLE : Specifies that the sequence should restart from the minimum value once it reaches the maximum value.
- NO CYCLE : Specifies that the sequence should not restart and will raise an error if it exceeds the maximum value.
- CACHE : Specifies the number of sequence numbers to cache in memory for performance improvement.
- OWNED BY : Associates the sequence with a specific table column.
Examples of PostgreSQL CREATE SEQUENCE
For better understanding of CREATE SEQUENCE we will perform the below examples along with the outputs.
Example 1: Creating an Ascending Sequence
In this example, we will use the CREATE SEQUENCE statement to create a new ascending sequence starting from 10 with an increment of 5:
CREATE SEQUENCE mysequence
INCREMENT 5
START 10;
 To get the next value from the sequence to you use the 'nextval()' function: 
SELECT nextval('mysequence');
It will result in the below output:
Now if we repeat the nexval() function we get the incremented value.
Output:
Example 2: Creating a Descending Sequence with Cycle
The following statement creates a descending sequence from 3 to 1 with the cycle option:
CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1
MAXVALUE 3
START 3
CYCLE;
When you execute the following statement multiple times, you will see the number starting from 3, 2, 1 and back to 3, 2, 1 and so on:
SELECT nextval('three');
Output:
Example 3: Creating a Sequence Associated with a Table Column
In this example we will create a sequence associated with a table column using the statement below:
CREATE TABLE order_details(
order_id SERIAL,
item_id INT NOT NULL,
product_id INT,
product_name TEXT NOT NULL,
price DEC(10, 2) NOT NULL,
PRIMARY KEY(order_id, item_id)
);
Create a sequence associated with the 'item_id' column:
CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;
Insert data into the table:
INSERT INTO 
order_details(order_id, item_id, product_name, price)
VALUES
(100, nextval('order_item_id'), 'DVD Player', 100),
(100, nextval('order_item_id'), 'Android TV', 550),
(100, nextval('order_item_id'), 'Speaker', 250);
Query the data from the table:
SELECT
order_id,
item_id,
product_name,
price
FROM
order_details;
Output:
Important Points About PostgreSQL CREATE SEQUENCE Statement
- The CREATE SEQUENCE in PostgreSQL statement is used to create a sequence, which generates unique integers in a specified order.
- Sequences can be defined with the data types SMALLINT ,INT , orBIGINT . The default data type isBIGINT if not specified.
- After creating a sequence, you can use functions like nextval() ,currval() , andsetval() to retrieve or set sequence values.
- The MINVALUE andMAXVALUE clauses set the bounds for the sequence.
Conclusion
In summary, understanding the CREATE SEQUENCE command in PostgreSQL is essential for effective data management. By using sequences, you can automate the generation of unique identifiers, minimizing errors and enhancing database performance. The nextval function simplifies value retrieval, making it easy to access the next available number in your sequence.

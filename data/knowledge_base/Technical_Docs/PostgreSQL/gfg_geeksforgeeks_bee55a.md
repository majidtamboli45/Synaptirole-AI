# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-commit/

The COMMIT command in PostgreSQL is important for saving the changes made during a transaction. Without executing a COMMIT, all the data manipulation operations performed within the transaction will be lost once the session ends. It ensures that the changes made to the database are permanent and visible to other users and sessions.
In this article, we will explain the PostgreSQL COMMIT command in detail, understand its importance, and provide examples to demonstrate its functionality. Let us learn how to properly manage transactions using the COMMIT command in PostgreSQL.
What is PostgreSQL COMMIT ?
In PostgreSQL, the COMMIT command is used to finalize a transaction by saving all changes made during that transaction to the database. It ensures that any modifications to the database, such as inserts, updates, or deletes, are permanently stored. As shown in the given below syntax of PostgreSQL COMMIT, all three variations achieve the same goal. They save the changes made during the current transaction to the database. Unlike other database languages in PostgreSQL, we commit the transaction in 3 different forms which are mentioned above.
Syntax
COMMIT TRANSACTION;
-- or
COMMIT;
-- or
END TRANSACTION;
Examples of PostgreSQL COMMIT Command
Now for getting good understanding of the use of COMMIT command we will first create a table for examples and add some records.
CREATE TABLE BankStatements (
customer_id serial PRIMARY KEY,
full_name VARCHAR NOT NULL,
balance INT
);
INSERT INTO BankStatements (
customer_id ,
full_name,
balance
)
VALUES
(1, 'Sekhar rao', 1000),
(2, 'Abishek Yadav', 500),
(3, 'Srinivas Goud', 1000);
Example 1: Inserting Data with COMMIT
In this example, we will insert a new record into the ' 'BankStatements' table and then commit the transaction to save the changes permanently. Without the COMMIT command, this record would not be saved once the session ends.
Query:
BEGIN;
INSERT INTO BankStatements (
customer_id,
full_name,
balance
)
VALUES
( 4, 'Priya chetri', 500 );
COMMIT;
Output
Explanation:
- The BEGIN command starts a transaction.
- We then insert a new record with customer_id 4,full_name "Priya Chetri," andbalance 500.
- The COMMIT command makes the change permanent in the database.
Example 2: Updating Data and Understanding Transaction Behavior
In this example, we will update the balance of two customers without initially committing the transaction, observe the data, and then commit the changes. We will display data before and after committing to understand the visibility of uncommitted changes.
Query:
BEGIN;
UPDATE BankStatements
SET balance = balance - 500
WHERE
customer_id = 1;
// displaying data before
// committing the transaction
SELECT customer_id, full_name, balance
FROM BankStatements;
UPDATE BankStatements
SET balance = balance + 500
WHERE
customer_id = 2;
COMMIT;
// displaying data after
// committing the transaction
SELECT customer_id, full_name, balance
FROM BankStatements;
Output
Output Before COMMIT:
Before committing, the changes are only visible in the current session. Other users or sessions cannot see these changes until the COMMIT command is executed.
Output After COMMIT:
After COMMIT, the changes are saved permanently, and the updated balances are visible to all users and sessions.
Important Points About COMMIT Command in PostgreSQL
- The PostgreSQL COMMIT command is used to save all changes made during the current transaction. Once committed, these changes become permanent and visible to other users.
- If an error occurs during a transaction, we can use the ROLLBACK command to undo all changes made in the transaction.
- Changes made within a transaction are not visible to other sessions until COMMIT is executed.
Conclusion
The PostgreSQL COMMIT command is fundamental in transaction management, making changes to the database permanent. By committing a transaction, we save all modifications, ensuring they are available to other users. Alternatively, the ROLLBACK command is essential for reversing changes in the event of errors or unintended modifications. This article on the COMMIT command in PostgreSQL gives us the tools to manage transactions effectively, ensuring database integrity and consistency.

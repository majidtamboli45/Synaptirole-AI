# MySQL Transaction

> Source: https://www.geeksforgeeks.org/mysql/mysql-transaction/

A MySQL transaction is a sequence of one or more SQL statements executed as a single unit of work.
- Ensures data consistency and reliability.
- Saves changes permanently using COMMIT.
- Reverts changes using ROLLBACK if an error occurs.
ACID Properties of MySQL Transactions
The reliability of MySQL transactions is based on the ACID properties.
- Atomicity: A transaction is either completed entirely or rolled back completely. If any statement fails, all previous changes are undone.
- Consistency: A transaction moves the database from one valid state to another while enforcing all constraints and rules.
- Isolation: Multiple transactions execute independently without affecting each other's results.
- Durability: Once a transaction is committed, the changes remain permanent even if the database server crashes.
MySQL Transaction Control Commands
Transaction control commands are used to start, save, undo or finalize transactions.
START TRANSACTION Command
The START TRANSACTION command begins a new transaction. All SQL statements executed after it become part of the same transaction until a COMMIT or ROLLBACK command is issued.
Syntax
START TRANSACTION;
Example: Transfer Money Between Accounts
Suppose there are two bank accounts. We want to transfer ₹500 from one account to another.
Query:
START TRANSACTION;UPDATE AccountsSET Balance = Balance - 500WHERE AccountID = 101;UPDATE AccountsSET Balance = Balance + 500WHERE AccountID = 102;COMMIT;
- The amount is deducted from Account 101 and credited to Account 102. Since both statements execute successfully, the transaction is committed.
- If any statement fails before COMMIT, execute ROLLBACK to undo all changes.
COMMIT Command
The COMMIT command permanently saves all changes made during the current transaction.
Syntax
COMMIT;
Example:
Assume the following table:
CREATE TABLE Student (    StudentID INT PRIMARY KEY,    Name VARCHAR(50),    Age INT);
Delete all students whose age is 20 and save the changes.
Query
START TRANSACTION;DELETE FROM StudentWHERE Age = 20;COMMIT;
Output:
- Rows where Age = 20 are permanently deleted.
ROLLBACK Command
The ROLLBACK command cancels the current transaction and restores the database to the state before the transaction began.
Syntax
ROLLBACK;
Query:
START TRANSACTION;DELETE FROM StudentWHERE Age = 20;ROLLBACK;
Output:
- The deleted rows are restored because the transaction was rolled back.
SAVEPOINT Command
A SAVEPOINT creates a checkpoint inside a transaction. It allows you to roll back only a portion of the transaction instead of canceling the entire transaction.
Syntax:
SAVE:POINT savepoint_name;
Query
START TRANSACTION;SAVEPOINT SP1;DELETE FROM StudentWHERE Age = 20;
Output:
- A savepoint named SP1 is created before deleting the records.
ROLLBACK TO SAVEPOINT
The ROLLBACK TO SAVEPOINT command restores the transaction to a previously created savepoint.
Syntax:
ROLLBACK TO SAVEPOINT SP1;
Query:
START TRANSACTION;SAVEPOINT SP1;DELETE FROM StudentWHERE Age = 20;ROLLBACK TO SAVEPOINT SP1;COMMIT;
Output:
- The deleted rows are restored, but the transaction continues from the savepoint.
RELEASE SAVEPOINT Command
The RELEASE SAVEPOINT command removes a savepoint from the current transaction.
Syntax
RELEASE SAVEPOINT SP1;
Query
START TRANSACTION;SAVEPOINT SP1;RELEASE SAVEPOINT SP1;COMMIT;
Output:
- The savepoint is removed and can no longer be used for rollback.
Example: Complete MySQL Transaction
The following example transfers ₹1000 from one account to another.
Query
START TRANSACTION;UPDATE AccountsSET Balance = Balance - 1000WHERE AccountID = 1;UPDATE AccountsSET Balance = Balance + 1000WHERE AccountID = 2;COMMIT;
If any statement fails, execute:
ROLLBACK;
This ensures that either both updates are applied or neither update is applied.
Types of MySQL Transactions
MySQL supports different types of transactions based on their purpose.
- Read Transactions: These transactions only retrieve data using SELECT statements.
- Write Transactions: These transactions modify data using INSERT, UPDATE or DELETE statements.
- Implicit Transactions: Each SQL statement is automatically treated as a separate transaction when autocommit mode is enabled.
- Explicit Transactions: Transactions started manually using START TRANSACTION and completed using COMMIT or ROLLBACK.

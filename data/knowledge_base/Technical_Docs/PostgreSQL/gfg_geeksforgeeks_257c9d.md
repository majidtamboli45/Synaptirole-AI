# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-transactions/

A PostgreSQL transaction groups one or more SQL statements (such as INSERT, UPDATE, DELETE and SELECT) into a single unit of work. It ensures that either all operations are completed successfully or none of them are applied, helping maintain data consistency and integrity.
- Execute multiple SQL statements as a single unit.
- Commit all changes only after successful execution.
- Roll back changes if an error occurs.
- Ensure reliable and consistent database operations.
ACID Properties
- Atomicity: Ensures that all operations in a transaction are completed successfully or none of them are applied.
- Consistency: Ensures that the database moves from one valid state to another while following all constraints and rules.
- Isolation: Ensures that concurrent transactions do not interfere with each other.
- Durability: Ensures that committed changes are permanently stored, even if the database system crashes.
PostgreSQL Transaction Control Commands
Transaction control commands are used to start, save, undo and manage transactions.
BEGIN Command
The BEGIN command starts a new transaction. All SQL statements executed after BEGIN become part of the same transaction until COMMIT or ROLLBACK is executed.
Syntax:
BEGIN;
or
BEGIN TRANSACTION;
Example:
BEGIN;
UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountID = 101;
UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 102;
COMMIT;
- The transaction begins using BEGIN.
- Both UPDATE statements execute as a single transaction.
- If all statements succeed, COMMIT permanently saves the changes.
COMMIT Command
The COMMIT command permanently saves all changes made during the current transaction.
Syntax:
COMMIT;
Example:
BEGIN;
INSERT INTO Accounts(AccountID, AccountHolder, Balance)
VALUES (103, 'Michael Brown', 5000);
COMMIT;
- A new account is inserted.
- COMMIT permanently saves the transaction.
- The changes become visible to other database sessions.
ROLLBACK Command
The ROLLBACK command cancels all changes made during the current transaction.
Syntax:
ROLLBACK;
Example:
BEGIN;
UPDATE Accounts
SET Balance = Balance - 500
WHERE AccountID = 101;
ROLLBACK;
- The balance is updated temporarily.
- ROLLBACK cancels the transaction.
- The account balance remains unchanged.
SAVEPOINT Command
A SAVEPOINT creates a checkpoint within a transaction. It allows rolling back only part of a transaction instead of canceling the entire transaction.
Syntax:
SAVEPOINT savepoint_name;
Example:
BEGIN;
UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountID = 101;
SAVEPOINT transfer_point;
UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 102;
- The first update is executed.
- A savepoint named transfer_point is created.
- Additional operations can be rolled back without affecting previous changes.
ROLLBACK TO SAVEPOINT Command
The ROLLBACK TO SAVEPOINT command restores the transaction to a previously created savepoint.
Syntax:
ROLLBACK TO SAVEPOINT savepoint_name;
Example:
ROLLBACK TO SAVEPOINT transfer_point;
- All changes made after the savepoint are undone.
- The transaction remains active.
- Changes made before the savepoint are preserved.
RELEASE SAVEPOINT Command
The RELEASE SAVEPOINT command removes a savepoint from the current transaction.
Syntax:
RELEASE SAVEPOINT savepoint_name;
Example:
RELEASE SAVEPOINT transfer_point;
- The specified savepoint is removed.
- It cannot be used again with ROLLBACK TO SAVEPOINT.
- The transaction continues normally.
Types of PostgreSQL Transactions
- Read Transactions: Retrieve data using SELECT statements.
- Write Transactions: Modify data using INSERT, UPDATE or DELETE.
- Implicit Transactions: PostgreSQL automatically treats each SQL statement as a transaction when no explicit transaction is started.
- Explicit Transactions: Transactions manually controlled using BEGIN, COMMIT and ROLLBACK.
Best Practices
- Keep transactions as short as possible to reduce locking.
- Commit transactions only after verifying all operations.
- Use ROLLBACK to recover from errors.
- Use SAVEPOINT when partial rollback is required.
- Avoid long-running transactions to improve concurrency and performance.

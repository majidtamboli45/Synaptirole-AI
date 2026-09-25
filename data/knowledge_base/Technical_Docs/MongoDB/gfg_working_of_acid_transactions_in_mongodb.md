# Working of ACID Transactions in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/acid-transactions-in-mongodb/

MongoDB ACID transactions allow multiple operations to run as one atomic unit, ensuring reliable and consistent data changes.
- Ensures all-or-nothing execution of operations.
- Maintains consistency and isolation across documents/collections.
- Guarantees durability of committed changes.
ACID Transaction Workflow
A MongoDB transaction moves through several states:
- Active State: Transaction starts and performs read/write operations.
- Partially Committed State: Operations are done but not yet permanently stored.
- Committed State: Changes are successfully saved to the database.
- Terminated State: Transaction completes successfully.
- Failed State: If a failure occurs during the transaction, it enters this state.
- Aborted State: The transaction is rolled back to undo changes after a failure.
ACID Properties in MongoDB
The term ACID stands for Atomicity, Consistency, Isolation, and Durability. Let's understand each of these ACID transaction properties with their examples.
1. Atomicity
Atomicity ensures that a transaction is executed as a single unit—either fully completed or fully rolled back.
- All operations succeed or none are applied.
- Partial execution is not allowed.
- Changes are rolled back if the transaction is explicitly aborted or fails before a successful commit.
- Prevents inconsistent database states.
Example (Bank Transfer): If money is debited from one account but crediting the other fails due to a crash, the entire transaction is rolled back. Both accounts remain unchanged.
2. Consistency
Consistency ensures the database moves from one valid state to another, preserving all rules and constraints.
- Maintains integrity constraints.
- Database remains valid before and after a transaction.
- Invalid updates are rejected.
- Prevents rule violations.
Example (Grade Validation): When updating a student’s grade, only valid values (A, B, C, D, F) are allowed. If an invalid grade is assigned, the transaction is aborted.
3. Isolation
Isolation ensures that concurrent transactions do not interfere with each other.
- Transactions run independently.
- Uncommitted changes are not visible to others.
- Prevents dirty reads and intermediate states.
- Ensures predictable results.
Example (Concurrent Transactions): If Transaction A is transferring money to Account Y and Transaction B reads Account Y’s balance, Transaction B will see either the old balance or the final committed balance- not an intermediate value.
4. Durability
Durability ensures that once a transaction is successfully committed, its changes are permanently stored and will survive system failures.
- Committed data is persisted permanently.
- Survives crashes, restarts, and power failures.
- Ensures data recovery after failures.
- Restores the database to the last consistent state on restart.
Example (Transaction Persistence & Recovery): After a successful fund transfer in a banking system, the changes are saved permanently. Even if the system crashes immediately afterward, the committed transaction is recovered when the system restarts, and the database is restored to its last consistent state.
Working of multi-document transactions
MongoDB multi-document transactions enable atomic and consistent operations across multiple documents and collections within a single session.
- Start Transaction: Open a session and begin the transaction.
- Define Operations: Perform inserts, updates, deletes, and reads using the same session.
- Execute Operations: Run all steps while the transaction is active.
- Isolation: Uncommitted changes remain hidden from other sessions.
- Consistency: Rules and constraints are enforced to keep data valid.
- Atomicity: Any failure triggers a rollback of all changes.
- Commit: Permanently save changes when all steps succeed.
- Rollback: Abort the transaction if errors or business rules fail.
- Durability: Committed data persists even after restarts or crashes.
ACID Vs BASE
Here is the detailed comparison between ACID Vs BASE .
| ACID | BASE | 
|---|---|
| Provides strong consistency so data remains valid and reliable | Provides eventual consistency, where data may be temporarily inconsistent | 
| Supports complex, multi-step transactions with rollback | Transactions are minimal or not guaranteed | 
| May sacrifice availability to maintain consistency | Prioritizes high availability, even if data is temporarily inconsistent | 
| Changes are permanent once committed | Durability in BASE systems is eventual; data is persisted but consistency is achieved over time. | 
| Banking, financial systems, critical applications | Large-scale distributed systems, web applications, caching systems. |

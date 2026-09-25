# Transactions in MongoDB

> Source: https://www.geeksforgeeks.org/mongodb/transaction-in-mongodb/

MongoDB 4.0 introduced multi-document ACID transactions, enabling developers to maintain data integrity across multiple operations, collections, and documents in a NoSQL database.
- Supports multi-document transactions across collections and databases.
- Ensures ACID Properties for reliable data consistency.
- Simplifies handling of complex multi-step operations.
- Improves data integrity in distributed applications.
ACID Transactions in MongoDB
MongoDB supports multi-document ACID transactions to ensure data integrity and consistency across multiple operations, making it suitable for systems that require guaranteed correctness, such as banking and order processing.
- Groups multiple operations into a single atomic transaction.
- All changes are rolled back if the transaction is explicitly aborted or if an error occurs before a successful commit. Suitable for enterprise applications such as banking, supply chain, shipping, and e-commerce systems.
- Supports multi-document and distributed transactions.
- Useful for critical workflows like orders and payments.
Features of Transactions in MongoDB
Here are some features of transactions in MongoDB:
- Atomic Unit: Groups multiple operations into a single transaction that commits or rolls back together.
- Data Consistency: Maintains consistency across multiple documents, collections, and databases.
- Use Cases: Suitable for System of Record and Line of Business apps (banking, supply chain, shipping, e-commerce).
- Transaction APIs: Core API (manual control) and Callback API (withTransaction).
- Core API Behavior: Requires explicit start and commit calls.
- Callback API Behavior: Automatically commits or aborts on error.
- Session-Based: Transactions execute within a client session.
- Timeout Handling: Transactions exceeding 60 seconds are automatically aborted.
Implementation of MongoDB Transactions
MongoDB transactions are implemented using start_session(), start_transaction(), and commit_transaction().
1. Set up MongoDB Client:
from pymongo import MongoClient
client = MongoClient("mongodb://localhost:27017")
database = client["your_database"]
- Connects to the MongoDB server.
- Selects the target database.
2. Start a Transaction Session:
with client.start_session() as session:
session.start_transaction()
- Starts a new session.
- Begins a transaction within the session.
3. Perform Operations within the Transaction:
try:
# Perform operations within the transaction
database.collection1.insert_one({"key": "value"}, session=session)
database.collection2.update_one(
{"key": "old_value"},
{"$set": {"key": "new_value"}},
session=session
)
# Commit the transaction
session.commit_transaction()
except Exception as e:
# Abort the transaction in case of an error
print("An error occurred:", e)
session.abort_transaction()
- Executes multiple operations in a single transaction.
- Commits all changes if successful.
- Aborts and rolls back if any operation fails.
Advantages of Transactions in MongoDB
MongoDB transactions provide ACID guarantees that ensure data validity and reliability despite failures and concurrent operations.
- Atomicity: Atomicity ensures that a transaction is executed as a single indivisible unit, where either all operations are committed or the entire transaction is rolled back, preventing partial or inconsistent state changes in the database.
- Consistency: Consistency ensures that each transaction transitions the database from one valid state to another, enforcing all constraints and rules. If a transaction violates consistency constraints, it is rolled back, leaving the database unchanged.
- Isolation: Isolation ensures that concurrent transactions execute as if they were serialized, preventing other transactions from observing intermediate or uncommitted states.
- Durability: Durability guarantees that once a transaction is committed, its changes are persisted to stable storage and survive system crashes or failures.
Disadvantages of MongoDB Transactions
While MongoDB transactions offer significant advantages, there are also some challenges associated with their use:
- Performance Overhead: Transactions introduce performance overhead, especially in write-intensive workloads. The need for coordination between operations and locking mechanisms can slow down the overall performance of the database.
- Complexity in Implementation: Implementing transactions, especially for multi-document transactions, requires additional code and logic. For complex systems with many operations across different collections, managing these transactions can become difficult.
- Not Ideal for All Use Cases: MongoDB transactions are not necessary for every application. For example, if your application performs only simple operations where atomicity is not a critical concern, transactions may add unnecessary overhead.

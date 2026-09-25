# Multiple Granularity Locking in DBMS

> Source: https://www.geeksforgeeks.org/dbms/multiple-granularity-locking-in-dbms/

Granularity refers to the size of the data item on which a lock is applied. Multiple Granularity Locking introduces a hierarchical structure, where locks can be applied at various levels (e.g., database, file, record) to balance efficiency and concurrency.
Granularity Hierarchy
A typical hierarchy can be visualized as a tree:
Database  
 └── Area  
      └── File  
           └── Record
- Database: the entire DB
- Area: logical sections
- File: groups of records
- Record: individual data entries
A transaction can lock any node, and doing so implicitly locks all of its descendants.
How It Works
- If a transaction locks a file in exclusive (X) mode, it implicitly holds an exclusive lock on all its records.
- This differs from traditional tree locking because you don’t have to lock each child explicitly.
Example: If T1 locks file Fc in exclusive mode, it doesn’t need to lock each record in Fc they're automatically locked.
Intention Mode Lock
To support hierarchical locking, new intention lock modes are introduced alongside Shared (S) and Exclusive (X):
- Intention-Shared (IS): explicit locking at a lower level of the tree but only with shared locks.
- Intention-Exclusive (IX): explicit locking at a lower level with exclusive or shared locks.
- Shared & Intention-Exclusive (SIX): the subtree rooted by that node is locked explicitly in shared mode and explicit locking is being done at a lower level with exclusive mode locks.
The compatibility matrix for these lock modes are described below:
Locking Protocol Rules
A transaction Ti must follow these rules:
- Lock the root first (in any mode).
- To acquire S or IS, parent must be locked in IS/IX.
- To acquire X, IX, or SIX, parent must be locked in IX or SIX.
- Locks must be acquired top-down (root to leaf).
- Locks must be released bottom-up (leaf to root).
- A node can be unlocked only after all its children are unlocked.
- Transactions must follow the 2-Phase Locking (2PL) protocol
Observe that the multiple-granularity protocol requires that locks be acquired in top-down (root-to-leaf) order, whereas locks must be released in bottom-up (leaf to-root) order.
As an illustration of the protocol, consider the tree given above and the transactions:
- Say transaction T1 reads record Ra2 in file Fa. Then, T1 needs to lock the database, area A1, and Fa in IS mode (and in that order), and finally to lock Ra2 in S mode.
- Say transaction T2 modifies record Ra9 in file Fa . Then, T2 needs to lock the database, area A1, and file Fa (and in that order) in IX mode, and at last to lock Ra9 in X mode.
- Say transaction T3 reads all the records in file Fa. Then, T3 needs to lock the database and area A1 (and in that order) in IS mode, and at last to lock Fa in S mode.
- Say transaction T4 reads the entire database. It can do so after locking the database in S mode.
Note: Transactions T1, T3 and T4 can access the database concurrently. Transaction T2 can execute concurrently with T1, but not with either T3 or T4.
This protocol enhances concurrency and reduces lock overhead. Deadlock is still possible in the multiple-granularity protocol, as it is in the two-phase locking protocol. These can be eliminated by using certain deadlock elimination techniques.

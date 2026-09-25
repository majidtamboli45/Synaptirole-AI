# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-upsert/

The PostgreSQL UPSERT operation is used to insert a new row into a table or update an existing row if a conflict occurs. It is implemented using the INSERT ... ON CONFLICT clause, which helps prevent duplicate records and simplifies insert-or-update operations.
- Prevent duplicate records based on PRIMARY KEY or UNIQUE constraints.
- Simplify data synchronization and bulk data operations.
Syntax
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...)
ON CONFLICT (conflict_column)
DO UPDATE
SET column1 = EXCLUDED.column1,
    column2 = EXCLUDED.column2;
Where:
- table_name: The table where data will be inserted or updated.
- conflict_column: A column with a PRIMARY KEY orUNIQUE constraint used to detect conflicts.
- EXCLUDED: Refers to the values that were attempted to be inserted.
- DO UPDATE: Updates the existing row if a conflict occurs.
- DO NOTHING: Skips the insert operation if a conflict occurs.
Working with the UPSERT Statement
Firstly, create an Inventory table and insert some records into it.
Example 1: Update an Existing Row Using UPSERT
The following query attempts to insert a row with ID = 1. Since the row already exists, PostgreSQL updates the existing record.
Query:
INSERT INTO Inventory (ID, Name, Price, Quantity)
VALUES (1, 'A', 16.99, 120)
ON CONFLICT (ID)
DO UPDATE
SET
    Price = EXCLUDED.Price,
    Quantity = EXCLUDED.Quantity;
SELECT * FROM Inventory
WHERE ID = 1;
Output:
Example 2: Insert a New Row Using UPSERT
The following query inserts a new row because ID = 4 does not exist.
Query:
INSERT INTO Inventory (ID, Name, Price, Quantity)
VALUES (4, 'D', 29.99, 20)
ON CONFLICT (ID)
DO UPDATE
SET
    Price = EXCLUDED.Price,
    Quantity = EXCLUDED.Quantity;
SELECT * FROM Inventory
WHERE ID = 4;
Output:
Example 3: Skip Insert Using ON CONFLICT DO NOTHING
The following query skips the insert operation if a row with the same ID already exists.
Query:
INSERT INTO Inventory (ID, Name, Price, Quantity)
VALUES (1, 'A', 16.99, 120)
ON CONFLICT (ID)
DO NOTHING;
SELECT * FROM Inventory
WHERE ID = 1;
Output:
Example 4: UPSERT Using ON CONFLICT ON CONSTRAINT
The following query uses the primary key constraint to detect conflicts.
Query:
INSERT INTO Inventory (ID, Name, Price, Quantity)
VALUES (1, 'A', 18.99, 150)
ON CONFLICT ON CONSTRAINT inventory_pkey
DO UPDATE
SET
    Price = EXCLUDED.Price,
    Quantity = EXCLUDED.Quantity;
SELECT * FROM Inventory
WHERE ID = 1;
Output:
Example 5: UPSERT Using WHERE
The following query updates the existing row only if the current quantity is greater than 50.
Query:
INSERT INTO Inventory (ID, Name, Price, Quantity)
VALUES (1, 'A', 19.99, 80)
ON CONFLICT (ID)
DO UPDATE
SET Price = EXCLUDED.Price,
    Quantity = EXCLUDED.Quantity
WHERE Inventory.Quantity > 50;
SELECT * FROM Inventory
WHERE ID = 1;
Output:

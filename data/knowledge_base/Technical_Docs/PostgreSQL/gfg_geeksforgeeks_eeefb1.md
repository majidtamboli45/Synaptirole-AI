# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-if-statement/

The PostgreSQL IF statement is a conditional statement used in PL/pgSQL blocks, functions, procedures and triggers to execute different statements based on specified conditions. It helps control the flow of program execution by evaluating one or more conditions.
- Control the flow of PL/pgSQL programs.
- Simplify decision-making using conditional logic.
Syntax
IF condition THEN
statements;
END IF;
IF...ELSE Syntax:
IF condition THEN
statements;
ELSE
statements;
END IF;
IF...ELSIF...ELSE Syntax:
IF condition1 THEN
statements;
ELSIF condition2 THEN
statements;
ELSE
statements;
END IF;
Where:
- condition: A Boolean expression that evaluates to TRUE or FALSE.
- statements: The SQL or PL/pgSQL statements executed when the corresponding condition is satisfied.
- ELSIF: Specifies additional conditions to evaluate if the previous condition is FALSE.
- ELSE: Executes when none of the specified conditions are TRUE.
You can use a Library table instead of the common Student or Employee table. Here's the revised article section.
Working
Firstly, create a Library table and insert some records.
CREATE TABLE Library (
BookID INT PRIMARY KEY,
BookTitle VARCHAR(100),
Category VARCHAR(50),
CopiesAvailable INT
);
INSERT INTO Library VALUES
(101, 'Database Systems', 'Database', 12),
(102, 'Python Programming', 'Programming', 5),
(103, 'Computer Networks', 'Networking', 0);
Example 1: Basic IF Statement
The following block checks whether copies of a book are available.
Query:
DO $$
DECLARE
copies INT := 5;
BEGIN
IF copies > 0 THEN
RAISE NOTICE 'Book is available.';
END IF;
END $$;
Output:
- The IF statement checks whether the number of available copies is greater than 0.
- Since the condition is TRUE, PostgreSQL executes the RAISE NOTICE statement.
Example 2: IF...ELSE Statement
The following block checks whether a book is available.
Query:
DO $$
DECLARE
copies INT := 0;
BEGIN
IF copies > 0 THEN
RAISE NOTICE 'Book is available.';
ELSE
RAISE NOTICE 'Book is not available.';
END IF;
END $$;
Output:
- Since the number of available copies is 0, the condition evaluates to FALSE.
- PostgreSQL executes the ELSE block.
Example 3: IF...ELSIF...ELSE Statement
The following block categorizes the availability of books based on the number of copies.
Query:
DO $$
DECLARE
copies INT := 12;
BEGIN
IF copies = 0 THEN
RAISE NOTICE 'Out of Stock';
ELSIF copies <= 5 THEN
RAISE NOTICE 'Limited Stock';
ELSE
RAISE NOTICE 'Available';
END IF;
END $$;
Output:
- PostgreSQL evaluates each condition sequentially.
- Since copies is greater than 5, the ELSE block is executed and displays "Available".

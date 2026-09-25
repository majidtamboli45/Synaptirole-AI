# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-assert/

PostgreSQL provides the ASSERT statement as a vital tool for inserting debugging checks in PL/pgSQL code. This statement is crucial for identifying logical errors, making it easier to catch problems in your code early on.
Let us better understand the Assert Statement in PostgreSQL from this article.
Syntax
assert condition [, message];  Parameters
If we analyze the above syntax:
- condition: The condition is a boolean expression that should return true.
  - If the condition returns true, the assert statement does nothing, and the program continues to run.
  - If the condition is false or null, an 'ASSERT_FAILURE' exception is raised.
  - Any error encountered while evaluating the condition is reported as a normal error.
- message: The message is an optional part of the ASSERT statement.
  - It is an expression whose result (if not null) replaces the default error message text “assertion failed” should the condition fail.
  - The message expression is only evaluated if the assertion fails, not when it succeeds.
It is important to note that ASSERT is meant for detecting program bugs, not for reporting ordinary error conditions. In the case of reporting bugs, one must use the RAISE keyword.
PostgreSQL Assert Statement
Let us take a look at some of the examples of the Assert Statement in PostgreSQL to better understand the concept.
First, we create a sample table using the below commands to perform examples:
 TABLE employees (
  employee_id serial PRIMARY KEY,
  full_name VARCHAR NOT NULL,
  manager_id INT
);
INSERT INTO employees (
  employee_id,
  full_name,
  manager_id
)
VALUES
  (1, 'M.S Dhoni', NULL),
  (2, 'Sachin Tendulkar', 1),
  (3, 'R. Sharma', 1),
  (4, 'S. Raina', 1),
  (5, 'B. Kumar', 1),
  (6, 'Y. Singh', 2),
  (7, 'Virender Sehwag ', 2),
  (8, 'Ajinkya Rahane', 2),
  (9, 'Shikhar Dhawan', 2),
  (10, 'Mohammed Shami', 3),
  (11, 'Shreyas Iyer', 3),
  (12, 'Mayank Agarwal', 3),
  (13, 'K. L. Rahul', 3),
  (14, 'Hardik Pandya', 4),
  (15, 'Dinesh Karthik', 4),
  (16, 'Jasprit Bumrah', 7),
  (17, 'Kuldeep Yadav', 7),
  (18, 'Yuzvendra Chahal', 8),
  (19, 'Rishabh Pant', 8),
  (20, 'Sanju Samson', 8);
SELECT * FROM employees;
Output:
Example 1: Checking for Records in the Table
The below query is used to check whether our table has one or more than 1 record.
Query:
DO $$
DECLARE  
  employee_count INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO employee_count
  FROM employees;
  
  ASSERT employee_count > 0, 'Check for Empty Employee Table';
END $$;
Output:
Explanation: As the size of the table is greater than 0, the assertion is true and hence, nothing is printed as the error message.
Example 2: Checking for More Than 100 Records
The below query is used to check whether our table has one or more than 100 records.
Query:
DO $$
DECLARE  
  employee_count INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO employee_count
  FROM employees;
  
  ASSERT employee_count > 100, '100 employee count found';
END $$;
Output:
Explanation: As the table has fewer than 100 records, the assertion fails, and the error message "100 employee count found" is printed.
Important Points About the PostgreSQL ASSERT Statement
- The ASSERT statement is designed to detect program bugs, not for regular error handling.
- Always use ASSERT with a boolean condition to check for expected logical states in your code.
- Assertions are only evaluated when the condition fails, ensuring minimal performance impact during normal execution.
- Use RAISE for handling known error conditions instead of ASSERT.

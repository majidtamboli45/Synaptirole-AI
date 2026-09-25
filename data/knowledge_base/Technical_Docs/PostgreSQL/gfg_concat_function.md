# CONCAT Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-concat-function/

PostgreSQL CONCAT() function combines two or more strings into a single string. It is commonly used to merge text values, such as names, addresses, or other character data, into one output.
- Combines multiple strings into a single string.
- Supports creating formatted text by joining character values.
Syntax
SELECT CONCAT(string1, string2, ...);
Where:
- string1, string2, ...: The strings or column values to be concatenated.
Examples
Consider the following Employees table for the examples below:
Example 1: Concatenate First Name and Last Name
Query:
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;
Output:
- The CONCAT() function combines the FirstName and LastName columns into a single string.
Example 2: Concatenate Multiple Columns
Query:
SELECT CONCAT(FirstName, ' ', LastName, ' - ', Department) AS EmployeeDetails
FROM Employees;
Output:
- The CONCAT() function combines multiple strings and column values into a formatted output.
Example 3: Using CONCAT() with NULL
CREATE TABLE Contacts (
ContactID INT,
Name VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20)
);
INSERT INTO Contacts VALUES
(1, 'John Smith', 'john@example.com', '555-1234'),
(2, 'Emily Johnson', 'emily@example.com', NULL),
(3, 'Michael Brown', 'michael@example.com', '555-6789');
Query:
SELECT CONCAT(Name, ' (', Email, ') ', Phone) AS ContactInfo
FROM Contacts;
Output:
- The CONCAT() function ignores NULL values, so rows with NULL in the Phone column are concatenated without returning NULL.

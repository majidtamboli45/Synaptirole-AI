# SQL Stored Procedures

> Source: https://www.geeksforgeeks.org/sql/what-is-stored-procedures-in-sql/

Stored procedures are used to group SQL statements and business logic into a single reusable unit that runs inside the database. These help in tasks such as:
- Executing multiple SQL statements as one operation.
- Accepting input and returning output values.
- Reducing repeated code in applications.
- Enforcing consistent business rules across systems.
Syntax
CREATE PROCEDURE procedure_name
(parameter1 data_type, parameter2 data_type, ...)
AS
BEGIN
-- SQL statements to be executed
END
- CREATE PROCEDURE – Creates a new stored procedure.
- @parameters – Used to pass values into the procedure.
- BEGIN…END – Contains the SQL code that the procedure runs.
Types of SQL Stored Procedures
SQL stored procedures are categorized into different types based on their use case and functionality. Understanding these categories can help developers choose the right type of procedure for a specific scenario
1. System Stored Procedures
These are predefined stored procedures provided by the SQL Server for performing administrative tasks such as database management, troubleshooting or system configuration. Examples include:
- sp_help: viewing database object information
- sp_rename: renaming database objects.
2. User-Defined Stored Procedures (UDPs)
These are stored procedures created by users to perform specific business operations. Examples include:
- procedures for calculating total sales
- procedures for processing customer orders
3. Extended Stored Procedures
These are stored procedures that allow SQL Server to execute external programs written in languages such as C or C++. Examples include:
- procedures that connect SQL Server to external tools
- procedures that run operating system functions
4. CLR Stored Procedures
These are stored procedures written in .NET languages like C# and executed inside SQL Server. Examples include:
- procedures for complex string processing
- procedures that call external web services
Benefits of SQL Stored Procedures
There are several key reasons why SQL Stored Procedures are widely used in database management:
- Performance Optimization: Stored procedures run faster because they are precompiled.
- Security: They limit direct access to tables and protect sensitive data.
- Code Reusability: The same procedure can be used in many applications.
- Reduced Network Traffic: Multiple operations run in one call.
- Easy Maintenance: Updating a procedure updates all its uses automatically.
Example
In this example, creates a stored procedure get_customers_by_country that takes a country and returns the customer_name and contact_name for customers from that country.
By passing a country as a parameter, the stored procedure dynamically fetches the relevant customer details from the table
Query:
CREATE PROCEDURE get_customers_by_country
@country VARCHAR(50)
AS
BEGIN
SELECT customer_name, contact_number
FROM customer
WHERE country = @country;
END;
EXEC get_customers_by_country @country = 'Sri Lanka';
Output:
- The procedure takes a country name as input and filters the customers table.
- It returns customer_name and contact_name for all customers from that country (e.g., Sri Lanka).
Real-World Use Cases
These are real-world scenarios where stored procedures are used.
- Order Processing System: Automatically inserts new orders, updates stock and generates invoices.
- Employee Management System: Calculates salaries, deducts taxes and creates monthly payslips.
- Data Validation: Checks data (like existing email IDs) before inserting new records.
- Audit Logs: Tracks changes to sensitive data such as user roles and permissions for security.
Best Practices for Writing SQL Stored Procedures
These are guidelines for writing better stored procedures.
- Keep it Simple: Write small and clear procedures for better readability.
- Use Error Handling: Use TRY...CATCH to manage errors safely.
- Avoid Cursors: Use set-based queries instead of cursors when possible.
- Use Parameters: Don’t hardcode values; use parameters for flexibility.

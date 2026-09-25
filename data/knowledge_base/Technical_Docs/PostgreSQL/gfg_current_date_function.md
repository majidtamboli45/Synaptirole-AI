# CURRENT_DATE Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-current_date-function/

PostgreSQL CURRENT_DATE function returns the current date based on the database server's time zone. It is commonly used in SQL queries to work with today's date without requiring any input.
- Provides the current date without the time component.
- Supports date filtering, comparisons, and calculations in SQL queries.
Syntax
SELECT CURRENT_DATE;
Where:
- CURRENT_DATE: Returns the current date.
Examples
Consider the following Appointments table for the examples below:
Example 1: Display the Current Date
Query:
SELECT CURRENT_DATE;
Output:
- The CURRENT_DATE function returns the current date of the database server.
Example 2: Find Today's Appointments
Query:
SELECT PatientName,
DoctorName,
AppointmentDate
FROM Appointments
WHERE AppointmentDate = CURRENT_DATE;
Output:
- The query uses CURRENT_DATE to retrieve appointments scheduled for today.

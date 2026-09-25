# Date Data Type

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-date-data-type/

PostgreSQL offers powerful DATE data type and date functions to efficiently handle date and time information. PostgreSQL DATE data type allows for storing and manipulating calendar dates while its robust set of date functions enables users to perform operations like date arithmetic and formatting.
In this article, We will learn about the Date Data Type in PostgreSQL by understanding various examples and comprehensive date and time handling.
Introduction to PostgreSQL Date Data Types
PostgreSQL offers several date and time data types to represent and manipulate calendar dates, timestamps, and time intervals.
These data types allow us to store and query both simple date values (like 2024-10-10) and more complex ones that include time zones, timestamps, and intervals.
The common PostgreSQL date data types are:
- DATE: Stores date values without time (e.g., '2024-10-10').
- TIMESTAMP: Stores both date and time values (e.g., '2024-10-10 14:30:00').
- TIMESTAMPTZ: A TIMESTAMP with a time zone.
- TIME: Stores only the time (e.g., '14:30:00').
- INTERVAL: Represents a time span (e.g., '1 year 2 months').
DATE Data Type in PostgreSQL
The DATE data type in PostgreSQL stores calendar dates without any associated time values. It follows the format YYYY-MM-DD (Year-Month-Day).
Storing and Querying Dates
When we insert a date into a PostgreSQL table, we simply need to define a column with the DATE data type. PostgreSQL will handle the formatting and ensure that it’s stored correctly.
Example 1: Inserting Dates
Let's create a table that stores information about employees, including their birthdates.
CREATE TABLE employees (
id SERIAL PRIMARY KEY,
name VARCHAR(50),
birthdate DATE
);
Now, insert some date values:
INSERT INTO employees (name, birthdate)
VALUES
('Alice', '1990-01-15'),
('Bob', '1985-07-23'),
('Charlie', '2000-03-02');
Example 2: Querying Date Values
To retrieve employees born before 1990:
SELECT name, birthdate
FROM employees
WHERE birthdate < '1990-01-01';\\
Output:
| name | birthdate | 
|---|---|
| Bob | 1985-07-23 | 
TIMESTAMP and TIMESTAMPTZ Data Types
Difference Between TIMESTAMP and TIMESTAMPTZ
- TIMESTAMP: It Stores date and time without any time zone information. It uses the format YYYY-MM-DD HH:MM.
- TIMESTAMPTZ: It is Similar to TIMESTAMP, but it includes time zone information. PostgreSQL will automatically convert the time to the specified time zone.
Example 1: Storing Timestamps
Create a table for event scheduling:
CREATE TABLE events (
id SERIAL PRIMARY KEY,
event_name VARCHAR(50),
event_start TIMESTAMP
);
Insert some events:
INSERT INTO events (event_name, event_start)
VALUES
('Conference', '2024-12-01 09:00:00'),
('Webinar', '2024-12-05 14:00:00');
Example 2: Querying Timestamps with Time Zone
SELECT event_name, event_start
FROM events;
Output:
| event_name | event_start | 
|---|---|
| Conference | 2024-12-01 09:00:00 | 
| Webinar | 2024-12-05 14:00:00 | 
TIME Data Type
The TIME data type stores only the time of the day, without any date.
Example 1: Inserting and Querying Time Values
CREATE TABLE office_hours (
id SERIAL PRIMARY KEY,
day VARCHAR(50),
open_time TIME,
close_time TIME
);
INSERT INTO office_hours (day, open_time, close_time)
VALUES
('Monday', '09:00:00', '17:00:00'),
('Friday', '10:00:00', '16:00:00');
Query the office hours:
SELECT day, open_time, close_time
FROM office_hours;
Output:
| day | open_time | close_time | 
|---|---|---|
| Monday | 09:00:00 | 17:00:00 | 
| Friday | 10:00:00 | 16:00:00 | 
INTERVAL Data Type
The INTERVAL data type represents a span of time (e.g., '2 years', '3 days').
Example 1: Performing Date Arithmetic
Let's calculate the age of employees by using the INTERVAL type.
SELECT name, birthdate, AGE(birthdate) AS age
FROM employees;
Output:
| name | birthdate | age | 
|---|---|---|
| Alice | 1990-01-15 | 34 years | 
| Bob | 1985-07-23 | 39 years | 
| Charlie | 2000-03-02 | 24 years | 
Common Date Functions in PostgreSQL
1. NOW()
The NOW() function returns the current date and time.
SELECT NOW();
Output:
| now | 
|---|
| 2024-10-10 14:45:22+00 | 
2. AGE()
The AGE() function calculates the difference between two dates.
SELECT AGE('2024-10-10', '1990-01-15') AS age_difference;
Output:
| age_difference | 
|---|
| 34 years 8 mons | 
3. EXTRACT()
The EXTRACT() function extracts parts of a date (year, month, day).
SELECT EXTRACT(YEAR FROM birthdate) AS birth_year
FROM employees;
Output:
| birth_year | 
|---|
| 1990 | 
| 1985 | 
| 2000 | 
4. TO_CHAR()
The TO_CHAR() function is used for formatting date and time output.
SELECT TO_CHAR(NOW(), 'DD/MM/YYYY') AS formatted_date;
Output:
| formatted_date | 
|---|
| 10/10/2024 | 
Important Points About the Date Data Type in PostgreSQL
- The DATE data type in PostgreSQL requires 4 bytes of storage and supports a range from 4713 BC to 5874897 AD.
- PostgreSQL uses the 'yyyy-mm-dd' format for storing and inserting date values.
- PostgreSQL supports date arithmetic, allowing you to add or subtract intervals from dates.
- PostgreSQL offers a variety of date functions for manipulating and extracting parts of dates. Some commonly used functions include AGE() ,EXTRACT() ,DATE_TRUNC() , andTO_CHAR() .
Conclusion
Overall, PostgreSQL provides a versatile timestamp data type and advanced time zone handling, allowing for precise date-time management across different regions. Functions like NOW return the current timestamp, while TO_CHAR formats date and time values. The AGE function calculates time differences, and EXTRACT allows you to retrieve specific parts of a date or time. These powerful features make PostgreSQL a robust solution for handling complex date-time operations in any application.

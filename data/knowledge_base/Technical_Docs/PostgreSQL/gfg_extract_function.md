# EXTRACT Function

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-extract-function/

PostgreSQL EXTRACT() function retrieves a specific part of a date, time or timestamp value, such as the year, month, day, hour or minute. It is commonly used for date and time analysis in SQL queries.
- Extracts a specified date or time component from a date/time value.
- Supports filtering, grouping and analyzing date and time data in SQL queries.
Syntax
SELECT EXTRACT(field FROM source);
Where:
- field: The date or time part to extract (such as YEAR, MONTH, DAY, HOUR, MINUTE or SECOND).
- source: The date, time or timestamp value from which the field is extracted.
Examples
Consider the following Events table for the examples below:
Example 1: Extract the Year from a Timestamp
Query:
SELECT EventName,
EXTRACT(YEAR FROM EventDate) AS EventYear
FROM Events;
Output:
- The EXTRACT() function retrieves the year from the EventDate column.
Example 2: Extract the Month from a Timestamp
Query:
SELECT EventName,
EXTRACT(MONTH FROM EventDate) AS EventMonth
FROM Events;
Output:
- The EXTRACT() function retrieves the month from the EventDate column.

# DATE() in MySQL

> Source: https://www.geeksforgeeks.org/mysql/date-in-mysql/

The DATE() function in MySQL extracts the date part from a DATE or DATETIME expression. It is useful when you want to work with the date separately from the time.
- Extracts only the date from a DATETIME value.
- Returns the date in YYYY-MM-DD format.
- Removes the time portion from a datetime value.
- Can be used with date and datetime values.
Syntax
DATE(date_expression);
Where:
- date_expression: The date or datetime value from which the date needs to be extracted.
Example
SELECT DATE('2026-08-13 10:30:45') AS date_value;
Output:
DATE() with Table
Consider an orders table:
To extract only the date from order_date:
SELECT order_id, DATE(order_date) AS order_dateFROM orders;
Output:
- The DATE() function removes the time portion from order_date and returns only the date.

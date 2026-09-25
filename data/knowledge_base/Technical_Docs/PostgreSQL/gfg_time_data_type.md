# TIME Data Type

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-time-data-type/

In PostgreSQL, the TIME data type is essential for applications that require precise time tracking, such as scheduling systems and event logging. This data type allows for accurate time-based entries without storing date information. PostgreSQL’s TIME data type also supports fractional seconds for up to 6 decimal places, making it highly suitable for applications requiring high-precision time data.
In this article, we will guide us through the syntax, formats, examples, and best practices when using the TIME data type in PostgreSQL.
PostgreSQL TIME Data Type
The TIME data type in PostgreSQL requires 8 bytes of storage and can handle time values ranging from 00:00:00 to 24:00:00. The precision for fractional seconds can be specified up to 6 decimal places, allowing applications to handle milliseconds and microseconds when necessary.
Syntax
column_name TIME(precision);
Common TIME Formats in PostgreSQL
The common TIME formats are illustrated below:
Without Precision:
- 'HH:MM'
- 'HH:MM:SS'
- 'HHMMSS'
With Precision
If precision is required the following format needs to be followed:
- 'MM:SS.pppppp'
- 'HH:MM:SS.pppppp'
- 'HHMMSS.pppppp'
Example Values Without Precision:
- '01:02' – Represents 1 hour and 2 minutes.
- '01:02:03' – Represents 1 hour, 2 minutes, and 3 seconds.
- '010203' – Interpreted as 1 hour, 2 minutes, and 3 seconds.
Example Values With Precision:
- '04:59.999999' – Represents 4 minutes, 59 seconds, and 999999 microseconds.
- '04:05:06.777777' – Represents 4 hours, 5 minutes, 6 seconds, and 777777 microseconds.
- '040506.777777' – Interpreted as 4 hours, 5 minutes, 6 seconds, and 777777 microseconds.
Examples of PostgreSQL TIME Data Type
Now let's look into some examples for better understanding. In these examples, we’ll look at creating tables, inserting data, and querying time values to illustrate how PostgreSQL handles time precisely and effectively.
Example 1: Creating a Table with TIME Data Type
In this example we will create a table that holds team schedules details of a company. First, create a new table named 'team_schedule' by using the following commands:
CREATE TABLE team_schedule (
id serial PRIMARY KEY,
team_name VARCHAR NOT NULL,
clock_in_time TIME NOT NULL,
clock_out_time TIME NOT NULL
);
Explanation:
This query creates a table named team_schedule with three columns: team_name to store the name of the team, clock_in_time to store the time each team clocks in, and clock_out_time to store the time they clock out.
Example 2: Inserting Data into the TIME Table
After creating the team_schedule table, let’s insert records with sample clock-in and clock-out times. 
INSERT INTO team_schedule(team_name, clock_in_time, clock_out_time)
VALUES
('Marketing', '09:00:00', '18:00:00'),
('Sales', '10:00:00', '19:00:00'),
('Mentors', '09:00:00', '18:00:00'),
('Software', '11:00:00', '20:00:00'),
('Content', '10:00:00', '19:00:00');
Explanation:
Here, we insert five rows with specific clock-in and clock-out times for each team. This demonstrates how the TIME data type stores time values precisely.
Example 3: Querying Data from the Table
Finally, we query from the shifts table using the below command.
Query:
SELECT *
FROM team_schedule;
Output
Explanation:
This query returns all rows in the team_schedule table, displaying the clock-in and clock-out times for each team, allowing for quick review and tracking of team schedules.
Important Points about TIME Data Type in PostgreSQL
- PostgreSQL's TIME Data type allows precision up to 6 fractional seconds, making it suitable for applications requiring high-precision time tracking.
- The TIME Data type requires only 8 bytes of storage.
- The TIME Data type supports a range of values from '00:00:00' to '24:00:00' , accommodating various time-related use cases.
- While the TIME Data Type does not store time zone information, we can use theTIMETZ Data Type if you need to store time with time zone information.
- PostgreSQL supports multiple formats for representing time values, both with and without precision.
Conclusion
The PostgreSQL TIME data type is a robust solution for storing precise time values, making it ideal for applications requiring accurate time records without date dependencies. By allowing up to 6 decimal places for fractional seconds, PostgreSQL provides flexibility for time-critical applications.
Use this data type when we need high precision and efficient storage for time values within a day. For time-based queries across time zones, consider using the TIMETZ data type.

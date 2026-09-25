# Pivot and Unpivot in SQL

> Source: https://www.geeksforgeeks.org/sql/pivot-and-unpivot-in-sql/

Pivot and Unpivot in SQL are used to transform data by switching rows and columns. They help make data more readable, organized and useful for reporting and analysis.
Pivot in SQL
Pivot in SQL is used to change rows into columns. It helps show data in a table format that is easier to read and analyze. We usually use functions like SUM, COUNT or AVG to summarize the data. Each different value becomes a new column in the result.
Syntax:
SELECT column_names
FROM table_name
PIVOT (
aggregate_function(column_to_aggregate)
FOR pivot_column IN (pivot_values)
) AS alias;
Example
We create a table named geeksforgeeks to store course details and then use PIVOT to get the total price for each course category.
Query:
SELECT course_name, programming, interview_preparation
FROM (
SELECT course_name, course_category, price
FROM geeksforgeeks
) AS source_table
PIVOT (
SUM(price)
FOR course_category IN (programming, interview_preparation)
) AS pivot_table;
Output:
- PIVOT converts course_category rows into columns.
- SUM(price) calculates the total price for each category.
Unpivot in SQL
UNPIVOT is the reverse of PIVOT in SQL. It converts column-based data back into rows, which helps in reorganizing and normalizing the data so it can be easily analyzed in row format.
Syntax:
SELECT column_names
FROM table_name
UNPIVOT (
value_column
FOR pivot_column IN (pivot_column_values)
) AS alias;
Example of Unpivot Operation
We use the same geeksforgeeks table and apply UNPIVOT to reverse the PIVOT and get back the original data format.
Query:
SELECT course_name, course_category, price
FROM (
SELECT course_name, programming, interview_preparation
FROM (
SELECT course_name, course_category, price
FROM geeksforgeeks
) AS source_table
PIVOT (
SUM(price)
FOR course_category IN (programming, interview_preparation)
) AS pivot_table
) AS p
UNPIVOT (
price
FOR course_category IN (programming, interview_preparation)
) AS unpivot_table;
Output:
- The column values are converted back into rows for each course.
- The result looks like the original table structure with category and price.

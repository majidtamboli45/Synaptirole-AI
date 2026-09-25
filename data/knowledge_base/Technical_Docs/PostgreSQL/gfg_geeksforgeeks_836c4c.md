# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-select-into/

The PostgreSQL SELECT INTO statement allows users to create a new table directly from the result set of a query. This command is ideal for duplicating or organizing data from an existing table into a new one for further analysis. SELECT INTO does not return data to the client but saves it in a new table, allowing for streamlined data handling and improved query performance.
In this article, we will cover the SELECT INTO syntax, explore its key parameters, and walk through examples demonstrating its usage in PostgreSQL.
What is PostgreSQL SELECT INTO?
In PostgreSQL, the SELECT INTO statement creates a new table and inserts data returned by a query into it. This newly created table inherits the column names and data types from the output of the query, which makes it easy to quickly organize or duplicate data for specific purposes.
Syntax
SELECT
column_list
INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
FROM
table_name
WHERE
condition;
Key Terms
- INTO Clause: Specifies the new table name and can include keywords like TEMPORARY ,TEMP , orUNLOGGED to define the table type.
- WHERE Clause: Filters the data to be inserted into the new table.
- Additional Clauses: We can use other clauses such as INNER JOIN ,LEFT JOIN ,GROUP BY , andHAVING to refine the data selection.
Examples of PostgreSQL SELECT INTO
Now let’s look into some examples of SELECT INTO Statement in PostgreSQL to better understand the concept. For examples we will be using the sample database (ie, dvdrental).
Example 1: Creating a Permanent Table
In this example, we will use the 'film' table from the 'dvdrental' database to create a new table named 'film_r'. This table will contain all films with a rating of 'R' and a rental duration of 5 days.
Query:
SELECT
film_id,
title,
rental_rate
INTO TABLE film_r
FROM
film
WHERE
rating = 'R'
AND rental_duration = 5
ORDER BY
title;
Now we can verify the created table using the below statement:
SELECT
*
FROM
film_r;
Output
Explanation:
- The query selects film_id ,title , andrental_rate columns from thefilm table where therating is'R' and therental_duration is 5 days.
- The INTO TABLE clause specifies that the data will be stored in a new table named film_r .
- The query will return all rows from the 'film_r' table, displaying the films that match the specified criteria.
Example 2: Creating a Temporary Table
In this example, we create a temporary table named 'short_film' that contains all films with a length of under 60 minutes.
Query:
SELECT
film_id,
title,
length
INTO TEMP TABLE short_film
FROM
film
WHERE
length < 60
ORDER BY
title;
Now we verify the table short_film using the below statement:
SELECT
*
FROM
short_film;
Output
Explanation:
- The query will return all rows from the 'short_film' table, showing the short films as specified.
- The INTO TEMP TABLE clause creates a temporary table named short_film , which will only exist for the duration of the session.
- This temporary table stores films where the length is less than 60 minutes.
Important Points About SELECT INTO Statement in PostgreSQL
- We cannot use the SELECT INTO statement in PL/pgSQL or ECPG because they interpret the INTO clause differently. In this case, we can use the CREATE TABLE AS statement which provides more functionality than the SELECT INTO statement.
- Using the TEMPORARY orTEMP keyword creates a table that is automatically dropped at the end of the session.
- Using the UNLOGGED keyword creates a table that is not written to the write-ahead log (WAL). This makes inserts faster but at the cost of durability.
- The SELECT INTO statement does not copy constraints (e.g., primary keys, foreign keys, or UNIQUE constraints) from the source table to the new table. We need to add them manually if required.
Conclusion
The PostgreSQL SELECT INTO statement is an efficient tool for creating a new table based on the results of a query, ideal for organizing and manipulating data quickly. For more strong requirements, the CREATE TABLE AS statement provides enhanced functionality and flexibility. Understanding the syntax of SELECT INTO and its options such as temporary tables and unlogged tables allows PostgreSQL users to optimize data workflows effectively.

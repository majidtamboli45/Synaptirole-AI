# PostgreSQL FETCH Clause

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-fetch-clause/

The PostgreSQL FETCH clause is an essential feature for controlling and managing the number of rows returned in our SQL queries. It provides a standardized approach for limiting results, similar to the LIMIT clause but with more flexibility and compatibility across different database systems.
This article will explain the PostgreSQL FETCH clause, explaining its syntax, functionality, and providing practical examples to enhance our SQL query performance.
What is the PostgreSQL FETCH Clause?
The FETCH clause in PostgreSQL is used to retrieve a specific subset of rows from a result set. When combined with the OFFSET clause, it allows us to skip a certain number of rows before fetching the next set of results. This combination makes FETCH an ideal choice for implementing pagination or limiting the number of rows returned in large datasets.
Unlike LIMIT, which is a non-standard SQL feature, the FETCH clause is part of the SQL standard, ensuring that our queries are more portable across various SQL databases like MySQL, SQL Server, and Oracle.
Syntax
OFFSET start { ROW | ROWS } 
FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY
Key Terms
- ROW and FIRST are synonymous with ROWS and NEXT, respectively.
- start is an integer value that is zero or positive. By default, it is zero.
- row_count is an integer value that is one or higher. By default, it is one.
- ORDER BY Clause: Since the order of rows stored in the table is unpredictable, it's crucial to use the FETCH clause with the ORDER BY clause to ensure consistent results.
Note: Here, we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link.
Examples of PostgreSQL FETCH clause
Now, let’s look at some practical examples to understand how the FETCH clause works in PostgreSQL. These examples will demonstrate various use cases of the FETCH clause with OFFSET, showing how to retrieve specific sets of rows.
Example 1: Fetching the First 10 Rows
In this Example, we will retrieve the first 10 rows of the film sorted by "title" from the film table of our sample database.
Query:
SELECT
film_id,
title
FROM
film
ORDER BY
title
FETCH FIRST 10 ROW ONLY;
Output
Explanation:
This query returns the first 10 films sorted alphabetically by their title.
Example 2: Fetching Rows with Offset
Here we will query the first 10 rows of the film after the first five films, sorted by "title" from the film table of our sample database. This is useful for pagination where we want to display results in chunks.
Query:
SELECT
film_id,
title
FROM
film
ORDER BY
title
OFFSET 5 ROWS
FETCH FIRST 10 ROW ONLY;
Output
Explanation:
This query skips the first 5 films and then returns the next 10 films sorted by their title.
Important Points About PostgreSQL FETCH clause
- Portability: While both FETCH and LIMIT are used to retrieve a subset of rows, FETCH is part of the SQL standard, making it more portable across different SQL databases. If you're aiming for compatibility with other SQL databases, prefer using FETCH.
- ROW vs. ROWS: The keywords ROW and ROWS can be used interchangeably with FETCH. ROW is more appropriate when fetching a single row, and ROWS is semantically better for multiple rows.
- ORDER BY Clause: Always use the ORDER BY clause with FETCH to ensure consistent results, especially when dealing with large datasets or queries that require pagination.
- Subqueries: FETCH can be used in subqueries to limit the number of rows processed by the outer query.
Conclusion
The PostgreSQL FETCH clause is a flexible tool that allows us to efficiently manage query results by limiting the number of rows returned. It ensures SQL standard compliance, which enhances portability across various database systems.
By combining FETCH with OFFSET, we can implement pagination and optimize the retrieval of data in large datasets. As a developer, mastering the FETCH clause will help improve the performance and flexibility of our PostgreSQL queries

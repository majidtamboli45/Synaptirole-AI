# Comparing Tables

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-comparing-tables/

Comparing tables in PostgreSQL is a common task when you need to identify differences between datasets. This can be especially useful when you are merging tables, validating data, or performing quality checks. In this article, we'll explore two of the most commonly used techniques for comparing tables in PostgreSQL:
1. Comparison using EXCEPT and UNION operators
The EXCEPT operator returns the rows from the first table that are not in the second table. It's a straightforward way to find differences between two tables.
Step 1: Create Sample Tables
First, let’s create table two tables named 'foo' and 'bar', and insert some sample data for the demonstration.
 TABLE foo (
    ID INT PRIMARY KEY,
    NAME VARCHAR (50)
);
INSERT INTO foo (ID, NAME)
VALUES
    (1, 'a'),
    (2, 'b');
CREATE TABLE bar (
    ID INT PRIMARY KEY,
    NAME VARCHAR (50)
);
INSERT INTO bar (ID, NAME)
VALUES
    (1, 'a'),
    (2, 'b');
The 'foo' table has the same structure and data as the 'bar' table.
Step 2: Modify One of the Tables
Next, we update one row in the 'bar' table.
UPDATE bar
SET name = 'c'
WHERE
    id = 2;
Now our tables look like below:
Step 3: Identify Differences Using EXCEPT
Then, to find the rows in the 'foo' table but not in the bar table, we use the following query.
Query:
SELECT
    ID,
    NAME,
    'not in bar' AS note
FROM
    foo
EXCEPT
    SELECT
        ID,
        NAME,
        'not in bar' AS note
    FROM
        bar;
Output:
We used EXCEPT operator that returns the rows in the 'foo' table but not in the 'bar' table. We can apply the same technique to find the rows that are in the 'bar' table but not in the 'foo' table.
SELECT
    ID,
    NAME,
    'not in foo' AS note
FROM
    bar
EXCEPT
    SELECT
        ID,
        NAME,
        'not in foo' AS note
    FROM
        foo;
Output:
2. Comparison using OUTER JOIN
The FULL OUTER JOIN approach is another powerful technique for comparing tables. It returns all rows when there is a match in either table, and fills with NULL where there is no match.
Step 1: Compare Tables Using FULL OUTER JOIN
SELECT
    id,
    name
FROM
    foo
FULL OUTER JOIN bar USING (id, name)
WHERE
    foo.id IS NULL
OR bar.id IS NULL;
Output:
This query returns the rows that exist in one table but not the other.
Step 2: Count the Number of Differences
To find the number of rows that are in the foo table but not bar table and vice versa, we use the COUNT function as follows:
SELECT
    COUNT (*)
FROM
    foo
FULL OUTER JOIN bar USING (id, name)
WHERE
    foo.id IS NULL
OR bar.id IS NULL;
Output:
This gives you a quick overview of how many rows are mismatched between the tables.
Conclusion
Both the EXCEPT-UNION and FULL OUTER JOIN techniques are effective for comparing tables in PostgreSQL, each with its advantages:
- EXCEPT-UNION: Best when you need clear, distinct differences between two datasets.
- FULL OUTER JOIN: Useful for detailed comparisons, especially when working with complex datasets.

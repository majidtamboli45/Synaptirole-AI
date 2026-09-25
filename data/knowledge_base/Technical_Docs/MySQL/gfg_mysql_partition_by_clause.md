# MySQL PARTITION BY Clause

> Source: https://www.geeksforgeeks.org/mysql/mysql-partition-by-clause/

The PARTITION BY clause in MySQL divides the result set into smaller groups so calculations can be performed independently within each group. It is mainly used with window functions to analyze related rows without affecting the entire dataset.
- Used with window functions like RANK(), DENSE_RANK(), LEAD(), and LAG()
- Creates partitions (also called windows) within the result set.
- Each partition is processed separately for calculations.
- If omitted, the whole table is treated as a single partition.
Syntax:
window_function(expression)
OVER (
    PARTITION BY column_name
    [ORDER BY column_name]
    [frame_clause]
);
- window_function(expression): Defines the window function and the column or value it operates on.
- OVER(): Specifies how the function should be applied across rows.
- PARTITION BY column_name: Divides rows into groups where calculations run separately.
- ORDER BY / frame_clause: Controls row order and the subset of rows used within each partition (Optional).
Working with PARTITION BY Clause
First, we will create a demo table on which the PARTITION BY Clause will be applied:
Example 1: Using PARTITION BY with DENSE_RANK()
We have to find the rank of hackers in each challenge. That means we have to list all participated hackers of a challenge along with their rank in that challenge.
Query:
SELECT 
    challenge_id, 
    h_id, 
    h_name, 
    score,
    DENSE_RANK() OVER (
        PARTITION BY challenge_id 
        ORDER BY score DESC
    ) AS `rank`
FROM hacker;
Output:
- PARTITION BY challenge_id splits the table into groups based on each challenge.
- ORDER BY score DESC sorts hackers within each challenge by score.
- DENSE_RANK() assigns ranks within each partition.
- Hackers with the same score receive the same rank.
Example 2: Using PARTITION BY with LEAD()
We want to find the next hacker’s score within each challenge.
Query:
SELECT 
    challenge_id,
    h_name,
    score,
    LEAD(score) OVER (
        PARTITION BY challenge_id 
        ORDER BY score DESC
    ) AS next_score
FROM hacker;
Output:
PARTITION BY Vs GROUP BY
Here are some key differences between PARTITION BY and GROUP BY:
| PARTITION BY | GROUP BY | 
|---|---|
| Used with window functions | Used with aggregate functions | 
| Does not reduce number of rows | Reduces rows into summary | 
| Returns original rows with extra calculations | Returns one row per group | 
| Performs calculations within partitions | Performs calculations on grouped data | 
| Used with OVER() clause | Used directly in SELECT query |

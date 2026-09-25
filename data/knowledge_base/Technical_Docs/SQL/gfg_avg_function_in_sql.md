# AVG() Function in SQL

> Source: https://www.geeksforgeeks.org/sql/avg-function-in-sql/

The AVG() function in SQL calculates the average of a numeric column. It helps identify the central value of data by ignoring NULL entries. Overall, it is a quick way to summarize large datasets.
- Finds the average or mean using only non-null values.
- Useful for quick comparisons and basic data analysis.
Example: First, we create a demo SQL database and table, on which we use the AVG() functions.
Query:
SELECT AVG(Marks) AS AverageMarks
FROM Student;
Output:
- AVG(Marks) computes the mean of all student marks.
- Returns one value showing the overall average score.
Syntax:
SELECT AVG(column_name)
FROM table_name;
Examples of SQL AVG() Function
Here, we demonstrate the usage of the AVG() function using a sample table named student_scores. Consider this student_scores table for all the examples below:
Example 1: Calculating Overall Average Score
In this example, we use AVG() to get the complete overall average of all scores.
Query:
SELECT AVG(score) AS overall_average_score
FROM student_scores;
Output:
- AVG() computes the average of all score values.
- Returns a single overall result.
Example 2: Calculating Average Score per Subject
In this example, we use AVG() with the GROUP BY clause to find the average score for each subject.
Query:
SELECT subject, AVG(score) AS average_score
FROM student_scores
GROUP BY subject;
Output:
- GROUP BY groups rows by subject.
- AVG() calculates the average score for each group.
Example 3: Calculating Average Score for a Specific Subject
In this example, AVG() is used with a WHERE clause to find the average score only for Science.
Query:
SELECT AVG(score) AS average_science_score
FROM student_scores
WHERE subject = 'Science';
Output:
- WHERE filters rows to include only Science.
- AVG() calculates the average from the filtered data.
Example 4: Showing Only Subjects with Average Score Above 85
In this example, we use AVG() with HAVING to display only those subjects whose average score exceeds 85.
Query:
SELECT subject, AVG(score) AS average_score
FROM student_scores
GROUP BY subject
HAVING AVG(score) > 85;
Output:
- HAVING filters groups based on aggregate values.
- Only subjects with an average score > 85 are shown.
Considerations
While the AVG() function is a powerful tool for data analysis, there are some considerations to keep in mind:
- NULL Handling: AVG() ignores NULL values, which may impact results if many entries are missing.
- Numeric Columns Only: The function works only on numeric data—using it on non-numeric columns causes errors.
- Precision: AVG() can return long decimals; round the result when cleaner output is needed.

# MySQL CASE Function

> Source: https://www.geeksforgeeks.org/mysql/case-function-in-mysql/

The MySQL CASE function is a conditional expression that returns a value when the first matching condition is met. If no condition is satisfied, it returns the value in the ELSE part or NULL if ELSE is not provided.
- It works like an if-then-else statement and allows conditional logic within queries.
- It can be used in clauses such as SELECT, WHERE, and ORDER BY.
- Once a condition is met, the CASE function stops checking further conditions.
- It evaluates conditions and returns corresponding result values.
Syntax:
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
Parameters:
The CASE expression accepts multiple conditions and corresponding result values as given below:
- condition1, condition2, ...conditionN: Specified conditions which are determined in the order they are stated.
- result1, result2, ...resultN: Specified output which is to be returned if the stated condition is satisfied.
Returns:
It returns the result of the first condition that evaluates to TRUE. If no condition is satisfied, it returns the value specified in the ELSE part. If ELSE is not provided, it returns NULL.
Working with the CASE Function
The CASE function evaluates conditions sequentially and returns a result when a condition is met. It is commonly used to categorize or transform data directly within queries. First, we will create a demo table on which the CASE Function will be applied:
Example 1: Categorizing Salary
This example uses CASE to group employees into salary categories such as high, medium, and low based on their salary values.
Query:
SELECT name, salary,
CASE
    WHEN salary > 70000 THEN 'High Salary'
    WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS salary_category
FROM employees;
Output:
- CASE checks conditions from top to bottom.
- First matching condition determines the result.
- Salaries are categorized into three groups.
Example 2: Department-Based Labels
This example assigns custom labels to employees based on their department using conditional logic.
Query:
SELECT name, department,
CASE
    WHEN department = 'IT' THEN 'Technical Team'
    WHEN department = 'HR' THEN 'Human Resources'
    ELSE 'Other Department'
END AS dept_label
FROM employees;
Output:
- CASE compares department values.
- Matching departments return predefined labels.
- Non-listed departments fall into ELSE.
Example 3: Custom Sorting with CASE
This example uses CASE inside ORDER BY to sort employees based on salary priority instead of direct numeric sorting.
Query:
SELECT name, salary
FROM employees
ORDER BY
CASE
WHEN salary >= 70000 THEN 1
WHEN salary >= 50000 THEN 2
ELSE 3
END;
Output:
- CASE assigns ranking values (1, 2, 3).
- ORDER BY sorts based on these ranks.
- Enables custom sorting logic beyond default behavior.
Best Practices
The CASE expression should be used thoughtfully to keep queries clean, efficient, and easy to understand. Following best practices helps avoid logical errors and improves overall query readability.
- Order conditions carefully: Place more specific conditions first, as CASE stops evaluating after the first match.
- Always include an ELSE clause: This ensures all possible cases are handled and avoids unexpected NULL results.
- Keep logic simple and readable: Avoid overly complex conditions; break them into multiple queries if needed.
- Use meaningful aliases: Assign clear column names using AS to improve output readability (e.g., salary_category).

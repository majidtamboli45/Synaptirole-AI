# MySQL SELF JOIN

> Source: https://www.geeksforgeeks.org/mysql/mysql-self-join/

A SELF JOIN is a join in which a table is joined with itself. It is useful for comparing rows within the same table, such as finding employees and their managers.
- Joins a table with itself.
- Uses aliases to treat the same table as two separate tables.
- Helps compare rows within the same table.
- Commonly used to represent hierarchical relationships.
Syntax
SELECT a.column1, b.column2FROM table_name aJOIN table_name bON a.column = b.column;
Example
Consider the following employees table:
| employee_id | employee_name | manager_id | 
|---|---|---|
| 101 | John | NULL | 
| 102 | Emily | 101 | 
| 103 | Michael | 101 | 
| 104 | Sophia | 102 | 
Here, manager_id stores the employee_id of the employee's manager.
To display employees along with their managers:
SELECT     e.employee_name AS employee,    m.employee_name AS managerFROM employees eLEFT JOIN employees mON e.manager_id = m.employee_id;
Output:
| employee | manager | 
|---|---|
| John | NULL | 
| Emily | John | 
| Michael | John | 
| Sophia | Emily | 
Explanation: The employees table is joined with itself. The first instance (e) represents the employee, while the second instance (m) represents the manager. The manager_id is matched with employee_id to find each employee's manager.

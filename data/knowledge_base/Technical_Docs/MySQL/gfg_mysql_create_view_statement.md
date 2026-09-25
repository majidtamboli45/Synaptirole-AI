# MySQL CREATE VIEW Statement

> Source: https://www.geeksforgeeks.org/mysql/mysql-create-view-statement/

MySQL, an open-source relational database management system, offers a variety of features to manage and manipulate data efficiently. One of these features is the CREATE VIEW statement, which allows you to create a virtual table known as a view. A view provides a way to simplify complex queries, enhance security, and present data in a specific format without storing it physically.
What is a View?
In relational database management systems (RDBMS) like MySQL, a view is a virtual table created from a query on one or more underlying tables. Unlike a regular table, a view does not store the data itself. Instead, it creates a result set when queried. Views are created using SELECT queries.
Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
Parameters:
- view_name : The name of the view you want to create.
- SELECT column1, column2, ... : The SELECT statement that defines the data to be included in the view.
- table_name : The name of the table(s) from which the data is retrieved.
- condition : Optional. The condition(s) to filter the data.
Examples of MySQL CREATE VIEW Statement
Let's explore examples using two sample tables: EMPLOYEE and EMPLOYEE1.
--EMPLOYEE Table Schema
CREATE TABLE EMPLOYEE (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
AGE INT,
SALARY INT
);
--EMPLOYEE1 Table Schema
CREATE TABLE EMPLOYEEE1(
EMP_ID INT PRIMARY KEY,
PHONE INT,
CITY VARCHAR(20)
);
Insert the data on it:
INSERT INTO EMPLOYEE (EMP_ID, NAME, AGE, SALARY) VALUES
(1, 'Sahil', 21, 15000),
(2, 'Alen', 22, 13000),
(3, 'John', 22, 14000),
(4, 'Alex', 20, 13000),
(5, 'Mathew', 22, 14000),
(6, 'Sia', 21, 15000),
(7, 'David', 22, 16000),
(8, 'Tim', 21, 14000),
(9, 'Leo', 20, 15000),
(10, 'Tom', 21, 16000);
INSERT INTO EMPLOYEE1 (EMP_ID, PHONE, CITY) VALUES
(1, 6412356, 'Pune'),
(2, 6815633, 'Mumbai'),
(3, 6313656, 'Pune'),
(4, 6522356, 'Delhi'),
(5, 6789356, 'Mumbai'),
(6, 6863456, 'Chennai'),
(7, 6412152, 'Pune'),
(8, 6412956, 'Delhi'),
(9, 6412756, 'Pune'),
(10, 6412456, 'Chennai');
EMPLOYEE Table:
EMPLOYEE1 Table:
Examples of MySQL CREATE VIEW Statement
Example 1: Creating a Basic View
Create a view view1 from the EMPLOYEE table with columns EMP_ID and SALARY.
Query:
 CREATE VIEW view1 AS
SELECT EMP_ID, SALARY
FROM EMPLOYEE;
Output:
Explanation: Here we are creating a VIEW named view1 from the EMPLOYEE table which will have EMP_ID and SALARY as columns. The VIEW will have all the rows present as we have not specified the WHERE condition. As there are 10 rows in the EMPLOYEE table the VIEW will also have 10 rows present in it.
Example 2: Creating a View with a WHERE Clause
Create view2 from EMPLOYEE with EMP_ID, AGE, and SALARY for employees whose SALARY is 14000.
Query:
CREATE VIEW view2 AS
SELECT EMP_ID, AGE, SALARY
FROM EMPLOYEE
WHERE SALARY=14000;
Output:
Explanation: Here we are creating a VIEW named view2 from the EMPLOYEE table which will have EMP_ID, AGE, and SALARY of Employees whose SALARY=14000. The VIEW will have only 3 rows present as there are only 3 Employees with SALARY=14000.
Example 3: Creating a View with Columns from Multiple Tables
Create view3 with EMP_ID and NAME from EMPLOYEE, and PHONE and CITY from EMPLOYEE1.
Query:
CREATE VIEW view3 AS
SELECT a.EMP_ID, a.NAME, b.PHONE, b.CITY
FROM EMPLOYEE a
JOIN EMPLOYEE1 b ON a.EMP_ID=b.EMP_ID;
Output:
Explanation: Here we are creating a VIEW named view3 which is having EMP_ID and NAME from the EMPLOYEE table and PHONE and CITY from the EMPLOYEE1 table. Here it will have only those rows which match EMP_ID from EMPLOYEE table and EMP_ID from the EMPLOYEE1 table. As there are 10 rows from both the tables which have EMP_ID same Let'sthe view3 will have 10 rows present in it.
Example 4: Creating a View with WHERE Clause from Multiple Tables
Create view4 with EMP_ID and NAME from EMPLOYEE, and PHONE, CITY from EMPLOYEE1 for employees in 'Pune'.
Query:
CREATE VIEW view4 AS
SELECT a.EMP_ID, a.NAME, b.PHONE, b.CITY
FROM EMPLOYEE a
JOIN EMPLOYEE1 b ON a.EMP_ID=b.EMP_ID
WHERE b.CITY='Pune';
Output:
Explanation: Here we are creating a VIEW named view4 which has EMP_ID and NAME from the EMPLOYEE table and PHONE and CITY from the EMPLOYEE1 table WHERE the CITY of the Employee is 'Pune'. Here it will have only those rows which match EMP_ID from EMPLOYEE table and EMP_ID from EMPLOYEE1 table. Then once the EMP_ID is matched it will check for the Employees whose CITY = 'Pune'. As there are 10 rows from both the tables which have EMP_ID same but there are only 4 Employees whose CITY= 'Pune'. So the view will have 4 rows present in it.
Conclusion
MySQL CREATE VIEW Statement is used to CREATE a virtual table by using the SELECT queries. There are many advantages of VIEWS as it provides data abstraction, simplified querying, enhanced security, and performance optimization. They give users a comfortable space where they can involved in all the complex logic without getting in touch with the table. Hence, they serve as a middleman to manipulate the data in any intuitive way at their convenience. Investigating through views will help to maintain a high level of stability, reinforcing safety as well as keeping queries efficient when it comes to setting up a MySQL database.

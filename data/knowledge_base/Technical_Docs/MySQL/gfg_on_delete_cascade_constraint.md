# ON DELETE CASCADE Constraint

> Source: https://www.geeksforgeeks.org/mysql/mysql-on-delete-cascade-constraint/

ON DELETE CASCADE constraint is used in MySQL to delete the rows from the child table automatically, when the rows from the parent table are deleted. For example when a student registers in an online learning platform, then all the details of the student are recorded with their unique number/id. All the courses in these online learning platforms had their own code, title, and name. Students can enroll in any course according to their wishes. 
There is no rule that all students must enroll in all courses, or they have to join the course on the same date. A student can enroll in one or more courses. Suppose you delete a row from the “Student” table, now you will also want to delete all rows in the “Enroll” table that references the row in the “Student” table. For that, we need ON DELETE CASCADE.  Below are the steps that explain how ON DELETE CASCADE referential action works.
Step 1: Create the Student table
CREATE TABLE Student (
    sno INT PRIMARY KEY,
    sname VARCHAR(20),
    age INT
);
Step 2: Insert rows into the Student table
INSERT INTO Student(sno, sname,age) 
 VALUES(1,'Ankit',17),
       (2,'Ramya',18),
       (3,'Ram',16);
Step 3: Execute the SELECT query to check the data in the STUDENT table.
SELECT *
FROM Student;
Output:
| sno | sname | age | 
|---|---|---|
| 1 | Ankit | 17 | 
| 2 | Ramya | 18 | 
| 3 | Ram | 16 | 
Step 4: Create the Course table
CREATE TABLE Course (
    cno INT PRIMARY KEY,
    cname VARCHAR(20)
);
Step 5: Insert rows into the Course table
INSERT INTO Course(cno, cname) 
 VALUES(101,'c'),
       (102,'c++'),
       (103,'DBMS');
Step 6: Execute the SELECT query to check the data in the Course table.
SELECT *
FROM Course;
Output:
| cno | cname | 
|---|---|
| 101 | c | 
| 102 | c++ | 
| 103 | DBMS | 
Step 7: Create the Enroll table
CREATE TABLE Enroll (
    sno INT,
    cno INT,
    jdate date,
    PRIMARY KEY(sno,cno),
    FOREIGN KEY(sno) 
        REFERENCES Student(sno)
        ON DELETE CASCADE
    FOREIGN KEY(cno) 
        REFERENCES Course(cno)
        ON DELETE CASCADE
);
Step 8: Insert rows into the Enroll table
INSERT INTO Enroll(sno,cno,jdate) 
 VALUES(1, 101, '5-jun-2021'),
       (1, 102, '5-jun-2021'),
       (2, 103, '6-jun-2021');
Step 9: Execute the SELECT query to check the data in the Enroll table.
SELECT *
FROM Enroll;
Output:
| sno | cno | jdate | 
|---|---|---|
| 1 | 101 | 5-jun-2021 | 
| 1 | 102 | 5-jun-2021 | 
| 2 | 103 | 6-jun-2021 | 
Step 10: Here the parent tables are Student and Course whereas the child table is Enroll. If a student drops from the course or a course is removed from the offering list it must affect the child table also.
DELETE FROM Student
WHERE sname="Ramya";
Step 11: Execute the SELECT query to check the data.
Select * from Student;
Output:
| sno | sname | age | 
|---|---|---|
| 1 | Ankit | 17 | 
| 3 | Ram | 16 | 
Select * from Enroll;
Output:
| sno | cno | jdate | 
|---|---|---|
| 1 | 101 | 5-jun-2021 | 
| 1 | 102 | 5-jun-2021 | 
As you delete the contents of sno=2 in the parent table it automatically deletes the details of sno=2 from the child table also. In the same way, if you remove a course from the Course table it automatically deletes the rows of that course in the child table Enroll. This works out because the foreign key constraint ON DELETE CASCADE is specified.

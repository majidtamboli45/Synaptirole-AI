# Database Management Systems

> Source: https://www.geeksforgeeks.org/dbms/database-management-system-set-3/

Following Questions have been asked in GATE 2012 exam.
1) Consider the following transactions with data items P and Q initialized to zero:
2) Consider the following relations A, B, C. How many tuples does the result of the following relational algebra expression contain? Assume that the schema of A U B is the same as that of A.
Table A
Id   Name    Age
----------------
12   Arun    60
15   Shreya  24
99   Rohit   11
Table B
Id   Name   Age
----------------
15   Shreya  24
25   Hari    40
98   Rohit   20
99   Rohit   11
Table C
Id   Phone  Area
-----------------
10   2200   02  
99   2100   01
(A) 7
(B) 4
(C) 5
(D) 9
Answer (A)
Result of AUB will be following table
Id   Name    Age
----------------
12   Arun    60
15   Shreya  24
99   Rohit   11
25   Hari    40
98   Rohit   20
The result of given relational algebra expression will be
Id   Name    Age  Id   Phone Area
---------------------------------
12   Arun    60   10   2200   02 
15   Shreya  24   10   2200   02   
99   Rohit   11   10   2200   02 
25   Hari    40   10   2200   02 
98   Rohit   20   10   2200   02 
99   Rohit   11   99   2100   01
98   Rohit   20   99   2100   01
3) Consider the above tables A, B and C. How many tuples does the result of the following SQL query contains?
T1: read (P) ;
    read (Q) ;
    if P = 0 then Q : = Q + 1 ;
    write (Q) ;
T2: read (Q) ;
    read (P) ;
    if Q = 0 then P : = P + 1 ;
    write (P) ;
Any non-serial interleaving of T1 and T2 for concurrent execution leads to
(A) A serializable schedule
(B) A schedule that is not conflict serializable
(C) A conflict serializable schedule
(D) A schedule for which a precedence graph cannot be drawn
Answer (B)
Two or more actions are said to be in conflict if:
1) The actions belong to different transactions.
2) At least one of the actions is a write operation.
3) The actions access the same object (read or write).
The schedules S1 and S2 are said to be conflict-equivalent if the following conditions are satisfied:
1) Both schedules S1 and S2 involve the same set of transactions (including ordering of actions within each transaction).
2) The order of each pair of conflicting actions in S1 and S2 are the same.
A schedule is said to be conflict-serializable when the schedule is conflict-equivalent to one or more serial schedules.
Source: Wiki Page for Schedule
In the given scenario, there are two possible serial schedules: 
1) T1 followed by T2 
2) T2 followed by T1.  
In both of the serial schedules, one of the transactions reads the value written by other transaction as a first step. Therefore, any non-serial interleaving of T1 and T2 will not be conflict serializable. 
2) Consider the following relations A, B, C. How many tuples does the result of the following relational algebra expression contain? Assume that the schema of A U B is the same as that of A.
Table A
Id   Name    Age
----------------
12   Arun    60
15   Shreya  24
99   Rohit   11
Table B
Id   Name   Age
----------------
15   Shreya  24
25   Hari    40
98   Rohit   20
99   Rohit   11
Table C
Id   Phone  Area
-----------------
10   2200   02  
99   2100   01
Result of AUB will be following table
Id   Name    Age
----------------
12   Arun    60
15   Shreya  24
99   Rohit   11
25   Hari    40
98   Rohit   20
The result of given relational algebra expression will be
Id   Name    Age  Id   Phone Area
---------------------------------
12   Arun    60   10   2200   02 
15   Shreya  24   10   2200   02   
99   Rohit   11   10   2200   02 
25   Hari    40   10   2200   02 
98   Rohit   20   10   2200   02 
99   Rohit   11   99   2100   01
98   Rohit   20   99   2100   01
3) Consider the above tables A, B and C. How many tuples does the result of the following SQL query contains?
SELECT A.id 
FROM   A 
WHERE  A.age > ALL (SELECT B.age 
                    FROM   B 
                    WHERE  B. name = "arun") 
(A) 4
(B) 3
(C) 0
(D) 1
Answer (B)
The meaning of "ALL" is the A.Age should be greater than all the values returned by the subquery. There is no entry with name "arun" in table B. So the subquery will return NULL. If a subquery returns NULL, then the condition becomes true for all rows of A (See this for details). So all rows of table A are selected.
Please see GATE Corner for all previous year paper/solutions/explanations, syllabus, important dates, notes, etc.
Please write comments if you find any of the answers/explanations incorrect, or you want to share more information about the topics discussed above.

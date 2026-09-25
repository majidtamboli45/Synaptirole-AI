# Database Management Systems

> Source: https://www.geeksforgeeks.org/dbms/database-management-systems-set-10/

Following questions have been asked in GATE CS 2005 exam.
1) Let r be a relation instance with schema R = (A, B, C, D). We define r1 = 'select A,B,C from r' and r2 = 'select A, D from r'. Let s = r1 * r2 where * denotes natural join. Given that the decomposition of r into r1 and r2 is lossy, which one of the following is TRUE?
(a) s is subset of r
(b) r U s = r 
(c) r is a subset of s
(d) r * s = s
Answer (c)
Consider the following example with lossy decomposition of r into r1 and r2.  We can see that r is a subset of s.
Table r
 A      B      C      D
---------------------------
 1     10     100    1000    
 1     20     200    1000    
 1     20     200    1001 
Table r1
 A      B      C
------------------
 1     10     100 
 1     20     200 
Table r2
 A     D  
-----------
 1    1000  
 1    1001
Table s (natural join of r1 and r2)
 A      B      C      D
---------------------------
 1     10     100    1000    
 1     20     200    1000    
 1     10     100    1001 
 1     20     200    1001 
2) Let E1 and E2 be two entities in an E/R diagram with simple single-valued attributes. R1 and R2 are two relationships between E1 and E2, where R1 is one-to-many and R2 is many-to-many. R1 and R2 do not have any attributes of their own. What is the minimum number of tables required to represent this situation in the relational model? (a) 2 (b) 3 (c) 4 (d) 5 Answer (b) See https://www.geeksforgeeks.org/questions/let-e1-and-e2-be-two-entities-in-an/ for explanation.
3) Consider a relation scheme R = (A, B, C, D, E, H) on which the following functional dependencies hold: {A-->B, BC--> D, E-->C, D-->A}. What are the candidate keys of R? (a) AE, BE (b) AE, BE, DE (c) AEH, BEH, BCH (d) AEH, BEH, DEH Answer (d) A set of attributes S is candidate key of relation R if the closure of S is all attributes of R and there is no subset of S whose closure is all attributes of R. Closure of AEH, i.e. AEH+ = {ABCDEH} Closure of BEH, i.e. BEH+ = {ABCDEH} Closure of DEH, i.e. DEH+ = {ABCDEH} Please see GATE Corner for all previous year paper/solutions/explanations, syllabus, important dates, notes, etc.
Please write comments if you find any of the answers/explanations incorrect, or you want to share more information about the topics discussed above.
Table r
 A      B      C      D
---------------------------
 1     10     100    1000    
 1     20     200    1000    
 1     20     200    1001 
Table r1
 A      B      C
------------------
 1     10     100 
 1     20     200 
Table r2
 A     D  
-----------
 1    1000  
 1    1001
Table s (natural join of r1 and r2)
 A      B      C      D
---------------------------
 1     10     100    1000    
 1     20     200    1000    
 1     10     100    1001 
 1     20     200    1001 
2) Let E1 and E2 be two entities in an E/R diagram with simple single-valued attributes. R1 and R2 are two relationships between E1 and E2, where R1 is one-to-many and R2 is many-to-many. R1 and R2 do not have any attributes of their own. What is the minimum number of tables required to represent this situation in the relational model? (a) 2 (b) 3 (c) 4 (d) 5 Answer (b) See https://www.geeksforgeeks.org/questions/let-e1-and-e2-be-two-entities-in-an/ for explanation.
3) Consider a relation scheme R = (A, B, C, D, E, H) on which the following functional dependencies hold: {A-->B, BC--> D, E-->C, D-->A}. What are the candidate keys of R? (a) AE, BE (b) AE, BE, DE (c) AEH, BEH, BCH (d) AEH, BEH, DEH Answer (d) A set of attributes S is candidate key of relation R if the closure of S is all attributes of R and there is no subset of S whose closure is all attributes of R. Closure of AEH, i.e. AEH+ = {ABCDEH} Closure of BEH, i.e. BEH+ = {ABCDEH} Closure of DEH, i.e. DEH+ = {ABCDEH} Please see GATE Corner for all previous year paper/solutions/explanations, syllabus, important dates, notes, etc.
Please write comments if you find any of the answers/explanations incorrect, or you want to share more information about the topics discussed above.

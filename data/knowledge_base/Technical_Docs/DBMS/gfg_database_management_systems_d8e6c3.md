# Database Management Systems

> Source: https://www.geeksforgeeks.org/dbms/database-management-systems-set-8/

Following questions have been asked in GATE 2005 CS exam.
1) Which one of the following statements about normal forms is FALSE?
(a) BCNF is stricter than 3NF
(b) Lossless, dependency-preserving decomposition into 3NF is always possible
(c) Lossless, dependency-preserving decomposition into BCNF is always possible
(d) Any relation with two attributes is in BCNF
Answer (c)
It is not always possible to decompose a table in BCNF and preserve dependencies. For example, a set of functional dependencies {AB --> C, C --> B} cannot be decomposed in BCNF. See this for more details.
2) The following table has two attributes A and C where A is the primary key and C is the foreign key referencing A with on-delete cascade.
A   C
-----
2   4
3   4
4   3
5   2
7   2
9   5
6   4
The set of all tuples that must be additionally deleted to preserve referential integrity when the tuple (2,4) is deleted is:
(a) (3,4) and (6,4) 
(b) (5,2) and (7,2)
(c) (5,2), (7,2) and (9,5) 
(d) (3,4), (4,3) and (6,4)
Answer (C)
When (2,4) is deleted.  Since C is a foreign key referring A with delete on cascade, all entries with value 2 in C must be deleted. So (5, 2) and (7, 2) are deleted. As a result of this 5 and 7 are deleted from A which causes (9, 5) to be deleted.
3) The relation book (title, price) contains the titles and prices of different books. Assuming that no two books have the same price, what does the following SQL query list?
2) The following table has two attributes A and C where A is the primary key and C is the foreign key referencing A with on-delete cascade.
A   C
-----
2   4
3   4
4   3
5   2
7   2
9   5
6   4
3) The relation book (title, price) contains the titles and prices of different books. Assuming that no two books have the same price, what does the following SQL query list?
  select title
  from book as B
  where (select count(*)
     from book as T
     where T.price > B.price) < 5
(a) Titles of the four most expensive books
(b) Title of the fifth most inexpensive book
(c) Title of the fifth most expensive book
(d) Titles of the five most expensive books
Answer (d)
When a subquery uses values from outer query, the subquery is called correlated subquery. The correlated subquery is evaluated once for each row processed by the outer query.
The outer query selects all titles from book table. For every selected book, the subquery returns count of those books which are more expensive than the selected book. The where clause of outer query will be true for 5 most expensive book. For example count (*) will be 0 for the most expensive book and count(*) will be 1 for second most expensive book.
Please see GATE Corner for all previous year paper/solutions/explanations, syllabus, important dates, notes, etc.
Please write comments if you find any of the answers/explanations incorrect, or you want to share more information about the topics discussed above.

# The Problem of Redundancy in Database

> Source: https://www.geeksforgeeks.org/dbms/the-problem-of-redundancy-in-database/

Redundancy means having multiple copies of the same data in the database. This problem arises when a database is not normalized. Suppose a table of student details attributes is: student ID, student name, college name, college rank, and course opted.
| Student_ID | Name | Contact | College | Course | Rank | 
|---|---|---|---|---|---|
| 100 | Michael | 7300934851 | GEU | B.Tech | 1 | 
| 101 | David | 7900734858 | GEU | B.Tech | 1 | 
| 102 | James | 7300936759 | GEU | B.Tech | 1 | 
| 103 | William | 7300901556 | GEU | B.Tech | 1 | 
Anomalies
It can be observed that the values of the attributes college name, college rank, and course are being repeated, which can lead to problems. Major problems caused by redundancy are called anomalies. The following types of anomalies are caused by redundancy:
1. Insertion Anomaly
In Insertion anomaly, if a student's details have to be inserted whose course has not been decided yet, then insertion will not be possible till the course is decided for the student.
- A record cannot be inserted without adding unrelated data (e.g., course details).
- Student details cannot be stored if the course has not yet decided.
- Occurs due to poor table design and a lack of normalization.
| Student_ID | Name | Contact | College | Course | Rank | 
|---|---|---|---|---|---|
| 100 | Michael | 7300934851 | GEU | B.Tech | 1 | 
Note: This problem happens when the insertion of a data record is not possible without adding some additional unrelated data to the record.
2. Deletion Anomaly
In Deletion anomaly, If the details of students in this table are deleted then the details of the college will also get deleted which should not occur by common sense. This anomaly happens when the deletion of a data record results in losing some unrelated information that was stored as part of the record that was deleted from a table.
- Deleting a record causes loss of other important information (e.g., college details).
- Unrelated data gets deleted along with the intended data.
- Happens because multiple entities are stored in one table.
Note: It is not possible to delete some information without losing some other information in the table as well.
3. Updation Anomaly
In Updation anomaly, Suppose the rank of the college changes then changes will have to be all over the database which will be time-consuming and computationally costly. All places should be updated, If updation does not occur at all places then the database will be in an inconsistent state.
- Same data must be updated in multiple rows.
- Missing an update causes data inconsistency.
- Caused by data redundancy in the table.
Note: Redundancy in a database occurs when the same data is stored in multiple places. Redundancy can cause various problems such as data inconsistencies, higher storage requirements, and slower data retrieval.
Problems Caused Due to Redundancy
- Data Inconsistency and Integrity Issues: Multiple copies of the same data can become inconsistent if all are not updated simultaneously, leading to inaccurate or unreliable information.
- Increased Storage Requirements: Redundant data consumes extra storage space, increasing storage costs and reducing system efficiency.
- Update Anomalies and Performance Problems: Any change to redundant data must be made in multiple places, slowing down operations and increasing the chance of update errors.
- Maintenance Complexity: Managing, updating, and synchronizing multiple data copies makes maintenance more time-consuming and error-prone.
- Security and Privacy Risks: More copies of the same data create more points of vulnerability, increasing the risk of unauthorized access or data breaches.
- Usability and Accessibility Issues: Users may face confusion in identifying the correct or latest version of data, reducing productivity and trust in the system.
Note: To prevent redundancy in a database, Normalization is used, which is the process of organizing data in a database to eliminate redundancy and improve data integrity.

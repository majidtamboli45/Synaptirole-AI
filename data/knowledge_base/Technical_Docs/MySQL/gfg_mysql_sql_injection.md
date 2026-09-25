# MySQL SQL Injection

> Source: https://www.geeksforgeeks.org/mysql/mysql-sql-injection/

This is a very common and hazardous security vulnerability that uses the interactions between web applications and their databases. MySQL is an open-source relational database management system, too commonly under attack by such threats. SQL injection is an application coding weakness in the use and handling of SQL queries, making it possible to execute arbitrary SQL code on the database.
In any ordinary web application, user inputs are generally used for forming SQL queries. If such inputs are not properly validated or sanitized, an attacker can inject malicious SQL statements, which in the end leads to unauthorized access, data manipulation, or even full control over the database.
What is MySQL SQL Injection
MySQL SQL injection is a type of cyber attack wherein malicious SQL statements are injected into an entry field for its execution. This kind of attack, however, is targeted at applications that have MySQL as their database management system. This usually aims to modify the queries of the database of the application to conduct unauthorized activities, either retrieving sensitive data, modifying or deleting it, or even gaining administrative privileges over the database.
Types of MySQL SQL Injection
Here are some types of SQL Injections which are used to exploit databases:
Error-Based SQL Injection
Error-based SQL injection exploits error messages returned from the database, giving an insight into the database structure. With these error messages, the attackers can further tune the attacks to extract information.
Example:
SELECT * FROM users WHERE id = 1 AND 1=2 UNION SELECT 1, @@version;
If the error message returned by the database contains the version details, then it means the query was executed.
Union-Based SQL Injection
Union-based SQL injection utilizes the UNION SQL operator to combine the results of two or more SELECT statements. In this way, attackers may access data from several database tables.
Example:
SELECT username, password FROM users WHERE id = 1 UNION SELECT username, password FROM admin;
The above query unions the results obtained from the users table with the results obtained from the admin table.
Blind SQL Injection
Blind SQL injection is used when the application does not return error messages or database information. Instead, attackers make an inference on application behavior and responses to true or false queries. These are of two types which are as follow:
Boolean-Based Blind SQL Injection: In this method, the attacker sends a query that will result in one response if it evaluates to true and in another response if it evaluates to false.
Example:
SELECT * FROM users WHERE id = 1 AND 1=1; -- If true, returns normal page
SELECT * FROM users WHERE id = 1 AND 1=2; -- If false, returns different page
Time-Based Blind SQL Injection: An attack query is launched with a time-delayed response if the condition is true.
Example:
SELECT IF(1=1, SLEEP(5), 0);
Time-Based Blind SQL Injection
Time-blind SQL injection is based on response times to the database. In most cases, attackers will try to extract data according to delays using SQL commands that include a sleep operation in case of a true condition.
Example:
SELECT IF(username='admin', SLEEP(5), 0) FROM users;
Out-of-Band SQL Injection
Out-of-band SQL injection techniques make use of methods where the attack request and result cannot utilize the same communication channel. This technique is used when the attacker can't receive data using the same channel through which the queries have to be sent.
Example:
SELECT LOAD_FILE('/etc/passwd');
If the application has access to the file system, it may allow the contents of arbitrary files to be exfiltrated to an attacker via an out-of-band channel, such as through DNS or HTTP requests.
Examples of SQL Injection Attacks
Simple Authentication Bypass
SELECT * FROM users WHERE username = 'admin' --' AND password = 'password';
Here, the comment sequence -- ignores the rest of the query, potentially allowing access without a correct password.
Union-based Attack
SELECT name, email FROM users WHERE id = 1 UNION SELECT name, email FROM admin;
This combines the results from the users table with the admin table.
Conclusion
MySQL SQL Injection is a critical security vulnerability that could bring devastating impacts to the Web application or its database. A hacker takes advantage of weak usage and parsing of user inputs, which can help them in restructuring the SQL commands to perform unauthorized access, data theft, or even take control of the database.

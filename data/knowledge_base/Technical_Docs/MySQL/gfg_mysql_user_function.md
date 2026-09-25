# MySQL USER( ) Function

> Source: https://www.geeksforgeeks.org/mysql/mysql-user-function/

The USER() function in MySQL is used to retrieve information about the current database connection. It returns the username and the hostname from which the connection to the MySQL server was established.
- Returns the username and host used to establish the current MySQL connection.
- The function does not require any parameters to execute.
- It uses the utf8 character set for the returned value.
- It is similar to SESSION_USER() and SYSTEM_USER() functions that provide user session information.
Syntax:
USER()
The USER() function does not take any parameters.
Return Value:
The USER() function returns the current MySQL username and hostname used to establish the connection to the MySQL server.
Usage:
The USER() function can be used in various scenarios, such as:
- Auditing: Track which user is executing specific queries.
- Debugging: Identify the user to troubleshoot permission issues.
- Monitoring: Keep an eye on who is connected to the database.
Working with MySQL USER( ) Function
The following examples demonstrate how the USER() function works in MySQL and how it retrieves the current username and host of the database connection.
Example 1: Get Current MySQL User
To retrieve the current user information.
Query:
SELECT USER();
Output:
USER()
'john@localhost'
This output shows the username and host used to connect to the MySQL server.
Example 2: Using USER() with Other Functions
The USER() function can be combined with other functions to create more informative queries. For example, logging the current user along with a timestamp:
Query:
INSERT INTO user_logs (username, log_time)
VALUES (USER(), NOW());
This query records the current user and the current time in a log table.
Example 3: Conditional Logic Based on User
The USER() function can also be used in stored programs to perform actions based on the connected user.
Query:
IF USER() = 'admin@localhost' THEN
-- perform admin-specific actions
END IF;
This query checks if the current connected user is 'admin@localhost' and executes specific actions only for that user.
Differences with Other Functions
MySQL provides multiple functions to retrieve information about the current user session. Although they appear similar, they return slightly different details.
1. USER()
The USER() function returns the username and host used to establish the current MySQL connection.
- Returns the username and host used to connect to the MySQL server.
- Example return value: 'john@localhost'.
- Shows the login credentials provided during connection.
2. CURRENT_USER()
The CURRENT_USER() function returns the authenticated MySQL account used for privilege checking.
- Returns the authenticated MySQL user account.
- Example return value: 'john@localhost'.
- May differ from USER() depending on authentication or privilege settings.
3. SESSION_USER()
The SESSION_USER() function returns the user account that originally initiated the session.
- Returns the user who started the current session.
- Example return value: 'john@localhost'.
- Remains unchanged during the session, even if roles change.

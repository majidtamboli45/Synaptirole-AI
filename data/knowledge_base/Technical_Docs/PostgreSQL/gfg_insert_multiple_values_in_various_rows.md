# Insert Multiple Values in Various Rows

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-insert-multiple-values-in-various-rows/

PostgreSQL, one of the most popular relational database management systems (RDBMS), is widely used for storing structured data in a tabular format, much like MySQL. In relational databases, data is stored in tables where each row represents a record and each column represents an attribute. One of the most common tasks in database management is inserting data into tables. In this article, we will explore how to efficiently insert multiple rows into a PostgreSQL database using the INSERT statement.
INSERT Statement in PostgreSQL
In PostgreSQL, the INSERT statement is typically used to add new rows to a table. However, when you need to insert multiple rows at once, PostgreSQL offers a more optimized approach than running multiple individual INSERT statements. This method can save you time and reduce overhead, especially when dealing with large datasets.
Syntax :
##When specifying Column Names
INSERT INTO tableName (col1, col2) VALUES (value,value),(value,value),(value,value);
## When not specifying Column Names
INSERT INTO tableName VALUES (value,value),(value,value),(value,value);
Approach:
- Our database name is geeksforgeeks and the table name is gfg at the beginning there is no data inside the table. For selecting the database we will use query \c databaseName.
- For checking the data inside the table we will use query select *from tableName.
- Now for inserting values, we will use the table name and the column names and the records to be inserted will be separated by comma("'").
- The query will be Insert into tableName (col1, col2) values (value,value),(value,value),(value,value).
- If you want to insert without the column names then the query will be a different one than the above query.
- Insert into tableName values (value,value),(value,value),(value,value) . But one thing should be remembered here that in this case, the order of the values being inserted should be the same as that of in the database and all the mandatory columns must be inserted.
- Now again we will check for records inside the table using select*from tableName.
Examples of Inserting Multiple Values in Various Rows
Let us look into some of the examples of inserting multiple values in rows in PostgreSQL.
Example 1: Inserting Multiple Rows with Specified Column Names
In this example, we first selected the database using the \c geeksforgeeks command, and then we looked into the database table records then we inserted the multiples record inside the table then again look inside the database tables. The steps followed are to select the database and then look into the table records then insert multiple values and then again look into the table records.
Example 2: Inserting Multiple Rows Without Specifying Column Names
Here in this example, we will insert the rows without using the column names but one thing to note about this approach is if you are not giving the column names the order of values being inserted will be the same as that of in the table and all the mandatory columns must be filled in the table otherwise there will be an exception. After inserting the data we will again look into the database table.

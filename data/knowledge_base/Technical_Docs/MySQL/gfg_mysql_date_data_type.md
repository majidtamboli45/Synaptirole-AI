# MySQL DATE Data Type

> Source: https://www.geeksforgeeks.org/mysql/mysql-date-data-type/

MySQL DATE Data Type stores date values in the format 'YYYY-MM-DD' and has a valid range of values from '1000-01-01' to '9999-12-31'.
DATE Data Type in MySQL
The Data data type in MySQL is used to store date values in a column. During later data analysis, it is necessary to perform date-time operations on the data.
Dates are displayed in the format 'YYYY-MM-DD', but can be inserted using either strings or numbers. If any invalid date is inserted, MySQL will store '0000-00-00' by default.
Syntax
DATE Data Type Syntax is:
Variable_Name DATE
MySQL DATE Data Type Examples
The following examples will illustrate how we can use Date data type in MySQL in a variable.
Creating a table with DATE Data Type Column Example
In this example, we will create a table 'StudentDetails'. The table consists of Student_Id, First_name, Last_name, Date_Of_Birth, Class, Contact_Details columns. Among these the data type of Date_Of_Birth column is DATE.
Query:
CREATE TABLE StudentDetails (
Student_Id INT AUTO_INCREMENT,
First_name VARCHAR (100) NOT NULL,
Last_name VARCHAR (100) NOT NULL,
Date_Of_Birth DATE NOT NULL,
Class VARCHAR (10) NOT NULL,
Contact_Details BIGINT NOT NULL,
PRIMARY KEY(Student_Id )
);
Inserting Date into DATE Data Type Column Example
In this example, we will insert data into table. We will also insert date in the Date_Of_Birth column as its data type is Date.
Query:
INSERT INTO     
StudentDetails(First_name , Last_name , Date_Of_Birth , Class, Contact_Details)
VALUES
('Amit', 'Jana', '2004-12-22', 'XI', 1234567890),
('Manik', 'Aggarwal', '2006-07-04', 'IX', 1245678998),
('Nitin', 'Das', '2005-03-14', 'X', 2245664909),
('Priya', 'Pal', '2007-07-24', 'VIII', 3245642199),
('Biswanath', 'Sharma', '2005-11-11', 'X', 2456789761),
('Mani', 'Punia', '2006-01-20', 'IX', 3245675421),
('Pritam', 'Patel', '2008-01-04', 'VII', 3453415421),
('Sayak', 'Sharma', '2007-05-10', 'VIII' , 1214657890);
To verify using the following command as follows.
SELECT * FROM StudentDetails ;
Output :
| Student_Id | First_name | Last_name | Date_Of_Birth | Class | Contact_Details | 
|---|---|---|---|---|---|
| 1 | Amit | Jana | 2004-12-22 | XI | 1234567890 | 
| 2 | Manik | Aggarwal | 2006-07-04 | IX | 1245678998 | 
| 3 | Nitin | Das | 2005-03-14 | X | 2245664909 | 
| 4 | Priya | Pal | 2007-07-24 | VIII | 3245642199 | 
| 5 | Biswanath | Sharma | 2005-11-11 | X | 2456789761 | 
| 6 | Mani | Punia | 2006-01-20 | IX | 3245675421 | 
| 7 | Pritam | Patel | 2008-01-04 | VII | 3453415421 | 
| 8 | Sayak | Sharma | 2007-05-10 | VIII | 1214657890 | 
So, we have successfully stored the DATE data-type in the Date_Of_Birth Column.
Similary we can create another table 'ProductDetails'
It consists of ProductId, ProductName, and Manufactured_On columns, among which the data type for Manufactured_On columns is DATE.
Query:
CREATE TABLE ProductDetails(
ProductId INT NOT NULL,
ProductName VARCHAR(20) NOT NULL,
Manufactured_On DATE NOT NULL,
PRIMARY KEY(ProductId)
);
Inserting data into the Table -
The CURRENTDATE function is used to assign value in the Manufactured_On column. The return data type for CURRENTDATE function is DATE.
Query:
INSERT INTO  
ProductDetails(ProductId, ProductName, Manufactured_On)
VALUES
(11001, 'ASUS X554L', CURRENT_DATE()) ;
To verify using the following command as follows.
SELECT  * FROM ProductDetails;
Output :
| PRODUCTID | PRODUCTNAME | MANUFACTURED_ON | 
|---|---|---|
| 11001 | ASUS X554L | 2020-12-08 |

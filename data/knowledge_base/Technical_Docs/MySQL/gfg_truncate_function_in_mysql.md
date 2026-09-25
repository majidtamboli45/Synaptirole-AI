# TRUNCATE() Function in MySQL

> Source: https://www.geeksforgeeks.org/mysql/truncate-function-in-mysql/

The TRUNCATE() function in MySQL is a valuable tool for manipulating numerical values by removing their decimal parts without rounding. It allows us to limit the precision of numbers to a specified number of decimal places or even truncate them to the nearest integer. 
In this article, We will learn about the TRUNCATE() Function in MySQL in detail by understanding various examples in detail.
TRUNCATE() Function in MySQL
- The TRUNCATE() function in MySQL is used to shorten a numerical value by removing the decimal part either by rounding it down to a specified number of decimal places or the nearest integer.
- It is particularly useful when we need to limit the precision of a number without rounding it, making it a valuable tool in scenarios where exact truncation is necessary.
Syntax:
TRUNCATE(number, decimal_places)
Parameter:
- number: The numeric value that you want to truncate.
- decimal_places: The number of decimal places to which the number should be truncated. If this value is 0, the function returns the integer part of the number.
Returns:
It returns the number after being truncated to the specified places.
Examples of TRUNCATE() Function in MySQL
Example 1
Truncating a number when D is 0.
Truncating a Negative number:
SELECT TRUNCATE(-10.11, 0) AS Truncated_Number ;
Output :
+------------------+
| Truncated_Number |
+------------------+
| -10 |
+------------------+
Truncating a Positive number:
SELECT TRUNCATE(100.61, 0) AS Truncated_Number ;
Output :
+------------------+
| Truncated_Number |
+------------------+
| 100 |
+------------------+
Example 2
Truncating a number when D is negative(-ve).
Truncating a Negative number:
SELECT TRUNCATE(-19087.1560, -3) AS Truncated_Number;
Output :
+------------------+
| Truncated_Number |
+------------------+
| -19000 |
+------------------+
1 row in set (0.00 sec)
Truncating a Positive number:
SELECT TRUNCATE(10876.5489, -1) AS Truncated_Number;
Output :
+------------------+
| Truncated_Number |
+------------------+
| 10870 |
+------------------+
Example 3
Truncating a number when D is positive(+ve).
Truncating a Negative number up to 2 decimal places:
SELECT TRUNCATE(-7767.1160, 2) AS Truncated_Number;
Output :
+------------------+
| Truncated_Number |
+------------------+
| -7767.11 |
+------------------+
1 row in set (0.00 sec)
Truncating a Positive number up to 3 decimal places:
mysql> SELECT TRUNCATE(17646.6019, 3) AS Truncated_Number;
Output:
+------------------+
| Truncated_Number |
+------------------+
| 17646.601 |
+------------------+
Example 4: How to truncate tables data in MySQL?
TRUNCATE Function can also be used to find the truncated values for the column data. In this example, we are going to find truncated values for Price column. To demonstrate create a table named
Product
CREATE TABLE Product
(
Product_id INT AUTO_INCREMENT,
Product_name VARCHAR(100) NOT NULL,
Buying_price DECIMAL(13, 6) NOT NULL,
Selling_price DECIMAL(13, 6) NOT NULL,
Selling_Date Date NOT NULL,
PRIMARY KEY(Product_id)
);
Now inserting some data to the Product table:
INSERT INTO  
Product(Product_name, Buying_price, Selling_price, Selling_Date)
VALUES
('P6', 1060.865460, 1700.675400, '2020-08-26' ),
('P2', 2000.154300, 3050.986700, '2020-08-27' ),
('P1', 4000.874300, 5070.786500, '2020-08-28' ),
('P2', 2090.654300, 3050.896500, '2020-09-01' ),
('P3', 5900.543280, 7010.654700, '2020-09-04' ),
('P4', 4000.353200, 4500.125400, '2020-09-05' ),
('P5', 5010.768900, 6000.873200, '2020-09-08' ),
('P6', 1060.865460, 1400.675430, '2020-09-11' );
So, the Product Table is:
mysql> SELECT * FROM Product;
Output:
+------------+--------------+--------------+---------------+--------------+
| Product_id | Product_name | Buying_price | Selling_price | Selling_Date |
+------------+--------------+--------------+---------------+--------------+
| 1 | P6 | 1060.865460 | 1700.675400 | 2020-08-26 |
| 2 | P2 | 2000.154300 | 3050.986700 | 2020-08-27 |
| 3 | P1 | 4000.874300 | 5070.786500 | 2020-08-28 |
| 4 | P2 | 2090.654300 | 3050.896500 | 2020-09-01 |
| 5 | P3 | 5900.543280 | 7010.654700 | 2020-09-04 |
| 6 | P4 | 4000.353200 | 4500.125400 | 2020-09-05 |
| 7 | P5 | 5010.768900 | 6000.873200 | 2020-09-08 |
| 8 | P6 | 1060.865460 | 1400.675430 | 2020-09-11 |
| 9 | P6 | 1060.865460 | 1700.675400 | 2020-08-26 |
| 10 | P2 | 2000.154300 | 3050.986700 | 2020-08-27 |
| 11 | P1 | 4000.874300 | 5070.786500 | 2020-08-28 |
| 12 | P2 | 2090.654300 | 3050.896500 | 2020-09-01 |
| 13 | P3 | 5900.543280 | 7010.654700 | 2020-09-04 |
| 14 | P4 | 4000.353200 | 4500.125400 | 2020-09-05 |
| 15 | P5 | 5010.768900 | 6000.873200 | 2020-09-08 |
| 16 | P6 | 1060.865460 | 1400.675430 | 2020-09-11 |
+------------+--------------+--------------+---------------+--------------+
Now, we are going truncating both Buying_price and Selling_price column up to 2 decimal places.
   SELECT  
Product_name,
Buying_price,
TRUNCATE(Buying_price, 2) Trucated_Bprice,
Selling_price,
TRUNCATE(Selling_price, 2) Trucated_Sprice
FROM Product ;
Output:
+--------------+--------------+-----------------+---------------+-----------------+
| Product_name | Buying_price | Trucated_Bprice | Selling_price | Trucated_Sprice |
+--------------+--------------+-----------------+---------------+-----------------+
| P6 | 1060.865460 | 1060.86 | 1700.675400 | 1700.67 |
| P2 | 2000.154300 | 2000.15 | 3050.986700 | 3050.98 |
| P1 | 4000.874300 | 4000.87 | 5070.786500 | 5070.78 |
| P2 | 2090.654300 | 2090.65 | 3050.896500 | 3050.89 |
| P3 | 5900.543280 | 5900.54 | 7010.654700 | 7010.65 |
| P4 | 4000.353200 | 4000.35 | 4500.125400 | 4500.12 |
| P5 | 5010.768900 | 5010.76 | 6000.873200 | 6000.87 |
| P6 | 1060.865460 | 1060.86 | 1400.675430 | 1400.67 |
| P6 | 1060.865460 | 1060.86 | 1700.675400 | 1700.67 |
| P2 | 2000.154300 | 2000.15 | 3050.986700 | 3050.98 |
| P1 | 4000.874300 | 4000.87 | 5070.786500 | 5070.78 |
| P2 | 2090.654300 | 2090.65 | 3050.896500 | 3050.89 |
| P3 | 5900.543280 | 5900.54 | 7010.654700 | 7010.65 |
| P4 | 4000.353200 | 4000.35 | 4500.125400 | 4500.12 |
| P5 | 5010.768900 | 5010.76 | 6000.873200 | 6000.87 |
| P6 | 1060.865460 | 1060.86 | 1400.675430 | 1400.67 |
+--------------+--------------+-----------------+---------------+-----------------+
Explanation: The query selects the `Product_name`, `Buying_price`, and `Selling_price` from the `Product` table, and it uses the `TRUNCATE()` function to truncate the `Buying_price` and `Selling_price` to two decimal places. The truncated values are returned as `Truncated_Bprice` and `Truncated_Sprice`. This helps in displaying the prices with a fixed number of decimal points for better readability or consistency.
Conclusion
In summary, the TRUNCATE() function in MySQL is an essential feature for developers and database administrators who need precise control over numerical data. Whether you're truncating values to maintain consistency or simplifying complex numbers for reporting purposes, TRUNCATE() provides a straightforward and efficient solution.

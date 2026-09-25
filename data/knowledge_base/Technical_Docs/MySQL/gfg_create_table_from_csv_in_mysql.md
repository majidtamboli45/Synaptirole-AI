# Create Table From CSV in MySQL

> Source: https://www.geeksforgeeks.org/mysql/create-table-from-csv-in-mysql/

The CSV (Comma-Separated Values) file is a simple text file format used to store tabular data. Each row represents a record, and each value is separated by a comma. CSV files are widely used because:
- They are simple and lightweight.
- Supported by tools like Excel, Google Sheets, etc.
- Easy to import/export between systems.
Import CSV File
The MySQL Command Line Client allows users to import CSV data into a table using SQL queries. This method is efficient and widely used for database management.
LOAD DATA INFILE 'file_path'INTO TABLE table_nameFIELDS TERMINATED BY ','ENCLOSED BY '"'LINES TERMINATED BY '\n'IGNORE 1 ROWS;
This CSV file contains 4 columns:
- DATE
- TOTAL_TIME
- HOURS
- MINUTES
Creation of Skeleton Table:
STEP 1: First, create a table based on the CSV file structure.
Example CSV Columns:
- DATE → DATEx
- TOTAL_TIME → INT
- HOURS → INT
- MINUTES → INT
Query:
CREATE TABLE table_name ( csv_column_1 
DATATYPE, csv_column_2 DATATYPE,
csv_column_3 DATATYPE ....);
The last 2 entries could be extended to the number of columns in the CSV file but in ourr case there are 4 columns each of which has the following data types:
DATE            => Date
TOTAL_TIME => INT
HOURS => INT
MINUTES => INT
So to create a table for the above file, the query would be:
Query:
CREATE TABLE TRANSFER ( DATE DATE, 
TOTAL_TIME INT, HOURS INT, MINUTES INT);
This would create a table. To view the table enter the query:
Query:
SELECT * FROM TRANSFER;
Which displays an empty table. Since we haven't added any data to it.
STEP 2:
Now to add the data from the CSV file to it, run the following:
Query:
LOAD DATA INFILE 'file.csv' 
INTO TABLE TRANSFER
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
The LOAD DATA INFILE statement allows you to read data from a text file and import the file’s data into a database. Upon execution of the above statement we display the table again using:
Query:
SELECT * FROM TRANSFER;
To which the resulting table is:
- Loads data from 'file.csv' into the TRANSFERS table.
- Fields are separated by comma (,) and may be enclosed in double quotes (" "); rows end with \n.
- The first row is ignored as it contains column names (headers).
Therefore the blueprint for loading the data to a table would be:
Query:
LOAD DATA INFILE '_path_to_csv_' 
INTO TABLE TABLE_NAME
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
where,
_path_to_csv_ => path to the csv file
TABLE_NAME => Name of the table (skel table)
in which the data is to be copied
If the excel file has different delimiters, that could also be mentioned in the second line.

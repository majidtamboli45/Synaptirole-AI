# MySQL Data Types

> Source: https://www.geeksforgeeks.org/mysql/mysql-data-types/

MySQL Data Types define the type of data that can be stored in a table column. They help ensure that data is stored in a structured and efficient way.
- Ensure that only valid and appropriate data is stored in each column.
- Improve storage efficiency and query performance.
- Include categories such as numeric, string, date & time, and spatial data types.
MySQL data types are mainly divided into the following categories:
1. Numeric Data Types
Numeric Data Types in MySQL are used to store numeric values such as integers and decimal numbers. They allow databases to perform mathematical operations and store numbers with different ranges and precision.
- INT: Used to store whole numbers such as IDs, counts, or quantities.
- TINYINT: Used to store very small integer values, often for flags or status values.
- SMALLINT: Used to store small integer numbers that require less storage.
- BIGINT: Used to store very large integer values beyond the range of INT.
- DECIMAL: Used to store exact numeric values with fixed precision, commonly for financial data.
- FLOAT: Used to store approximate decimal numbers with single precision.
- DOUBLE: Used to store approximate decimal numbers with double precision for higher accuracy.
Example: Creates a Products table where INT stores whole numbers and DECIMAL(10,2) stores precise price values.
CREATE TABLE Products (
product_id INT,
price DECIMAL(10,2),
quantity INT
);
2. String Data Types
String Data Types in MySQL are used to store text or character data. These data types allow storing names, descriptions, emails, and other textual information.
- CHAR: Used to store fixed-length character strings.
- VARCHAR: Used to store variable-length character strings.
- TEXT: Used to store large amounts of text data.
- TINYTEXT: Used to store very short text data.
- MEDIUMTEXT: Used to store medium-length text data.
- LONGTEXT: Used to store very large text values.
Example: Creates a Users table where VARCHAR stores variable-length text and TEXT stores longer descriptions.
CREATE TABLE Users (    name VARCHAR(50),    email VARCHAR(100),    description TEXT);
3. Date and Time Data Types
Date and Time Data Types in MySQL are used to store date and time values. They help manage information such as timestamps, event dates, and schedules.
- DATE: Used to store date values in YYYY-MM-DD format.
- TIME: Used to store time values in HH:MM:SS format.
- DATETIME: Used to store both date and time values.
- TIMESTAMP: Used to store date and time values with automatic updates.
- YEAR: Used to store year values in four-digit format.
Example: Creates an Orders table where DATE stores the order date and TIME stores the order time.
CREATE TABLE Orders (    order_id INT,    order_date DATE,    order_time TIME);
4. Spatial Data Types
Spatial Data Types in MySQL are used to store geometric and geographic data. These data types are commonly used in location-based applications and geographic information systems.
- GEOMETRY: Used to store geometric objects such as points, lines, and polygons.
- POINT: Used to store a single coordinate location.
- LINESTRING: Used to store a line formed by multiple points.
- POLYGON: Used to store polygon shapes defined by multiple coordinates.
Example: Creates a Locations table where POINT stores geographic coordinates.
CREATE TABLE Locations (    location_id INT,    coordinates POINT);
Choosing the Right Data Type
Selecting the correct data type is important for efficient storage and performance. Some key considerations include:
- Choose INT for whole numbers.
- Use VARCHAR for variable-length text.
- Use DATE or DATETIME for date and time values.
- Use DECIMAL for financial calculations to maintain precision.

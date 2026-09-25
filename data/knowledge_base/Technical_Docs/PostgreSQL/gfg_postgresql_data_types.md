# PostgreSQL Data Types

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-data-types/

Data Types in PostgreSQL define the type of data that can be stored in each table column. They help ensure data is stored, validated and processed correctly. provides different types of data types, which are as follows:
- Improve data accuracy and maintain data integrity.
- Support advanced data types such as JSON, arrays and user-defined types for application-specific needs.
1. Numeric Type
These types are used for storing numerical data. PostgreSQL provides various numeric types, including:
| Numeric Type | Description | Storage Size | Range | Example Values | 
|---|---|---|---|---|
| smallint | A 2-byte integer type. | 2 bytes | -32,768 to 32,767 | -100 ,0 ,20000 | 
| integer | A 4-byte integer type (default integer type). | 4 bytes | -2,147,483,648 to 2,147,483,647 | -5000 ,0 ,150000 | 
| bigint | An 8-byte integer type. | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | -1000000000 ,0 ,30000000000 | 
| decimal(p, s) | A numeric type with user-defined precision (p) and scale (s). | Variable | -1038 +1 to 1038 -1 with up to 38 digits of precision. | 123.45 ,-987.654321 | 
| numeric(p,s s) | Similar to decimal, with user-defined precision and scale, representing exact numeric values. | Variable | -1038 +1 to 10^38 -1 with up to 38 digits of precision. | 123.456 ,-12345.6789 | 
| real | A 4-byte single precision floating-point number. | 4 bytes | 1.701411734 × 1038 (max) to -1.701411734 × 1038 (min). | 3.14 ,-0.001 ,2.71828 | 
| double precision | An 8-byte double precision floating-point number. | 8 bytes | 1.7976931348623157 × 10308 (max) to -1.7976931348623157 × 10308 (min). | 3.141592653589793 ,-1.0E-5 | 
| serial | An auto-incrementing 4-byte integer type, often used for primary keys. | 4 bytes | Same as integer. | Automatically increments by 1 | 
| bigserial | An auto-incrementing 8-byte integer type, used for large-scale primary keys. | 8 bytes | Same as bigint. | Automatically increments by 1 | 
2. Monetary Type
Here’s a detailed overview of the monetary types available in PostgreSQL, presented in a tabular format:
| Monetary Type | Description | Storage Size | Range | Example Values | 
|---|---|---|---|---|
| money | A fixed-point type used for storing currency values. | 8 bytes | -2,147,483,648.00 to 2,147,483,647.00 | $1234.56 ,-$10.00 | 
3. Character Types
Here’s a detailed overview of the character types available in PostgreSQL, presented in a tabular format:
| Character Type | Description | Storage Size | Maximum Length | Example Values | 
|---|---|---|---|---|
| char(n) | A fixed-length character type. If the string is shorter than n, it is padded with spaces. | n + 1 bytes (1 byte per character plus 1 byte for length) | 1 to 8,000 | 'A', 'Hello ' (padded) | 
| varchar(n) | A variable-length character type. It can store strings with a maximum length of n. | 1 + actual length (1 byte for length) | 1 to 8,000 | 'Alice', 'Bob' | 
| text | A variable-length character type with no specific length limit. | 1 + actual length (1 byte for length) | No limit | 'This is a long text string.' | 
4. Binary Types
Binary types in PostgreSQL are used to store raw binary data. The bytea type is specifically designed for this purpose, allowing you to store byte arrays for applications that need to manage non-text data, such as images, audio and other multimedia files.
| Binary Type | Description | Storage Size | Maximum Length | Example Values | 
|---|---|---|---|---|
| bytea | Stores binary data (byte array). | Variable | No limit | '\xDEADBEEF', '\x00FF' | 
5. Date/Time Types
PostgreSQL provides several date and time types to handle temporal data effectively. These types are essential for applications that require accurate time tracking, such as event scheduling, logging and historical data analysis.
| Date/Time Type | Description | Storage Size | Range | Example Values | 
|---|---|---|---|---|
| date | Stores calendar dates (year, month, day). | 4 bytes | 4713 BC to 5874897 AD | 2024-10-08 | 
| time | Stores time of day (hour, minute, second). | 8 bytes | 00:00:00 to 24:00:00 (with or without time zone) | 13:45:30, 12:00:00 | 
| timestamp | Stores both date and time (without time zone). | 8 bytes | 4713 BC to 5874897 AD | 2024-10-08 14:30:00 | 
| timestamptz | Stores both date and time (with time zone). | 8 bytes | 4713 BC to 5874897 AD | 2024-10-08 14:30:00-05 | 
| interval | Represents a span of time (days, hours, minutes, seconds). | Variable | -178000 years to 178000 years | 1 day, 2 hours 30 mins | 
6. Boolean Types
Boolean types in PostgreSQL store truth values which can be either true or false. The boolean type is simple yet powerful for conditional checks and decision-making in applications. 
| Boolean Type | Description | Storage Size | Example Values | 
|---|---|---|---|
| boolean | Stores true, false and null values. | 1 byte | true, false, NULL | 
7. Enumerated Types
Enumerated types (enums) allow us to define a data type with a static, ordered set of values. This is useful for situations where a column must contain one of a limited set of predefined values enhancing data integrity and readability.
| Enumerated Type | Description | Storage Size | Example Values | 
|---|---|---|---|
| enum | A user-defined type that consists of a static, ordered set of values. | Variable | 'small', 'medium', 'large' | 
8. Geometric Types
Geometric types in PostgreSQL are used to store two-dimensional geometric data. These types are ideal for applications involving spatial data, such as geographic information systems (GIS), computer graphics and geometric modeling.
| Geometric Type | Description | Storage Size | Example Values | 
|---|---|---|---|
| point | Represents a point in a 2D space (x, y). | 16 bytes | (1, 2), (3.5, 4.5) | 
| line | Represents an infinite line in 2D space. | 32 bytes | line(1, 2) | 
| lseg | Represents a line segment in 2D space. | 32 bytes | lseg((1, 2), (3, 4)) | 
| box | Represents a rectangular box in 2D space. | 32 bytes | box((1, 2), (3, 4)) | 
| path | Represents a path (open or closed) in 2D space. | Variable | path((1, 2), (3, 4), (5, 6)) | 
| polygon | Represents a polygon in 2D space. | Variable | polygon((1, 1), (2, 2), (1, 2)) | 
| circle | Represents a circle in 2D space (center, radius). | 32 bytes | circle((1, 1), 5) | 
9. Other (Special Purpose) Data Types
PostgreSQL also provides several special-purpose data types that are used for modern applications, networking and document-based data.
| Data Type | Description | Storage Size | Example | 
|---|---|---|---|
| UUID | Stores 128-bit universally unique identifiers | 16 bytes | 550e8400-e29b-41d4-a716-446655440000 | 
| JSON | Stores JSON data as text | Variable | {"name":"Riya","age":21} | 
| JSONB | Stores JSON in binary optimized format | Variable | {"price":120,"stock":true} | 
| INET | Stores IPv4 or IPv6 addresses | 7 or 19 bytes | 192.168.1.1 | 
| CIDR | Stores network blocks | 7 or 19 bytes | 192.168.0.0/24 | 
| MACADDR | Stores MAC addresses | 6 bytes | 08:00:2b:01:02:03 | 
| TSVECTOR | Stores full-text search documents | Variable | 'postgres database' |

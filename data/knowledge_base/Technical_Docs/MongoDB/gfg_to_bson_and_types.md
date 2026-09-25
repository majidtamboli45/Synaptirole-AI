# Introduction to BSON and Types

> Source: https://www.geeksforgeeks.org/mongodb/what-is-bson/

BSON (Binary JSON) is a binary-encoded data format derived from JSON, designed for efficient data storage and fast processing, especially in databases like MongoDB.
- Binary-encoded version of JSON.
- Stores and transfers data efficiently.
- Supports more precise data types than JSON.
- Faster data traversal and better performance.
- Less human-readable compared to JSON.
- Commonly used in high-performance databases (e.g., MongoDB).
Need of BSON
BSON is used to overcome JSON’s limitations by providing better data type support and improved performance for machine processing.
- Addresses limitations of JSON.
- Supports advanced data types (ObjectId, Date, Binary).
- Encodes data more precisely.
- Enables efficient storage and fast query performance.
- Used by MongoDB as its primary data format.
- Suitable for applications requiring a robust and efficient data format.
BSON Specification and Structure
BSON is a document-based data format that defines binary encoding rules and supports richer data types than JSON for efficient storage and processing.
A BSON document consists of:
- Document Size: The first 4 bytes represent the total size of the document in bytes.
- Elements: Each element contains a field name, a type identifier, and the corresponding value. Each element is encoded with its type, length, and data.
- End of Object (EOO): BSON documents are terminated by a special marker, ensuring that the parser knows when a document ends.
Here’s an example of a document and its corresponding BSON encoding:
JSON
{
"hello": "world"
}
BSON
\x16\x00\x00\x00           // total document size
\x02 // 0x02 = type String
hello\x00 // field name
\x06\x00\x00\x00world\x00 // field value (size of value, value, null terminator)
\x00 // 0x00 = type EOO ('end of object')
BSON Data Types
BSON extends JSON by adding support for advanced data types, making it suitable for complex use cases such as timestamps and high-precision decimal values.
| Data Type | Description | Size | Usage | 
|---|---|---|---|
| Double | 64-bit IEEE 754 floating-point value | 8 bytes | Used for storing floating-point numbers. | 
| String | UTF-8 encoded string | Variable (length-prefixed) | Used to store textual data. | 
| Object | Embedded document (similar to a JSON object) | Variable (length-prefixed) | Stores nested documents. | 
| Array | List of values (can be other BSON types) | Variable (length-prefixed) | Stores ordered collections of values. | 
| Binary Data | Arbitrary binary data (used for storing files, images, etc.) | Variable (length-prefixed) | Used to store binary objects (e.g., images). | 
| Undefined | Used in earlier versions of BSON, now deprecated | 1 byte | Deprecated in modern BSON. | 
| ObjectId | 12-byte identifier that uniquely identifies a document in MongoDB | 12 bytes | Used as a unique identifier for documents. | 
| Boolean | Boolean value (true or false) | 1 byte | Used for logical values. | 
| Date | 64-bit integer representing a Unix timestamp in milliseconds | 8 bytes | Used for storing date/time values. | 
| Null | Null value | 1 byte | Used to represent a missing or empty value. | 
| Regular Expression | Regular expression pattern | Variable (length-prefixed) | Used for storing regular expressions. | 
| DBPointer | Pointer to a document in another collection (deprecated in favor of DBRefs) | Variable (length-prefixed) | Deprecated. Previously used for cross-collection references. | 
| JavaScript | JavaScript code (with scope) | Variable (length-prefixed) | Stores JavaScript code. | 
| Symbol | Deprecated data type for storing symbols | Variable (length-prefixed) | Deprecated, previously used for symbols. | 
| Decimal128 | 128-bit decimal representation for high precision (used in financial data) | 16 bytes | Used for storing high-precision decimal values. | 
| MinKey | Special value used for comparison; less than all other values | 1 byte | Used in queries to represent the lowest possible value. | 
| MaxKey | Special value used for comparison; greater than all other values | 1 byte | Used in queries to represent the highest possible value. | 
Advantages of BSON
BSON offers several benefits over JSON, particularly in terms of storage, performance, and flexibility:
- Lightweight and Efficient: BSON enables efficient parsing and traversal, improving performance while supporting additional data types.
- Supports Rich Data Types: BSON supports complex data types like dates, binary data, and high-precision decimals, making it suitable for modern applications such as financial systems and large-scale data processing.
- Fast Data Parsing: BSON’s binary format enables fast parsing, making it ideal for real-time systems and high-performance databases like MongoDB.
- Schema Flexibility: BSON is schema-less and flexible, allowing data structures to evolve without major database migrations, supporting agile development.
Using BSON in MongoDB
BSON is the native data format used by MongoDB database for storing, processing, and exporting data efficiently.
- MongoDB stores documents internally in BSON
- BSON enables efficient data storage, retrieval, and communication
- Encoding and decoding are handled by the MongoDB engine
- BSON is used during MongoDB data export
- bsondump is used to convert BSON data into JSON
bsondump --outFile=output.json input.bson
Converting JSON to BSON and Vice Versa
To convert JSON data to BSON, we can use various tools and online converters. MongoDB provides a command-line tool called mongoexport and mongoimport are primarily used for JSON/CSV data, while bsondump and mongorestore are used for BSON data.
To import a BSON file into MongoDB:
mongorestore -d mydatabase /path/to/file.bson
Use Cases for BSON
BSON is widely used in MongoDB and other applications that require efficient, high-performance storage. Some key use cases include:
- Database Storage: MongoDB uses BSON for efficient document storage and fast querying, supporting complex data types like ObjectId and Date.
- Network Transfer: BSON’s compact binary format reduces data size and improves transmission efficiency.
- Real-Time Applications: High speed and low overhead make BSON suitable for performance-critical systems like gaming, social media, and analytics.
BSON Vs JSON
While BSON and JSON share many similarities, they are distinct in several ways:
| JSON | BSON | 
|---|---|
| Text-based and human-readable | Binary-based and machine-optimized | 
| Limited support for data types | Supports rich data types like ObjectId, Date, and Binary | 
| Slower parsing and traversal | Faster parsing and data access | 
| Less efficient for database storage | Efficient storage and querying in databases like MongoDB | 
| Larger size for network transfer | Compact format, efficient network transfer | 
| Better for simple data exchange | Ideal for high-performance and real-time applications |

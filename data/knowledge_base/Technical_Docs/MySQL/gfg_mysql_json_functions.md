# MySQL JSON Functions

> Source: https://www.geeksforgeeks.org/mysql/mysql-json-functions/

MySQL provides JSON functions to create, read, modify and work with data stored in JSON format.
- Extract values from JSON documents.
- Modify, Search and check JSON values.
- Convert JSON data into relational results.
Functions
| Function | Description | 
|---|---|
| JSON_OBJECT() | Creates a JSON object. | 
| JSON_ARRAY() | Creates a JSON array. | 
| JSON_EXTRACT() | Extracts data from a JSON document. | 
| JSON_SET() | Adds or updates a value in a JSON document. | 
| JSON_REMOVE() | Removes a value from a JSON document. | 
| JSON_CONTAINS() | Checks whether a JSON document contains a value. | 
| JSON_VALID() | Checks whether a value is valid JSON. | 
JSON_OBJECT()
The JSON_OBJECT() function creates a JSON object using key-value pairs.
Syntax:
JSON_OBJECT(key, value, key, value, ...);
Example:
SELECT JSON_OBJECT('name', 'John', 'age', 25) AS result;
Output:
JSON_ARRAY()
The JSON_ARRAY() function creates a JSON array from the given values.
Syntax:
JSON_ARRAY(value1, value2, ...);
Example:
SELECT JSON_ARRAY('Apple', 'Banana', 'Mango') AS result;
Output:
JSON_EXTRACT()
The JSON_EXTRACT() function extracts a value from a JSON document using a JSON path.
Syntax:
JSON_EXTRACT(json_document, path);
Example:
SELECT JSON_EXTRACT('{"name": "John", "age": 25}', '$.name') AS result;
Output:
JSON_SET()
The JSON_SET() function adds or updates a value in a JSON document.
Syntax:
JSON_SET(json_document, path, value);
Example:
SELECT JSON_SET('{"name": "John"}', '$.age', 25) AS result;
Output:
JSON_REMOVE()
The JSON_REMOVE() function removes a value from a JSON document.
Syntax:
JSON_REMOVE(json_document, path);
Example:
SELECT JSON_REMOVE('{"name": "John", "age": 25}', '$.age') AS result;
Output:
JSON_CONTAINS()
The JSON_CONTAINS() function checks whether a JSON document contains a specified value.
Syntax:
JSON_CONTAINS(json_document, value);
Example:
SELECT JSON_CONTAINS('["Apple", "Banana", "Mango"]', '"Banana"') AS result;
Output:
JSON_VALID()
The JSON_VALID() function checks whether a value is valid JSON.
Syntax:
JSON_VALID(json_document);
Example:
SELECT JSON_VALID('{"name": "John"}') AS result;
Output:

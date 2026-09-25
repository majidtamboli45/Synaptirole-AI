# JavaScript JSON Parser

> Source: https://www.geeksforgeeks.org/javascript/javascript-json-parser/

JSON (JavaScript Object Notation) is a lightweight format used to exchange data between a server and a client. A JSON parser converts JSON data into a structured format that can be easily accessed and manipulated in programs.
- Converts JSON strings into JavaScript objects or arrays.
- Enables easy data access and manipulation.
- Commonly used in APIs and web applications.
JSON Parser
A JSON parser is a tool or built-in function that converts a JSON string into a usable data structure like a JavaScript object or array.
- Converts JSON string to JavaScript object
- Makes data easy to access and manipulate
- Available in most programming languages
JSON Structures
JSON data is mainly represented in two forms:
- Objects - Collection of key-value pairs
- Arrays - Ordered list of values
Types of JSON Mapping
1. Mapping JSON Types to JavaScript Objects
- JSON data is converted into JavaScript objects
- Keys become object properties
- Values remain unchanged
2. Mapping JavaScript Objects to JSON
- JavaScript objects are converted into JSON format
- Object properties - JSON keys
- Object values - JSON values
The conversion is reversible, meaning Some data types (e.g., functions, undefined) are not preserved in JSON.
Importance of JSON Parsing
- Helps convert JSON data into usable objects.
- Essential for working with APIs and web services.
- Allows accessing specific values from structured data.
- Widely used in web development and backend systems.
JSON Parsing Methods
1. Using JSON.parse() Method
This is the most common method used to parse JSON data.
Syntax
JSON.parse(jsonString);
const jsonString = '{"name": "Geek", "age": 22, "city": "Delhi"}';
const obj = JSON.parse(jsonString);
console.log(obj.name); // Geek
console.log(obj.age);  // 22
console.log(obj.city); // Delhi
2. Reading JSON from Local File (Node.js)
You can load JSON files directly using require().
data.json
{
"data": [
{
"name": "GFG",
"description": "A Computer Science portal!"
}
]
}
const sample = require('./data.json');
console.log(sample.data[0]);
Output:
{ name: 'GFG', description: 'A Computer Science portal!' }
There are more methods to read JSON files that you can find here https://www.geeksforgeeks.org/javascript/read-json-file-using-javascript/

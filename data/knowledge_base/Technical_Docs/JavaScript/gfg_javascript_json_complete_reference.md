# JavaScript JSON Complete Reference

> Source: https://www.geeksforgeeks.org/javascript/javascript-json-complete-reference/

JavaScript JSON (JavaScript Object Notation) is a lightweight format for storing and exchanging data. It is easy to read, write, and parse. JSON is based on key-value pairs and arrays.
let data = '{"name":"Raj","age":25}';
let obj = JSON.parse(data); // Convert JSON string to object
console.log(obj.name); 
The complete list of JavaScript JSON methods are listed below:
JavaScript JSON Methods
| Method | Description | 
|---|---|
| parse() | JSON format and return a JavaScript object. | 
| stringify() | It creates a JSON string out of it. | 
JSON Properties in JavaScript
| Methods | Description | 
|---|---|
| object.keys() | Returns an array of keys from a JSON object. | 
| object.values() | Returns an array of values from a JSON object. | 
| object.entries() | Returns an array of key-value pairs from a JSON object. | 
JSON Operations
| Operation | Description | 
|---|---|
| Parsing JSON | Convert JSON string to JavaScript object. | 
| Stringifying JSON | Convert JavaScript object/array into JSON string. | 
| JSON Validation | Check if a string is a valid JSON using try-catch block. | 
| Converting to JSON | Convert JavaScript objects, arrays, or values to JSON strings. | 
| Error Handling | Handle errors gracefully when working with JSON (e.g., invalid format). | 
| Formatting JSON | Format JSON output for better readability. |

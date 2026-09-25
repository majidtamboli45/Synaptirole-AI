# JSON Vs JavaScript Object

> Source: https://www.geeksforgeeks.org/javascript/json-vs-javascript-object/

JSON and JavaScript Objects are both used to represent data in JavaScript, but they are designed for different use cases. JSON focuses on data exchange, while JavaScript Objects are meant for working with data inside programs.
- JSON is a text-based format used for storing and transmitting data, whereas JavaScript objects exist in memory and are used for program logic.
- JSON has strict syntax rules (no functions, comments, or trailing commas), while JavaScript Objects are more flexible.
- JavaScript Objects can include methods and complex logic, but JSON is limited to pure data only.
JSON
JSON (JavaScript Object Notation) is a text-based data format designed for data exchange. It is language-independent and follows a strict syntax for storing and transmitting data.
{
    "name": "Amit",
    "age": 25,
    "city": "Mumbai"
}
- JSON keys and string values must be enclosed in double quotes.
- It supports only limited data types such as strings, numbers, booleans, arrays, objects, and null.
- Used for transferring data between servers and applications.
JavaScript Object
A JavaScript Object is a data structure within JavaScript, used to store key-value pairs. It supports a wider range of data types and operations compared to JSON.
const user = {
    name: "Amit",
    age: 25,
    city: "Mumbai",
    greet: function () {
        console.log(`Hello, ${this.name}!`);
    },
};
- Keys are unquoted (but quotes can be used if needed), and strings can use single or double quotes.
- JavaScript Objects can include methods (functions as values).
- These are manipulated directly in JavaScript programs.
Difference Between JSON and JavaScript Object
| Aspect | JSON | JavaScript Object | 
|---|---|---|
| Definition | Text-based format for data exchange. | In-memory data structure in JavaScript. | 
| Syntax | Strict syntax: keys and strings must use double quotes. | Flexible syntax: keys can be unquoted; methods allowed. | 
| Data Types | Supports limited types: string, number, boolean, null, array, object. | Supports all JavaScript data types, including undefined. | 
| Functionality | No methods or executable code. | Can include methods and execute logic. | 
| Purpose | Used for transferring data between systems. | Used for in-program data manipulation. | 
| Conversion | Requires parsing to convert to JavaScript Object. | Can be directly used in JavaScript programs. | 
Other Important Comparisons
1. Conversion Between JSON and JavaScript Object
JSON to JavaScript Object
Use JSON.parse() to convert JSON strings into JavaScript Objects.
const jsonS = '{"name": "Neha", "age": 30}';
const obj = JSON.parse(jsonS);
console.log(obj.name);
JavaScript Object to JSON
Use JSON.stringify() to convert JavaScript Objects into JSON strings.
const user = { name: "Rahul", age: 28 };
const jsonS = JSON.stringify(user);
console.log(jsonS);
2. Usage in APIs
JSON
JSON is used for transferring data in APIs.
fetch("https://api.example.com/data")
    .then((response) => response.json())
    .then((data) => console.log(data));
JavaScript Object
JavaScript Objects are used for manipulating and processing data in memory.
const data = { name: "Ravi", age: 40 };
data.city = "Delhi";
console.log(data);

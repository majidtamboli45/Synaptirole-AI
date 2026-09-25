# Parse JSON Data in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/how-to-parse-json-data-in-javascript/

Parsing JSON in JavaScript means converting a JSON string into a usable JavaScript object so that its data can be accessed and manipulated easily.
- Use JSON.parse() to convert a JSON string into a JavaScript object.
- After parsing, you can access values using dot or bracket notation.
- Always ensure the JSON string is valid, otherwise it will throw an error.
1. Parse Simple JSON Strings
//Driver Code Starts
const jsonS = '{"name": "Rahul", "age": 25, "city": "Mumbai"}';
//Driver Code Ends
const obj = JSON.parse(jsonS);
//Driver Code Starts
console.log(obj.name);
//Driver Code Ends
- The string is in JSON format.
- JSON.parse() converts it into a JavaScript object.
- You can access the object properties using dot notation or brackets.
2. Parse JSON Array Strings
//Driver Code Starts
const jsonA = '[{"name": "Anjali"}, {"name": "Vikas"}]';
//Driver Code Ends
const a = JSON.parse(jsonA);
a.forEach(person =>
	console.log(person.name)); 
- The JSON string represents an array of objects.
- After parsing, you can iterate through the array and access each object.
3. Parse Nested JSON
//Driver Code Starts
const nested = '{"person": {"name": "Ravi", "address": {"city": "Delhi", "pin": 110001}}}';
//Driver Code Ends
const obj = JSON.parse(nested);
console.log(obj.person.address.city);
- JSON.parse() handles nested objects seamlessly.
- You can access nested properties using chained dot notation.
4. Parse JSON with Validation
//Driver Code Starts
const jsonS = '{"name": "Pooja", "age": 28}';
//Driver Code Ends
try {
    const obj = JSON.parse(jsonS);
    console.log(obj);
} catch (e) {
    console.error("Invalid JSON:", e.message);
}
- Wrapping JSON.parse() in a try...catch block handles invalid JSON inputs.
- This is especially useful when dealing with external or unverified data.
5. Parse JSON with a Reviver Function
//Driver Code Starts
const jsonS = '{"name": "Amit", "age": "30"}';
//Driver Code Ends
const obj = JSON.parse(jsonS, (key, value) => {
    if (key === "age") return parseInt(value);
    return value;
});
//Driver Code Starts
console.log(obj.age);
//Driver Code Ends
- A reviver function lets you transform values during parsing.
- Here, the age is converted from a string to a number.

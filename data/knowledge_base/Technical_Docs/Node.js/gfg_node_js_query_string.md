# Node.js Query String

> Source: https://www.geeksforgeeks.org/node-js/node-js-query-string/

In Node.js, a query string is the part of a URL used to send small key-value data to the server, mainly with GET requests for filtering and fetching information without using a request body.
- Appears after "?" in the URL as key=value pairs, separated by &.
- Parsed and formatted using querystring or modern URLSearchParams.
- Commonly used for searching, filtering, sorting, and pagination.
Example URL:
http://localhost:8080?id=1&name=Nicol
- id=1 and name=Nicol are query parameters.
- Multiple parameters are separated using &.
Working with Query String
Node.js provides two main ways to work with query strings:
1. querystring Module
The querystring module provides utilities to parse and stringify query strings.
Importing Module: You can include the module using the following code:
const querystring = require('querystring');
Note: The querystring module is built-in in Node.js and does not require installation.
Example 1: Parsing a Query String (parse())
// Filename - index.js
// Importing the models
import url from 'url'
import querystring from 'querystring'
const exampleUrl = 'http://www.company.com:81/a/b/c.html?user=GEEKSFORGEEKS&year=2021#p2';
let parsed_Url = url.parse(exampleUrl);
let parsed_queryString = querystring.parse(parsed_Url.query);
console.log("This is parsed Query String : ",parsed_queryString);
Output:
This is parsed Query String : { user: 'GEEKSFORGEEKS', year: '2021' }
- Converts query string into a JavaScript object.
- Values are returned as strings.
const http = require("http");
const qs = require("querystring");
const users = [
  { id: 1, name: "Nicol" },
  { id: 2, name: "James" },
  { id: 3, name: "Marry" }
];
const server = http.createServer((req, res) => {
  if (req.method === "GET" && req.url.includes("?")) {
    const query = req.url.split("?")[1];
    const data = qs.parse(query);
    const id = Number(data.id);
    const user = users.find(u => u.id === id);
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({ user }));
  }
});
server.listen(3000, () => {
  console.log("Server running on port 3000");
});
If the server is running and you open the following URL in the browser:
http://localhost:3000?id=2
Output:
{
"user": {
"id": 2,
"name": "James"
}
}
- Extracts the query string from the URL and parses it using querystring.parse()
- Uses the id query parameter to find the matching user from the array.
- Returns the filtered user data as a JSON response.
Example 2: Converting Object to Query String (stringify())
import querystring from "querystring";
const query = querystring.stringify({
  name: "Testing",
  company: "GeeksforGeeks",
  content: "Article",
  date: "9thMarch2021"
});
console.log(query);
Output:
name=Testing&company=GeeksforGeeks&content=Article&date=9thMarch2021
- Useful for dynamically building URLs.
- Automatically formats key=value pairs.
2. URL and URLSearchParams
URL and URLSearchParams are modern, built-in APIs in Node.js used to easily parse, read, and manage query parameters from URLs with clean and standardized syntax.
Example:
const url = new URL(req.url, "http://localhost:8080");
const params = new URLSearchParams(url.search);
console.log(params.get("id"));
console.log(params.get("name"));
Assumed Request URL:
http://localhost:8080?id=1&name=Nicol
Output:
1
Nicol
- URL() parses the full request URL.
- url.search extracts the query string (?id=1&name=Nicol).
- URLSearchParams reads individual parameters using get().
Query Parameters in GET Requests
Query parameters allow a GET request to retrieve specific data from the server using values passed in the URL, without sending a request body.
- GET Requests: Retrieve data using parameters in the URL; no request body is sent.
- URL Search Params: Key-value pairs added after ? (e.g., ?id=1&name=Nicol).
- Node.js Usage: URLSearchParams is used to extract query parameters from the URL.
Benefits of Query Strings
Query strings provide a simple and efficient way to send small amounts of data to the server through the URL without using a request body.
- Easy to pass data in GET requests and useful for filtering, searching, and sorting data
- Improves URL readability and shareability
- Enables better caching and SEO-friendly URLs
- No need to modify server-side data or request body

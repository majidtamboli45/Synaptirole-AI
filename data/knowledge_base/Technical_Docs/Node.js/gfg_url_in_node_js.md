# URL in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-url-complete-reference/

The url module in Node.js provides utilities to parse and manipulate URLs. The URL class is globally available and allows access to URL properties using getters and setters.
- Provides the WHATWG URL class for URL parsing and manipulation.
- The URL class is globally available in Node.js.
- Supports getters and setters to access and modify URL components like protocol, host, and query parameters.
// Create URLSearchParams object
const searchpar = new URLSearchParams("keya=vala&keyb=valb");
// Loop through key-value pairs
for (const [key, value] of searchpar.entries()) {
    console.log(key + ', ' + value); // Print key and value
}
Output
keya, vala
keyb, valb
Node.js URL Module APIs
Node.js URL Module APIs provide methods and properties to parse, construct, and manipulate URLs in Node.js applications.
URL Methods
- URL(): method provides utilities for URL resolution and parsing.
- url.toString(): method returns the URL as a string representation.
- url.toJSON(): method returns the serialized URL of the URL object.
- pathToFileURL(): method converts a file path into a file URL.
- fileURLToPath(): method converts a file URL into a path string.
- parse(): method parses a URL string and returns a URL object.
- resolve(): method resolves a target URL relative to a base URL.
- format(): method formats a URL object into a URL string.
- domainToASCII(): method converts a Unicode domain name to ASCII.
- domainToUnicode(): method converts an ASCII domain name to Unicode.
URL Class APIs
- hash: API gets or sets the fragment portion of the URL.
- host: API gets or sets the host portion of the URL.
- origin: API returns the origin of the URL.
- username: API gets or sets the username of the URL.
- search: API gets or sets the query string of the URL.
- port: API gets or sets the port number of the URL.
- pathname: API gets or sets the pathname portion of the URL.
- password: API gets or sets the password of the URL.
- href: API returns the complete URL string.
- hostname: API gets or sets the hostname portion of the URL.
- protocol: API gets or sets the protocol scheme of the URL.
Class: URLSearchParams
- Append(): This method adds a key–value pair to the query string.
- Delete(): This method removes the specified parameter and its values.
- Entries(): This method returns an iterator for all key–value pairs.
- forEach(): This method iterates through all parameters using a callback function.
- get(): This method returns the first value of the specified parameter.
- getAll(): This method returns all values of a parameter as an array.
- set(): This method sets or updates the value of a parameter.
- has(): This method checks whether a parameter exists.
- keys(): This method returns an iterator of parameter names.
- values(): The values() method returns an iterator of parameter values.
- sort(): This method sorts parameters using a stable sorting algorithm.
- toString(): This method returns the query string representation.

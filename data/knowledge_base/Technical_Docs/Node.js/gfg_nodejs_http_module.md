# NodeJS HTTP Module

> Source: https://www.geeksforgeeks.org/node-js/node-js-http-module/

The Node.js HTTP module is a core built-in module used to create and manage HTTP servers and handle client–server communication.
- Included using the require() method.
- Supports standard HTTP methods like GET, POST, PUT, and DELETE.
- Simplifies handling of requests, headers, query parameters, and responses.
Syntax:
const http = require('http');
Features
Here are some features of the Node.js HTTP module:
- Server Creation: Enables creation of HTTP servers.
- Request Handling: Listens for and processes incoming HTTP requests.
- Response Handling: Sends responses to clients, supporting dynamic content delivery.
- HTTP Method Support: Supports methods such as GET, POST, PUT, DELETE, and others.
Creating Servers using HTTP
Create a server using http.createServer() that listens for requests.
import http from 'http';
http.createServer((request, response) => {
    response.write('Hello World!');
    response.end();
}).listen(3000);
console.log('Server started on port 3000');
Output:
- http.createServer() is used to create a new HTTP server.
- The (request) object represents the incoming request from the client.
- The (response) object is used to send the HTTP response to the client.
- response.write() sends data as part of the response.
- response.end() signals that the response is complete.
- server.listen() makes the server listen on the specified port (3000 in this case).
Adding an HTTP Header
Adding HTTP headers like Content-Type tells the client what type of data is being sent, ensuring proper rendering of the response.
- text/html tells the browser to render the response as HTML.
- application/json tells the client to parse the response as JSON.
import http from 'http';
import url from 'url';
http.createServer((req, res) => {
    const q = url.parse(req.url, true).query;
    let contentType = 'text/html';
    if (q.json === 'true') {
        contentType = 'application/json';
    }
    res.writeHead(200, { 'Content-Type': contentType });
    if (contentType === 'text/html') {
        res.write('<html><body><h1>Hello, World!</h1></body></html>');
    } else {
        res.write(JSON.stringify({ message: 'Hello, World!' }));
    }
    res.end();
}).listen(3000, () => {
    console.log('Server running at http://localhost:3000/');
});
Output:
- When you visit http://localhost:3000/, the server will respond with an HTML page.
- The HTTP header will be set as Content-Type: text/html.
- The browser knows to render the response as an HTML document.
- If you visit http://localhost:3000/?json=true, the server will respond with a JSON object.
- The HTTP header will be set as Content-Type: application/json.
- The browser or client knows to treat the response as a JSON object and can handle it accordingly (e.g., parsing it in JavaScript).Reading the Query String
Reading the Query String
The http.createServer() function provides access to the request object, which contains details about the incoming HTTP request.
- req represents the incoming client request.
- req.url stores the URL path after the domain name.
- Used to route and handle different requests.
var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write(req.url);
    res.end();
}).listen(8080, () => {
    console.log('Server running at http://localhost:8080/');
});
Output:
- http://localhost:8080/name will display /name
- http://localhost:8080/summer will display /summer
- The server listens for HTTP requests.
- req.url returns the full URL requested by the client, including the path and query string (if any).
- The server sends the path (including any query string) as part of the response.
Splitting the Query String
The built-in url module in Node.js helps parse and split query strings into structured, readable components.
- Extracts query parameters from URLs.
- Converts query strings into key–value pairs.
- Simplifies request data handling.
import http from 'http';
import url from 'url';
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    var q = url.parse(req.url, true).query; // Parse the query string
    var txt = q.year + " " + q.month; // Get year and month from query string
    res.end(txt); // Display the result
}).listen(8080, () => {
    console.log('Server running at http://localhost:8080/');
});
Output:
- The server listens for HTTP requests and parses the query string of the URL.
- The url.parse(req.url, true).query parses the URL and extracts the query parameters as an object.
- The q.year and q.month are then concatenated into a string txt.
- The server sends the txt string (2025 March) as the response, if you access the URL:
http://localhost:8080/?year=2025&month=March
- If no query parameters are provided, the output will be undefined undefined.

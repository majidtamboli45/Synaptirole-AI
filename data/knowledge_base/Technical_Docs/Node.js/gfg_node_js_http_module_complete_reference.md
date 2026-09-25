# Node.js HTTP Module Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-http-module-complete-reference/

To make HTTP requests in Node.js, there is a built-in module HTTP in Node.js to transfer data over the HTTP. To use the HTTP server in the node, we need to require the HTTP module. The HTTP module creates an HTTP server that listens to server ports and gives a response back to the client.
Example:
// Node.js program to demonstrate the
// agent.maxSockets method
// Importing http module
const http = require('http');
// Importing agentkeepalive module
const Agent = require('agentkeepalive');
// Creating new agent
const keepAliveAgent = new Agent({});
console.log(keepAliveAgent.maxSockets);
// Options object
const options = {
host: 'geeksforgeeks.org',
port: 80,
path: '/',
method: 'GET',
agent: keepAliveAgent,
};
// Requesting via http server module
const req = http.request(options, (res) => {
// Printing statuscode
console.log("StatusCode: ", res.statusCode);
});
req.end();
Output:
Infinity
StatusCode:  301
The Complete List of HTTP modules are listed below:
Class: http.Agent
| Class: http.Agent Method | Description | 
|---|---|
| new Agent() | The new Agent({}) (Added in v0.3.4) method is an inbuilt application programming interface | 
| createConnection() | This is used to produce a socket or stream which is further used for HTTP requests and by default, | 
| maxSockets() | This determines how many concurrent sockets the agent can have open per origin. | 
| maxFreeSockets() | The ‘Http‘ module sets the maximum number of sockets that will be left open in the free state. | 
Class: http.ClientRequest
| Class: http.Server Properties | Description | 
|---|---|
| connection | Get the reference of the underlying client request socket. | 
| aborted | Check if the client's request has been aborted or not. | 
| path | Get the request path for the particular client request. | 
| reusedSocket | Check if the request is sent through a reused socket. | 
| socket | Get a Proxy object that acts as a net.Socket. | 
| Class: http.Server Methods | Description | 
|---|---|
| abort() | It aborts the client's request. | 
| protocol() | Get the object of the client request protocol. | 
| setNoDelay() | Set the socket such as delaying excessive requests while requests are being limited is not desired. | 
| removeHeader() | Remove a header that’s already defined in the headers object. | 
| setHeader() | Set the object of the header. | 
| setTimeout() | Get the request time out for the client request. | 
Class: http.Server
| Class: http.Serverv Properties | Description | 
|---|---|
| timeout | Get the default Timeout value in milliseconds. | 
| maxHeadersCount | Get the maximum incoming headers to count. | 
| listening | Check if the server is listening for connection or not. | 
| keepAliveTimeout | Get the number of milliseconds of inactivity a server needs to wait for additional incoming data. | 
| Class: http.Server Methods | Description | 
|---|---|
| setTimeout() | Set the time-out value for the socket. | 
| close() | Stop the server from accepting new connections. | 
| headersTimeout() | Get the time the parser will wait to receive the complete HTTP headers. | 
| listen() | Start the server from accepting new connections. | 
Class: http.ServerResponse
| Class: http.ServerResponse Properties | Description | 
|---|---|
| writableFinished | Check if all the data has been flushed or not. | 
| writableEnded | Check if response.end() has been called or not. | 
| statusCode | This property controls the status code that will be sent to the client when the headers get flushed. | 
| headersSent | Check if the header has been sent or not. | 
| statusMessage | Control the status message that will be sent to the client when the headers get flushed. | 
| Class: http.ServerResponse Methods | Description | 
|---|---|
| setTimeout() | Set the Socket’s timeout value to msecs (Milliseconds). | 
| writeProcessing() | Send an HTTP/1.1 102 Processing message to the client. | 
| sendDate() | Check if the date header has been sent or not. | 
| end() | Send the signal to the server that all the header has been sent. | 
| connection() | Get the response socket of this HTTP connection. | 
Class: http.IncomingMessage
| Class: http.IncomingMessage Methods | Description | 
|---|---|
| URL() | Get the request URL string which is also used for validating the particular URL. | 
| trailers() | Get the request/response trailers to object. | 
| statusMessage() | Get the HTTP response status message. | 
| method() | Get the type of request method as a string. | 
| rawHeaders() | Get the raw request/response headers to list exactly as they were received. | 
| statusCode() | Get the 3-digit HTTP response status code. | 
| rawTrailers() | Get the raw request/response trailer keys and values exactly as they were received. | 
| aborted() | Check if the request has been aborted or not. | 
| headers() | Get all the request/response headers to the object. | 
| httpVersion() | Get the HTTP version sent by the client. The most commonly used version is HTTP/1.1. | 
| complete() | Check if a complete HTTP message has been received and successfully parsed or not. |

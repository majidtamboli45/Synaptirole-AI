# HTTP2 Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-http2-complete-reference/

The HTTP2 module in Node.js provides support for the HTTP/2 protocol, enabling faster and more efficient communication between clients and servers.
- The HTTP2 module is a built-in module used to implement the HTTP/2 protocol in Node.js.
- It improves performance through features like multiplexing, header compression, and server push.
- It allows developers to create HTTP/2 servers and manage client–server communication efficiently.
// Node.js program to demonstrate the close event in HTTP2
const http2 = require('http2');
// Creating HTTP/2 server
const server = http2.createServer();
server.on('stream', (stream, headers) => {
    // Send response headers
    stream.respond({
        ':status': 200,
        'content-type': 'text/plain'
    });
    stream.write('Hello ');
    // Get Http2Session from stream
    const session = stream.session;
    // Get ALPN protocol used
    const protocol = session.alpnProtocol;
    stream.end("Session protocol: " + protocol);
    // Listen for session close event
    session.on('close', () => {
        console.log("Session is closed");
    });
    // Close the session
    session.close();
});
// Start server
server.listen(8000, () => {
    console.log("Server running at http://localhost:8000");
});
// Creating HTTP/2 client
const client = http2.connect('http://localhost:8000');
const req = client.request({
    ':method': 'GET',
    ':path': '/'
});
// Handle response headers
req.on('response', (headers) => {
    console.log("Status:", headers[':status']);
});
// Handle response data
req.on('data', (chunk) => {
    console.log("Received:", chunk.toString());
});
// Close client after response
req.on('end', () => {
    client.close(() => {
        console.log("Client destroyed");
    });
});
req.end();
Output:
Server running at http://localhost:8000
Status: 200
Received: Hello Session protocol: h2c
Client destroyed
Session is closed
Classes in the Node.js HTTP2 Module
1. Class: Http2Session
Represents an HTTP/2 session that manages communication between peers.
Events
- timeout: This event in Http2Session occurs when there is no activity for a specified time.
- close: This event in Http2Session is emitted when the session is destroyed.
Methods
- state(): This method of Http2Session returns the current session state.
- socket(): This method of Http2Session returns the associated socket.
- remoteSettings(): This method of Http2Session returns remote session settings.
- destroyed(): This method of Http2Session checks if the session is destroyed.
- type(): This method of Http2Session returns the session type.
- encrypted(): This method of Http2Session checks if the session uses TLS.
- localSettings(): This method of Http2Session returns local settings.
- pendingSettingsAck(): This method of Http2Session checks for SETTINGS acknowledgment.
- close(): This method of Http2Session closes the session.
- closed(): This method of Http2Session checks if the session is closed.
- alpnProtocol(): This method of Http2Session returns the ALPN protocol used.
- unref(): This method of Http2Session returns the associated socket instance.
- destroy(): This method of Http2Session destroys the session.
- connecting(): This method of Http2Session checks if the session is connecting.
- ping(): This method of Http2Session sends a PING frame.
- setTimeout(): This method of Http2Session sets a session timeout.
2. Class: ClientHttp2Session
ClientHttp2Session represents an HTTP/2 client session.
Methods
- request(): The method of ClientHttp2Session returns a ClientHttp2Stream object.
3. Class: Http2Stream
Http2Stream represents an HTTP/2 stream for request–response communication.
Events
- timeout: The event in Http2Stream occurs when the stream is inactive.
- close: The event in Http2Stream is emitted when the stream is destroyed.
Methods
- state(): This method of Http2Stream returns the stream state.
- priority(): This method of Http2Stream updates the stream priority.
- setTimeout(): This method of Http2Stream sets a stream timeout.
- id(): This method of Http2Stream returns the stream identifier.
- closed(): This method of Http2Stream checks if the stream is closed.
- endAfterHeaders(): This method of Http2Stream checks if the END_STREAM flag is set.
- pending(): This method of Http2Stream checks if the stream identifier is assigned.
- destroyed(): This method of Http2Stream checks if the stream is destroyed.
- session(): This method of Http2Stream returns the associated Http2Session.
- close(): This method of Http2Stream closes the stream.
- rstCode(): This method of Http2Stream returns the RST_STREAM error code.
- sentHeaders(): This method of Http2Stream returns sent headers.
- sentInfoHeaders(): This method of Http2Stream returns informational headers.
4. Class: ServerHttp2Stream
ServerHttp2Stream represents an HTTP/2 stream on the server side.
Methods
- additionalHeaders(): The additionalHeaders() method of ServerHttp2Stream sends extra headers.
- headersSent(): The headersSent() method of ServerHttp2Stream checks if headers are sent.
- pushAllowed(): The pushAllowed() method of ServerHttp2Stream checks if server push is allowed.
- respond(): The respond() method of ServerHttp2Stream sends response headers.
5. Class: http2.Http2ServerRequest
Http2ServerRequest represents the incoming HTTP/2 request.
Properties
- aborted: The property of Http2ServerRequest indicates if the request is aborted.
Events
- close: The event in Http2ServerRequest occurs when the underlying stream closes.
Methods
- url(): The method of Http2ServerRequest returns the request URL.
- httpVersion(): The method of Http2ServerRequest returns the HTTP version.
- headers(): The method of Http2ServerRequest returns request headers.
- rawHeaders(): The method of Http2ServerRequest returns raw headers.
- destroy(): The method of Http2ServerRequest destroys the request.
- authority(): This method of Http2ServerRequest returns the request authority.
- complete(): This method of Http2ServerRequest checks request completion.
- method(): The method of Http2ServerRequest returns the request method.
- scheme(): The method of Http2ServerRequest returns the request scheme.
- rawTrailers(): The method of Http2ServerRequest returns trailer headers.
- socket(): The method of Http2ServerRequest returns a proxy socket object.
6. Class: http2.Http2ServerResponse
Http2ServerResponse represents the outgoing HTTP/2 response.
Properties
- headersSent: The property of Http2ServerResponse indicates if headers were sent.
Events
- close: The event in Http2ServerResponse occurs when the stream closes.
- finish: The event in Http2ServerResponse occurs when the response is fully sent.
Methods
- setHeader(): The method of Http2ServerResponse sets a response header.
- setTimeout(): The method of Http2ServerResponse sets a response timeout.
- stream(): The method of Http2ServerResponse returns the HTTP stream.
- statusMessage(): The method of Http2ServerResponse returns an empty string in HTTP/2.
- writableEnded(): The method of Http2ServerResponse checks if response.end() was called.
- write(): The method of Http2ServerResponse sends response data.
- writeHead(): The method of Http2ServerResponse sends response headers.
- sendDate(): The method of Http2ServerResponse checks automatic Date header generation.
- socket(): The method of Http2ServerResponse returns a proxy socket.
- statusCode(): The method of Http2ServerResponse returns the response status code.
- getHeaderNames(): The method of Http2ServerResponse returns header names.
- removeHeader(): The method of Http2ServerResponse removes a header.
- hasHeader(): The method of Http2ServerResponse checks if a header exists.
- getHeaders(): The method of Http2ServerResponse returns outgoing headers.
- end(): The method of Http2ServerResponse completes the response.
- finished(): The method of Http2ServerResponse checks response completion.
- getHeader(): The method of Http2ServerResponse returns a queued header.
http2.constants
The http2.constants object provides predefined constants used in HTTP/2 operations.
Properties
- constants: The property of http2.constants provides HTTP/2 error codes.
HTTP2 Module Methods
The Node.js HTTP2 module provides several classes that manage HTTP/2 sessions, streams, requests, and responses for efficient client–server communication.
- getPackedSettings(): The method of http2 module returns serialized HTTP/2 settings.
- connect(): The method of http2 module creates a ClientHttp2Session.
- getUnpackedSettings(): The method of http2 module returns deserialized settings.
- getDefaultSettings(): The method of http2 module returns default session settings.
- createServer(): The method of http2 module creates an HTTP/2 server.
- prompt.get(): The method performs input/output operations.
- aborted(): The method checks if an aborted event is emitted.
- bufferSize(): The method returns the number of buffered characters.

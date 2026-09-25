# TLS/SSL Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/nodejs-tlsssl-module/

The TLS/SSL module enables secure communication by encrypting data between clients and servers using TLS/SSL protocols.
- Used to create secure servers and clients and is commonly applied in HTTPS and other secure network applications.
- Ensures encrypted data transmission over the network to protect sensitive information.
- Supports certificate-based authentication for establishing secure connections.
Importing the Module
To use the TLS/SSL module in your Node.js application, import it as shown below:
const tls = require('tls');
Features of the Node.js TLS/SSL Module
- Secure Communication: Encrypts data transmitted between clients and servers using TLS/SSL protocols.
- Certificate Management: Supports digital certificates and certificate chains for trusted connections.
- Configurable Security: Enables secure server/client connections with customizable protocols and cipher suites.
TLS/SSL Methods
The TLS/SSL module provides several methods for setting up secure connections and managing encryption.
- tls.createServer(): method creates a new TLS server for handling secure encrypted connections.
- tls.connect(): method establishes a secure connection to a TLS server as a client.
- tls.createSecureContext(): creates a secure context with specified security parameters such as certificates & keys.
- tls.checkServerIdentity(): verifies the server’s certificate to ensure the server’s identity during a secure connection.
- tls.TLSSocket(): class creates a secure TLS socket used for encrypted communication between client and server.
Creating a Secure TLS Server
Create a simple TLS server that listens on a specific port and sends a response when a client connects, using self-signed certificates for secure communication.
Step1: Before running the server, you need to create SSL certificates. You can generate them using OpenSSL
openssl req -nodes -new -x509 -keyout key.pem -out cert.pem -days 365
Step2: Create a simple TLS server using the generated certificates:
const tls = require('tls');
const fs = require('fs');
const options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
};
const server = tls.createServer(options, (socket) => {
    socket.write('Welcome to the secure server!\n');
    socket.end();
});
server.listen(8000, () => {
    console.log('TLS server is running on port 8000');
});
Output:
TLS server is running on port 8000
Also Check

# UDP/DataGram (dgram) Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/nodejs-udpdatagram-module/

The UDP/Datagram (dgram) module enables applications to send and receive messages using the UDP protocol for fast network communication.
- Built-in Node.js module used to create UDP servers and clients.
- Uses connectionless communication for fast data transfer.
- Does not guarantee the delivery of packets.
- Does not ensure the ordering of data.
- Has no built-in error correction or retransmission.
- Supports non-blocking asynchronous networking and is commonly used in streaming, gaming, and message broadcasting.
Importing the Module
To use the UDP/Datagram (dgram) module in your Node.js application, you need to import it as follows:
const dgram = require('dgram');
Features
- Connectionless Communication: Sends and receives messages without establishing a connection, enabling fast UDP-based data transfer.
- Broadcast Support: Allows sending messages to multiple clients at the same time over the network.
- Low Latency and Lightweight Design: Delivers minimal delay and uses fewer system resources, making it suitable for real-time and high-performance applications.
UDP Methods
The UDP/Datagram (dgram) module provides several methods for creating and managing UDP communication.
- socket.close(): socket.close() method closes the UDP socket and stops it from receiving further messages.
- socket.on('message'): socket.on('message') event listens for incoming messages sent to the socket.
- dgram.createSocket(): dgram.createSocket() method creates a new UDP socket for sending and receiving messages.
- socket.bind(): socket.bind() method binds the socket to a specific port and IP address to start receiving messages.
- socket.send(): socket.send() method sends a message to a specified port and IP address using the UDP socket.
Example 1: Create a UDP client that sends a message to the server and handles the server’s response.
console.clear();
const dgram = require('dgram');
const client = dgram.createSocket('udp4');
const message = Buffer.from('Hello from client');
client.send(message, 41234, 'localhost', (err) => {
    if (err) {
        console.log('Error:', err);
    } else {
        console.log('Message sent');
    }
});
client.on('message', (msg, rinfo) => {
    console.log(`Client received: ${msg} from ${rinfo.address}:${rinfo.port}`);
    client.close();
});
Output:
Example 2: UDP client that sends a message to a server and a UDP server that listens for messages.
UDP Server Code
This code sets up a UDP server that listens for messages on port 41234.
//udp_server.js
const dgram = require('dgram');
const server = dgram.createSocket('udp4');
server.on('message', (msg, rinfo) => {
    console.log(`Received message: ${msg} from ${rinfo.address}:${rinfo.port}`);
});
server.on('listening', () => {
    const address = server.address();
    console.log(`Server listening on ${address.address}:${address.port}`);
});
server.bind(41234);
UDP Client Code
This code sends a message to the UDP server and then closes the socket.
// udp_client.js
const dgram = require('dgram');
const client = dgram.createSocket('udp4');
const message = Buffer.from('Hello from client');
client.send(message, 41234, 'localhost', (err) => {
    if (err) {
        console.log('Error:', err);
    } else {
        console.log('Message sent to server');
    }
    client.close();
});
Steps to Run
Step1: Open your terminal, navigate to the directory containing udp_server.js, and run.
node udp_server.js
Step2: Open another terminal, navigate to the directory containing udp_client.js, and run:
node udp_client.js
Output:
Also Check: UDP/Datagram (dgram) Module Complete Reference

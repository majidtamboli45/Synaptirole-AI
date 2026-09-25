# Buffer in Node.js

> Source: https://www.geeksforgeeks.org/node-js/what-is-buffer-in-node-js/

Buffer in Node.js is a built-in object used to handle and manipulate raw binary data, especially when working with streams, files, or network operations.
• Represents raw memory allocation for binary data
 • Used in low-level operations like file systems and networking
 • Provides methods for reading and writing binary data
Syntax:
const buf = Buffer.alloc(10); // Allocates a buffer of 10 bytes.
Characteristics of Buffer
Buffer is a fixed-size memory structure in Node.js designed specifically for handling raw binary data efficiently.
• A Buffer represents a fixed memory location used to store binary data.
 • Unlike arrays, Buffers are not resizable and only handle binary data.
 • Arrays can store any data type, but Buffers store only binary values.
 • Each integer in a Buffer represents one byte.
 • console.log() can be used to print the Buffer instance.
Buffer Methods
Buffer methods provide built-in functions to create, manipulate, and manage binary data efficiently in Node.js.
| Method | Description | 
|---|---|
| Buffer.alloc(size) | Creates a new buffer of specified size. | 
| Buffer.from(data) | Creates a buffer from given data. | 
| buffer.write(data) | Writes data to the buffer. | 
| buffer.toString() | Converts buffer data to a string. | 
| Buffer.isBuffer(obj) | Checks if the object is a buffer. | 
| buffer.length | Returns the length of the buffer in bytes. | 
| buffer.copy(targetBuffer) | Copies data from one buffer to another. | 
| buffer.slice(start, end) | Returns a portion of the buffer. | 
| Buffer.concat([buffers]) | Concatenates multiple buffers. | 
Example: Basic Implementation of Node.js Buffers
// Different Method to create Buffer
const buffer1 = Buffer.alloc(100);
const buffer2 = Buffer.from('GFG');
const buffer3 = Buffer.from([1, 2, 3, 4]);
// Writing data to Buffer
buffer1.write("Happy Learning");
// Reading data from Buffer
const a = buffer1.toString('utf8');
console.log(a);
// Check object is buffer or not
console.log(Buffer.isBuffer(buffer1));
// Check length of Buffer
console.log(buffer1.length);
// Copy buffer
const bufferSrc = Buffer.from('ABC');
const bufferDest = Buffer.alloc(3);
bufferSrc.copy(bufferDest);
const data = bufferDest.toString('utf8');
console.log(data);
// Slicing data
const bufferOld = Buffer.from('GeeksForGeeks');
const bufferNew = bufferOld.slice(0, 4);
console.log(bufferNew.toString());
// concatenate two buffer
const bufferOne = Buffer.from('Happy Learning ');
const bufferTwo = Buffer.from('With GFG');
const bufferThree = Buffer.concat([bufferOne, bufferTwo]);
console.log(bufferThree.toString());
Run the index.js file using the following command:
node index.js
Output:
Happy Learning
true
100
ABC
Geek
Happy Learning With GFG
- Efficient for processing large binary data and performance-critical tasks.
- Avoids the overhead of encoding and decoding data into JavaScript strings.

# Node.js Streams

> Source: https://www.geeksforgeeks.org/node-js/node-js-streams/

Node.js Streams are used to handle I/O operations efficiently by processing data in a continuous flow. They help in:
- Reading data from a source continuously.
- Writing data to a destination smoothly.
- Processing data in chunks instead of loading it all at once.
- Improving memory usage and performance during data transfer.
Streams provide an interface for working with real-time data flow, such as HTTP requests and output streams.
Accessing Streams
To use streams in Node.js, import the built-in stream module:
const stream = require('stream');
Note: Streams process data in small chunks instead of loading everything into memory at once, making them memory-efficient for handling large data.
Types of Streams in Node.js:
There are namely four types of streams in Node.js.
- Writable: We can write data to these streams.
- Readable: We can read data from these streams.
- Duplex: Streams that are both, Writable as well as Readable.
- Transform: Streams that can modify or transform the data as it is written and read.
Implementing a Readable Stream:
We will read the data from inStream and echoing it to the standard output using process.stdout.
// Sample JavaScript Code for creating
// a Readable Stream
// Accessing streams
const { Readable } = require('stream');
// Reading the data 
const inStream = new Readable({
    read() { }
});
// Pushing the data to the stream
inStream.push('GeeksForGeeks : ');
inStream.push(
    'A Computer Science portal for Geeks');
// Indicates that no more data is
// left in the stream
inStream.push(null);
// Echoing data to the standard output
inStream.pipe(process.stdout);
Output:
GeeksForGeeks : A Computer Science portal for Geeks Implementing a Writable Stream:
In the outStream, we simply console.log the chunk as a string. We also call the callback function to indicate success without any errors. We will read the data from inStream and echo it to the standard output using process.stdout.
// Sample JavaScript Code for
// Writable Stream
// Accessing Streams
const { Writable } = require('stream');
// Whatever is passed in standard 
// input is out streamed here.
const outStream = new Writable({
    // The Write function takes three 
    // arguments
    // Chunk is for Buffer
    // Encoding is used in case we want
    // to configure the stream differently
    // In this sample code, Encoding is ignored 
    // callback is used to indicate 
    // successful execution
    write(chunk, encoding, callback) {
        console.log(chunk.toString());
        callback();
    }
});
// Echo the data to the standard output
process.stdin.pipe(outStream);
Output:
Hello Geeks
Benefits
- Efficiency: Handles large data sets efficiently by processing data in chunks.
- Memory Usage: Reduces memory consumption as data is processed incrementally rather than loaded all at once.
- Performance: Improves performance by allowing continuous data flow and processing.

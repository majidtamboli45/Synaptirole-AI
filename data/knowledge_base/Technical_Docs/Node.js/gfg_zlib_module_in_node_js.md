# Zlib Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/nodejs-zlib-module/

The zlib module in Node.js is used to compress and decompress data using algorithms like Gzip and Deflate. It helps reduce data size, improving performance and saving bandwidth.
- Supports compression and decompression of data streams and buffers.
- Uses Gzip, Deflate, and Inflate algorithms for efficient data compression.
- Built on the zlib C library, providing reliable and high-performance compression.
Example: Compress a file (demofile.txt) into a gzip file (mygzipfile.txt.gz).
var fs = require('fs');
var zlib = require('zlib');
var x = fs.createReadStream('demofile.txt');
var y = fs.createWriteStream('mygzipfile.txt.gz');
var gzip = zlib.createGzip();
x.pipe(gzip).pipe(y);
Importing Module
To use the zlib module in your Node.js application, simply import it as below:
const zlib = require('zlib');
Zlib Methods
The zlib module provides several methods for compression and decompression.
- zlib.gzip():zlib.gzip() method compresses data using the Gzip compression algorithm.
- zlib.gunzip():zlib.gunzip() method decompresses Gzip-compressed data.
- zlib.deflate(): zlib.deflate() method compresses data using the Deflate algorithm.
- zlib.inflate(): zlib.inflate() method decompresses Deflate-compressed data.
- zlib.deflateRaw(): zlib.deflateRaw() method compresses data using the Deflate algorithm without headers or checksums.
- zlib.inflateRaw(): zlib.inflateRaw() method decompresses data that was compressed using deflateRaw().
- zlib.brotliCompress(): zlib.brotliCompress() method compresses data using the Brotli compression algorithm.
- zlib.brotliDecompress(): zlib.brotliDecompress() method decompresses Brotli-compressed data.
Example 1: Compressing a String
const zlib = require('zlib');
const s_in = 'This is a sample string to compress.';
zlib.gzip(s_in, (err, compressedBuffer) => {
    if (err) {
        console.error('Compression error:', err);
    } else {
        console.log('Compressed Buffer:', compressedBuffer);
        console.log('Compressed Buffer (Hex):', compressedBuffer.toString('hex'));
    }
});
Output:
Example 2: Decompressing a Gzip Buffer
console.clear();
const zlib = require("zlib");
const compressedBuffer = Buffer.from("your_hex_string_here", "hex");
zlib.gunzip(compressedBuffer, (err, buffer) => {
    if (err) {
        console.error("Error decompressing:", err);
    } else {
        console.log("Decompressed String:", buffer.toString());
    }
});
Output:
Benefits of Zlib Module
The zlib module improves data compression efficiency and performance in Node.js applications.
- Reduces Storage Space: Compresses data to minimize disk storage requirements.
- Improves Data Transfer: Decreases data size, resulting in faster network transmission.
- Enhances Performance: Stream-based compression efficiently processes large files with lower memory usage.
- Provides Flexible Compression: Supports multiple compression algorithms and configurable compression levels for different requirements.

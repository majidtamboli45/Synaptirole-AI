# String Decoder in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-string-decoder-complete-reference/

The String Decoder module converts Buffer data into properly encoded strings, ensuring multi-byte characters are not broken when data is processed in chunks.
- Built-in module (string_decoder) used to convert Buffer objects into readable strings.
- Prevents broken multi-byte characters when processing data.
- Commonly used with streams for chunked data and supports encodings like utf8, utf16le, and base64.
// Node.js program to demonstrate the
// stringDecoder.write() Method
// Import the string_decoder module
// and get the StringDecoder class
// using object destructuring
const { StringDecoder } = require("string_decoder");
// Create a new instance of the decoder
const decoder = new StringDecoder("utf-8");
const text_one = Buffer.from("GeeksforGeeks", "utf-8");
let decoded_text = decoder.write(text_one);
console.log("Decoded Text:", decoded_text);
Output
Decoded Text: GeeksforGeeks
Class: StringDecoder Methods
Provides methods to decode Buffer data into strings while handling multi-byte characters correctly.
- stringDecoder.write(buffer): stringDecoder.write(buffer) returns a decoded string from the given Buffer, TypedArray, or DataView.
- stringDecoder.end([buffer]): stringDecoder.end([buffer]) returns any remaining data stored in the internal buffer as a string and ends the decoding process.

# Node.js Buffer Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-buffer-complete-reference/

Buffers are instances of the Buffer class in Node.js. Buffers are designed to handle binary raw data. Buffers allocate raw memory outside the V8 heap. Buffer class is a global class so it can be used without importing the Buffer module in an application.
Example:
<script>
    // Node.js program to demonstrate the
    // Buffer.allocUnsafeSlow() Method
        
    // Creating a buffer
    const buffer = Buffer.allocUnsafe(10);
        
    // Display the buffer containing random values
    console.log("allocUnsafeSlow() Method");
    console.log(buffer);
</script>
Output:
allocUnsafeSlow() Method
<Buffer 01 00 00 00 00 00 00 00 8b ed>
The Complete List of Node.js Buffer module methods are listed below:
| Node.js Buffer | Description | 
|---|---|
| Node.js Buffer.copy() Method | Buffer is a temporary memory storage which stores the data when it is being moved from one place to another. | 
| Node.js Buffer.includes() Method | The Buffer.includes() method checks whether the provided value is present or included in the buffer or not. | 
| Nodejs Buffer.compare() Method | Buffer.compare() method compares the two given buffers. | 
| Node.js Buffer.alloc() Method | The Buffer.alloc() method is used to create a new buffer object of the specified size. | 
| Node.js Buffer.equals() Method | The Buffer.equals() method is used to compare two buffer objects and returns | 
| Node.js Buffer.subarray() Method | The buffer.subarray() method is an inbuilt application programming interface of the buffer module which is used to crop a part of array | 
| Node.js Buffer.readIntBE() Method | The Buffer.readIntBE() method is used to read the number of bytes for a buffer at a given offset and interprets the result as a two’s complement signed value. | 
| Node.js Buffer.write() Method | The Buffer.write() method writes the specified string into a buffer, at the specified position. | 
| Node.js Buffer.readIntLE() Method | The Buffer.readIntLE() method is used to read a number of bytes from a buffer at a given offset and interprets the result as a two’s complement signed value. | 
| Node.js Buffer.readUInt8() Method | The Buffer.readUInt8() method is used to read an unsigned 8-bit integer from a Buffer object. | 
| Node.js Buffer.indexOf() Method | Buffer is a temporary memory storage that stores the data when it is being moved from one place to another. | 
| Node.js Buffer.allocUnsafeSlow() Method | Buffer is a temporary memory storage that stores the data when it is being moved from one place to another. It’s like the array of integers | 
| Node.js Buffer.writeUInt32BE() Method | The Buffer.writeUInt32BE() method is used to write a number to an instance of the Buffer class. | 
| Node.js Buffer.readInt32LE() Method | This is used to read a 32-bit integer from a buffer object at a given offset and returns the result in Little endian. | 
| Node.js Buffer.readFloatLE() Method | This is used to read a 32-bit float number from the Buffer class with a specified endian format. | 
| Node.js Buffer.writeIntLE() Method | Buffer is a temporary memory storage that stores the data when it is being moved from one place to another. | 
| Node.js Buffer.isEncoding() Method | The Buffer.isEncoding() method checks whether the given encoding is supported or not. | 
| Node.js Buffer.swap32() Method | This is an inbuilt application programming interface of class Buffer within the Buffer module which is used to swap the buffer byte order in-place. | 
| Node.js Buffer.readUInt16BE() Method | This is an inbuilt application programming interface of class Buffer within the Buffer module which is used to read a 16-bit value from an allocated buffer at a specified offset. | 
| Node.js Buffer.writeUInt16LE() Method | This is used to write specified bytes in Little Endian format to the buffer object. Here, the value should be a valid unsigned 16-bit integer. | 
| Node.js Buffer.readUInt16LE() Method | This is used to read an unsigned 16-bit integer from the buffer at the specified offset with a specified little-endian format. | 
| Node.js Buffer.writeFloatBE() Method | This is used to write big endian 32 bits floating point value to an allocated buffer at the specified offset | 
| Node.js Buffer.writeUIntLE() Method | This is used to write the specified bytes, using little endian, to a Buffer object. It supports up to 48 bits of accuracy. | 
| Node.js Buffer.writeUInt16BE() Method | The Buffer.writeUInt16BE() method is used to write specified bytes using Big endian format to the buffer object | 
| Node.js Buffer.readUInt32BE() Method | This is used to read a 32-bit value from an allocated buffer at a specified offset. | 
| Node.js Buffer.writeFloatLE() Method | The value to the buffer at the specified offset with the specified little-endian format. | 
| Node.js Buffer.readInt16LE() Method | This is used to read 16-bit values from an allocated buffer at a specified offset in Little Endian format. | 
| Node.js Buffer.toString() Method | The Buffer.toString() method is used to decode buffer data to string according to the specified encoding type. | 
| Node.js Buffer.writeUInt8() Method | This is used to write values to buffer at the specified offset. | 
| Node.js Buffer.values() Method | The Buffer.values() Method is used to create a loop or iterating object which contains the value of each byte of buffer instance. | 
| Node.js Buffer.from() Method | The Buffer.from() method is used to create a new buffer containing the specified string, array or buffer. | 
| Node.js Buffer.writeUIntBE() Method | Buffer.writeUIntBE() method is used to write the specified bytes using big endian format to a Buffer object. | 
| Node.js Buffer.readInt8() Method | The Buffer.readUInt8() method is used to read an unsigned 8-bit integer from a Buffer from a with the specific offset. | 
| Node.js Buffer.concat() Method | The Buffer.concat() method is used to concat all buffer objects in a given array into one buffer object. | 
| Node.js Buffer.fill() Method | The Buffer.fill() Method puts the data into the buffer instance. | 
| Node.js Buffer.readUIntBE() Method | This is used to read specified number of byte(s) value from an allocated buffer at a specified offset. | 
| Node.js Buffer.swap16() Method | This is used to swap the buffer byte order in-place. The swapping is performed by interpreting buffer as an array of 16-bit numbers. | 
| Node.js Buffer.writeDoubleBE() Method | This is used to writes big endian 64-bits double value to an allocated buffer at the specified offset. | 
| Node.js Buffer.writeUInt32LE() Method | This is used to write specified bytes using Little endian format to the buffer object. | 
| Node.js Buffer.isBuffer() Method | The Buffer.isBuffer() method checks whether the provided object is a buffer or not. | 
| Node.js Buffer.keys() Method | The Buffer.keys() method is used to return an iterator object, containing the key of every byte in a buffer object. | 
| Node.js Buffer.writeInt32LE() Method | The Buffer.writeInt32LE() method is used to write specified bytes into the buffer using little-endian format | 
| Node.js Buffer.readUInt32LE() Method | This is used to read 32-bit value from an allocated buffer at a specified offset in little endian format. | 
| Node.js Buffer.writeIntBE() Method | It supports upto 48 bits of accuracy. If the value is other then signed integer then its behavior is undefined. | 
| Node.js Buffer.swap64() Method | The Buffer.swap64() method is an inbuilt application programming interface of class Buffer | 
| Node.js Buffer.writeInt16BE() Method | This is used to write integer value to buffer at the specified offset with the big-endian format. | 
| Node.js Buffer.readInt16BE() Method | Buffer module which reads a 16-bit signed integer from the buffer at the specified offset in the big endian format. | 
| Node.js Buffer.entries() Method | The Buffer.entries() method is used to create and return the iterator of [index, byte] pairs from the contents of the buffer. | 
| Node.js Buffer.readDoubleBE() Method | The Buffer.readDoubleBE() Method in Node.js is used to read a 64-bit double from the buffer at the given offset with the Big Endian format. | 
| Node.js Buffer.writeDoubleLE() Method | Buffer module that writes a value to the buffer at the specified offset with the specified endian format. | 
| Node.js Buffer.writeInt16LE() Method | This is used to write a valid signed 16-bit integer to buffer at the specified offset with specified little endian format. | 
| Node.js Buffer.poolSize Property | The Buffer.poolSize property is an inbuilt application programming interface of class Buffer | 
| Node.js Buffer.readDoubleLE() Method | This is used to read a 64-bit double from the buffer at the given offset with Little Endian format. | 
| Node.js Buffer.byteLength() Method | This is used to return the length in bytes of the specified buffer object. | 
| Node.js Buffer.readFloatBE() Method | This is used to read big endian 32 bits floating-point value to an allocated buffer at the specified offset. | 
| Node.js Buffer.writeInt32BE() Method | This is used to write integer value to buffer at the specified offset with the big-endian format, integer value should be a valid signed 32-bit integer. | 
| Node.js Buffer.writeInt8() Method | This is used to writes value to an allocated buffer at the specified offset. | 
| Node.js Buffer.readUIntLE() Method | This is used to read specified number of byte(s) value from an allocated buffer at a specified offset. | 
| Node.js Buffer.toJSON() Method | The Buffer.toJSON() method returns the buffer in JSON format. | 
| Node.js Buffer.lastIndexOf() Method | The Buffer.lastIndexOf() Method checks for a given value in the buffer and return its index where it is present. | 
| Node.js Buffer.byteOffset Property | The Buffer.byteOffset property is an inbuilt application programming interface of class Buffer | 
| Node.js Buffer.kMaxLength Property | The Buffer.kMaxLength property is an inbuilt application programming interface of class Buffer | 
| Node.js Buffer.buffer Property | This is used to get the object of array buffer equivalent to this buffer object. | 
| Node.js Buffer.length Property | This is used to get the length of this buffer object. | 
| Node.js Buffer.writeBigInt64BE() Method | This is used to writes big endian 64-bits Big integer value to an allocated buffer at the specified offset. | 
| Node.js Buffer.readBigInt64BE() Method | This is used to read 64-bit Big integer from a buffer object at a given offset and returns the result in Big endian. | 
| Node.js Buffer.readBigUInt64LE() Method | This is used to read unsigned 64 bit integer from a buffer object at a given offset and returns the result in Little endian. | 
| Node.js Buffer.writeBigUInt64LE() Method | This is used to writes little endian 64-bits Big integer value to an allocated buffer at the specified offset. | 
| Node.js Buffer.writeBigInt64LE() Method | This is used to writes little endian 64-bits Big integer value to an allocated buffer at the specified offset. | 
| Node.js Buffer.readBigInt64LE() Method | This is used to read 64 bit Big integer from a buffer object at a given offset and returns the result in Little endian. | 
| Node.js Buffer.writeBigUInt64BE() Method | This is used to writes big endian 64-bits Big integer value to an allocated buffer at the specified offset. | 
| Node.js Buffer.readBigUInt64BE() Method | This is used to read unsigned 64 bit integer from a buffer object at a given offset and returns the result in Big endian . |

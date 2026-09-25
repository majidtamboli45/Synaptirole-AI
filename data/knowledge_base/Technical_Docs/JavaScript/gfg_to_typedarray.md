# Introduction to TypedArray

> Source: https://www.geeksforgeeks.org/javascript/typedarray-introduction/

TypedArray is an array-like object used for handling binary data efficiently in JavaScript. It works as a view over raw binary data stored in an ArrayBuffer.
- TypedArray provides fast processing of binary and numeric data.
- It includes types like Int8Array, Uint8Array, and Float32Array.
- It is commonly used in graphics, audio processing, and file handling.
There are several types of TypedArray shown below with their range, size, web IDL Type, and Equivalent C Type:
| Type | Range Value | Size (Bytes) | Web IDL Type | Equivalent C type | 
|---|---|---|---|---|
| Int8Array | -128 to 127 | 1 | byte | int8_t | 
| Uint8Array | 0 to 255 | 1 | octet | uint8_t | 
| Uint8ClampedArray | 0 to 255 | 1 | octet | uint8_t | 
| Int16Array | -32768 to 32767 | 2 | short | int16_t | 
| Uint16Array | 0 to 65535 | 2 | unsigned short | uint16_t | 
| Int32Array | -2147483648 to 2147483647 | 4 | long | int32_t | 
| Uint32Array | 0 to 4294967295 | 4 | unsigned long | uint32_t | 
| Float32Array | 1.2×10^-38 to 3.4×10^38 | 4 | unrestricted float | float | 
| Float64Array | 5.0×10^-324 to 1.8×10^308 | 8 | unrestricted double | double | 
| BigInt64Array | -2^63 to 2^63-1 | 8 | bigint | int64_t (signed long) | 
| BigUint64Array | 0 to 2^64-1 | 8 | bigint | uint64_t (unsigned long) | 
Constructor:
- This object cannot be instantiated directly. Instead, you have to create an instance of an array of a particular type, such as an UInt8Array or a BigInt64Array.
- When creating an instance of a TypedArray(e.g. Int8Array), an Array Buffer instance is also created internally in the memory or, if an ArrayBuffer object is given as a constructor argument, then that argument is used instead.
- We can create the instance of TypedArray by using the 'new' keyword with the respective constructor.
Syntax:
new TypedArray();
// Or
new TypedArray(length);
// Or
new TypedArray(typedArray);
// Or
new TypedArray(object);
// Or
new TypedArray(buffer [, byteOffset [, length]]);
TypedArray can be of any type mentioned above.
Parameters: Below are the parameters that TypedArray can take:
- length: The size of ArrayBuffer to create.
- TypedArray: Type of array to be created.
- object: When called with the object argument, a new typed array instance is created.
- buffer, byteOffset, length: When called with a buffer, byte offset, and a length argument, a new typed array view is created that is used to view the specified ArrayBuffer.
Instantiating a TypedArray
Below are some examples that show how to instantiate a TypedArray.
Example 1: In this example, we will initialize a typedArray.
const buffer = new ArrayBuffer(8);
// Initiating using the constructor
const uint8 = new Uint8Array(buffer);
// Output is 8 as we initiated the length with 8
console.log(uint8.length);
Example 2: In this example, we will initialize a typedArray.
const int8 = new Int8Array([0, 0, 0, 0]);
    
int8.fill(4, 1, 3);
console.log(int8);
Example 3: Checking if the values are contained inside the TypedArray.
const int8 = new Int8Array([10, 20, 30, 40, 50]);
    
console.log(int8.includes(20));
    
console.log(int8.includes(20, 3));

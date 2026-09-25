# Node.js Path Module

> Source: https://www.geeksforgeeks.org/node-js/nodejs-path-module/

The path module provides utilities to handle and manipulate file and directory paths in a platform-independent way.
- Ensures consistent behavior across different operating systems
- Supports operations like joining, resolving, and parsing paths
- Helps avoid errors in manual path handling
Installation Step (Optional)
Installation is an optional step as the path module is a built-in module in Node.js. Install the assert module using the following command:
npm install path
Importing the Module
To start using the path module in your Node.js application, import it as follows:
const path = require('path');
Path Methods
The path module provides methods to create, analyze, and manipulate file and directory paths in a platform-independent manner.
| Method | Description | 
|---|---|
| path.join() | Joins multiple path segments into a single path. | 
| path.resolve() | Resolves a sequence of paths into an absolute path. | 
| path.normalize() | Normalizes a path by resolving . and .. segments. | 
| path.isAbsolute() | Returns true if the path is an absolute. | 
| path.basename() | Returns the last portion of a path (file name). | 
| path.dirname() | Returns the directory name of a path. | 
| path.extname() | Returns the file extension of a path. | 
| path.parse() | Parses a path into an object (root ,dir ,base , etc.). | 
| path.format() | Constructs a path string from a parsed path object. | 
| path.relative() | Computes the relative path between two paths. | 
| path.sep | Platform-specific path separator (/ on POSIX,\ on Windows). | 
| path.delimiter | Platform-specific delimiter (: on POSIX, ; on Windows). | 
Example: Uses path.extname() to extract a file extension, useful for identifying or filtering file types.
console.clear();
const path = require('path');
// Define a file path
const filePath = '/users/gfg/documents/report.pdf';
// Extract the file extension
const fileExtension = path.extname(filePath);
console.log(`File Extension: ${fileExtension}`);
Output:
File Extension: .pdf
Example: Uses path.resolve() to convert a sequence of path segments into an absolute path.
console.clear();
const path = require('path');
// Resolving an absolute path from segments
const absolutePath = path.resolve('users', 'gfg', 'documents');
console.log(absolutePath);
Output
/your/current/directory/users/gfg/documents
Benefits of Path Module
- Provides cross-platform utilities for handling file paths consistently across operating systems.
- Simplifies path joining, resolving, parsing, and formatting with built-in methods.
- Normalizes file paths and handles edge cases to reduce errors in path operations.
- Improves code readability by replacing manual string manipulation with cleaner path methods.
- Comes built into Node.js, so no external dependencies are required.

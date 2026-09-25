# Node.js File System

> Source: https://www.geeksforgeeks.org/node-js/node-js-file-system/

The fs (File System) module in Node.js is a built-in API used to perform file and directory operations on the server.
- Provides file I/O operations using standard POSIX wrappers.
- Supports both synchronous and asynchronous methods.
- Imported using const fs = require('fs');.
- Common operations include reading, writing, appending, closing, and deleting files.
Synchronous Approach
Blocking functions run tasks sequentially, requiring one operation to finish completely before the next begins, which delays subsequent execution.
- Executes tasks sequentially, following a step-by-step flow.
- Blocks execution until the current operation completes before moving to the next task.
- Can reduce application responsiveness during long-running operations.
Use Cases:
- Suitable for lightweight tasks that execute quickly.
- Simple to implement when performance impact is minimal.
Create a text file named input.txt with the following content:
GeeksforGeeks: A computer science portal
Create a main.js file with the following code:
const fs = require("fs");
// Synchronous read
const data = fs.readFileSync('input.txt');
console.log("Synchronous read: " + data.toString());
Output:
Synchronous read: GeeksforGeeks: A computer science portal
Asynchronous Approach
Non-blocking functions start operations without waiting for them to finish, enabling continuous execution while results are handled asynchronously.
- Execution continues without waiting for operation completion.
- Operations run in the background and return results when ready.
- Enhances performance and application responsiveness.
Use cases:
- Ideal for heavy or time-consuming tasks like large data processing.
- Allows showing progress indicators while work continues in the background.
- Best suited for GUI-based and responsive applications.
Create a text file named input.txt with the following content:
GeeksforGeeks: A computer science portal
Create a main.js file with the following code:
const fs = require("fs");
// Asynchronous read
fs.readFile("input.txt", function (err, data) {
	if (err) {
		return console.error(err);
	}
	console.log("Asynchronous read: " + data.toString());
});
Output:
Asynchronous read: GeeksforGeeks: A computer science portal
File Operations Using the fs Module in Node.js
The Node.js fs module provides methods to open, read, write, append, close, and delete files, enabling efficient file system operations.
Opening a File
Opening a file in Node.js allows you to create, read, or write files using the fs module.
- fs.open() supports multiple file operations based on flags.
- Can open files for reading, writing, or both.
- Returns a file descriptor used for further file actions.
Syntax:
fs.open(path, flags, mode, callback)
- path: File name or full file path.
- flags: Defines open behavior (r ,w ,a ,r+ , etc.).
- mode: File access permissions (default: read/write).
- err: Error object if the operation fails.
- data: File descriptor returned after successful open.
Example: Create a file named main.js having the following code to open a file input.txt for reading and writing.
const fs = require("fs");
// Asynchronous - Opening File
console.log("opening file!");
fs.open("input.txt", "r+", function (err, fd) {
	if (err) {
		return console.error(err);
	}
	console.log("File open successfully");
});
Output:
opening file!
File open successfully
Reading a File
The fs.read() method is used to read data from an open file into memory.
- Reads file content using the file descriptor (fd).
- Stores the read data in a buffer for further processing.
Syntax:
fs.read(fd, buffer, offset, length, position, callback)
- fd: This is the file descriptor returned by fs.open() method.
- buffer: This is the buffer that the data will be written to.
- offset: This is the offset in the buffer to start writing at.
- length: This is an integer specifying the number of bytes to read.
- Position: Specifies the starting point for reading if null, data is read from the current file position.
- Callback: Executed after reading the file, receiving err for errors and data for the file contents.
Example: Create a file named main.js having the following code:
const fs = require("fs");
const buf = Buffer.alloc(1024);
console.log("opening an existing file");
fs.open("input.txt", "r+", function (err, fd) {
	if (err) {
		return console.error(err);
	}
	console.log("File opened successfully!");
	console.log("reading the file");
	fs.read(fd, buf, 0, buf.length, 0, function (err, bytes) {
		if (err) {
			console.log(err);
		}
		console.log(bytes + " bytes read");
		// Print only read bytes to avoid junk.
		if (bytes > 0) {
			console.log(buf.slice(0, bytes).toString());
		}
	});
});
Output:
opening an existing file
File opened successfully!
reading the file
40 bytes read
GeeksforGeeks: A computer science portal
Writing to a File
The fs.writeFile() method is used to asynchronously write data to a file in Node.js.
- Overwrites the file if it already exists.
- Writes data asynchronously for better performance.
- Supports optional settings through the options parameter.
Syntax:
fs.writeFile(path, data, options, callback)
- path: File location to write to, or a file descriptor.
- data: Content to be written such as string or buffer.
- options: Controls writing behavior like encoding, mode, and flag.
- callback: Runs after the write operation completes.
- err: Indicates an error if the write operation fails.
Example: Create a file named main.js having the following code:
const fs = require("fs");
console.log("writing into existing file");
fs.writeFile("input.txt", "Geeks For Geeks", function (err) {
	if (err) {
		return console.error(err);
	}
	console.log("Data written successfully!");
	console.log("Let's read newly written data");
	fs.readFile("input.txt", function (err, data) {
		if (err) {
			return console.error(err);
		}
		console.log("Asynchronous read: " + data.toString());
	});
});
Output:
writing into existing file
Data written successfully!
Let's read newly written data
Asynchronous read: Geeks For Geeks
Appending to a File
Appending to a file adds new data at the end of an existing file without overwriting its content.
- Uses fs.appendFile() to add data.
- Preserves existing file content.
- Writes data at the end of the file.
Syntax:
fs.appendFile(filepath, data, options, callback); 
// or
fs.appendFileSync(filepath, data, options);
- filepath: It is a String that specifies the file path.
- data: It is mandatory and it contains the data that you append to the file.
- options: It is an optional parameter that specifies the encoding/mode/flag.
- Callback: Function is mandatory and is called when appending data to file is completed.
Example: Appending to a File Asynchronously.
const fs = require("fs");
let data = "\nLearn Node.js";
// Append data to file
fs.appendFile(
	"input.txt", data, "utf8",
	// Callback function
	function (err) {
		if (err) throw err;
		// If no error
		console.log("Data is appended to file successfully.");
	}
);
Output:
Data is appended to file successfully.
Example: Appending to a File Synchronously.
const fs = require("fs");
const data = "\nLearn Node.js";
// Append data to file
fs.appendFileSync("input.txt", data, "utf8");
console.log("Data is appended to file successfully.");
Output:
Data is appended to file successfully.
- Before Appending Data to input.txt file:
GeeksforGeeks: A computer science portal - After Appending Data to input.txt file:
GeeksforGeeks: A computer science portal
Learn Node.js
Closing the File
The fs.close() method asynchronously closes an open file descriptor, releasing system resources and making the descriptor available for reuse.
- Closes a file descriptor asynchronously.
- Frees associated system resources.
- Allows descriptor reuse for other files.
- Should not be called during active file operations.
Syntax:
fs.close(fd, callback)
- fd: An integer representing the file descriptor to be closed.
- callback: A function invoked after the close operation completes.
- err: An error object returned if the operation fails.
Example: Create a file named main.js having the following code:
const fs = require("fs");
fs.open("input.txt", "r+", function (err, fd) {
    if (err) {
        return console.error(err);
    }
    console.log("File opened successfully");
    fs.close(fd, function (err) {
        if (err) {
            return console.error(err);
        }
        console.log("File closed successfully.");
    });
});
Output:
File closed successfully.
Delete a File
The fs.unlink() method deletes a file or symbolic link from the filesystem.
- Removes files or symbolic links.
- Does not work on directories.
- Use fs.rm() to delete directories.
Syntax:
fs.unlink(path, callback)
- path: A string, Buffer, or URL representing the file or symbolic link to be removed.
- callback: A function invoked after the removal operation completes.
- err: An error object returned if the operation fails.
Example: Create a file named main.js having the following code:
const fs = require("fs");
console.log("deleting an existing file");
fs.unlink("input.txt", function (err) {
	if (err) {
		return console.error(err);
	}
	console.log("File deleted successfully!");
});
Output:
deleting an existing file
File deleted successfully!
Difference Between readFile/writeFile and readFileSync/writeFileSync
| readFile/ writeFile | readFileSync/writeFileSync | 
|---|---|
| Asynchronous (non-blocking) | Synchronous (blocking) | 
| Better for high-performance and large-scale applications | Slower, blocks the event loop until the operation completes | 
| Takes a callback function | Returns result directly or throws error | 
| Preferred in server environments to avoid blocking | Useful for small scripts or startup code | 
| Error passed to callback | Use try...catch block for error handling | 
| fs.readFile('file.txt', 'utf8', (err, data) => {...}) | const data = fs.readFileSync('file.txt', 'utf8') | 
| fs.writeFile('file.txt', data, err => {...}) | fs.writeFileSync('file.txt', data) | 
Advantages
- Provides both asynchronous (non-blocking) and synchronous (blocking) methods for file operations.
- Enables efficient reading, writing, updating, and deleting of files.
- Supports directory operations such as creating, deleting, and listing directories.
- Includes detailed error handling to simplify debugging and troubleshoot file system issues.

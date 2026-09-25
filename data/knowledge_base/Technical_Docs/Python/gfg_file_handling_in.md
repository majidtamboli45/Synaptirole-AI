# File Handling in Python

> Source: https://www.geeksforgeeks.org/python/file-handling-python/

File handling refers to the process of performing operations on a file, such as creating, opening, reading, writing and closing it through a programming interface. It involves managing the data flow between the program and the file system on the storage device, ensuring that data is handled safely and efficiently.
Need for File Handling
- Store data permanently, even after the program ends.
- Access external files like .txt, .csv, .json, etc.
- Process large files efficiently without using much memory.
- Automate tasks like reading configs or saving outputs.
Opening a File
To open a file, we can use open() function, which requires file-path and mode as arguments.
Note: We will use a sample file named geek.txt for all examples in this article. To download click here
Syntax:
file = open('filename.txt', 'mode')
- filename.txt: name (or path) of the file to be opened.
- mode: mode in which you want to open the file (read, write, append, etc.).
Note: If you don’t specify the mode, Python uses 'r' (read mode) by default.
Basic Example: Opening a File
f = open("geek.txt", "r")
print(f)
Explanation: code opens file geek.txt in read mode. If the file exists, it returns a file object connected to that file; if the file does not exist, Python raises a FileNotFoundError.
Closing a File
file.close() method closes the file and releases the system resources. If the file was opened in write or append mode, closing ensures that all changes are properly saved.
file = open("geek.txt", "r")
# Perform file operations
file.close()
We will also see later how closing can be handled automatically using the with statement and how to ensure files close properly using exception handling.
Checking File Properties
Once the file is open, we can check some of its properties:
f = open("geek.txt", "r")
print("Filename:", f.name)
print("Mode:", f.mode)
print("Is Closed?", f.closed)
f.close()
print("Is Closed?", f.closed)
Output
Filename: geek.txt
Mode: r
Is Closed? False
Is Closed? True
Explanation:
- f.name: Returns the name of the file that was opened (in this case, "geek.txt").
- f.mode: Tells us the mode in which the file was opened. Here, it’s 'r' which means read mode.
- f.closed: Returns a boolean value- False when file is currently open otherwise True.
Reading a File
Reading a file can be achieved by file.read() which reads the entire content of the file. After reading, it’s good practice to close the file to free up system resources.
Example: Reading a File in Read Mode (r)
file = open("geek.txt", "r")
content = file.read()
print(content)
file.close()
Output
Hello world
GeeksforGeeks
123 456
Writing a File
Writing to a file is done using the mode "w". This creates a new file if it doesn’t exist, or overwrites the existing file if it does. The write() method is used to add content. After writing, make sure to close the file.
Example: Writing to a file (overwrites if file exists)
with open("geek.txt", "w") as file:
    file.write("Hello, Python!\n")
    file.write("File handling is easy with Python.")
print("File written successfully")
Output
Hello, Python!
File handling is easy with Python.
Explanation:
- "w" mode opens the file for writing (overwrites existing content if the file already exists).
- write() method adds new text to the file.
- When using with, the file closes automatically at the end of the block.
Using with Statement
Instead of manually opening and closing the file, you can use the with statement, which automatically handles closing. This reduces the risk of file corruption and resource leakage.
Example: Let's assume we have a file named geek.txt that contains text "Hello, World!".
with open("geek.txt", "r") as file:
    content = file.read()
    print(content)
Output
Hello, World!
Handling Exceptions When Closing a File
It's important to handle exceptions to ensure that files are closed properly, even if an error occurs during file operations. Here, the finally block ensures the file is closed even if an error occurs.
try:
    file = open("geek.txt", "r")
    content = file.read()
    print(content)
except FileNotFoundError as e:
    print("Error:", e)
finally:
    file.close()
Output
Hello, World!
Explanation:
- try block contains code that may raise an error.
- except block handles specific errors like missing files.
- finally block ensures the file is always closed, even if an error occurs.
Related articles: Modes in File Handling

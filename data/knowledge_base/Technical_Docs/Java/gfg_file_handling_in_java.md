# File Handling in Java

> Source: https://www.geeksforgeeks.org/java/file-handling-in-java/

In Java, file handling means working with files like creating them, reading data, writing data or deleting them. It helps a program save and use information permanently on the computer.
Why File Handling is Required?
- To store data permanently instead of keeping it only in memory.
- To read and write data from/to files for later use.
- To share data between different programs or systems.
- To organize and manage large data efficiently.
To support file handling, Java provides the File class in the java.io package.
File Class
File class in Java (from the java.io package) is used to represent the name and path of a file or directory. It provides methods to create, delete, and get information about files and directories.
// Importing File Class
import java.io.File;
class Geeks{
    
    public static void main(String[] args){
        
        // File name specified
        File obj = new File("myfile.txt");
        System.out.println("File Created!");
    }
}
Output:
File Created!
In Java, I/O streams are used to perform input and output operations on files. So, let’s first understand what streams are.
I/O Streams in Java
In Java, I/O streams are the fundamental mechanism for handling input and output operations. They provide a uniform way to read data from various sources (files, network, memory) and write data to different destinations.
Java I/O streams are categorized into two main types based on the type of data they handle:
1. Byte Streams
In Java, Byte Streams are used to handle raw binary data such as images, audio files, videos or any non-text file. They work with data in the form of 8-bit bytes.
The two main abstract classes for byte streams are:
- InputStream: for reading data (input)
- OutputStream: for writing data (output)
Since abstract classes cannot be used directly, we use their implementation classes to perform actual I/O operations.
- FileInputStream: reads raw bytes from a file.
- FileOutputStream: writes raw bytes to a file.
- BufferedInputStream / BufferedOutputStream: use buffering for faster performance.
- ByteArrayInputStream: reads data from a byte array as if it were an input stream.
- ByteArrayOutputStream: writes data into a byte array, which grows automatically.
2. Character Streams
In Java, Character Streams are used to handle text data. They work with 16-bit Unicode characters, making them suitable for international text and language support.
The two main abstract classes for character streams are:
- Reader: Base class for all character-based input streams (reading).
- Writer: Base class for all character-based output streams (writing).
Since abstract classes cannot be used directly, we use their implementation classes to perform actual I/O operations.
- FileReader: reads characters from a file.
- FileWriter: writes characters to a file.
- BufferedReader: reads text efficiently using buffering; also provides readLine() for reading lines.
- BufferedWriter: writes text efficiently using buffering.
- StringReader: reads characters from a string.
- StringWriter: writes characters into a string buffer.
Use Byte Streams when working with binary data (images, audio, video, executable files) and use Character Streams when working with text data (characters, strings, text files).
File Operations
The following are the several operations that can be performed on a file in Java:
1. Create a File
- In order to create a file in Java, you can use the createNewFile() method.
- If the file is successfully created, it will return a Boolean value true and false if the file already exists.
import java.io.File;
import java.io.IOException;
public class CreateFile
{
    public static void main(String[] args)
    {
        try {
            File Obj = new File("myfile.txt");
            
          	// Creating File
          	if (Obj.createNewFile()) {
                System.out.println("File created: " + Obj.getName());
            }
            else {
                System.out.println("File already exists.");
            }
        }
      
      	// Exception Thrown
        catch (IOException e) {
            System.out.println("An error has occurred.");
            e.printStackTrace();
        }
    }
}
Output:
2. Write to a File
We use the FileWriter class along with its write() method in order to write some text to the file.
import java.io.FileWriter;
import java.io.IOException; 
public class WriteFile 
{
    public static void main(String[] args)
    {
        // Writing Text File       
        try {
            FileWriter Writer = new FileWriter("myfile.txt");
            // Writing File
            Writer.write("Files in Java are seriously good!!");
            Writer.close();
            
            System.out.println("Successfully written.");
        }
        // Exception Thrown
        catch (IOException e) {
            System.out.println("An error has occurred.");
            e.printStackTrace();
        }
    }
}
Output:
3. Read from a File
In Java, the read() method is used with classes like FileReader or InputStream to read data from a file one character or byte at a time.
- It returns an integer value representing the character or byte read.
- When the end of the file is reached, the method returns -1 indicating no more data is available.
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner; 
public class ReadFile 
{
    public static void main(String[] args)
    {
        // Reading File
        try {
            File Obj = new File("myfile.txt");
            Scanner Reader = new Scanner(Obj);
          
            // Traversing File Data
          	while (Reader.hasNextLine()) {
                String data = Reader.nextLine();
                System.out.println(data);
            }
          
            Reader.close();
        }
        
        // Exception Cases
        catch (FileNotFoundException e) {
            System.out.println("An error has occurred.");
            e.printStackTrace();
        }
    }
}
Output:
4. canRead a File
canRead() check if the file is readable.
import java.io.File;
import java.io.IOException;
public class CanReadExample {
    public static void main(String[] args) {
        try {
            // Create a new file
            File obj = new File("myfile.txt");
            if (obj.createNewFile()) {
                System.out.println("File created: " + obj.getName());
            } else {
                System.out.println("File already exists.");
            }
            // Check if the file is readable
            if (obj.canRead()) {
                System.out.println("The file is readable.");
            } else {
                System.out.println("The file is not readable.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
Output:
5. canWrite a File
canWrite() checks whether the file can be written to by the program.
import java.io.File;
import java.io.IOException;
public class CanWriteExample {
    public static void main(String[] args) {
        try {
            // Create a new file
            File obj = new File("myfile.txt");
            if (obj.createNewFile()) {
                System.out.println("File created: " + obj.getName());
            } else {
                System.out.println("File already exists.");
            }
            // Check if the file is writable
            if (obj.canWrite()) {
                System.out.println("The file is writable.");  // One-line explanation
            } else {
                System.out.println("The file is not writable.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
Output:
6. Existance of a File
exists() checks whether the specified file or directory exists on the file system.
import java.io.File;
public class ExistsExample {
    public static void main(String[] args) {
        // Create a File object
        File obj = new File("myfile.txt");
        // Check if the file exists
        if (obj.exists()) {
            System.out.println("The file exists.");  // One-line explanation
        } else {
            System.out.println("The file does not exist.");
        }
    }
}
Output:
7. Getting a path
getAbsolutePath() returns the full path of the file or directory in the file system.
import java.io.File;
public class AbsolutePathExample {
    public static void main(String[] args) {
        // Create a File object
        File obj = new File("myfile.txt");
        // Print the absolute path of the file
        System.out.println("Absolute Path: " + obj.getAbsolutePath());
    }
}
8. Delete a File
We use the delete() method in order to delete a file.
import java.io.File; 
public class DeleteFile 
{
    public static void main(String[] args)
    {
        File Obj = new File("myfile.txt");
        
        // Deleting File
        if (Obj.delete()) {
            System.out.println("The deleted file is : " + Obj.getName());
        }
        else {
            System.out.println(
                "Failed in deleting the file.");
        }
    }
}
Output:

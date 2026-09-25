# Out Implicit Object

> Source: https://www.geeksforgeeks.org/advance-java/jsp-out-implicit-object

JavaServer Pages (JSP) is used to create dynamic web pages in Java. The Out implicit object is used to send output data from the server to the client browser. It helps in displaying dynamic content directly on the web page.
- We can access the Out implicit object within the JSP Code.
- Use methods like print( ) or println() to send the content to the response stream.
- Then the content can be sent using Out and is directly rendered on the web page when the response is sent to the client.
Methods of Out Implicit Object
1. Using print() method
- Prints content without adding a new line
- Used for continuous output
Example
<body>    
 <%      
      // Using Out.print() to send content     
      out.print("This is printed using Out.print(). ");       
      out.print("No new line character is appended.");   
  %>
2. Using println() method
- Prints content with a new line character
- Each statement appears on a new line
Example:
<body> 
    <%      
      // Using Out.println() to send content     
        out.println("This is printed using Out.println().");     
        out.println("A new line character is appended after each println() call.");  
   %>
3. Using flush() Method
- Forces the buffer to send output immediately to the browser
- Useful when you want real-time response
Example:
<body>   
  <%     
      // Using Out.println() to send content    
      out.println("This content is flushed immediately.");       
     // Flush the output to ensure it's sent immediately  
       out.flush();   
  %>
Directives to Control Output
JSP directives like <% page buffer = "none" %> can be used to the control of buffering behavior and it can affecting how the content sent using the Out is handled.
Example:
<body>   
  <%      
      // Send content using Out implicit object      
     out.println("This content is not buffered because buffer=\"none\" directive is used.");  
   %>
Note: If you are beginner refer the link to create the JSP project and execution of the JSP application.
Program to Implement Out Implicit Object of JSP
Below is a working code example to demonstrate the implementation of Out Implicit Object of JSP.
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Out Implicit Object Example</title>
</head>
<body>
    <%
        // Using Out.print() method
        out.print("Hello, this is printed using Out.print()<br>");
        // Using Out.println() method
        out.println("This is printed using Out.println()");
    %>
</body>
</html>
Output:
Hello, this is printed using Out.print()
This is printed using Out.println()
Output Image:
Below is the Output image for better understanding.
Note: URL could vary depending on the server's port number and context path.

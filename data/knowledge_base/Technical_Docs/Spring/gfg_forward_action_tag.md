# Forward action tag

> Source: https://www.geeksforgeeks.org/advance-java/jsp-forward-action-tag

The Forward Action Tag in JSP is used to forward a request from one JSP page to another within the same application. It transfers control internally on the server without changing the browser URL. This helps in building modular and reusable web applications.
- Uses <jsp:forward> tag to transfer request to another JSP
- Forwarding happens on server side, URL does not change
- Useful for request processing and page redirection internally
Syntax:
<jsp:forward page="file.jsp" />
Steps of Implementation
- Create JSP pages: We can create multiple JSP pages representing different parts or concepts of a web application.
- Use Forward Action Tag: To refer to the target JSP page we can use the <jsp:forward> tag to which the control should be forwarded.
- Modify the request on the target page: We can execute the request sent to the target JSP page and then retrieve the request parameters or perform the necessary server-side operations.
- Display Output: Finally, create dynamic objects or display information based on submitted requests.
Implementation JSP Forward action tag
Step 1: Create Dynamic Web Project
- Go to File -> New -> Dynamic Web Project
- Enter Project Name (e.g., ForwardProject)
- Select Apache Tomcat Server
- Click Finish
Step 2: Create index.jsp
- Right-click on project ->New -> JSP File
- File name: index.jsp
- Add <jsp:forward> tag to forward request to target page
index.jsp:
<html>
<head>
    <title>Forward Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        p {
            color: #666;
        }
    </style>
</head>
<body>
    <h2>Welcome to the Forward Example</h2>
    <p>This is the index page.</p>
    <jsp:forward page="target.jsp"/>
</body>
</html>
Step 3: Create target.jsp
- Right-click on project -> New -> JSP File
- File name: target.jsp
- Add content to display message (Target Page)
Target.jsp:
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Target Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        p {
            color: #666;
        }
    </style>
</head>
<body>
    <h2>Target Page</h2>
    <p>This is the target page.</p>
</body>
</html>
Step 4: Run the Application
- Right-click project -> Run As -> Run on Server
- Select Apache Tomcat
Url: http://localhost:8080/YourProject/
Output:
Below we can see the output in browser.
When the users reach the index.jsp page, they will see the message "Target Page" with the paragraph "This is the target page." The <jsp: forward> tag in the index.jsp forwards the request to the target.jsp and the user see the contents target.jsp including the message of the target page.

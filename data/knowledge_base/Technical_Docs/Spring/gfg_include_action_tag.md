# Include Action Tag

> Source: https://www.geeksforgeeks.org/advance-java/jsp-include-action-tag

The Include Action Tag in JSP is used to include the content of one JSP page into another at request time. It helps in reusing common components like headers and footers, making web applications more modular and maintainable. This inclusion happens dynamically when the page is requested.
- Uses <jsp:include> tag to include another JSP page
- Content is included at request time (dynamic)
- Helps in code reusability and modular design
Syntax:
<jsp:include page="file.jsp" />
Implementation of Include action tag in JSP
A simple JSP application that will demonstrate the Include Action Tag of JSP.
Step 1: Create index.jsp
This is the main page where we include header and footer using <jsp:include>.
index.jsp:
<!DOCTYPE html>
<html>
<head>
    <title>Include Example</title>
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
        /* Styles for header and footer */
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
        }
        footer {
            background-color: #333;
            color: white;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h2>Welcome to the Include Example</h2>
    <p>This is the index page.</p>
    <jsp:include page="header.jsp"/>
    <p>This is some content below the header.</p>
    <jsp:include page="footer.jsp"/>
</body>
</html>
Step 2: Create header.jsp
This file contains reusable header content.
header.jsp:
<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
</head>
<body>
    <header>
        <h1>Header Content</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>
Step 3: Create footer.jsp
This file contains reusable footer content.
footer.jsp:
<!DOCTYPE html>
<html>
<head>
    <title>Footer</title>
</head>
<body>
    <footer>
        <p>© 2024 Example Company</p>
    </footer>
</body>
</html>
Step 4: Run the Application
- Right-click project -> Run As -> Run on Server
- Select Apache Tomcat
Url: http://localhost:8080/YourProject/
Output:
- When the user opens index.jsp, the message “Welcome to the Include Example” is displayed
- The <jsp:include> tag dynamically includes header.jsp and footer.jsp
- Final output shows combined content (header + main content + footer)

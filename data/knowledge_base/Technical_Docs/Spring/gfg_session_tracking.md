# Session Tracking

> Source: https://www.geeksforgeeks.org/advance-java/jsp-session-tracking

Session Tracking in JSP is used to maintain user data across multiple requests in a web application. Since HTTP is a stateless protocol, session tracking helps identify users and store their information while they navigate between pages. It ensures a smooth and personalized user experience.
- Uses mechanisms like Cookies, URL Rewriting, and HttpSession
- Essential for features like login, cart, and user sessions
JSP Session Tracking Mechanisms
JSP provides different methods to maintain user sessions:
- Cookies: Stores small data in the browser and sends it with each request.
- URL Rewriting: Appends session ID to the URL when cookies are disabled.
- Hidden Form Fields: Passes session data through invisible form inputs.
Project Implementation of Session Tracking in JSP
This example will demonstrate a simple login system where the user's session is tracked across multiple pages.
Step 1: Create Dynamic Web Project
- Go to File -> New -> Dynamic Web Project
- Select Apache Tomcat
- Click Finish
Step 2: Create the LoginServlet Class
- Handles login request
- Creates session using HttpSession
- Stores username in session
LoginServlet.java:
package com.example;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles POST requests for user login.
     * 
     * @param request  HttpServletRequest object containing request details
     * @param response HttpServletResponse object to send response
     * @throws ServletException If an error occurs during request processing
     * @throws IOException      If an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("admin".equals(username) && "password".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("dashboard");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
Step 3: Create DashboardServlet
- Checks if session exists
- If valid -> forward to dashboard
- Else -> redirect to login page
DashboardServlet.java:
package com.example;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles GET requests to the dashboard page.
     * 
     * @param request  HttpServletRequest object containing request details
     * @param response HttpServletResponse object to send response
     * @throws ServletException If an error occurs during request processing
     * @throws IOException      If an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}
Step 4: Create the LogoutServlet Class
- Invalidates session using session.invalidate
- Redirects to logout page
File: LogoutServlet.java:
package com.example;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles POST requests to log out the user.
     * 
     * @param request  HttpServletRequest object containing request details
     * @param response HttpServletResponse object to send response
     * @throws ServletException If an error occurs during request processing
     * @throws IOException      If an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("logout.jsp");
    }
}
Step 5: Create the Login Page
- Form to accept username & password
- Sends request to LoginServlet
login.jsp:
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login"> <!-- Button text is "Login" -->
        </form>
    </div>
</body>
</html>
This JSP page provides a form for users to enter their username and password. The form submits a POST request to the LoginServlet.
Step 6: Create the Dashboard Page
- Retrieves session data
- Displays username
- Redirects if session not found
dashboard.jsp:
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= username %>!</h2>
        <p>This is your dashboard.</p>
        <form action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
This JSP page displays a welcome message to the logged-in user. If the session is invalid or the username is not set, it redirects to the login page. Otherwise, it shows the dashboard and provides a logout button.
Step 7: Create the Logout Page
- Displays logout message
- Provides login link
logout.jsp:
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Logout</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>You have successfully logged out.</h2>
        <a href="login.jsp">Login again</a>
    </div>
</body>
</html>
This JSP page informs the user that they have successfully logged out and provides a link to log in again.
Step 8: Create the StyleSheet
This CSS file styles the JSP pages. It includes styling for the background, container, headers, and form elements.
style.css:
body {
    background-color: #f0f8f7;
    font-family: Arial, sans-serif;
}
.container {
    width: 30%;
    margin: 100px auto;
    background-color: #d8f3dc;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 0px 10px #333;
}
h2 {
    color: #40916c;
    text-align: center;
}
input[type="text"], input[type="password"], input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}
input[type="submit"] {
    background-color: #40916c;
    color: #fff;
    border: none;
}
Step 9: Configure web.xml
This configuration file maps the servlets to their respective URL patterns. It tells the server which servlet to use for each URL pattern.
- Map servlets (/login, /dashboard, /logout)
- Set session timeout
web.xml:
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" xmlns="https://jakarta.ee/xml/ns/jakartaee/" xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee/ https://jakarta.ee/xml/ns/jakartaee//web-app_6_0.xsd" id="WebApp_ID" version="6.0">
  <display-name>SessionTrackingExample</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
    <servlet>
        <servlet-name>LoginServlet</servlet-name>
        <servlet-class>com.example.LoginServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>LoginServlet</servlet-name>
        <url-pattern>/login</url-pattern>
    </servlet-mapping>
    <servlet>
        <servlet-name>DashboardServlet</servlet-name>
        <servlet-class>com.example.DashboardServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>DashboardServlet</servlet-name>
        <url-pattern>/dashboard</url-pattern>
    </servlet-mapping>
    <servlet>
        <servlet-name>LogoutServlet</servlet-name>
        <servlet-class>com.example.LogoutServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>LogoutServlet</servlet-name>
        <url-pattern>/logout</url-pattern>
    </servlet-mapping>
    <session-config>
    <session-timeout>30</session-timeout> <!-- Timeout in minutes -->
</session-config>
    
  
</web-app>
Step 10: Run the Application
Output:
1. Login Page:
2. Dashboard:
3. Logout page:
Advantages of JSP Session Tracking
- Maintains user state across multiple requests
- Improves user experience (login, cart, form data)
- Supports multiple methods (cookies, URL rewriting, hidden fields)
- Easy session handling using HttpSession API
- Enhances security with session management and timeouts

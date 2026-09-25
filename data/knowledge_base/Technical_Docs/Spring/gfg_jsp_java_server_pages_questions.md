# JSP (Java Server Pages)  questions

> Source: https://www.geeksforgeeks.org/advance-java/jsp-java-server-pages-interview-questions

JSP (Java Server Pages) interview questions are commonly asked to test your knowledge of Java web application view layer development and how dynamic pages work in Java EE. These questions primarily focus on the JSP lifecycle, directives, implicit objects, scripting elements, expression language (EL), JSTL, session handling, and the concepts of JSP vs. Servlet.
1. What is JSP (Java Server Pages)?
JSP is a server-side technology used to create dynamic web pages that utilize HTML and Java. It is mainly used for the presentation layer in Java web applications.
- Used to generate dynamic HTML pages
- Runs inside a servlet container (Tomcat)
- Internally converted into a servlet
2. How does JSP work internally?
JSP works internally by converting the JSP file into a Servlet. When a client requests a .jsp page, the server (Tomcat) first translates it into a Java servlet class, compiles it, and then executes it to generate the final HTML response.
- JSP is translated into a servlet (.java) only the first time (or when modified).
- The generated servlet runs _jspService() for every request and sends HTML output.
- Next requests use the already compiled servlet, so response becomes faster.
3. What is the JSP lifecycle?
JSP lifecycle refers to the steps a JSP page follows inside the server from the time it is requested until it is removed. Internally, every JSP is converted into a servlet, and its lifecycle methods are managed by the servlet container (like Tomcat).
- Translation and Compilation: JSP -> Servlet .java -> .class (only first time or when JSP changes)
- Initialization: jspInit() runs only once when JSP is loaded
- Request Handling and Destroy: _jspService() runs for every request, and jspDestroy() runs when JSP is unloaded
4. What is the use of jspInit() method?
jspInit() is a JSP lifecycle method that is called only once when the JSP page is loaded for the first time. It is mainly used to perform initialization tasks before the JSP starts handling client requests.
- Runs only one time during JSP lifecycle
- Used for initial setup like loading config values
- Can be used for resource initialization (DB connection, objects, etc.)
5. What is the use of _jspService() method?
_jspService() is the most important JSP lifecycle method because it is called every time a client requests the JSP page. This method contains the actual translated servlet code that generates the dynamic HTML response.
- Runs for every request (like service() in servlet)
- Executes JSP code (HTML, scriptlets, expressions, JSTL, etc.)
- Sends the final output to the browser using the out object
6. What is the use of jspDestroy() method?
jspDestroy() is a JSP lifecycle method that is called only once when the JSP page is being removed from memory (unloaded). It is mainly used to release resources that were created during initialization.
- Runs only one time at the end of JSP lifecycle
- Used to close DB connections, files, or cleanup objects
- Called when server stops, JSP is redeployed, or container unloads the JSP
7. What is the difference between JSP and Servlet?
JSP and Servlet both are server-side technologies used to build dynamic web applications in Java. The main difference is that Servlet is Java code that generates HTML, while JSP is HTML-based code that gets converted into a Servlet internally.
| Feature | JSP | Servlet | 
|---|---|---|
| Main Use | Presentation (UI) | Business logic / Controller | 
| Coding Style | HTML + Java (easy for UI) | Pure Java (hard for UI) | 
| Compilation | Converted into Servlet automatically | Written and compiled manually | 
| Best For | View layer | Control + Processing | 
| Performance | Slightly slower first time (translation) | Faster initially | 
| Complexity | Easy for beginners | More complex than JSP | 
8. What are JSP directives?
JSP directives are special instructions used to give information to the JSP container about how the JSP page should be processed. They do not produce output directly, but they control page settings like imports, error handling, and file inclusion.
- Written using <%@ %> syntax
- Used for configuration like import, contentType, session, etc.
9. What are the types of JSP directives?
JSP directives are used to give instructions to the JSP container for processing the JSP page. They control important settings like imports, page configuration, and using tag libraries.
1. Page Directive: Page directive is used to define page-level settings like imports, session, buffer, content type, and error page.
<%@ page import="java.util.*" %>
2. Include Directive: Include directive is used to include another JSP file at translation time.
<%@ include file="header.jsp" %>
3. Taglib Directive: Taglib directive is used to use JSTL or custom tag libraries in JSP.
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
10. What is Scriptlet in JSP?
JSP scripting elements are special tags used to write Java code inside a JSP page. They help in generating dynamic content by allowing logic, expressions, and variable declarations within the JSP.
1. Scriptlet (<% %>): Scriptlet is used to write Java code inside JSP using <% %>.
<% int a = 10; %>
2. Expression (<%= %>): Expression is used to print output directly using <%= %>
<%= new Date() %>
3. Declaration (<%! %>): Declaration is used to declare variables and methods in JSP using <%! %>.
<%! int count = 0; %>
11. What are JSP implicit objects?
JSP implicit objects are pre-defined objects that are automatically available inside every JSP page. These objects are created by the JSP container, so developers can directly use them without writing code to create them.
- Common implicit objects: request, response, session, application, out
- Used for handling input/output, session tracking, and server-level data
- Available inside the _jspService() method automatically
12. Name the 9 JSP implicit objects
JSP provides 9 implicit objects that are automatically available in every JSP page. These objects are created by the JSP container and help in handling request, response, session, and output.
- request
- response
- session
- application
- out
- config
- pageContext
- page
- exception
13. What is the use of request object in JSP?
The request object in JSP is used to receive data from the client and access all request-related information. It represents the HTTP request sent by the browser to the server.
- Used to get form data using request.getParameter()
- Used to read request headers, method, and URI
- Used to store data for forwarding using request.setAttribute()
14. What is the use of response object in JSP?
The response object in JSP is used to send output back to the client. It represents the HTTP response that the server returns to the browser after processing the request.
- Used to send redirect using response.sendRedirect()
- Used to set content type and headers (setContentType, setHeader)
- Used to write output and manage cookies/status codes
15. What is the use of session object in JSP?
The session object in JSP is used to store user-specific data across multiple requests. It helps in session tracking, so the server can remember a user until the session expires or is invalidated.
- Stores data using session.setAttribute()
- Retrieves data using session.getAttribute()
- Used for login tracking, shopping cart, and user preferences
16. What is the use of application object in JSP?
The application object in JSP is used to store and share data at the application level. It represents the ServletContext, so the data stored in it is available to all users and all JSP/Servlets in the same web application.
- Data is shared globally using application.setAttribute()
- Useful for common configuration values (app name, DB info, counters)
- Exists until the server stops or the application is undeployed
17. What is pageContext in JSP?
pageContext is a JSP implicit object that acts as a central container for all JSP-related objects. It provides access to request, session, application, and also helps in managing attributes across different scopes.
- Used to access other implicit objects like request, session, application
- Used to store/retrieve attributes in different scopes (page, request, session, application)
- Provides utility methods like forwarding and including resources
18. What is JSP Expression Language (EL)?
JSP Expression Language (EL) is a simple scripting language used in JSP to access data from objects like request, session, and application without writing Java code. It makes JSP pages cleaner by reducing the need for scriptlets.
- Written using ${ } syntax
- Used to access attributes, beans, and collections easily
- Commonly used with JSTL for cleaner dynamic pages
19. What are JSP scopes?
JSP scopes define the area and lifetime where a variable/attribute can be accessed in a web application. They help in deciding how long data should stay available and who can use it.
- Page Scope: available only within the same JSP page
- Request Scope: available until the request is completed
- Session Scope: available for a user until session expires
- Application Scope: available to all users until server/app stops
20. What is the difference between include directive and jsp:include?
Include directive includes file at translation time, while jsp:include includes file at
| Feature | Include Directive (<%@ include %>) | <jsp:include> | 
|---|---|---|
| Type | Static Include | Dynamic Include | 
| When it happens | Translation time (before compilation) | Request time (during execution) | 
| Output | Included content becomes part of same JSP | Included output is inserted at runtime | 
| Best for | Common static files (header, footer) | Dynamic pages (menus, data-based content) | 
| Performance | Faster at runtime | Slightly slower (runs each request) | 
| Changes reflect | Needs JSP reload/recompile | Reflects immediately without recompiling | 
| Request/Response sharing | Same servlet code | Separate resource execution | 
21. What is jsp:forward in JSP?
<jsp:forward> is a JSP action tag used to forward the current request from one JSP page to another resource (JSP/Servlet). It transfers control internally on the server side, so the browser URL does not change.
- It performs server-side forwarding using the same request and response
- The client does not know the request was forwarded
- Used for page navigation like login -> dashboard, validation -> error page
<jsp:forward page="target.jsp" />
22. What is the difference between forward and redirect in JSP?
Forward and Redirect are both used for navigation in JSP, but the main difference is that forward happens inside the server, while redirect sends a new request from the browser. In forward, the URL does not change, but in redirect, the browser URL changes.
| Feature | Forward | Redirect | 
|---|---|---|
| Type | Server-side | Client-side | 
| Request | Same request | New request | 
| URL Change | No | Yes | 
| Speed | Faster | Slower | 
| Data Sharing | Possible (request scope) | Not possible (request scope) | 
| Best Use | Internal resource | External / new request | 
23. What is JSTL in JSP?
JSTL (JavaServer Pages Standard Tag Library) is a collection of ready-made tags used in JSP to perform common tasks like looping, conditions, formatting, and database operations without writing Java code. It makes JSP pages cleaner, readable, and easier to maintain.
- Removes the need for scriptlets (<% %>) in JSP
- Provides tags for if, forEach, choose, formatting, functions
- Mainly used with EL (${ }) for clean dynamic pages
24. What are the advantages of JSP?
JSP is a server-side technology used to create dynamic web pages by combining HTML with Java-based features. It makes web development easier because it supports reusable components, built-in objects, and clean separation of UI from backend logic.
- Easy to develop dynamic pages compared to writing HTML in Servlets
- Supports EL, JSTL, and tag libraries for cleaner code
- Faster development and good integration with Java frameworks like Spring
25. What is the use of config object in JSP?
The config object in JSP is an implicit object that represents the ServletConfig of the JSP servlet. It is used to access initialization parameters and configuration details defined for that JSP.
- Used to read init parameters using config.getInitParameter()
- Provides configuration info of the JSP servlet
- Helpful for loading settings during JSP initialization

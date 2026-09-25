# Servlet  Questions

> Source: https://www.geeksforgeeks.org/advance-java/servlet-interview-questions

Java Servlet interview questions are commonly asked to assess your understanding of server-side web development, the Servlet lifecycle, request handling, session management, and servlet APIs. This collection covers the most important Servlet concepts to help you prepare for technical interviews.
- Covers the most frequently asked Java Servlet interview questions with concise explanations.
- Suitable for both freshers and experienced professionals preparing for Java web development interviews.
1. What is a Servlet in Java?
A Servlet is a Java program that runs on a web server and handles client requests dynamically. It is mainly used to build server-side web applications.
- Runs inside a Servlet Container (Tomcat)
- Works with HTTP requests and responses
- Used for backend logic in web apps
2. What is a Servlet Container?
A Servlet Container is a part of the web server that manages servlets. It controls servlet lifecycle and provides services like request handling and session management.
- Manages servlet lifecycle (init, service, destroy)
- Creates request and response objects
- Provides multi-threading support
3. What is the Servlet Life Cycle?
The servlet lifecycle defines how a servlet is created, initialized, used, and destroyed by the container.
- init() -> called only once
- service() -> called for every request
- destroy() -> called before servlet is removed
4. What is the difference between doGet() and doPost()?
doGet() and doPost are HTTP methods in a Servlet used to handle client requests. doGet() is mainly used to retrieve data, while doPost() is used to submit data to the server.
- doGet() sends data through the URL, is suitable for read-only operations, and supports bookmarking and caching.
- doPost() sends data in the request body, is more secure for sensitive information, and is commonly used for form submissions, file uploads, and creating or updating data.
5. What is the use of init() method?
init() is a servlet lifecycle method used to initialize the servlet when it is loaded for the first time by the servlet container. It is called only once during the servlet’s life.
- Runs only one time
- Used for database connection setup
- Used for reading config values
Syntax:
public void init() throws ServletException {
// initialization code
}
6. What is the use of service() method?
The service() method is responsible for handling requests and generating responses. It is called every time the client sends a request.
- Called for each request
- Calls doGet() or doPost() internally
- Handles request-response processing
Syntax:
public void service(ServletRequest request, ServletResponse response)
        throws ServletException, IOException {
    // request handling code
}
7. What is the use of destroy() method?
The destroy() method is called when the servlet is removed from the container. It is used to clean up resources.
- Called only once before servlet is destroyed
- Used to close DB connections
- Used for cleanup tasks
Syntax:
public void destroy() {
    // cleanup code
}
8. What is the difference between Servlet and JSP?
Servlet is used for backend logic while JSP is mainly used for view (presentation). JSP is internally converted into a servlet.
| Feature | Servlet | JSP | 
|---|---|---|
| Type | Java class (backend component) | Web page (view layer) | 
| Coding Style | More Java code, HTML written inside Java | More HTML, Java used inside JSP | 
| Best Used For | Business logic + request handling | UI / presentation (dynamic pages) | 
| Compilation | Compiled into .class directly | Converted into a Servlet first, then compiled | 
9. What is HttpServlet?
HttpServlet is a class in the jakarta.servlet.http package that extends GenericServlet and provides support for handling HTTP requests and responses. It is the most commonly used base class for creating web servlets.
- Provides HTTP-specific methods such as doGet(), doPost(), doPut(), and doDelete() to handle different types of requests.
- Simplifies web application development by offering built-in support for request processing, response generation, session management, and HTTP protocol features.
10. What is GenericServlet?
GenericServlet is an abstract class in the jakarta.servlet package that provides a protocol-independent implementation of the Servlet interface. It simplifies servlet development by implementing most of the lifecycle methods.
- Supports generic request processing through the service() method and can work with different protocols, not just HTTP.
- Acts as the parent class of HttpServlet, allowing developers to focus on request handling without implementing all Servlet interface methods.
11. What is the difference between GenericServlet and HttpServlet?
GenericServlet is protocol independent while HttpServlet is protocol dependent (HTTP only).
| Feature | GenericServlet | HttpServlet | 
|---|---|---|
| Protocol Dependency | Protocol-independent | HTTP protocol–specific | 
| Key Method | Implements only service() | Provides doGet(), doPost(), doPut(), etc. | 
| Package | jakarta.servlet | jakarta.servlet.http | 
| Usage | Rarely used in web apps | Most commonly used for web applications | 
12. What is a RequestDispatcher?
A RequestDispatcher is an interface in Servlet API used to forward a request from one servlet/JSP to another resource. It also allows including the output of another resource into the current response.
- Used for forwarding request: forward(request, response)
- Used for including another resource: include(request, response)
- Helps in servlet-to-servlet or servlet-to-JSP communication
13. What is the difference between forward() and include()?
forward() transfers control completely, while include() adds output of another resource in the same response.
| Feature | forward() | include() | 
|---|---|---|
| Control Flow | Current resource stops | Current resource continues | 
| Response | Only forwarded resource output is sent | Both outputs are combined | 
| URL in Browser | Does not change | Does not change | 
| Use Case | Navigation to another page/resource | Reusing common content (header/footer) | 
14. What is sendRedirect() in servlet?
sendRedirect() is a method in Servlet API used to redirect the client to a new URL. It tells the browser to make a new request to another resource (Servlet/JSP/External website).
- Creates a new request (client-side redirection)
- URL changes in the browser
- Can redirect to another server/domain (example: Google, payment gateway)
15. What is the difference between forward() and sendRedirect()?
forward() transfers the same request to another servlet/JSP inside the server without creating a new request and sendRedirect() sends the response back to the browser and asks it to make a new request to a new URL.
| Feature | forward() | sendRedirect() | 
|---|---|---|
| Type | Server-side forwarding | Client-side redirection | 
| Request | Same request object | New request object | 
| URL Change | URL does not change | URL changes in browser | 
| External Redirect | Not possible (same server only) | Possible (can go to another site) | 
16. What is ServletConfig?
ServletConfig is an interface in Servlet API used to get initialization parameters and configuration details for a specific servlet. It is created by the container and provided to the servlet during init().
- Stores servlet-specific init parameters (from web.xml or annotations)
- Available only for one servlet
- Used to read config values using getInitParameter()
17. What is ServletContext?
ServletContext is an interface in Servlet API that provides application-level information shared by all servlets in a web application. It is created once per application by the container.
- Shared across all servlets in the same web app
- Used to store and read global attributes
- Used to get app info like getRealPath(), getInitParameter()
18. What is session in servlet?
A session is a way to store user-specific data on the server so the application can remember the user across multiple requests. It helps maintain state because HTTP is stateless by default.
- Created using request.getSession()
- Stores data like userId, username, cart items, etc.
- Each user gets a unique session ID
19. How do you create a session in servlet?
A session is created in a servlet using the HttpSession object, which is obtained from the request. If a session does not already exist, the container automatically creates a new one.
HttpSession session = request.getSession();
Creates a new session if not present. Session data is stored using:
session.setAttribute()
20. What is the difference between session and cookie?
A Session stores user data on the server-side, while a Cookie stores small data on the client-side (browser). Both are used to maintain user information between multiple requests.
| Feature | Session | Cookie | 
|---|---|---|
| Stored In | Server-side | Client-side (Browser) | 
| Security | More secure | Less secure (can be modified) | 
| Data Size | Large (depends on server) | Small (around 4KB) | 
| Lifetime | Ends on timeout/logout | Ends on expiry time set | 
21. What is a Cookie in servlet?
A Cookie is a small piece of data stored in the user’s browser that helps the server identify the user across multiple requests. It is commonly used for tracking, login sessions, and remembering user preferences.
Cookie Created using:
Cookie cookie = new Cookie("name","value");
Cookie sent to browser using:
response.addCookie(cookie)
Cookie read using:
request.getCookies()
22. How do you delete a cookie in servlet?
A cookie is deleted by setting its value as empty and its maximum age to 0, then sending it again to the browser. This tells the browser to remove that cookie.
Set cookie:
cookie.setMaxAge(0);
Add again cookie:
response.addCookie(cookie);
23. What is URL Rewriting?
URL Rewriting is a technique used to maintain session tracking by adding the session ID or extra data directly into the URL. It is mainly used when cookies are disabled in the browser.
- Session ID is appended to URL
- Used when cookies are not available
- Helps in session tracking across multiple requests
24. What is hidden form field in servlet?
A hidden form field is an input field in HTML that is not visible to the user but is used to send extra data from client to server along with the form submission.
- Written as: <input type="hidden" name="id" value="101">
- Used for passing data like userId, token, page info, etc.
- Works only when the form is submitted
25. What are Servlet Filters?
Servlet Filters are components in Servlet API used to intercept requests and responses before they reach a servlet or after they leave it. They are mainly used for common tasks like logging, authentication, and input validation.
- Executes before and after servlet using doFilter()
- Used for authentication, logging, compression, etc.
- Configured using web.xml or @WebFilter
26. What are Servlet Listeners?
Servlet Listeners are components in Servlet API that listen to events in a web application, like session creation, session destruction, and context loading. They are used to perform tasks automatically when these events occur.
- Used for resource initialization and cleanup (DB connection, logging setup)
- Can track attribute changes using ServletContextAttributeListener / HttpSessionAttributeListener
- Helpful for application monitoring like active users count, session timeout tracking
27. What is the use of web.xml in servlet?
web.xml is the deployment descriptor file used to configure servlets, mappings, filters, listeners, and other settings in a Java web application. It tells the server how to load and run web components.
- Used to map servlet URL patterns (<servlet-mapping>)
- Used to configure filters, listeners, and init parameters
- Defines welcome files, error pages, and session timeout
28. What is the difference between web.xml and @WebServlet annotation?
web.xml is an XML-based configuration file used to define servlets and mappings manually and @WebServlet is an annotation-based approach used to configure servlets directly inside the Java class.
| Feature | web.xml | @WebServlet | 
|---|---|---|
| Configuration Type | XML-based (external file) | Annotation-based (inside class) | 
| Ease of Use | More lengthy | Simple and faster | 
| Changes | Requires editing XML | Just update Java code | 
| Best For | Large apps with centralized config | Small/medium apps with clean setup | 
29. What do you mean by Servlet chaining?
Servlet chaining is a process where one servlet passes the request to another servlet to continue processing. It helps multiple servlets work together to generate a final response.
- Done using RequestDispatcher.forward() or RequestDispatcher.include()
- Useful for step-by-step processing (example: login -> validation -> dashboard)
- Helps in separating logic into multiple servlets
30. How can a servlet get information about the client machine?
A servlet can get information about the client machine using the HttpServletRequest object. It provides methods to read details like client IP address, browser type, operating system, and request headers.
Client IP address:
request.getRemoteAddr()
Browser and OS details:
request.getHeader("User-Agent")
Client host name:
request.getRemoteHost()
31. Explain the Single-Thread Model in servlets.
Single-Thread Model in servlets is an old mechanism where the servlet container allows only one request at a time for a servlet instance. It was used to avoid thread-safety issues in servlets.
- Only one thread can access the servlet at a time
- Reduces performance because requests are processed one by one
- Deprecated/removed in modern Servlet API (not recommended)
32. What is the javax.servlet package?
javax.servlet is a package that provides the core classes and interfaces required to build servlets in Java. It contains the basic servlet APIs like Servlet, ServletRequest, ServletResponse, ServletConfig, and ServletContext.
- Provides the core servlet interfaces and classes
- Used for building server-side web applications
- In newer versions, it is replaced by jakarta.servlet

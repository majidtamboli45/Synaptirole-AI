# Servlet: Request, Response, and Session

> Source: https://www.geeksforgeeks.org/advance-java/servlet-request-response-and-session/

Servlet is a server-side technology that runs on a web server. They are used to handle the client request obtained from the web server, process that request, generate the response and then send the response back to the web server.
Responsibilities of Servlets are as follows:
- Servlets work on the server-side
- It is used to handle client requests and generate a corresponding response.
- Managing request dispatching (e.g., forwarding that request to another servlet).
Servlet Architecture
Execution of Servlet:
- The client sends an HTTP request using an HTTP method.
- The web server receives the request and process that request.
- The web server passes the request to the corresponding servlet.
- The servlet processes the request and generates the corresponding response in the form of output.
- The servlet container send the generated response to the web server.
- And the web server returns the response to the client.
1. HttpServletRequest
The HttpServletRequest is an interface that extends the ServletRequest interface. It is used to handle client requests. and it is used to access and manage the form data.
Example:
public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException  {
String sname = req.getParameter("name"); 
String spass= req.getParameter("pass");
//These lines extract the values of the input fields with names like name and pass from the form.
}
Methods of HttpServletRequest
1. getParameter(): The getParameter() method is used to retrieve form data that was sent to the server using http request method like get and post.
String user = request.getParameter("username");
String pass = request.getParameter("password");
2. getRequestDispatcher(): This method is used to dispatching a request from one servlet to another servlet.
RequestDispatcher rd = request.getRequestDispatcher("nextservlet");
rd.forward(request, response);
3. getMethod(): This method belongs to the HttpServletRequest interface and it is used to find out which HTTP method was used by the client for a request.
String m1= request.getMethod();
if (m1.equals("post")) {
 // handle form submission
} else if (m1.equals("GET")) {
// handle page display
}
4. getRequestURI(): It is method of HttpServletRequest Interface. used to retrieve the part of the URL that represents the requested resource’s path, excluding the query string.
String uri = request.getRequestURI();
System.out.println(uri);
2. HttpServletResponse
HttpServletResponse is an interface used to send responses from the server back to the client. Its core responsibilities include:
- Writing response data (HTML, JSON, files, etc.)
- Setting response headers and status codes
- Defining the response content type (e.g., text/html, application/json)
Example:
public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException {
  resp.setContentType("text/html"); // it is html file.  
 String name = req.getParameter("name"); 
 }
Methods of HttpServletResponse
1. setContentType(String type): This method set the content type of client response..
response.setContentType("text/html");
2. setStatus(int statusCode): It is used to set the HTTP status code.
public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException { 
resp.setStatus(302); 
}
3. sendRedirect(String location): The sendRedirect method is used to dispatching a request to a different resource like servlet or jsppage..
response.sendRedirect("anotherServlet"); // Redirects to anotherservlet
response.sendRedirect("https://www.facebook.com/"); // Redirects to an external URL
4. addCookie(): The addCookie() method is used to send a cookie from the web server to the client.
Cookie userCookie = new Cookie("username", "vishnu");
response.addCookie(userCookie); // Adds the cookie to the response object
3. HttpSession
HttpSession is an interface that allows the server to store user-specific data and maintain state across multiple HTTP requests.
Use of HttpSession:
HttpSession session = request.getSession();//it return the  current session.
session.setAttribute("user", username);
Methods of HttpSession
1. getSession(): This method used to fetch the HttpSession object. If the request does not have a session, then a new session object is created.
HttpSession s = request.getSession(); // used to Gets or creates a session
s.setAttribute("username", "vishnu"); // it Stores the data in the session object
2. setAttribute(String name, Object value): It is used to set/store an attribute in the session scope of one servlet.
HttpSession session = request.getSession();
session.setAttribute("user", "vishnu"); // Stores user in session
3. getAttribute(String name): It is used to retrieve an attribute from session scope.
HttpSession session = request.getSession();
String name = (String) session.getAttribute("name");
4. invalidate(): It is used for end the session object.
HttpSession session = request.getSession();
session.invalidate(); // Ends the session

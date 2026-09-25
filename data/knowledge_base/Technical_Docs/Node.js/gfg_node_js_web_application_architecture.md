# Node.js Web Application Architecture

> Source: https://www.geeksforgeeks.org/node-js/node-js-web-application-architecture/

Node.js is a JavaScript-based platform mainly used to create I/O-intensive web applications such as chat apps, multimedia streaming sites, etc. It is built on Google Chrome’s V8 JavaScript engine.
Web Applications
A web application is software that runs on a server and is rendered by a client browser that accesses all of the application's resources through the Internet.
A typical web application consists of the following components:
- Client: A client refers to the user interacting with the server by sending out requests.
- Server: The server is responsible for receiving client requests, performing appropriate tasks, and returning results to the clients. It bridges the front end and the stored data, allowing clients to perform operations on the data.
- Database: A database is where a web application's data is stored. The data can be created, modified, and deleted depending on the client's request.
VPS servers offer base capabilities and environments to integrate Node.js apps with developer tools and APIs.
Node.js Server Architecture
Node.js Server Architecture: To manage several concurrent clients, Node.js employs a “Single Threaded Event Loop" design. The JavaScript event-based model and the JavaScript callback mechanism are employed in the Node.js Processing Model.
It employs two fundamental concepts:
- Asynchronous model
- Non-blocking of I/O operations
These features enhance the scalability, performance, and throughput of Node.js web applications.
Components of the Node.js Architecture
- Requests: Depending on the actions that a user needs to perform, the requests to the server can be either blocking (complex) or non-blocking (simple).
- Node.js Server: The Node.js server accepts user requests, processes them, and returns results to the users.
- Event Queue: The main use of Event Queue is to store the incoming client requests and pass them sequentially to the Event Loop.
- Thread Pool: The Thread pool in a Node.js server contains the threads that are available for performing operations required to process requests.
- Event Loop: Event Loop receives requests from the Event Queue and sends out the responses to the clients.
- External Resources: In order to handle blocking client requests, external resources are used. They can be of any type ( computation, storage, etc).
Workflow of Node.js Server Architecture
- Users send requests (blocking or non-blocking) to the server for performing operations.
- The requests enter the Event Queue first at the server-side.
- The Event queue passes the requests sequentially to the event loop. The event loop checks the nature of the request (blocking or non-blocking).
- Event Loop processes the non-blocking requests which do not require external resources and returns the responses to the corresponding clients
- For blocking requests, a single thread is assigned to the process for completing the task by using external resources.
- After the completion of the operation, the request is redirected to the Event Loop which delivers the response back to the client.
Advantages of Node.js Server Architecture
- The Node.js server can efficiently handle a high number of requests by employing the use of Event Queue and Thread Pool.
- There is no need to establish multiple threads because Event Loop processes all requests one at a time, therefore a single thread is sufficient.
- The entire process of serving requests to a Node.js server consumes less memory and server resources since the requests are handled one at a time.
Disadvantages of Node.js Server Architecture
here are the disadvantages of Node.js server architecture in a more concise format:
- Single-Threaded: Limited to one thread; can be a bottleneck for CPU-intensive tasks.
- Callback Hell: Complex nesting of callbacks can lead to hard-to-maintain code.
- Performance Bottlenecks: Not optimal for heavy computational tasks due to non-blocking I/O model.
- Dependency on Outside Libraries: Heavy reliance on third-party libraries can impact stability and security.
- Inconsistent API: Frequent API changes can lead to backward compatibility issues.
- Lack of Strong Typing: JavaScript’s lack of strong typing can lead to runtime errors and bugs.

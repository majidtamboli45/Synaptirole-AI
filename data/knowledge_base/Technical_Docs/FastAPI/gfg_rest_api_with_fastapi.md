# REST API with FastAPI

> Source: https://www.geeksforgeeks.org/python/rest-api-with-fastapi/

FastAPI, a modern Python framework, makes building REST APIs easier with high performance, built-in validation and interactive documentation. REST (Representational State Transfer) is an architectural style for designing web services. It defines a set of principles that make communication between clients and servers simple, standardized and scalable.
Key Concepts of REST
1. Resources as data: Information is organized into resources (such as users, products or documents).
2. Unique URLs (endpoints): Each resource is identified and accessed through a specific URL.
3. Standard HTTP methods: Operations on resources are performed using well-defined methods:
- GET: Retrieve data
- POST: Create new data
- PUT: Update existing data
- DELETE: Remove data
REST ensures stateless communication, meaning each request from client contains all the information needed to process it, without relying on previous interactions. This makes REST services reliable, scalable and widely used for web APIs.
Example: Making a POST Request
@app.post() decorator is used to define a POST endpoint. The general syntax looks like this:
@app.post("/endpoint")
def function_name(data: dict):
    return {"message": "Success", "data": data}
Explanation:
- @app.post("/endpoint"): Defines a POST route at given URL (here, /endpoint).
- function_name(data: dict): function handles the request, parameter data: dict means endpoint expects JSON data from the client.
- return {}: function returns a JSON response back to the client.
Now, if a client sends a request like this:
{
  "name": "Mary",
  "age": 25
}
The server will respond with:
{
  "message": "Success",
  "data": { "name": "Mary",  "age": 25 }
}
- "message" confirms the resource was created.
- "data" shows the same data client sent.
Types of REST APIs
REST APIs can be grouped into different types based on who can use them and how they are designed:
- Open APIs (Public APIs): These are publicly available for anyone to use. They allow external developers or users to access certain data or services. Often used to share information like weather updates, exchange rates or news feeds.
- Internal APIs (Private APIs): Accessible only within an organization. They are not exposed to public and are meant to improve internal workflows. Commonly used for internal systems such as employee management, finance or inventory tools.
- Partner APIs: Shared between specific business partners or organizations. Access is controlled and requires proper authentication or agreements. Often used in cases like payment gateways, shipping integrations or vendor collaborations.
- Composite APIs: Combine multiple API requests into a single call. Useful when a client needs data from different services at once. For example, a travel booking system may fetch flight, hotel and car rental details in one request.
REST API with FastAPI
FastAPI is a web framework for Python that makes building REST APIs simple. It combines speed, ease of use and helpful built-in features that make it popular among developers. Here’s why FastAPI stands out for REST API development:
- High Performance: Built on Starlette for handling web requests and Pydantic for data validation, making it extremely fast.
- Developer-Friendly: Automatically checks data types and validates inputs, reducing errors and saving time.
- Interactive Documentation: Generates API documentation automatically at /docs (Swagger UI) and /redoc, so developers can test and explore endpoints with no extra setup.
With just a few lines of code, anyone can create a fully functional REST API. FastAPI keeps things simple for beginners while still offering advanced features for production use.
Example: Simple GET API in FastAPI
This code creates a simple FastAPI app with one GET endpoint at /hello that returns a welcome message. Save file as main.py to run it later.
from fastapi import FastAPI
# Create a FastAPI app instance
app = FastAPI()
# Simple GET endpoint
@app.get("/hello")
def say_hello():
    return {"message": "Hello, welcome to FastAPI!"}
Explanation:
- app = FastAPI(): Creates a new FastAPI application.
- @app.get("/hello"): Defines a GET endpoint at /hello.
- say_hello(): Function that runs when someone visits /hello.
- Return value: Sent back to the client as JSON.
Before executing code, ensure FastAPI and Uvicorn are installed. Run this command in your terminal:
pip install "fastapi[standard]"
Open your terminal (or command prompt) in the same folder and type:
uvicorn main:app --reload
- main: file name (main.py) without .py
- app: FastAPI instance (app = FastAPI())
- --reload: Restarts server automatically when you change the code
If it works, you’ll see something like this in the terminal:
Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
Now, copy the URL shown in terminal and add /hello at the end, since that’s the endpoint we created. For example:
http://127.0.0.1:8000/hello
Paste the url in your browser and at last, you’ll see below JSON response:
REST API vs Other APIs
While REST is one of the most popular styles, there are other approaches to building APIs. Each has its own strengths depending on the use case:
- SOAP (Simple Object Access Protocol): Uses XML as message format. Has very strict standards and built-in features like security and transaction handling. Reliable but heavy, often used in enterprise applications (e.g., banking, finance).
- GraphQL: Allows clients to request exactly the data they need, no more and no less. Reduces multiple API calls by combining queries into one request. Great for modern web and mobile apps where flexibility is important.
- gRPC (Google Remote Procedure Call): Uses Protocol Buffers (binary format), making it extremely fast and efficient. Designed for real-time communication between microservices. Works best in large distributed systems where performance is critical.
Why REST?
REST is simple, widely supported and easy to understand. It works seamlessly over HTTP and is ideal for both beginners and large-scale applications. That’s why it has become the most common choice for building APIs today.
Features
REST APIs are widely used because they follow a set of strong design principles that make them reliable and efficient:
- Stateless: Each request from client must contain all the information needed to process it. The server does not store any client state between requests, which makes system simpler and more scalable.
- Scalable: Since server does not need to manage sessions, it can handle a large number of clients efficiently. This makes REST APIs suitable for applications that serve millions of users.
- Uniform Interface: A consistent way to access resources using standard HTTP methods (GET, POST, PUT, DELETE). This ensures that different clients (web, mobile, IoT devices) can interact with the API in the same way.
- Cacheable: Responses from the server can be cached by clients or intermediaries. This reduces repeated calls to the server, improving performance and reducing load.
- Layered System: The client does not need to know the internal structure of the server. REST APIs can use multiple layers (like load balancers, security layers or proxy servers) without affecting how the client interacts with the service.
Real-World Examples
REST APIs power many of the applications we use every day:
- Social Media: Retrieving posts, likes and comments in apps like Instagram or Twitter.
- Online Payments: Services like Stripe or PayPal process secure transactions through REST APIs.
- E-commerce: Managing shopping carts, product listings and order tracking.
- Weather Services: Delivering real-time weather updates and forecasts to apps.
Whenever an app communicates with the internet to fetch or send data, a REST API is usually at work behind the scenes.

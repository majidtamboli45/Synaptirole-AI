# Custom Middlewares in FastAPI

> Source: https://www.geeksforgeeks.org/python/custom-middlewares-in-fastapi/

Custom middleware in FastAPI allows injecting logic before and after every request, helping handle cross-cutting concerns like logging, authentication, and response modification without repeating code in each route.
Why use custom middleware?
- Avoid repetition by centralizing shared logic
- Ensure consistent behavior across all routes
- Improve observability with logging and metrics
- Enforce policies like validation or request blocking
Middleware Execution Flow
To understand custom middleware better, let’s look at the order in which it runs during a request and response cycle.
- Request path: middlewares are executed in the same order they’re defined (from top to bottom) before request reaches the route handler.
- Response path: once the route sends back a response, middlewares are triggered again, but this time in reverse order (from bottom to top).
- Exceptions: if something goes wrong inside a route, the error flows back through middlewares, giving them a chance to log it, handle it or even transform the response.
Adding Custom Middleware
In FastAPI, custom middleware can be added using the @app.middleware("http") decorator. It allows executing logic before and after each request without repeating code in every route.
Basic Syntax:
@app.middleware("http")
async def custom_middleware(request: Request, call_next):
    # Code before request reaches the route
    response = await call_next(request)
    # Code after response is generated
    return response
- request: incoming HTTP request (method, path, headers, body, etc.).
- call_next(request): forwards request to the next step (another middleware or the route) and returns a response.
- response: object that you can inspect or modify before sending it back to the client.
Creating Custom Middleware
Example 1: This code defines a custom middleware that logs before and after each request, then forwards it to the route.
from fastapi import FastAPI
from fastapi.requests import Request
app = FastAPI()
# Custom middleware
@app.middleware("http")
async def demo_mw(request: Request, call_next):
    print("Middleware, Before request")
    response = await call_next(request)  # Pass request to the next process
    print("Middleware, After response")
    return response
# A test route
@app.get("/")
def home():
    return {"message": "Hello, FastAPI with Middleware!"}
Output:
The terminal displays:
Middleware, Before request
Middleware, After response
This shows middleware runs around every request.
Explanation:
- @app.middleware("http"): Declares a middleware for all HTTP requests.
- request: Represents incoming request.
- call_next(request): Forwards request to the actual route (/ in this case).
Example 2: This code defines a logging_middleware that measures request time and logs the method, URL, and duration before returning the response.
import time
from fastapi import FastAPI, Request
app = FastAPI()
@app.middleware("http")
async def logging_middleware(request: Request, call_next):
    start_time = time.time()  # Record start time
    response = await call_next(request)  # Process request
    process_time = time.time() - start_time  # Calculate duration
    print(f"Request: {request.method} {request.url} completed in {process_time:.4f} seconds")
    return response
@app.get("/hello")
def hello():
    return {"message": "Hello World"}
Output:
And in the terminal:
Request: GET http://127.0.0.1:8000/hello completed in 0.0009 seconds
It means middleware logged that a GET request was made to /hello and server took 0.0009 seconds to process and return the response.
Explanation:
- time.time(): Records the current time before the request is processed.
- request.method: Shows method like GET/POST.
- request.url: Shows which URL was requested.
Example 3: This code defines a middleware that adds an X-Custom-Header to every response, eliminating the need to set it in each route.
from fastapi import FastAPI, Request
app = FastAPI()
@app.middleware("http")
async def add_custom_header(request: Request, call_next):
    response = await call_next(request)  # process the request
    response.headers["X-Custom-Header"] = "This is a custom header"
    return response
# Sample route
@app.get("/hello")
def say_hello():
    return {"message": "Hello from FastAPI!"}
Output:
Open Developer Tools → go to the Network tab → select the /hello request → check the Response Headers section to see the custom header added by the middleware.
Explanation:
- @app.middleware("http"): Defines middleware for all HTTP requests.
- add_custom_header(): Runs before/after every request.
- call_next(request): Passes request to the next step (actual route).
- response.headers[]: Adds a new header to the response.
To understand Middlewares, refer this article: Middlewares in FastAPI

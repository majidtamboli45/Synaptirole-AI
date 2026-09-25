# Middlewares in FastAPI

> Source: https://www.geeksforgeeks.org/python/middlewares-in-fastapi/

A middleware is a piece of code that runs before the request reaches your endpoint and again after response is sent back. It:
- Inspect or modify the incoming request.
- Add extra processing like logging, authentication and compression.
- Adjust or monitor outgoing response.
Middlewares can be categorixed into two types:
- Built-in Middlewares
- Custom or User-defined Middlewares
Built-in Middlewares in FastAPI
1. CORSMiddleware (Cross-Origin Resource Sharing)
When the frontend and FastAPI backend run on different domains or ports, browsers block requests due to CORS policy. CORS Middleware allows specified domains to access the API, enabling seamless communication between frontend and backend.
Example: Enable CORS in FastAPI to allow the frontend to communicate with the backend without being blocked.
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI()
# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["*"], 
    allow_headers=["*"], 
)
@app.get("/")
def home():
    return {"message": "CORS enabled!"}
Output:
Now, any frontend app can also access this API without being blocked.
Explanation:
- allow_origins=["*"] allows all domains to access your API, allow_credentials=True allows cookies and authentication headers.
- allow_methods=["*"] allows all HTTP methods (GET, POST, PUT, DELETE, etc.), allow_headers=["*"] allows all headers in requests.
- @app.get("/"): Defines a simple GET route at /.
- def home(): Returns a JSON response to confirm that CORS is enabled.
- Middleware is added using app.add_middleware()
2. GZipMiddleware (Response Compression)
GZipMiddleware compresses responses before sending, making them smaller and faster to deliver as large API responses increase transfer time and bandwidth usage.
Example: This example shows how to use GZipMiddleware to compress large responses automatically, saving bandwidth.
from fastapi import FastAPI
from fastapi.middleware.gzip import GZipMiddleware
app = FastAPI()
# Adding GZip middleware
app.add_middleware(GZipMiddleware, minimum_size=1000)
@app.get("/large-data")
def get_data():
    return {"data": "x" * 2000}  # A large response
Output:
When you open /large-data, server compresses the response before sending it. The browser automatically decompresses it and shows:
Explanation:
- minimum_size=1000: Only responses larger than 1000 bytes will be compressed (to avoid unnecessary overhead on small responses).
- @app.get("/large-data"): Defines an API endpoint /large-data.
- return {"data": "x" * 2000}: Returns a large JSON response (~2000 characters). Since it’s bigger than 1000 bytes, it will be compressed automatically before sending to the client.
3. TrustedHostMiddleware (Restrict Allowed Hosts)
Allowing all hosts in production is insecure. TrustedHostMiddleware restricts access to specified hostnames, blocking others and protecting against Host Header attacks
Example: This example uses TrustedHostMiddleware to restrict access to specific hostnames.
from fastapi import FastAPI
from fastapi.middleware.trustedhost import TrustedHostMiddleware
app = FastAPI()
# Allow only these hosts
app.add_middleware(TrustedHostMiddleware, allowed_hosts=["example.com", "localhost"])
@app.get("/")
def home():
    return {"message": "Only trusted hosts can access this!"}
Output:
If you open using http://127.0.0.1:8000/, you get Invalid Host header (because 127.0.0.1 is not in the allowed_hosts).
The Invalid Host Header error is expected and proves that TrustedHostMiddleware is working correctly. If you also want to allow 127.0.0.1, just add it to the list like this:
allowed_hosts=["example.com", "localhost", "127.0.0.1"]
Explanation:
- app.add_middleware(): Adds TrustedHostMiddleware to the app. Only requests from example.com or localhost will be allowed and any request from a different host will be rejected.
- @app.get("/"): Defines a simple route at the root /.
- def home(): Returns a JSON response if the request comes from an allowed host.
4. HTTPSRedirectMiddleware (Force HTTPS)
In production, HTTP is insecure. HTTPSRedirectMiddleware automatically redirects all HTTP requests to HTTPS, ensuring secure and encrypted communication.
Example: This example shows how to use HTTPSRedirectMiddleware to automatically redirect all HTTP requests to HTTPS for better security.
from fastapi import FastAPI
from fastapi.middleware.httpsredirect import HTTPSRedirectMiddleware
app = FastAPI()
# Redirect HTTP -> HTTPS
app.add_middleware(HTTPSRedirectMiddleware)
@app.get("/")
def home():
    return {"message": "You are redirected to HTTPS!"}
Output:
When you run this code locally, you’ll see warnings like:
WARNING: Invalid HTTP request received.
This happens because your local server is only running on HTTP and doesn’t have HTTPS configured. That’s normal nothing is wrong.
In a real production setup (with HTTPS enabled), this middleware automatically redirects all incoming HTTP requests to HTTPS, so users always connect securely. For example:
http://example.com -> redirects to -> https://example.com
And then you’ll see the response:
{"message": "You are redirected to HTTPS!"}
Explanation:
- app.add_middleware(HTTPSRedirectMiddleware): Adds middleware so that any incoming HTTP request is automatically redirected to HTTPS.
- @app.get("/"): Defines a simple GET endpoint at the root URL (/).
- def home(): Returns a JSON response after the redirection happens.
Middleware vs Dependencies in FastAPI
When building a FastAPI application, you may wonder whether to use middleware or dependencies for certain logic. The choice depends on the scope of what you want to apply:
Use Middleware when logic should run for every request and response globally, regardless of which route is called.
Examples:
- Enabling CORS so any frontend can communicate with the backend.
- Redirecting all HTTP traffic to HTTPS.
- Compressing large responses to save bandwidth.
Use Dependencies when logic is needed only for specific routes or endpoints, not whole application.
Examples:
- Checking authentication or user roles only on protected endpoints.
- Validating query parameters for a single route.
- Applying business logic that differs between APIs.
Best Practices
- Use built-in middleware for common tasks instead of writing your own from scratch.
- Add only what you really need too many middlewares can slow down performance.
- Configure options carefully (e.g., don’t use allow_origins=["*"] in production).
- Always add security-related middleware (like HTTPS redirect) when deploying.

# FastAPI Templates

> Source: https://www.geeksforgeeks.org/python/fastapi-templates/

FastAPI does not include built-in HTML template rendering like Flask or Django. However, template engines can be integrated easily. The options used are Jinja and Mako. Jinja is used here due to its widespread adoption.
Steps to Integrate Templates
Step 1: Installing Jinja library
Install the jinja library using below command in cmd or terminal:
pip install Jinja2
Step 2: Create Templates and Static Directory.
Create a directory named Templates in your project. This is where HTML templates will reside.
Step 3: Using Jinja2 Template Engine to Create FastAPI.
Create a file name main.py. Below code sets up a web application that serves static files, uses Jinja2 templates for rendering HTML pages and responds to the root URL ("/") with an HTML page that displays the message "Hello, World!"
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse(request, "index.html", {"message": message})
Step 4: Creating a HTML Template
Write HTML templates in templates/index.html.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FastAPI Template</title>
</head>
<body>
      <h1>Geeks for Geeks</h1>
    <h1>{{ message }}</h1>
</body>
</html>
Step 5: Run FastAPI Application.
uvicorn main:app --reload
Visit http://localhost:8000 in your browser and you should see "Hello, World!" displayed on the page.
Templates with Static Files
Now, integrate Static files that includes CSS style sheets. For this make little changes in HTML templates as shown below and use url_for() function for integrating static files.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FastAPI Template</title>
      <link href="{{ url_for('static', path='/styles.css') }}" rel="stylesheet">
</head>
<body>
      <h1>Geeks for Geeks </h1>
    <h1>{{ message }}</h1>
</body>
</html>
In this example, it would link to a CSS file at static/styles.css with:
h1 {
    color: red;
}
Run the FastAPI Application.
uvicorn main:app --reload
Visit http://localhost:8000 in your browser, and you should see "Hello, World!" displayed on the page.
Output
If-else Statements
To add an "if-else" statement to your main.py file, we can include it in our jinja template (index.html) and pass the necessary variables from our FastAPI route.
Step 1: Update main.py
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    message = "Hello"
    return templates.TemplateResponse(request, "index.html", {"message": message})
In this code, we've added a message variable in the "read_root" route. Depending on its value, the if-else block in the Jinja template will render different content.
Step 2: Including if-else condition
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FastAPI Template Example</title>
    <link rel="stylesheet" href="/static/style.css"> <!-- Link to your CSS file -->
</head>
<body>
{% if message == "Hello" %}
    <p>Welcome to the FastAPI application!</p>
{% else %}
    <p>Message: {{ message }}</p>
{% endif %}
</body>
</html>
In this example, we've added an if-else block that checks if the message variable is equal to "Hello". Depending on the condition, it will display different content.
Output
Conditional loop
Jinja templates support loop constructs like for to dynamically render repeated content. This allows to iterate over data passed from the backend and display it efficiently in HTML.
Step 1: Update main.py to send parameters that has to be iterated
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    message = "Hello World!!!!"
    return templates.TemplateResponse(request, "index.html", {"message": message})
Step 2: Add For statement in Jinja template
In this modified "index.html" file, we've added a for loop using "{% for i in range(5) %}" which will loop five times. In each iteration, it will print the value of the "message" variable.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FastAPI Template Example</title>
    <link rel="stylesheet" href="/static/style.css"> <!-- Link to your CSS file -->
</head>
<body>
{% for i in range(5) %}
    <p>{{ message }}</p>
{% endfor %}
</body>
</html>
Output

# Django Basics

> Source: https://www.geeksforgeeks.org/python/django-basics/

Django is a Python-based web framework that makes it easier to build secure, scalable and maintainable web applications. It takes care of tasks like database handling, user authentication, and routing so developers can focus on features instead of boilerplate code. It comes with many built-in features like user authentication, an admin panel and form handling.
- It follows the principle of DRY (Don’t Repeat Yourself).
- Manages both backend logic and frontend rendering.
- Enables quick creation of complete web applications.
- Auto-generates an admin panel for easy data management.
- Works seamlessly with SQLite, MySQL, and PostgreSQL.
- Efficiently handles growing traffic and application size.
Django Architecture and Working
Django is based on MVT (Model-View-Template) architecture. MVT is a software design pattern for developing a web application. It's structure has the following three parts :
- Model: Acts as the data interface. It defines the structure of your data and is usually backed by a database (e.g., MySQL, PostgreSQL).
- View: A Python function or class that handles web requests. It interacts with the Model and renders a response, typically by passing data to a Template.
- Template: Contains static HTML mixed with Django’s templating syntax. Templates are used to display dynamic data on the web page.
Below is a detailed diagram of how Django operates and interacts with web server:
- Browser Sends Request: The browser sends an HTTP request to the web server (e.g., typing http://127.0.0.1:8000/).
- Web Server Receives It: The server (like Nginx or Apache) serves static files directly or forwards other requests to a WSGI/ASGI server such as Gunicorn or Daphne.
- Request Reaches Django: The Web Server Gateway Interface (WSGI)/Asynchronous Server Gateway Interface (ASGI) server converts the request into a Python-friendly format and passes it through Django’s middleware before it reaches your app.
- URL Routing: Django checks urls.py to find the correct view function for the request, turning it into an HttpRequest object.
- View Handles Logic: The view processes the request - querying the database, rendering templates, or returning data (like JSON).
- Response Created: The view returns an HttpResponse object, which Django converts into an HTTP response.
- Response Sent to Browser: The response passes back through the server and is displayed by the browser as a web page.
Installing Django
Follow these steps to set up Django on your system:
1. Install Python 3:
Download and install the latest Python 3 version from the official website.
2. Install pip:
Pip comes with recent versions of Python. Open the command prompt and run:
- Windows (PowerShell):
pip --version
- MacOS/Linux:
pip3 --version
3. Set Up a Virtual Environment:
This isolates your project’s dependencies.
- Windows (PowerShell):
python -m venv venv
- MacOS/Linux:
python3 -m venv venv
This creates a virtual environment folder named venv. The folder can have any name.
4. Activate the Environment:
- Windows (PowerShell):
.\venv\Scripts\activate
- MacOS/Linux:
source venv/bin/activate
5. Install Django:
With your virtual environment active, run:
pip install django
"Hello, Geeks!" in Django
To display a simple "Hello, Geeks!" message in the browser, start by creating a views.py file in your app directory. It defines how Django responds to an incoming request.
from django.http import HttpResponse
def home(request):
    return HttpResponse("<h1>Hello, Geeks!</h1>")
Next, configure urls.py to route the incoming URL to this view. The URL configuration maps a specific URL path to the corresponding view function so Django knows what code to execute when a user visits that URL.
In urls.py:
from django.urls import path
from . import views
urlpatterns = [
    path("", views.home, name="home"),
]
Output: Visiting development server at "http://localhost:8000/" will display:
Hello, Geeks!
In this example:
- The view (home) handles the request and returns a response.
- The URLconf (urls.py) maps / to the view.
- Django sends the response back as HTML to the browser.

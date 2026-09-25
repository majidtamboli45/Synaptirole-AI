# Handling HTML Forms in Django: GET and POST Methods

> Source: https://www.geeksforgeeks.org/python/render-html-forms-get-post-in-django/

Handling HTML forms is a fundamental part of web development. In Django, forms allow users to submit data to the server for processing, whether saving it to a database or retrieving information, while leveraging Django’s built-in form handling capabilities.
HTML Form
An HTML form is a collection of input elements wrapped inside <form>...</form> tags. Forms let users:
- Enter text
- Select options
- Interact with checkboxes, radio buttons, or dropdowns
- Submit data to the server for processing
The server then handles this data, often involving database operations or custom logic. Django fully supports HTML forms and simplifies both rendering and processing of form data using views.
Understanding GET and POST Methods
1. GET Method
- Appends form data to the URL as query parameters.
- Ideal for search forms or filters, where data retrieval doesn’t modify the server state.
Example url:
https://docs.djangoproject.com/en/5.2/search/?q=forms
2. POST Method
- Sends form data in the HTTP request body.
- Used when submitting data that modifies the server, like updating a database.
- Requires CSRF protection in Django using {% csrf_token %}.
Rendering a Simple HTML Form in Django
Consider a project named 'geeksforgeeks' having an app named 'geeks'.
Step 1: Create the HTML Form
Create home.html in geeks/templates/:
<form action="" method="GET">
    <label for="your_name">Your name: </label>
    <input id="your_name" type="text" name="your_name">
    <input type="submit" value="OK">
</form>
This form will send data using the GET method when submitted.
Step 2: Configure URLs
In geeks/urls.py:
from django.urls import path
from .views import home_view
urlpatterns = [
    path('', home_view),
]
Step 3: Create the View
In geeks/views.py:
from django.shortcuts import render
def home_view(request):
    return render(request, "home.html")
Step 4: Run the Server
python manage.py runserver
Handling GET Request Data in Views
Submitting the form will append data to the URL, which can be accessed in the view using request.GET.
from django.shortcuts import render
def home_view(request):
    print(request.GET)  # Prints the submitted data as a QueryDict
    return render(request, "home.html")
After entering a name and submitting the form, the data will be printed in the terminal:
request.GET returns a QueryDict object. While it behaves similarly to a Python dictionary, it is specifically designed to handle multiple values for the same key. For example, to retrieve a single value, you use .get(), but to retrieve a list of multiple values for one key, you must use the .getlist() method.
Handling POST Requests
To use POST instead of GET, modify form in home.html:
<form action="" method="POST">
    {% csrf_token %}
    <label for="your_name">Your name: </label>
    <input id="your_name" type="text" name="your_name">
    <input type="submit" value="OK">
</form>
Django requires the {% csrf_token %} template tag inside all POST forms for security to prevent Cross-Site Request Forgery attacks.
Update the View to Handle POST Data
Modify view to handle POST data:
from django.shortcuts import render
def home_view(request):
    if request.method == "POST":
        print(request.POST)  # Prints the POSTed data as a QueryDict
        name = request.POST.get('your_name')
    return render(request, "home.html")
Submit the form it shows the data:
This way one can use this data for querying into the database or for processing using some logical operation and pass using the context dictionary to the template.
HTML Forms vs. Django Forms
| HTML Forms | Django Forms | 
|---|---|
| Standard forms written in HTML using <form> tags. | Abstracted forms defined as Python classes in Django. | 
| Data handling and validation must be manually implemented in the view. | Provides built-in data validation, rendering, and handling. | 
| No direct integration with Django models. | Can be linked directly to Django models using ModelForm. | 
| Suitable for simple forms or quick prototypes. | Ideal for robust, secure, and reusable form handling. | 
| Form fields are defined in HTML with attributes like type, name, and required. | Form fields are defined in Python using Django’s forms module. |

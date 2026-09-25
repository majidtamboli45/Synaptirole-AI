# Template Inheritance in Django

> Source: https://www.geeksforgeeks.org/python/extends-django-template-tags/

Django's extends tag enables reusing a base template across multiple pages, eliminating the need to duplicate HTML code. This ensures cleaner templates, easier maintenance, and a consistent layout throughout the site. Example:
<p>This is the Home Page.</p>
{% endblock %}
Explanation:
- The {% extends %} tag tells Django that the current template should inherit the layout and structure of base.html.
- The child template can then override specific {% block %} sections defined in the parent template.
Project Structure
myproject/
│
├── myapp/
│   ├── views.py
│   └── urls.py
│
└── templates/
    ├── geeks.html
    └── extendedgeeks.html
Syntax
{% extends 'base_template.html' %}
Step 1: Create a template that defines the main structure of your page with a content block that child templates can override.
In geeks.html:
<!DOCTYPE html>
<html>
<head>
    <title>My Site</title>
</head>
<body>
    <h1>Main Template Header</h1>
    {% block content %}
    <!-- Default content can go here -->
    {% endblock %}
    <footer>
        <p>Footer information here</p>
    </footer>
</body>
</html>
Explanation: The block tag defines a replaceable section in the parent template. Child templates can override this block to provide their own content.
Step 2: Create a template that extends geeks.html and overrides the content block to provide page-specific content.
In extendedgeeks.html:
<h2>GeeksForGeeks is the Best</h2>
    <p>Welcome to the extended template example!</p>
{% endblock %}
Note: {% extends 'base.html' %} must be the very first line of code in your child template, If there's even a single space or a comment before {% extends %} tag, Django will fail to parse the inheritance correctly.
Step 3: Define a View to Render the Template
In views.py:
from django.shortcuts import render
def geeks_view(request):
    return render(request, "extendedgeeks.html")
Step 4: Add the URL path to access view.
In urls.py:
from django.urls import path
from .views import geeks_view
urlpatterns = [
    path('', geeks_view, name='geeks_home'),
]
Step 5: Find the TEMPLATES list in settings.py file and update the DIRS key to include your base directory.
# settings.py
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        # Add 'BASE_DIR / "templates"' to this list:
        'DIRS': [BASE_DIR / 'templates'], 
        'APP_DIRS': True,
        # ... rest of code
    },
]
Step 6: Make sure your virtual environment is activated, then run:
python manage.py runserver
Output
Explanation:
- {% extends "geeks.html" %} makes extendedgeeks.html inherit the layout defined in geeks.html.
- {% block content %} in geeks.html creates a placeholder that child templates can override.
- The content block in extendedgeeks.html replaces the corresponding block in the parent template.
- The geeks_view() function uses render() to render extendedgeeks.html.
- The URL pattern connects the root URL ("") to the geeks_view() function.
- The DIRS setting tells Django where to find the template files.
Using a Variable with the extends Tag
The extends Django template tag can also accept a variable instead of a hardcoded template name.
- If the variable evaluates to a string, Django treats it as the name of the parent template.
- If the variable evaluates to a Template object, Django uses that object as the parent template.
This feature allows dynamic selection of the base template at runtime, making template inheritance more flexible
Example: Here, the parent template name is passed from the view using a context variable instead of being hardcoded in the template. This allows Django to dynamically choose which template should be extended at runtime, making template inheritance more flexible and reusable.
views.py,
from django.shortcuts import render
def home(request):
    return render(
        request,
        "child.html",
        {"template_name": "geeks.html"}
    )
child.html,
<h2>Dynamic Template Inheritance</h2>
{% endblock %}
Explanation:
- Pass Template Name: The view passes the parent template name through the template_name context variable.
- Use Variable in extends: {% extends template_name %} tells Django to use the value of the variable as the parent template.
- Override Blocks: The child template can still override blocks defined in the parent template.
- Dynamic Inheritance: This approach is useful when different parent templates need to be selected based on user roles, themes, or application settings.

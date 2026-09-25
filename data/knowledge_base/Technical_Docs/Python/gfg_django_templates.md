# Django Templates

> Source: https://www.geeksforgeeks.org/python/django-templates/

A Django template is an HTML file that can also include CSS and JavaScript. It is used to create dynamic web pages. It renders data sent from views inside the HTML structure.
- Helps define the layout and design of each page.
- Supports template tags and variables for dynamic content.
- Makes it easy to separate presentation from application logic.
Organizing Templates
Django provides two ways to organize templates based on your project structure:
- Project-level templates: A single template directory shared across all apps.
- App-level templates: Separate template directories for individual apps, useful in large projects or when different layouts are needed
Template Setup in Django
A single template directory at the project level can be used for simplicity, storing all templates in one central location. Configuration in settings.py
- Create a folder named templates in the project’s base directory (BASE_DIR).
- Update the TEMPLATES setting in settings.py to include this folder.
TEMPLATES = [
    {
        #By default, Django Templates (DTL) is used.
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
      
        # Options to configure template behavior
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
Explanation:
- 'DIRS' specifies custom template directories. Here it points to the templates folder in the project root.
- 'APP_DIRS': True allows Django to automatically discover templates inside each app’s templates folder.
- context_processors make certain variables available in all templates, such as request or user.
To use Jinja2 as the template engine instead, the 'BACKEND' can be changed to 'django.template.backends.jinja2.Jinja2'
Using Django Templates
Templates are not limited to displaying static HTML, they can also present dynamic data passed from views via a context dictionary.
Example: Consider a project called 'geeksforgeeks' with an app named 'geeks':
1. views.py
Define three views in geeks/views.py:
- simple_view renders static content.
- check_age handles form input and applies conditional rendering.
- loop passes a list and string to demonstrate looping and filters.
from django.shortcuts import render
def simple_view(request):
    context = {"data": "Gfg is the best"}
    return render(request, "geeks.html", context)
def check_age(request):
    age = None
    if request.method == 'POST':
        # request.POST.get returns a string, default to "0"
        age = int(request.POST.get('age', 0))
    return render(request, 'check_age.html', {'age': age})
def loop(request):
    data = "Gfg is the best"
    number_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    context = {
        "data": data,
        "list": number_list
    }
    return render(request, "loop.html", context)
2. urls.py
Define the URL patterns in your app’s urls.py file to link each view to a specific route:
from django.urls import path
from mini import views  # Assuming your app is named 'mini'
urlpatterns = [
    path('simple/', views.simple_view),
    path('condition/', views.check_age),
    path('loop/', views.loop),
]
Template Files
1. geeks.html
Displays static data passed from the simple_view.
In app_name/templates/geeks.html:
<!DOCTYPE html>
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Homepage</title> 
</head> 
<body> 
    <h1>Welcome to GeeksforGeeks.</h1> 
    <p>{{ data }}</p>
</body> 
</html>
2. check_age.html
Accepts user input and displays different messages based on the entered age.
In app_name/templates/check_age.html:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Age Checker</title>
</head>
<body>
    <h1>Welcome to the Age Checker</h1>
    <form method="post">
        {% csrf_token %}
        <label for="age">Enter your age:</label>
        <input type="number" id="age" name="age" required>
        <button type="submit">Check Age</button>
    </form>
    {% if age != None %}
        <p>Your age is: {{ age }}</p>
        {% if age >= 20 %}
            <p>You are an adult.</p>
        {% else %}
            <p>You are not an adult.</p>
        {% endif %}
    {% endif %}
</body>
</html>
3. loop.html
Uses a for loop and if condition to display even numbers from a list.
In app_name/templates/loop.html:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Even Numbers</title>
</head>
<body>
    <h1>{{ data }}</h1>
    <p>Even Numbers:</p>
    <ul>
        {% for number in list %}
            {% if number|divisibleby:2 %}
                <li>{{ number }}</li>
            {% endif %}
        {% endfor %}
    </ul>
</body>
</html>
Output
Django Template Language
Django Template Language (DTL) is the syntax used by Django’s built-in template engine. It allows insertion of dynamic content, implementation of logic and definition of structure directly within HTML without embedding Python code. It primarily consists of variables, tags, filters, and comments.
1. Variables
Variables are used to display dynamic data passed from views through the context dictionary.
- Enclosed in double curly braces {{ }}.
- Accesses values sent from the backend to the template.
Syntax:
{{ variable_name }}
Example: Variables are surrounded by {{ and }} like this:
My first name is {{ first_name }}. My last name is {{ last_name }}.
With a context of {'first_name': 'Rahul', 'last_name': 'Kumar'}, this template renders to:
My first name is Rahul. My last name is Kumar.
2. Tags
Tags add control flow and logic to templates, such as loops, conditionals, and inheritance.
Syntax:
{% tag_name %}
Example: Tags are surrounded by {% and %} like this:
{% csrf_token %}
Common tags include: if, for, block, extends, include, csrf_token and url.
3. Filters
Filters are used to modify variable output before rendering on the page.
- Applied using the pipe symbol |.
- Can be chained for multiple transformations.
Syntax:
{{ variable_name | filter_name }}
Example:
{{ value | length }}
If value is ['a', 'b', 'c', 'd'], the output will be 4.
Common filters: length, lower, title, date, default, truncatechars.
4. Comments
Comments are used to hide or disable parts of a template that should not be rendered.
Syntax:
{% comment 'comment_name' %}
{% endcomment %}
Example :
{% comment "Optional note" %}
    Commented out text with {{ create_date|date:"c" }}
{% endcomment %}
5. Template Inheritance
Facilitates reusability and consistency by defining a common base layout that child templates can extend. Implemented using {% extends %} and {% block %} tags.
Syntax:
{% extends 'template_name.html' %}
Example: Assume the following directory structure:
dir1/
    template.html
    base2.html
    my/
        base3.html
base1.html
In template.html, the following paths would be valid:

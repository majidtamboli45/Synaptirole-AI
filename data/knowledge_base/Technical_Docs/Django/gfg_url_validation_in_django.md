# URL Validation in Django

> Source: https://www.geeksforgeeks.org/python/url-validation-in-django/

Validating URLs is an important part of web development to ensure data integrity and prevent errors. Django provides built-in tools that make URL validation simple and reliable. Using Django's URLValidator, URLs can be checked for correctness before storing them in the database or using them in views and forms.
Django's URL Validator
URLValidator is a built-in Django tool that checks whether a string follows valid URL syntax. It validates format, but does not verify whether the URL actually exists or is reachable.
- Supports validating URL syntax for schemes such as http and https.
- Helps detect malformed URLs in forms, models or custom validation logic.
- Can be used both through Django field validation and independently in Python code.
Steps to Use URLValidator
Consider a project named 'bookstore' having an app named 'mini'. Let's create a model of which we will be creating instances through view.
Step 1: Define the Model
In mini/models.py:
from django.db import models
class ValidatedURL(models.Model):
    url = models.URLField(unique=True)
    def __str__(self):
        return self.url
In the above model.py:
- URLField automatically validates URLs.
- unique=True ensures no duplicate URLs are stored.
Step 2: Create form.py
In mini/forms.py, create a form for URL submission:
from django import forms
class URLForm(forms.Form):
    url = forms.URLField(
        label='Enter a URL',
        widget=forms.TextInput(attrs={'placeholder': 'https://example.com/'})
    )
In the above form.py:
- URLField includes built-in URL validation and checks submitted input for valid URL syntax.
- widget=forms.TextInput adds a placeholder for better user experience.
- Can be used independently, without a model, for quick URL validation.
Step 3: Create Views
In mini/views.py, define views for submitting and displaying validated URLs:
from django.shortcuts import render, redirect
from .forms import URLForm
from .models import ValidatedURL
def index(request):
    if request.method == 'POST':
        form = URLForm(request.POST)
        if form.is_valid():
            url = form.cleaned_data['url']
            ValidatedURL.objects.create(url=url)
            return redirect('success')
    else:
        form = URLForm()
    return render(request, 'mini/index.html', {'form': form})
def success(request):
    validated_urls = ValidatedURL.objects.all()
    return render(request, 'mini/success.html', {'validated_urls': validated_urls})
In the above views.py:
- index view handles form display (GET) and URL submission (POST).
- Valid URLs are saved to the database using the ValidatedURL model.
- Redirects to the success view after successful submission.
- success view retrieves all validated URLs and displays them in a template.
Step 4: Create the Templates
Templates handle user interaction one for submitting URLs and another for displaying validated ones.
index.html: URL submission form
<!DOCTYPE html>
<html>
<head>
    <title>URL Validator</title>
</head>
<body>
    <h1>URL Validator</h1>
    <form method="post">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit">Submit</button>
    </form>
</body>
</html>
In the above index.html:
- Displays a form created from URLForm.
- Uses csrf_token for security during POST requests.
- Submits the form data to the index view for validation.
template/success.html: Display validated URLs
<!DOCTYPE html>
<html>
<head>
    <title>Validated URLs</title>
</head>
<body>
    <h1>Validated URLs</h1>
    <ul>
        {% for url in validated_urls %}
            <li>{{ url }}</li>
        {% empty %}
            <li>No validated URLs yet.</li>
        {% endfor %}
    </ul>
    <a href="{% url 'index' %}">Back to validation</a>
</body>
</html>
In the above success.html:
- Loops through all validated URLs stored in the database.
- Displays each URL in a list format.
- Includes a navigation link to return to the validation form.
Step 5: Configure URLs
Define the URL patterns for the app to connect views with routes. In mini/urls.py:
from django.urls import path
from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path('success/', views.success, name='success'),
]
In the above urls.py:
- The empty path '' maps to the index view for URL submission.
- The path 'success/' maps to the success view to display validated URLs.
- Each path is assigned a name for easy reference in templates and redirects.
Step 6: Include app URLs in the Project URLs
In the project's main urls.py, include the app’s URLs to make them accessible from the root URL. In url_validator_project/urls.py:
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('mini.urls')),
]
Output

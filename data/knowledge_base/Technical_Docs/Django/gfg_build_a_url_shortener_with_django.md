# Build a URL Shortener with Django

> Source: https://www.geeksforgeeks.org/python/how-to-build-a-url-shortener-with-django/

Django URL Shortener refers to a web application or reusable component built using Django that shortens long URLs into concise, shareable aliases making links easier to distribute on social media, emails, or documents while often tracking clicks for analytics.
Steps to create a URL Shortener
Consider a project named 'urlShort' having an app named 'url'. Create a model which will store original URLs and their shortened slugs.
Step 1: Creating the Models
A model is required to store both the original URL and its shortened version (slug).
In models.py:
from django.db import models
class UrlData(models.Model):
    url = models.URLField(max_length=200)
    slug = models.CharField(max_length=10)  # Store the shortened slug
    def __str__(self):
        return f"Short URL for: {self.url} is {self.slug}"
In the above model:
- url: This field stores the original URL.
- slug: This field stores the shortened version of the URL (a 10-character string).
Step 2: Creating the Forms
A form is required to allow users to enter the URL they want to shorten.
Create a forms.py:
from django import forms
class Url(forms.Form):
    url = forms.CharField(label="URL")  # Input field for the original URL
This form will be used in views to get the user’s original URL and process it.
Step 3: Creating the Views
Views handle the core logic of the URL shortener. In url/views.py:
1. urlShort(): Handle URL Shortening
This function takes the original URL from the form, generates a random 10-character slug, saves it in the database, and displays all shortened URLs.
import random
import string
from django.shortcuts import render, redirect
from .models import UrlData
from .forms import Url
def urlShort(request):
    if request.method == 'POST':
        form = Url(request.POST)
        if form.is_valid():
            slug = ''.join(random.choice(string.ascii_letters) for _ in range(10))  # Generate slug
            url = form.cleaned_data["url"]  # Get original URL
            new_url = UrlData(url=url, slug=slug)  # Save to database
            new_url.save()
            return redirect('/')  # Redirect after saving
    else:
        form = Url()  # Empty form for GET request
    data = UrlData.objects.all()  # Fetch all shortened URLs
    context = {'form': form, 'data': data}
    return render(request, 'index.html', context)
2. urlRedirect(): Redirect to the Original URL
This function retrieves the original URL based on the slug and redirects the user to it. In url/views.py:
from django.shortcuts import redirect , get_object_or_404
from .models import UrlData
def urlRedirect(request, slugs):
    # Find the original URL by the slug
    data = get_object_or_404(UrlData, slug=slugs)
    return redirect(data.url)  # Redirect to the original URL
Step 4: Creating the Templates
The template displays the URL submission form and the list of shortened URLs.
Create a new file url/templates/index.html:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>URL Shortener</title>
</head>
<body>
    <h1>Welcome to the URL Shortener</h1>
    <!-- Form to submit the original URL -->
    <form method="POST">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit">Shorten URL</button>
    </form>
    <h2>Shortened URLs</h2>
    <ul>
        {% for entry in data %}
            <li>{{ entry.url }} → <a href="/u/{{ entry.slug }}">/u/{{ entry.slug }}</a></li>
        {% endfor %}
    </ul>
</body>
</html>
This template contains:
- A form to input the original URL.
- A list displaying all shortened URLs, each linked to its shortened path.
Step 5: Creating URL Routes
Connect the views to specific URLs by defining routes inside the urls.py file of the url app.
In url/urls.py:
from django.urls import path
from . import views
app_name = "url"
urlpatterns = [
    path("", views.urlShort, name="home"),  # Home route for URL shortening form
    path("u/<str:slugs>/", views.urlRedirect, name="redirect"),  # Redirect using the slug
]
In the above urls.py:
- "" : Home route that displays the URL shortening form and list of shortened URLs.
- "u/<str:slugs>" : Route to redirect users to the original URL based on the generated slug.
Step 6: Create and Apply the Migration Files
Before migrations can run, ensure your url app is listed in the project's settings file. Find the INSTALLED_APPS list and add your app:
INSTALLED_APPS = [
     ...
    'url', 
]
Run the following commands in your terminal to package your model changes and apply them to the database:
python manage.py makemigrations
python manage.py migrate
Step 7: Running the Project
Start the Django development server to test the URL shortener. In the project’s root directory, run:
python manage.py runserver
Open a web browser and visit:
http://localhost:8000/
Output

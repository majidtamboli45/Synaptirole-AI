# How to Create an App in Django

> Source: https://www.geeksforgeeks.org/python/how-to-create-an-app-in-django/

Django apps are separate modules that handle specific features in a web project, helping keep code clean and organized.
- Each application is responsible for a particular function, such as handling data, managing pages or facilitating routing.
- A Django project works as the main setup that brings multiple apps together.
- Every app contains its own models, views, templates and URLs.
- Example apps include: a Posts app for creating and showing blog articles, a Comments app for adding and moderating user comments and a Users app for login, signup, and profile features.
Pre-Installed Apps
Django includes several pre-installed apps for convenience. To view them, check the INSTALLED_APPS section in settings.py. The apps listed there are provided by Django to simplify development.
Before creating apps in a Django project, ensure the project folder exists. If it doesn’t, create it using the following command:
django-admin startproject project_name
Steps to Create Apps
Step 1: Navigate to the Project Directory
Open the terminal and navigate to the root directory of the Django project, where the manage.py file is located:
cd project_name
Step 2: Create a New App
Create a Django app with the following command:
python manage.py startapp projectApp
This will generate a directory structure like:
Step 3: Register the App in Project's settings.py
Open project_name/settings.py and add app to the INSTALLED_APPS list:
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'projectApp' #  Add app here
]
Step 4: Include App URLs in Project URLs
After creating the app, connect its URLs to the main project so Django can route requests to the app’s views. In the main project’s urls.py file located at project_name/project_name/urls.py, import:
from django.urls import include
In the urlpatterns list, add the following line to include the app’s URLs:
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),  # Admin panel URL
    path('', include("projectApp.urls")),  # Include app URLs
]
Note: Django uses the project-level urls.py file for routing and app URLs are included using include().
Step 5: Create urls.py in App
The app requires its own urls.py to define view routes. If it doesn’t exist, create it inside the projectApp directory:
from django.urls import path
from . import views
urlpatterns = [
    path('', views.index, name='index'),
]
Step 6: Create a View
In projectApp/views.py, define a view that will return a simple response:
from django.http import HttpResponse
def index(request):
    return HttpResponse("Hello, Geeks! Welcome to your first Django app.")
Step 7: Run the Development Server
python manage.py runserver
Visit the application in your browser at: http://127.0.0.1:8000/
Django App Features
- Modularity: Apps are loosely coupled and can be developed independently.
- Reusability: Apps can be reused across multiple Django projects.
- Collaboration: Different teams can work on separate apps simultaneously.
- Organization: Helps maintain clean, structured and manageable code.
- Built-in Features: Provides tools like admin panel, authentication and middleware to speed up development.

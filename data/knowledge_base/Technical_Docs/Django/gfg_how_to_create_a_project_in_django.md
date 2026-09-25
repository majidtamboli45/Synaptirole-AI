# How to Create a Project in Django

> Source: https://www.geeksforgeeks.org/python/how-to-create-a-basic-project-using-mvt-in-django/

A Django project is the main folder structure for a web application, containing settings, URLs, and apps. It sets up the environment for development.
Steps to create apps in Django
Before creating a Django project, ensure that a virtual environment is set up and Django is installed within it.
Step 1: Create the Project
Once the environment is activated and Django is available, a new project can be created using:
django-admin startproject projectName
This will create a new folder named projectName.
Change into your project directory:
cd projectName
Step 2: Create a View
Inside your project folder (where settings.py and urls.py are located), create a new file named views.py. and add the following code to views.py:
from django.http import HttpResponse
def hello_geeks(request):
    return HttpResponse("Hello Geeks")
This simple view returns the string "Hello Geeks" when accessed.
Step 3: Configure URLs
In the urls.py file inside the project folder (projectName/urls.py) and modify it as follows:
1. Import view at the top:
from projectName.views import hello_geeks
2. Add a URL pattern inside the urlpatterns list to link view:
from django.urls import path
from projectName.views import hello_geeks
urlpatterns = [
    path('geek/', hello_geeks),
]
This routes any request to /geek/ to the hello_geeks view.
After following these steps, file structure should look like this:
Step 4: Run the Development Server
Ensure the virtual environment is activated, then start the Django development server:
python manage.py runserver
In web browse, visit:
http://127.0.0.1:8000/geek/
The message "Hello Geeks" should be displayed.

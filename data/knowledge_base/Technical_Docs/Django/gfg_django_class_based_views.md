# Django Class Based Views

> Source: https://www.geeksforgeeks.org/python/class-based-generic-views-django-create-retrieve-update-delete/

Class-Based Views (CBVs) in Django are Python classes that handle web requests and send responses in a structured and reusable way.
- Each HTTP method, such as GET or POST, is handled in its own method for better organization.
- Shared features can be placed in base classes or mixins and reused through inheritance.
- Django offers built-in CBVs like CreateView, ListView, and DetailView for common tasks.
- CBVs help reduce repeated code and make view logic cleaner.
Using Class-based view in Django
Consider a project named ‘geeksforgeeks’ having an app named ‘geeks’. After setting up the project and app, create a Class-Based List View to display instances of a model, along with the model for which these instances will be created and shown through the view.
In geeks/models.py:
from django.db import models
class GeeksModel(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    def __str__(self):
        return self.title
After creating this model, we need to run two commands in order to create Database.
python manage.py makemigrations
python manage.py migrate
Create instances of this model using the Django shell by running the following command in the terminal:
python manage.py shell
Enter following commands:
from geeks.models import GeeksModel
GeeksModel.objects.create(title="title1", description="description1")
GeeksModel.objects.create(title="title2", description="description2")
GeeksModel.objects.create(title="title3", description="description3")
Create the Class-Based ListView. In geeks/views.py:
from django.views.generic import ListView
from .models import GeeksModel
class GeeksList(ListView):
    model = GeeksModel
    template_name = "geeks/geeksmodel_list.html"   # template path
    context_object_name = "object_list"            # list name in template
Now, create a URL path to map the view. In geeks/urls.py:
from django.urls import path
from .views import GeeksList
urlpatterns = [
    # .as_view() converts the class into a callable function
    path('', GeeksList.as_view(), name='geeks-list'),
]
Include app URLs in project URLs. In geeksforgeeks/urls.py:
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),        # default admin route
    path('', include('geeks.urls')),        # root mapped to ListView
]
Create a template in geeks/templates/geeks/geeksmodel_list.html:
<ul>
    <!-- Iterate over object_list -->
    {% for object in object_list %}
    <!-- Display Objects -->
    <li>{{ object.title }}</li>
    <li>{{ object.description }}</li>
    <hr/>
    <!-- If object_list is empty  -->
    {% empty %}
    <li>No objects yet.</li>
    {% endfor %}
</ul>
Visit development server: http://localhost:8000/
Similarly, class based views can be implemented with logics for create, update, retrieve and delete views.
Django Class Based Views - CRUD Operations
Django Class-Based Views (CBVs) make it easier to implement CRUD operations (Create, Read, Update, Delete) by providing built-in generic views. These views save time by handling common patterns with minimal code.
- CreateView: create or add new entries in a table in the database.
- Retrieve Views: read, retrieve, search, or view existing entries as a list(ListView) or retrieve a particular entry in detail (DetailView)
- UpdateView: update or edit existing entries in a table in the database
- DeleteView: delete, deactivate, or remove existing entries in a table in the database
- FormView: render a form to template and handle data entered by user
These operations power common features like user management, blog posts, and product catalogs, making Class-Based Views a powerful and reusable way to build dynamic web applications

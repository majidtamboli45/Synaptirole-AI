# Redesign and Customization

> Source: https://www.geeksforgeeks.org/python/django-admin-redesign-and-customization/

The default Django admin interface is often sufficient for most projects, but sometimes more control and customization are needed. Django provides powerful tools to tailor the admin panel to specific requirements.
For Example, Consider a Django project named 'myproject' with an app named 'catalog'. Create the Movie and Customer model apply the migrations.
In models.py:
from django.db import models
class Movies(models.Model):
    title = models.CharField(max_length=200)
    length = models.PositiveIntegerField()
    release_year = models.PositiveIntegerField()
    def __str__(self):
        return self.title
class Customers(models.Model):
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    phone = models.PositiveIntegerField()
    def __str__(self):
        return self.first_name + ' ' + self.last_name
Once the following models are created, they will appear in the Django Admin panel:
Customizations
Django’s admin interface can be extended with multiple customizations to better suit project needs. Some common customizations include:
1. Changing order of Fields
By default, fields in the admin detail view appear in the same order as defined in the model. This order can be changed directly in admin.py without modifying models.py.
Movie model:
title
length
release_year
fields=['release_year', 'title', 'length']
Movie model:
release_year
title
length
In admin.py:
from django.contrib import admin
from .models import Movies, Customers
class MovieAdmin(admin.ModelAdmin):
    fields = ['release_year', 'title', 'length']
admin.site.register(Movies, MovieAdmin)
admin.site.register(Customers)
2. Adding Search and Filters
Currently, the models contain only a few entries. As the number of entries grows to hundreds or thousands, finding specific data by browsing manually becomes tedious. Adding a search bar or filter feature in the admin panel makes it easier to access specific entries quickly.
Search by the following elements:
search_fields = ['title', 'length', 'release_year']
search_fields = ['first_name', 'last_name', 'phone']
Filter by the following elements:
list_filter = ['release_year']
list_filter = ['last_name']
In app_folder/admin.py:
from django.contrib import admin
from .models import Movies, Customers
class MovieAdmin(admin.ModelAdmin):
    # Let you search with title name, release year and length of duration of movie
    search_fields = ['title', 'length', 'release_year']
    # There will be a filter on release year
    list_filter = ['release_year']
class CustomerAdmin(admin.ModelAdmin):
    # Let you search with first name, last name and phone number of the customer
    search_fields = ['first_name', 'last_name', 'phone']
    # There will be a filter on last name
    list_filter = ['last_name']
admin.site.register(Movies, MovieAdmin)
admin.site.register(Customers, CustomerAdmin)
3. Viewing Additional Fields
In the admin interface, the list view normally shows only one field per model. Using list_display, additional fields can be added to make the list view more informative.
list_display=['title', 'release_year']
list_display=['first_name', 'last_name', 'phone']
In admin.py:
from django.contrib import admin
from .models import Movies, Customers
class MovieAdmin(admin.ModelAdmin):
  list_display =['title', 'release_year']
  
class CustomerAdmin(admin.ModelAdmin):
  list_display =['first_name', 'last_name', 'phone']
admin.site.register(Movies, MovieAdmin)
admin.site.register(Customers, CustomerAdmin)
4. Editing List View
Fields can be made editable directly from the list view using list_editable, eliminating the need to open each detail view.
list_editable = ['phone']
In admin.py:
from django.contrib import admin
from .models import Movies, Customers
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'phone'] 
    list_editable = ['phone']
admin.site.register(Movies)
admin.site.register(Customers, CustomerAdmin)
5. Admin Template
To modify the layout or appearance of the Django admin interface, such as changing the header, custom templates can be added to the project. This involves creating a specific folder structure and adding custom HTML files to override default admin templates.
Steps:
- Create a templates folder in the project root.
- Inside templates, create a folder named admin.
- Add a file named base_site.html inside templates/admin/ to customize the admin interface’s branding.
In templates/admin/base_site.html:
<h1 id="site-name" style="font-family: cursive;" ><a href="{% url 'admin:index' %}">Video Rental Administration</a></h1>
{% endblock %}
{% block nav-global %}{% endblock %}
After adding a custom HTML file, the heading in the admin interface will reflect the changes.
If the template doesn’t appear, ensure the template configuration in settings.py is correct so Django can locate and apply the custom templates.
In settings.py:
import os
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
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
This demonstrates how the Django admin template can be customized to meet project-specific requirements.

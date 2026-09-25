# Django QuerySet Filtering

> Source: https://www.geeksforgeeks.org/python/python-django-queryset-filtering/

QuerySet filtering helps retrieve only the required records from the database, making data handling fast and efficient.
- filter() and exclude() select or remove records based on given conditions.
- Lookup expressions like exact, icontains, lte, and gte refine query accuracy.
- QuerySets are lazy and support chaining multiple conditions for precise results.
- Q objects enable advanced filtering using OR, AND, and NOT operations.
QuerySet Filtering Implementation
Consider a project named 'projectApp' with a model 'User'. Filtering datasets using Django’s filter(), exclude(), and advanced Q objects with a model named User.
Step 1: Define the User Model
In projectApp/models.py, create a User model with fields for user_name, city, and country:
from django.db import models
class User(models.Model):
    user_name = models.CharField(max_length=20)
    city = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=20, blank=True, null=True)
    def __str__(self):
        return self.user_name
Step 2: Register the Model in Django Admin
To make the User model accessible in the Django Admin interface, register it in projectApp/admin.py:
from django.contrib import admin
from .models import User
admin.site.register(User)
To access the User model through the Django admin panel, create a superuser:
python manage.py createsuperuser
Suppose the User model contains the following entries:
QuerySet Filtering Examples
With the User model in place, it’s time to explore how to filter data using QuerySets.
1. Filtering All Users
To retrieve all users from a specific country, use filter():
users = User.objects.filter(country='India')
This retrieves all users where the country is 'India':
2. Excluding Specific Records
To exclude records that match a condition, use exclude():
users = User.objects.filter(country='India').exclude(city='Agra')
This retrieves all users from India, excluding those from Agra.
3. Using Q Objects for Advanced Filtering
Q objects allow for more complex queries, like OR conditions:
from django.db.models import Q
users = User.objects.filter(Q(country='India') | Q(city='New York'))
This returns users who are from either India or New York.
Code for AND Operation (&):
from django.db.models import Q
# Users who are from 'India' AND live in the city of 'Delhi'
users = User.objects.filter(Q(country='India') & Q(city='Delhi'))
Code for NOT Operation (~):
from django.db.models import Q
# Users from 'India' who are NOT from the city of 'Delhi'
users = User.objects.filter(Q(country='India') & ~Q(city='Delhi'))

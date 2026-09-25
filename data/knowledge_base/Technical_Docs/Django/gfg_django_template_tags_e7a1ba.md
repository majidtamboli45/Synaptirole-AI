# For Loop in Django Template Tags

> Source: https://www.geeksforgeeks.org/python/for-loop-django-template-tags/

Django templates allow rendering dynamic data by embedding Python-like logic into HTML. The for loop tag is commonly used to iterate over lists or other iterable objects. This enables displaying repeated content, such as lists or tables, directly in templates, without adding complex logic in the view.
Syntax
{% for item in iterable %}
    <!-- Do something with 'item' -->
{% endfor %}
- iterable: This is the collection (such as a list or a queryset) over which the loop will iterate.
- item: This represents each individual element in the iterable during the iteration.
Example: Consider a project named 'geeksforgeeks' having an app named 'geeks'.
View (geeks/views.py):
from django.shortcuts import render 
# create a function 
def geeks_view(request): 
	# create a dictionary 
	context = { 
		"data" : [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 
	} 
	return render(request, "geeks.html", context) 
URL Configuration (geeks/urls.py):
from django.urls import path 
# importing views from views.py 
from .views import geeks_view 
urlpatterns = [ 
	path('', geeks_view , name='geeks_view'), 
] 
Template (templates/geeks.html):
<div class="row"> 
		{{ i }} 
	</div> 
{% endfor %} 
Output
Advanced Usage
Django for tag, one of the Django Template Tags, supports more advanced looping scenarios beyond simple iteration over a list.
1. Looping in Reverse: Iterate over a list in reverse order
2. Unpacking Sub-lists or Tuples: When iterating over a list of lists or tuples, unpack values into separate variables
Example context:
points = [(1, 2), (3, 4), (5, 6)]
Output
There is a point at 1, 2
There is a point at 3, 4
There is a point at 5, 6
3. Iterating Over Dictionaries: Access keys and values using .items
Example context:
data = {'name': 'Rahul', 'age': 23, 'city': 'Noida'}
Output
name: Rahul
age: 23
city: Noida

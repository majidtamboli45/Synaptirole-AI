# If-Else in Django Template Tags

> Source: https://www.geeksforgeeks.org/python/if-django-template-tags/

The "if" tag in Django templates controls what content is displayed based on conditions. It can be combined with "elif (else-if)" and "else" to handle multiple conditional scenarios, allowing templates to show different content depending on various conditions. This provides a flexible way to dynamically render HTML based on data passed from views.
Syntax
{% if condition1 %}
    <!-- Code to execute if condition1 is True -->
{% elif condition2 %}
    <!-- Code to execute if condition2 is True -->
{% else %}
    <!-- Code to execute if none of the above conditions are True -->
{% endif %}
- condition1, condition2, etc., can be variables, comparisons, or any expression that evaluates to True or False.
- {% elif %} and {% else %} are optional. Multiple {% elif %} blocks are allowed, but only one {% else %}.
Example:
Explanation:
- {% if athlete_list %}: If the athlete_list is not empty, the number of athletes is displayed using the {{ athlete_list|length }} filter.
- {% elif athlete_in_locker_room_list %}: If athlete_list is empty but athlete_in_locker_room_list has a value, a message saying athletes should be out of the locker room soon is displayed.
- {% else %}: If neither condition is true, the message "No athletes." is shown.
Using {% if %} in a Django Application
Consider a project named 'geeksforgeeks' having an app named 'geeks'.
1. Creating the View
In geeks/views.py, a view can be defined to pass data to the template.
from django.shortcuts import render
 
def geeks_view(request):
    context = {
        "data" : 99,
    }
    return render(request, "geeks.html", context)
A key-value pair is passed in the context, where "data" has a value of 99.
2. Creating the URL Path
In the geeks/urls.py, Map the URL to this view.
from django.urls import path
from .views import geeks_view
urlpatterns = [
    path('', geeks_view),
]
3. Creating the Template
Create a template geeks.html inside the templates directory and use the {% if %} tag to conditionally render content.
4. Output
Visit: http://127.0.0.1:8000/
Handling Empty Values
If empty value is passed, like False, the {% else %} block will be executed.
from django.shortcuts import render
 
def geeks_view(request):
    context = {
        "data" : False,
    }
    return render(request, "geeks.html", context)

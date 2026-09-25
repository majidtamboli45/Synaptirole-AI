# Boolean Operators in Django Template Tags

> Source: https://www.geeksforgeeks.org/python/boolean-operators-django-template-tags/

Django Template Tags support boolean operators to combine or negate conditions in if statements. These operators allow more complex conditional logic directly in templates. Boolean operator are:
- and: Checks if all conditions are true.
- or: Checks if at least one condition is true.
- not: Negates the condition.
Syntax
{% if [not] variable1 [and| or [not] variable2] %}   
     <!-- statements -->
{% endif %}
- variable1 and variable2 can be context variables or values.
- boolean_operator can be and or or. The not operator can be used to negate a single variable or expression.
Note: Unlike standard Python, the Django template engine does not support the use of parentheses () to group expressions or change operator precedence.
- {% if %} tag may include one or more {% elif %} clauses to handle additional conditions.
- an optional {% else %} clause can be used to display content if all previous conditions fail.
- these clauses allow flexible control of content rendering directly in templates.
Example of Boolean Operators in Django
Consider a project named 'geeksforgeeks' having an app named 'geeks'.
In views.py
Create a view through which we will pass the context dictionary in geeks/views.py:
from django.shortcuts import render
def geeks_view(request):
    context = {
        "data": 99,
    }
    return render(request, "geeks.html", context)
In urls.py
Create a url path to map to this view in geeks/urls.py,
from django.urls import path
from .views import geeks_view
urlpatterns = [
    path('', geeks_view),
]
In templates/geeks.html
Create a geeks.html file in templates folder of the app (geeks) if the folder already exists, if not then create the templates folder and then the geeks.html file in it:
Run the app using command- python manage.py runserver and visit http://127.0.0.1:8000/
Output
Common Boolean Operators in Django Templates
Django Template Tags support boolean operators that enable complex conditional logic directly in templates. Operators are:
1. == (Equal to)
Returns True if values on both side of the operator are equal.
{% if somevar == "x" %}
  somevar is equal to "x"
{% endif %}
2. != (Not equal to)
Returns True if the values are not equal.
{% if somevar != "x" %}
  somevar is not equal to "x"
{% endif %}
3. < (Less than)
Checks if the left value is less than the right value.
{% if somevar < 100 %}
  somevar is less than 100
{% endif %}
4. > (Greater than)
Checks if the left value is greater than the right value.
{% if somevar > 0 %}
  somevar is greater than 0
{% endif %}
5. <= (Less than or equal to)
Checks if the left value is less than or equal to the right value.
{% if somevar <= 100 %}
  somevar is less than or equal to 100
{% endif %}
6. >= (Greater than or equal to)
Checks if the left value is greater than or equal to the right value.
{% if somevar >= 1 %}
  somevar is greater than or equal to 1
{% endif %}
7. in (Contained within)
Tests if a value exists in a list, string, or QuerySet.
8. not in (Not contained within)
It's the negation (opposite) of the in operator.
9. is (Object identity)
Tests if two values are the same object.
10. is not (Negated object identity)
Tests if two values are not the same object

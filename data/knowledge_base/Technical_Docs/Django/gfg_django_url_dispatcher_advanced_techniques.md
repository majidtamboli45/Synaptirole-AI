# Django URL Dispatcher & Advanced URL Techniques

> Source: https://www.geeksforgeeks.org/python/django-url-dispatcher-tutorial/

Django URL Dispatcher maps incoming HTTP requests to views, enabling precise request routing. It supports dynamic URLs, named patterns, namespaces and class-based views for scalable, maintainable web applications.
Creating URL Patterns
URL patterns define how URLs are routed to views. They are stored in the urlpatterns list in a Django app's urls.py.
Steps to create URL patterns:
- Open urls.py in the app or project.
- Import path() from django.urls.
- Define URL patterns and map them to views.
Example: urls.py
from django.urls import path
from . import views
urlpatterns = [
    path('home/', views.home_view, name='home'),
    path('about/', views.about_view, name='about'),
]
In the above example:
- 'home/' mapped to home_view.
- 'about/' mapped to about_view.
- name='home' and name='about' allow easy reference in templates and Python code.
Using Regular Expression
For most URL patterns, Django’s path() with converters is preferred. For more complex matching requirements, Django provides re_path() with regular expressions to capture dynamic values from URLs.
Steps to use regex captures:
- Use path() for standard dynamic URLs and re_path() only when complex pattern matching is needed.
- Define a re_path() pattern using regex capturing groups ().
- Add parameters in the view for each captured value.
Example: urls.py
from django.urls import re_path
from . import views
urlpatterns = [
    re_path(r'^blog/(?P<blog_id>\d+)/$', views.blog_detail, name='blog_detail'),
]
In the above example:
- (?P<blog_id>\d+) captures an integer from the URL.
- The view is called as blog_detail(request, blog_id=1) for /blog/1/.
Naming URL Patterns
Named URL patterns allow referencing URLs without hardcoding paths in templates or Python code.
Steps to name URL patterns:
- Add the name argument to the path() function.
- Use {% url 'name' %} in templates.
- Use reverse('name') in Python code
Example: urls.py
from django.urls import path
from . import views
urlpatterns = [
    path('home/', views.home_view, name='home'),
    path('about/', views.about_view, name='about'),
]
In the above example:
- name='home' and name='about' assign a name to the URL patterns.
- Templates can use {% url 'home' %} and {% url 'about' %}.
- Python code can use reverse('home') and reverse('about').
Inverting URL Patterns
Inverting URLs generates URLs from their names instead of hardcoding paths.
Steps to invert URL patterns:
- Use {% url 'url_name' %} in templates.
- Use reverse('url_name') in Python code.
Example: template
<a href="{% url 'home' %}">Home</a>
Example: Python view
from django.urls import reverse
home_url = reverse('home')
In the above example:
- {% url 'home' %} generates the URL mapped to the 'home' route in the URL configuration.
- reverse('home') returns the URL associated with the 'home' route in Python code.
Using Namespaces
Namespaces organize URL patterns, avoiding naming conflicts when multiple apps exist.
Steps to use namespaces:
- Include app URLs in the project urls.py with namespace parameter.
- Reference URLs using 'namespace:url_name' in templates or Python code.
Example: urls.py
from django.urls import path, include
urlpatterns = [
    path('books/', include(('books.urls', 'books'), namespace='books')),
]
Example: template reference
<a href="{% url 'books:book_detail' book_id=1 %}">Book Detail</a>
In the above example:
- namespace='books' groups URLs under the books namespace.
- {% url 'books:book_detail' book_id=1 %} references namespaced URL in template.
- reverse('books:book_detail', kwargs={'book_id': 1}) references namespaced URL in Python code.
Using Class-Based Views (CBVs)
Class-based views provide reusable and organized view logic.
Steps to use CBVs:
- Create a Python class inheriting from View or generic CBVs.
- Define methods like get() or post().
- Map the class to a URL using .as_view()
Example: views.py
from django.views import View
from django.http import HttpResponse
class ItemListView(View):
    def get(self, request):
        return HttpResponse("List of items")
Example: urls.py
from django.urls import path
from .views import ItemListView
urlpatterns = [
    path('items/', ItemListView.as_view(), name='item-list'),
]
In the above example:
- ItemListView defines a get method for GET requests.
- .as_view() converts the class into a callable view.
- 'items/' URL maps to the CBV, and name='item-list' allows referencing it.

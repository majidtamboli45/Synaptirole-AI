# How to use sessions in django

> Source: https://www.geeksforgeeks.org/python/python-sessions-framework-using-django/

Django sessions enable storage of data for each user across multiple pages, even without login. Data is securely saved on the server, while a small cookie (sessionid) tracks the session. Sessions provide the ability to:
- Persist user data between HTTP requests.
- Store information server-side in the database, cache, or file system.
- Identify users through a session ID stored in the browser cookie.
This functionality supports tracking shopping carts, user preferences, form inputs, and anonymous analytics such as page visits. The following guide demonstrates a simple Django app that tracks and displays the number of visits, showcasing how sessions function
Step 1: Enabling Sessions in Django
Consider a project named 'session_project' having an app named 'mysession'.
After creating the project, enable sessions in Django by ensuring two things in settings.py:
1. Add 'django.contrib.sessions' to INSTALLED_APPS
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',  # Enables session management
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'mysession', # Custom Django app created for handling session-related functionality
]
2. Include SessionMiddleware in MIDDLEWARE
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',  # Must be here
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',  # Must be after sessions
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
Step 2: Creating the Sessions Table
To initialize the session table in your database:
python manage.py migrate
This applies all necessary migrations, including the creation of the sessions table.
Step 3: Configuring Session Storage (Optional)
By default, Django stores session data in the database. The storage engine can be changed using the SESSION_ENGINE setting in settings.py to enable cache-based sessions.
1. To use database-backed sessions (default):
SESSION_ENGINE = 'django.contrib.sessions.backends.db'
2. To use cache-based sessions:
SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
Caching must also be configured (example using Memcached):
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': '127.0.0.1:11211',
    }
}
Step 4: Creating a Visit Counter Using Sessions
Next, build a simple visit counter to demonstrate session functionality.
In mysession/views.py:
from django.shortcuts import render
from django.http import HttpResponse
def index(request):
    # Set a test cookie
    request.session.set_test_cookie()
    # Get current visit count (default 0) and increment
    num_visits = request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits + 1
    return HttpResponse(f"Visit count: {request.session['num_visits']}")
def about(request):
    # Check if test cookie worked
    if request.session.test_cookie_worked():
        message = "Cookie Tested!"
        request.session.delete_test_cookie()  # Remove test cookie after checking
    else:
        message = "Cookie not set or not supported"
    # Optionally, show current visit count
    num_visits = request.session.get('num_visits', 0)
    return HttpResponse(f"About page<br>{message}<br>Current visit count: {num_visits}")
def reset_count(request):
    # Delete the 'num_visits' session key to reset count
    if 'num_visits' in request.session:
        del request.session['num_visits']
    return HttpResponse("Visit count has been reset to 0")
In session_project/urls, map the URLs:
from django.contrib import admin
from django.urls import path
from mysession.views import index, about, reset_count
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),          # shows visit count
    path('about/', about, name='about'),    # tests cookie and shows info
    path('reset/', reset_count, name='reset')  # resets visit count
]
Run the server:
python manage.py runserver
Visit http://localhost:8000 in your browser. Refresh the index page multiple times and you’ll see the visit count increasing.
In the above snapshot, the visit count is 7. Refreshing the page increases the count by 1.
Navigate to the /about page. The page displays “Cookie Tested!” along with the current visit count.
Navigating to /reset resets the visit count to 0.
Advanced: Session Expiry Settings
By default, session data persists until the browser is closed. The duration can be customized using the SESSION_COOKIE_AGE setting in the app’s settings.py.
Example: to set a session timeout of 30 minutes:
SESSION_COOKIE_AGE = 1800 # 30 minutes (in seconds)
To force the session to expire when the browser closes:
SESSION_EXPIRE_AT_BROWSER_CLOSE = True

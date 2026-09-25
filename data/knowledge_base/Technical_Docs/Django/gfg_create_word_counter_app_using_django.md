# Create Word Counter App using Django

> Source: https://www.geeksforgeeks.org/python/create-word-counter-app-using-django/

Our task is to build a simple Django application that counts the number of words in a given text. This is a great beginner project if you have some basic knowledge of Django.
Refer to the below article to know about basics of Django.
Step 1: Create the Word Counting Logic in Views
First, we create a function called counter in views.py which will handle the logic for counting words:
from django.shortcuts import render
def counter(request):
    if request.method == 'POST':
        text = request.POST['texttocount']
        if text != '':
            word = len(text.split())
            i = True
            return render(request, 'counter.html',
                          {'word': word,
                          'text': text,
                          'i': i, 
                          'on': 'active'
            })
        else:
            return render(request, 'counter.html', {'on': 'active'})
    else:
        return render(request, 'counter.html', {'on': 'active'})
Explanation:
- When the user submits text via POST, we check if the input is not empty.
- We then split the text by spaces and count the resulting words.
- If successful, we pass the word count and original text back to the template.
- On GET requests or empty input, we simply render the form without results.
Step 2: Configure URL Patterns
In your app's urls.py, map the URL /counter to your counter view:
from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('counter',views.counter, name='counter'),
]
Then include your app URLs in the main project urls.py:
from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', RedirectView.as_view(url='counter', permanent=False)),  # Redirect root to /counter
    path('myapp/', include('yourappname.urls')),  # Replace yourappname with your actual app name
]
Step 3: Create the HTML Template
Create a file called counter.html inside your app’s templates folder and add the following code:
<div class="mb-2" style="border-style: groove; border-radius: 10px;">
  <div class="card-header">
    <p style="font-size: 20px;">{{ word }} Word{{ word|pluralize }} in the text</p>
  </div>
</div>
{% endif %}
<div class="col-12 pb-3" style="background-color: #c2d6d6; border: 2px groove; border-radius: 10px;">
  <form action="counter" method="POST">
    {% csrf_token %}
    <div class="form-group">
      <label for="text1">Paste your text here</label>
      <textarea name="texttocount" id="text1" rows="8" style="background-color: #f0f5f5;" class="form-control" placeholder="Enter text to count words">{{ text }}</textarea>
    </div>
    
    <div class="text-center">
      <!-- Ads or other content can go here -->
    </div>
    <div class="form-group text-center">
      <button type="submit" class="btn btn-primary w-25">Run Counter</button>
    </div>
  </form>
</div>
Notes:
- The {% csrf_token %} tag is essential for POST requests to pass Django’s CSRF protection.
- We conditionally display the word count only when the counting process has succeeded (i is true).
- {{ word|pluralize }} adds an “s” when the word count is more than one for proper grammar.
Step 4: Run Your Application
Make sure your Django server is running:
python manage.py runserver
Output:

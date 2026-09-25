# CRUD Operations in Django Admin

> Source: https://www.geeksforgeeks.org/python/crud-operations-in-django-admin/

Django Admin is a built-in tool that automatically generates a web interface for models, removing the need to create separate pages or forms. It provides an intuitive way to manage project data and perform CRUD(Create, Read, Update, and Delete) operations efficiently.
Let's understand step by step how to perform CRUD operations.
Creating the App and Model
Consider a project named 'projectName' having an app named 'app'. After creating the app, make sure to add your app to the INSTALLED_APPS list in settings.py file of 'projectName'.
Step 1: Define the Book Model
In app/models.py, create a "Book" model to represent books in your library. This model will include common book details like title, author, published date, ISBN, number of pages, and availability status.
from django.db import models
class Book(models.Model):
    title = models.CharField(max_length=200)
    author = models.CharField(max_length=100)
    published_date = models.DateField()
    isbn = models.CharField(max_length=13, unique=True)
    pages = models.IntegerField()
    available = models.BooleanField(default=True)
    def __str__(self):
        return f"{self.title} by {self.author}"
Step 2: Migrate Your Database
After creating this model, we need to run two commands in order to create Database for the same:
python manage.py makemigrations
python manage.py migrate
Step 3: Register the Model in Django Admin
To manage Book records via the admin panel, register model in app/admin.py:
from django.contrib import admin
from .models import Book
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'published_date', 'isbn', 'available')
    search_fields = ('title', 'author', 'isbn')
    list_filter = ('available', 'published_date')
This customizes the admin interface to show important book details and helps to find books faster using search and filters.
Step 4: Create a Superuser to Access Admin
To create a superuser, run following command:
python manage.py createsuperuser
Provide a username, email, and password. This superuser account has full access to the admin panel. After creation, log in using these credentials to access and manage your models.
Step 5: Configure Admin URL
Open projectName/urls.py and ensure the admin/ path is included in the urlpatterns list:
from django.contrib import admin
rom django.urls import path
urlpatterns = [
    # Add this line if it is missing
   path('admin/', admin.site.urls),
]
Step 6: Run the Development Server
Start the Django server:
python manage.py runserver
Visit: http://127.0.0.1:8000/admin/ and log in with your superuser credentials to access the admin panel.
Performing CRUD Operations
1. Create New Book Records
- Click Books in the admin sidebar.
- Click Add Book.
- Fill in details like title, author, and ISBN.
- Click Save to add the book.
2. View (Read) Books
- The Books list page shows all saved books.
- Use the search bar or filters on the right to find specific books quickly.
3. Edit Existing Books
- Click on a book title from the list.
- Update any details in the form.
- Click Save to apply changes.
4. Delete Books
- Select the book/books.
- Select the DELETE option from the dropdown above the list of books.
- Confirm to permanently remove the book.

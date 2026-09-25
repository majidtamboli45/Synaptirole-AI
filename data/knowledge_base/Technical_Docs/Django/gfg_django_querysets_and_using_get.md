# Django QuerySets: Introduction and Using get()

> Source: https://www.geeksforgeeks.org/python/django-query-set-get/

A QuerySet in Django is a collection of database records that works like a Python list but offers more features for handling data efficiently.
- Allows filtering, sorting, and organizing records before they are fetched from the database.
- Uses lazy loading, so data is retrieved only when the QuerySet is used.
- Supports chaining multiple filters to get precise results.
- Fetches only the required data, which improves performance.
get() Method
The get() method returns exactly one object that matches the conditions provided. It has specific behaviors and use cases as described below:
- Raises a DoesNotExist exception if no object is found.
- Raises a MultipleObjectsReturned exception if more than one object matches.
- Ideal when there is only one record for the given lookup.
- Unlike filter(), get() returns a single model instance, not a QuerySet.
Syntax
Model.objects.get(**kwargs)
- Model is a Django model.
- kwargs are the conditions used to find the object.
Using get() with a Book Model
Consider a Book model with fields like title and author. To get the book titled "The Great Gatsby":
from app.models import Book
try:
    book = Book.objects.get(title='The Great Gatsby')
    # Use the book object here
except Book.DoesNotExist:
    print("No book found with that title.")
except Book.MultipleObjectsReturned:
    print("Multiple books found with that title.")
- Book.objects.get(title='The Great Gatsby') attempts to fetch a single Book object with the specified title.
- If no object matches, a DoesNotExist exception is raised.
- If more than one object matches, a MultipleObjectsReturned exception is raised.
- Using try-except ensures the program handles these cases gracefully without crashing.
Using Multiple Conditions (AND)
To use multiple conditions with the get() method in Django:
try:
    book = Book.objects.get(title='The Great Gatsby', author='F. Scott Fitzgerald')
except Book.DoesNotExist:
    print("No matching book found.")
except Book.MultipleObjectsReturned:
    print("More than one book matches your query.")
- Book.objects.get(title='The Great Gatsby', author='F. Scott Fitzgerald') tries to fetch a single Book object that matches both conditions.
- Django treats multiple keyword arguments in get() as an AND operation, meaning all conditions must be true for the object to be returned.
Using Primary Key with get()
Fetching objects by their primary key (usually id) is a common and efficient way to retrieve a single record:
book = Book.objects.get(pk=1) # Get book with primary key 1
- pk is a shortcut for the model’s primary key field.
- This query retrieves the exact object with id=1.
Practical Uses of get()
- Authenticating users by username or email.
- Retrieving records using unique fields like primary keys.
- Getting exact matches when only one record is expected.
Using get() in the Django Shell
The Django shell is an interactive Python environment for experimenting with models and QuerySets in real time. It’s perfect for:
- Testing database queries
- Exploring data
- Debugging without writing views or templates
Example: Fetching a Book Object Using get()
Consider the book model. Data can be fetched from it using the Python shell:
1. Activate the Shell:
python manage.py shell
2. Use the following commands:
>>> from app.models import Book
>>> book = Book.objects.get(id=2)
>>> print(book)
This should print the details of book with id = 2.

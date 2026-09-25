# Aggregation and Annotation in Django

> Source: https://www.geeksforgeeks.org/python/aggregate-vs-annotate-in-django/

Django's ORM offers tools for querying and performing calculations on database data. Two commonly used methods are aggregate() and annotate().
- aggregate() summarizes data across the entire queryset (e.g., total, average, count).
- annotate() computes and adds calculated values for each individual object in the queryset.
aggregate() vs annotate()
| aggregate() | annotate() | 
|---|---|
| Performs calculations over the entire queryset. | Performs calculations for each object in the queryset. | 
| Returns a dictionary with computed values. | Returns a queryset with extra computed fields added to each object. | 
| Example: Book.objects.aggregate(total_price=Sum('price')) returns {'total_price': 5000} | Example: Author.objects.annotate(num_books=Count('book')) adds a num_books field to each author | 
| Use for summary statistics like total, average, max, min. | Use for per-object analytics like counts, sums, or averages for each object. | 
| Scope is global for the queryset. | Scope is individual per object. | 
Example
Consider a project named 'bookstore_project' having an app named 'store'. The app contains two models, Author and Book and we will perform aggregations to analyze book data.
from django.db import models
class Author(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name
class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, related_name='books')
    price = models.DecimalField(max_digits=5, decimal_places=2)
    published_date = models.DateField()
    def __str__(self):
        return self.title
Sample Dataset
# Create sample authors
author1 = Author.objects.create(name='John Doe')
author2 = Author.objects.create(name='Jane Smith')
# Create sample books
Book.objects.create(title='Book 1', author=author1,
                    price=19.99, published_date=datetime.date(2024, 1, 15)
Book.objects.create(title='Book 2', author=author1,
                    price=25.50, published_date=datetime.date(2024, 2, 20)
Book.objects.create(title='Book 3', author=author2, 
                    price=12.75, published_date=datetime.date(2024, 3, 10)
Book.objects.create(title='Book 4', author=author2, 
                    price=18.00, published_date=datetime.date(2024, 4, 25)
Using aggregate()
Calculate the total number of books and the average price of all books in the bookstore.
from django.db.models import Avg, Count, Sum
# Aggregate data
summary = Book.objects.aggregate(
    total_books=Count('id'),
    average_price=Avg('price'),
    total_price=Sum('price')
)
print(summary)
Output
{'total_books': 4, 'average_price': 18.81, 'total_price': 76.24}
In this example, aggregate() summarizes the dataset by calculating the total number of books, the average price and the combined price of all books.
Using annotate()
Calculate the number of books and the average price of books for each author.
from django.db.models import Count, Avg
# Annotate data
author_summary = Author.objects.annotate(
    total_books=Count('book'),
    average_price=Avg('book__price')
)
for author in author_summary:
    print(f'{author.name} - Total Books: {author.total_books}, 
          					Average Price: {author.average_price}')
Output
# John Doe - Total Books: 2, Average Price: 22.74
# Jane Smith - Total Books: 2, Average Price: 15.38
annotate() adds total_books and average_price fields to each Author record, showing the count of books and the average price per author.

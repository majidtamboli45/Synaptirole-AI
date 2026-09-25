# ViewSets and Routers in Django REST Framework

> Source: https://www.geeksforgeeks.org/python/viewsets-routers-django-rest-framework/

In Django REST Framework (DRF), ViewSets allow defining API actions like list, retrieve, create, and update in a single class. Routers work with ViewSets to generate URL patterns automatically, removing the need for manual URL setup.
- Removes the need to write separate views and URLs for common CRUD operations.
- Creates consistent and predictable URL patterns automatically.
- Let developers focus on models, serializers, and logic instead of mapping HTTP methods.
- Useful for APIs that follow standard CRUD flows, reducing development effort.
- Supports custom endpoints using the @action decorator when extra behavior is needed.
Refactoring to Use ViewSets
Instead of defining separate views for listing and retrieving objects, a single ViewSet can manage multiple actions:
# views.py
from rest_framework import viewsets
from django.contrib.auth.models import User
from .serializers import UserSerializer
class UserViewSet(viewsets.ReadOnlyModelViewSet):
    """
    Provides 'list' and 'retrieve' actions automatically.
    """
    queryset = User.objects.all()
    serializer_class = UserSerializer
ReadOnlyModelViewSet restricts operations to read-only actions (list, retrieve).
For a model such as Snippet, a full set of CRUD operations plus custom actions can be implemented in a single ViewSet:
# views.py
from rest_framework import viewsets, permissions, renderers
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Snippet
from .serializers import SnippetSerializer
from .permissions import IsOwnerOrReadOnly
class SnippetViewSet(viewsets.ModelViewSet):
    """
    Provides list, create, retrieve, update, destroy actions.
    Includes a custom `highlight` action.
    """
    queryset = Snippet.objects.all()
    serializer_class = SnippetSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    @action(detail=True, renderer_classes=[renderers.StaticHTMLRenderer])
    def highlight(self, request, *args, **kwargs):
        snippet = self.get_object()
        return Response(snippet.highlighted)
    def perform_create(self, serializer):
        # Assign the owner to the current authenticated user
        serializer.save(owner=self.request.user)
- ModelViewSet provides standard CRUD operations.
- @action decorator allows defining custom endpoints beyond the standard actions.
- perform_create() ensures that ownership is assigned automatically during creation.
Manual URL Binding
ViewSets can be manually mapped to URLs to retain explicit control.
# urls.py
from django.urls import path
from rest_framework import renderers
from .views import SnippetViewSet, UserViewSet
snippet_list   = SnippetViewSet.as_view({"get": "list", "post": "create"})
snippet_detail = SnippetViewSet.as_view({"get": "retrieve", "put": "update", "patch": "partial_update", "delete": "destroy"})
snippet_highlight = SnippetViewSet.as_view({"get": "highlight"}, renderer_classes=[renderers.StaticHTMLRenderer])
user_list   = UserViewSet.as_view({"get": "list"})
user_detail = UserViewSet.as_view({"get": "retrieve"})
urlpatterns = [
    path("", api_root),
    path("snippets/", snippet_list, name="snippet-list"),
    path("snippets/<int:pk>/", snippet_detail, name="snippet-detail"),
    path("snippets/<int:pk>/highlight/", snippet_highlight, name="snippet-highlight"),
    path("users/", user_list, name="user-list"),
    path("users/<int:pk>/", user_detail, name="user-detail"),
]
- .as_view() maps HTTP methods to ViewSet actions.
- Custom renderers can be specified for special endpoints.
Routers for Automatic URL Configuration
To simplify URL management, routers can register ViewSets automatically:
# urls.py
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import AuthorViewSet, BookViewSet
router = DefaultRouter()
router.register(r"authors", AuthorViewSet, basename="author")
router.register(r"books",   BookViewSet,   basename="book")
urlpatterns = [
    path("", include(router.urls)),
]
- Standard CRUD endpoints are generated automatically.
- A root API view listing registered endpoints is included.
- Minimal boilerplate is required compared to manual URL mapping
Example: Bookstore API
Consider a project named 'geeksforgeeks' having an app named 'geeks'. After creating the project and the app, a model will be defined for managing Authors and Books.
In geeks/models.py:
from django.db import models
from django.contrib.auth.models import User
class Author(models.Model):
    name        = models.CharField(max_length=100)
    biography   = models.TextField(blank=True)
    owner       = models.ForeignKey(User, related_name="authors", on_delete=models.CASCADE)
    def __str__(self):
        return self.name
class Book(models.Model):
    title       = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    author      = models.ForeignKey(Author, related_name="books", on_delete=models.CASCADE)
    owner       = models.ForeignKey(User, related_name="books", on_delete=models.CASCADE)
    def __str__(self):
        return self.title
Database Migration
After creating the models, the database tables can be created using the following commands
python manage.py makemigrations
python manage.py migrate
These commands generate the necessary migration files and apply them to the database, creating the tables for Author and Book.
In geeks/serializers.py:
from rest_framework import serializers
from .models import Author, Book
class BookSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    class Meta:
        model  = Book
        fields = ['id', 'title', 'description', 'author', 'owner']
class AuthorSerializer(serializers.ModelSerializer):
    books = BookSerializer(many=True, read_only=True)
    owner = serializers.ReadOnlyField(source='owner.username')
    class Meta:
        model  = Author
        fields = ['id', 'name', 'biography', 'owner', 'books']
ViewSets( In geeks/views.py):
from rest_framework import viewsets, permissions
from .models import Author, Book
from .serializers import AuthorSerializer, BookSerializer
from .permissions import IsOwnerOrReadOnly
class AuthorViewSet(viewsets.ModelViewSet):
    queryset = Author.objects.all()
    serializer_class = AuthorSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
class BookViewSet(viewsets.ModelViewSet):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
Router URLs (In geeks/urls.py):
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import AuthorViewSet, BookViewSet
router = DefaultRouter()
router.register(r"authors", AuthorViewSet, basename="author")
router.register(r"books",   BookViewSet,   basename="book")
urlpatterns = [
    path("", include(router.urls)),
]
Run the Server
Once the project is set up and migrations are applied, start the server with
python manage.py runserver
Visiting the API
The API can be accessed through a web browser or an API client:
- List all authors: "http://127.0.0.1:8000/authors/"
- Create a new author: POST "http://127.0.0.1:8000/authors/"
- Retrieve an author: "http://127.0.0.1:8000/authors/1/"
- Update a book partially: PATCH "http://127.0.0.1:8000/books/5/"
- Delete a book: DELETE "http://127.0.0.1:8000/books/5/"
All endpoints follow standard CRUD conventions provided by the ViewSets and DefaultRouter.
HTTP Methods and Endpoints
Authors:
| Method | Endpoint | Action | 
|---|---|---|
| GET | /authors/ | List all authors | 
| POST | /authors/ | Create a new author | 
| GET | /authors/{id}/ | Retrieve a specific author | 
| PUT | /authors/{id}/ | Update an author completely | 
| PATCH | /authors/{id}/ | Update an author partially | 
| DELETE | /authors/{id}/ | Delete an author | 
Books:
| Method | Endpoint | Action | 
|---|---|---|
| GET | /books/ | List all books | 
| POST | /books/ | Create a new book | 
| GET | /books/{id}/ | Retrieve a specific book | 
| PUT | /books/{id}/ | Update a book completely | 
| PATCH | /books/{id}/ | Update a book partially | 
| DELETE | /books/{id}/ | Delete a book |

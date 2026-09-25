# Custom User Models in Django: AbstractUser and AbstractBaseUser

> Source: https://www.geeksforgeeks.org/python/custom-user-models-in-django/

Every Django project should implement a custom user model from the start. This approach avoids future issues and allows flexibility in authentication, user fields, and business logic. Two common ways to create a custom user model are: extending "AbstractUser" and using "AbstractBaseUser".
Creating custom user models: Using AbstractUser Model
AbstractUser allows you to extend Django’s default User model while retaining its built-in authentication features. Consider a project named "geeksforgeeks" with an app named "geeks", and add "geeks" to INSTALLED_APPS in settings.py.
Step 1: Define the Model
In geeks/models.py:
from django.contrib.auth.models import AbstractUser
from django.db import models
class User(AbstractUser):
    email = models.EmailField(unique=True, null=False, blank=False)
    phone_number = models.CharField(max_length=15, blank=True, null=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']
    def __str__(self):
        return self.email
- User(AbstractUser): Custom user model extending Django’s AbstractUser.
- email (unique) and phone_number fields added, email used for login (USERNAME_FIELD).
- REQUIRED_FIELDS ensures required fields for superuser, and __str__ returns the email.
Step 2: Update Settings.py
In setting.py:
AUTH_USER_MODEL = 'geeks.User'
Step 3: Admin Registration
In geeks/admin.py:
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User
class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ['email', 'first_name', 'last_name', 'is_staff']
    search_fields = ['email']
admin.site.register(User, CustomUserAdmin)
Step 4: Migrations
python manage.py makemigrations geeks
python manage.py migrate
Step 5: Create Superuser and Test
python manage.py createsuperuser
Email: admin@example.com
Password: ****
Step 6: Run the Server
python manage.py runserver
Visit: "http://127.0.0.1:8000/admin/" to manage users.
Using AbstractBaseUser Model
AbstractBaseUser gives full control over the user model but requires implementing authentication logic, manager classes, and additional fields.
Step 1: Define the Model
In geeks/models.py:
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("Email is required")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)
class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True, null=False, blank=False)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    objects = UserManager()
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name']
    def __str__(self):
        return self.email
- UserManager handles user creation, validating email, setting passwords, and creating superusers with is_staff and is_superuser.
- User extends "AbstractBaseUser" and "PermissionsMixin" for authentication and permissions.
- Core fields: email (unique, login ID), first_name, last_name, is_active, is_staff.
- USERNAME_FIELD is email, REQUIRED_FIELDS for superuser, and __str__ returns the email.
Step 2: Update Settings.py
In settings.py:
AUTH_USER_MODEL = 'geeks.User'
Step 3: Admin Registration
In geeks/admin.py:
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User
class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ['email', 'first_name', 'last_name', 'is_staff']
    search_fields = ['email']
admin.site.register(User, CustomUserAdmin)
Step 4: Migrations
python manage.py makemigrations geeks
python manage.py migrate
Step 5: Create Superuser and Test
$ python manage.py createsuperuser
Email: admin@example.com
Password: ****
Step 6: Run the Server
$ python manage.py runserver
Visit: "http://127.0.0.1:8000/admin/" to manage users.
AbstractUser Model vs AbstractBaseUser Model
| AbstractUser | AbstractBaseUser | 
|---|---|
| Extends Django's default User with extra fields | Minimal base class, all fields must be defined manually | 
| Easy to implement and use | Requires custom manager and full authentication logic | 
| Retains username, email, first_name, last_name by default | Only fields you define exist | 
| Suitable for small modifications to default User | Suitable for complete control over user model and authentication |

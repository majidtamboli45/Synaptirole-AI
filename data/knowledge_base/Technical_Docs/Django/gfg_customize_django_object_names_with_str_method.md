# Customize Django Object Names with __str__ Method

> Source: https://www.geeksforgeeks.org/python/change-object-display-name-using-__str__-function-django-models-python/

When Django model instances are created, they appear in the admin interface with generic labels like ModelName object (1). This default naming can make it difficult to identify specific records when multiple entries exist.
Giving model instances clear, readable names makes them easier to identify and manage.
- Django uses a generic placeholder when no readable name is defined.
- Meaningful names help quickly identify records in the admin panel.
- Overriding the __str__() method in the model class defines how objects are displayed.
- Improves clarity and usability for developers and administrators.
Example: Consider a project named 'geeksforgeeks' having an app named 'geeks'.
In models.py:
from django.db import models
from django.db.models import Model
# Create your models here.
class GeeksModel(Model):
    geeks_field = models.CharField(max_length = 200)
After creating this model, we need to run two commands in order to create Database for the same:
python manage.py makemigrations
python manage.py migrate
After migrations and creating an instance with "GfG is Best" as the geeks_field value, the admin will display it as GeeksModel object (1). This default label is not descriptive and makes it hard to identify the entry.
To make objects more readable in the admin, add a __str__ method to the model. This method should return a descriptive string representing the object.
In models.py:
from django.db import models
class GeeksModel(models.Model):
    geeks_field = models.CharField(max_length=200)
    
    def __str__(self):
        return self.geeks_field  # Returns the value of geeks_field as the display name
Creating an object with geeks_field = "GfG is Best" will display "GfG is Best" in the admin instead of the generic "GeeksModel object (1)".

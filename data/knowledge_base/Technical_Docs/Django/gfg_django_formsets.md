# Django Formsets

> Source: https://www.geeksforgeeks.org/python/django-formsets/

Django Formsets allow managing multiple instances of the same form on a single page. Instead of creating each form Django Formsets simplify managing multiple instances of the same form on a single page. Instead of creating each form separately, formsets group them together, allowing all forms to be displayed, validated, and processed simultaneously.
For instance, when users need to add multiple articles at once, a formset can render several article forms together, making it easier to handle multiple inputs efficiently.
Example: Creating a Simple Form and Formset
Consider a project named 'geeksforgeeks' having an app named 'geeks'.
Step 1: Define a Basic Form
In forms.py, define a simple form, syntax:
field_name = forms.FieldType(attributes)
from django import forms
class GeeksForm(forms.Form):
    title = forms.CharField()
    description = forms.CharField()
Each field name appears on the left, and its type and attributes are defined on the right.
Step 2: Create a Formset in Views
In views.py, import formset_factory and create a view to render the formset:
from django.shortcuts import render
from django.forms import formset_factory
from .forms import GeeksForm
def formset_view(request):
    GeeksFormSet = formset_factory(GeeksForm)
    formset = GeeksFormSet()
    return render(request, "home.html", {'formset': formset})
Step 3: Render the Formset in a Template
In templates/home.html, display the formset:
<form method="POST" enctype="multipart/form-data">
    {% csrf_token %}
    {{ formset.management_form }}
    {{ formset.as_p }}
    <input type="submit" value="Submit">
</form>
management_form is required for Django to track and validate formset data.
Run the server:
python manage.py runserver
Visit: "http://localhost:8000/"
The formset is now functional. Next, modify it to explore additional features and customization options available in Django Formsets.
Step 4: Handling Multiple Forms with extra
By default, a formset displays one form. To show multiple forms, use the extra parameter:
GeeksFormSet = formset_factory(GeeksForm, extra=5)  # Shows 5 forms
formset = GeeksFormSet()
The keyword argument "extra" makes multiple copies of same form. If one wants to create 5 forms enter extra = 5 and similarly for others.
Visit: "http://localhost:8000/" to check 5 forms:
Step 5: Processing Submitted Formset Data
To handle submitted data, update view to bind POST data and validate:
def formset_view(request):
    GeeksFormSet = formset_factory(GeeksForm, extra=3)
    if request.method == 'POST':
        formset = GeeksFormSet(request.POST)
        if formset.is_valid():
            for form in formset:
                print(form.cleaned_data)  # Process form data here
    else:
        formset = GeeksFormSet()
    return render(request, "home.html", {'formset': formset})

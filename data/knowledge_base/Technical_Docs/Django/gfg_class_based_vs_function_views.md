# Class Based vs Function Based Views

> Source: https://www.geeksforgeeks.org/python/class-based-vs-function-based-views-which-one-is-better-to-use-in-django/

A core feature of Django is views, which define how data is presented to users. Views can be implemented in two main ways: Function-Based Views (FBVs) and Class-Based Views (CBVs).
Function-Based Views (FBVs)
FBVs are simple Python functions that receive a request, process it and return a response. They provide a straightforward way to handle HTTP requests.
Pros of FBVs:
- Easy to understand, especially for beginners.
- Explicit code flow for each HTTP method.
- Flexible and quick to implement.
- Simple decorator usage (e.g., @login_required).
Cons of FBVs:
- Code duplication in larger projects.
- Conditional branching for multiple HTTP methods can get messy.
Example: Creating a function-based view
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import render
from .forms import MyForm
def example_create_view(request):
  template_name = 'form.html'
  form_class = MyForm
  form = form_class()
  if request.method == 'POST':
    form = form_class(request.POST)
    if form.is_valid():
      form.save()
      return HttpResponseRedirect(reverse('list-view'))
  return render(request, template_name, {'form': form})
In this example:
- Renders a form using template_name and form_class.
- On POST, validates and saves the form.
- Redirects if successful; re-renders with errors if invalid.
Class-Based Views (CBVs)
CBVs are Python classes that handle requests using object-oriented principles such as inheritance and mixins. They promote reusable and organized view logic, making it easier to manage complex views and avoid code duplication.
Pros of CBVs:
- Promotes DRY (Don’t Repeat Yourself) principle.
- Better code organization via methods like get(), post().
- Supports inheritance and mixins for modularity.
- Built-in generic views (CreateView, UpdateView, DeleteView).
Cons of CBVs:
- More abstract, harder for beginners to grasp.
- Less explicit code flow (uses dispatch() and as_view()).
- May require extra imports and method overrides.
Example: Creating a class-based view
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View
from .forms import MyForm
class MyCreateView(View):
    template_name = 'form.html'
    form_class = MyForm
    def get(self, request, *args, **kwargs):
        form = self.form_class()
        return render(request, self.template_name, {'form': form})
    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('list-view'))
        return render(request, self.template_name, {'form': form})
Note: Ensure that the template file 'form.html' exists inside your app's templates directory (e.g., templates/form.html), otherwise Django will raise a TemplateDoesNotExist error.
- as_view() is inherited from View and returns a callable to handle requests.
- When a request arrives, as_view() calls dispatch(), which determines the correct method (get(), post(), etc.).
You can override class attributes dynamically when defining URL patterns:
from django.urls import path
from .views import MyCreateView
urlpatterns = [
    path('new/', MyCreateView.as_view(), name='original-create-view'),
    path(
        'new_two/',
        MyCreateView.as_view(
            template_name='other_form.html',
            form_class=MyOtherForm
        ),
        name='modified-create-view'
    ),
]
- Generic CBVs (like CreateView) allow overriding helper methods such as get_form_class() or get_template_names() to insert custom logic instead of just changing class attributes.
- Example: With ModelFormMixin, you can override form_valid() to modify self.object before saving.
Generic Class-Based View
Django’s generic CBVs provide pre-built views for common tasks like creating, updating, listing and deleting objects. They reduce boilerplate by automatically handling standard operations such as form display, validation, and saving.
from django.views.generic import CreateView
from .models import MyModel
from .forms import MyModelForm
class MyCreateView(CreateView):
    model = MyModel
    form_class = MyModelForm
    template_name = 'form.html'
    success_url = '/success/'
In this example:
- CreateView automatically handles GET and POST requests.
- Only need to specify model, form, template, and success URL.
- Saves time and avoids repetitive code for standard CRUD operations.
FBVs vs CBVs
| Function-Based Views (FBVs) | Class-Based Views (CBVs) | 
|---|---|
| Best for simple or one-off views with minimal logic. | Ideal for reusable or complex views. | 
| Suitable for small, straightforward functionality. | Handles multiple HTTP methods or advanced logic cleanly. | 
| Quick to prototype with minimal overhead. | Saves time with built-in generic views like CreateView, UpdateView, and DeleteView. | 
| Provides full control over request handling. | Promotes reusable code using inheritance and mixins. | 
| Example Use Cases: Contact form, simple data display, basic API endpoint | Example Use Cases: Blog post CRUD, user management, e-commerce product views |

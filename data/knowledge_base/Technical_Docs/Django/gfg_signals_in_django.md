# Signals in Django

> Source: https://www.geeksforgeeks.org/python/how-to-create-and-use-signals-in-django/

Signals provide a way to respond to actions occurring within an application. They allow tasks like logging, cache invalidation, or automatic data updates to execute without tightly coupling the code. Signals follow a publish-subscribe pattern, where a sender broadcasts an event and receivers handle it.
Built-in Signals
Django provides around 20 built-in signals, organized by category. They trigger at specific points in the framework lifecycle, allowing applications to respond to events such as model saves, deletions, or request/response processing.
Model Signals
| Signal | When It’s Triggered | Key Arguments | 
|---|---|---|
| pre_save | Before a model instance is saved | sender, instance, raw, using, update_fields | 
| post_save | After a model instance is saved | sender, instance, created, raw, using, update_fields | 
| pre_delete | Before a model instance is deleted | sender, instance, using | 
| post_delete | After a model instance is deleted | sender, instance, using | 
| m2m_changed | When a ManyToMany field is modified | sender, instance, action, pk_set, using | 
Request/Response Signals
| Signal | When It’s Triggered | Key Arguments | 
|---|---|---|
| request_started | When Django starts processing a request | sender | 
| request_finished | When Django finishes processing a request | sender | 
| got_request_exception | When an exception occurs in a view | request | 
Database Signals
| Signal | When It’s Triggered | Key Arguments | 
|---|---|---|
| connection_created | When a new database connection is opened | connection | 
| post_migrate | After migrations run for an app | sender, app_config, verbosity, interactive, using, apps | 
Connect to these via decorators or methods. Always specify sender for efficiency.
Connecting and Disconnecting Receivers
Signals in Django need receiver functions to respond when an event is triggered. Receivers can be connected and disconnected using decorators or the connect()/disconnect() methods.
1. Using Decorators
from django.db.models.signals import post_save
from django.dispatch import receiver
from myapp.models import CustomUser
@receiver(post_save, sender=CustomUser)
def create_profile(sender, instance, created, **kwargs):
    if created:
        # Logic to create a related profile
        print(f"Profile created for {instance.username}")
- @receiver(signal, sender=Model) connects the function to the signal.
- sender ensures the receiver only listens to that specific model, improving efficiency.
2. Using connect() Method
from django.db.models.signals import post_save
from myapp.models import CustomUser
def create_profile(sender, instance, created, **kwargs):
    if created:
        print(f"Profile created for {instance.username}")
# Connect manually
post_save.connect(create_profile, sender=CustomUser)
3. Disconnecting Receivers
To stop a receiver from listening:
post_save.disconnect(create_profile, sender=CustomUser)
This can be useful in tests or temporary signal handling. Always specify the sender when connecting to signals. It reduces unnecessary function calls and improves performance.
Sending Signals
Built-in signals fire automatically, but custom signals can be sent manually when needed.
from django.dispatch import Signal
# Define a custom signal
my_signal = Signal()  # Or specify arguments: Signal(arg_types=['str', 'int'])
# Send the signal (fires all connected receivers)
my_signal.send(sender=self.__class__, message="Hello", count=5)
# Robust send (catches exceptions and reports failures without stopping other receivers)
my_signal.send_robust(sender=self.__class__, message="Hello", count=5)
- send(): Fails fast if a receiver raises an exception.
- send_robust(): Continues sending to other receivers; exceptions are returned in a SignalError list.
- Signal receivers always receive the sender, which is the object or class sending the signal, and kwargs, containing any additional data passed during send().
This allows custom events to trigger multiple receivers in a clean and decoupled way.
Signals Working
Django signals allow decoupled components to get notified when certain actions occur. The flow works as follows:
1. Define or Use a Signal
- Use a built-in signal like post_save or define a custom signal using Signal().
2. Connect a Receiver
- A receiver is a function or method that reacts when the signal is sent.
- Connect it using the @receiver decorator or signal.connect() method.
3. Send the Signal
- Built-in signals are fired automatically by Django.
- Custom signals are fired manually using send() or send_robust().
4. Receiver Executes
- The connected receiver receives the sender and any additional kwargs passed.
- It performs the intended action (e.g., logging, updating related objects, sending notifications).
Example: Auto-Creating User Profile with Django Signals
Consider a project named 'userprofile_project' having an app named 'users'.
Automatically create a profile for every new user upon registration.
models.py: Each user has a profile linked via a one-to-one relationship.
from django.db import models
from django.contrib.auth.models import User
from PIL import Image
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
    def __str__(self):
        return f'{self.user.username} Profile'
views.py:
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserUpdateForm, ProfileUpdateForm
def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Your account has been created! You are now able to log in')
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})
@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST,
                                   request.FILES,
                                   instance=request.user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('profile')
    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)
    context = {
        'u_form': u_form,
        'p_form': p_form
    }
    return render(request, 'users/profile.html', context)
forms.py: Defines forms for user registration and profile updates.
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Profile
class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()
    class Meta:
        model = User
        fields = ['username', 'email']
class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image']
signals.py(Using receiver method): Automatically creates and saves a profile when a User is created.
from django.db.models.signals import post_save, pre_delete
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Profile
@receiver(post_save, sender=User) 
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
 
@receiver(post_save, sender=User) 
def save_profile(sender, instance, **kwargs):
        instance.profile.save()
When the User model is saved, a signal called create_profile is fired. This signal creates a Profile instance with a foreign key pointing to the saved User instance. The save_profile signal ensures that the profile instance is also saved after the user is saved.
Signals can also be loaded automatically using AppConfig:
from django.apps import AppConfig
class UsersConfig(AppConfig):
    name = 'users'
    def ready(self):
        import users.signals
The signal resides in the signals.py file of the app.
If user is created:
Then his profile is automatically created:
Check it in admin view:
Using pre_save with Receiver Method
The pre_save signal is triggered immediately before a model's save() method is executed. The model is saved only after the pre_save signal completes successfully.
from django.db.models.signals import post_save, pre_delete,pre_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Profile
@receiver(pre_save, sender=User) 
def checker(sender, instance, **kwargs):
    if instance.id is None:
        pass
    else:
      current=instance
      previous=User.objects.get(id=instance.id)
      if previous.reaction!= current.reaction:
               #save method can be called
This signal ensures actions are executed conditionally, for example, only if a specific field has changed.
Using connect() Method
Signals can also be connected without decorators by using the connect() method. This is an alternative to the @receiver decorator.
from django.db.models.signals import post_save, pre_save
# Fires when any save occurs on MyModel
post_save.connect(my_function_post_save, sender=MyModel)
# Fires before save on UserTextMessage
pre_save.connect(my_function, sender=UserTextMessage)
This method provides the same functionality as receiver decorators, allowing explicit control over which functions handle which signals.
Advantages and Considerations
Signals promote loose coupling by notifying external handlers instead of embedding side effects directly in model methods.
| Advantage | Drawback / Consideration | 
|---|---|
| Reusability: A single signal can trigger multiple receivers across different apps. | Performance: Each signal emission calls all connected receivers, which may impact high-traffic applications. | 
| Separation of Concerns: Models remain lean while tasks like sending emails or updating caches are handled externally. | Debugging: Side effects triggered by signals are less explicit and harder to trace. | 
| Extensibility: Third-party apps can connect to signals without modifying existing code. | Execution Order: Receivers execute in connection order, not a guaranteed sequence. |

# Calculate CGPA using Python Django

> Source: https://www.geeksforgeeks.org/python/calculate-cgpa-using-python-django/

We will build a secure and user-friendly CGPA calculator using Django. Starting with user registration and login, the app lets students input their subjects, grades, and credits. After entering all data, they can instantly calculate their CGPA and generate a printable result.
What is CGPA Calculator ?
A CGPA (Cumulative Grade Point Average) calculator is a tool used to determine a student's overall academic performance based on the grades obtained in various courses or subjects over a specific period. It assigns a numerical value, known as the Grade Point, to each grade received, and the CGPA is calculated as the average of these grade points.
Project Setup
Create Project and App
Start by creating a new Django project and app:
django-admin startproject core
cd core
python manage.py startapp home
Register the App
Add the app to your settings.py under INSTALLED_APPS:
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "home",
]
File Structure:
Define Models (models.py)
models.py : This Django model, named "Subject," includes fields for user (linked to the built-in User model), subject name, grade (with predefined choices), and credit. The `__str__` method customizes the string representation of an instance.
from django.db import models
from django.contrib.auth.models import User
class Subject(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=255)
    grade = models.CharField(max_length=2, choices=[('S', 'S'), ('A', 'A'), ('B', 'B'), ('C', 'C'), ('D', 'D'), ('F', 'F')])
    credit = models.PositiveIntegerField()
    def __str__(self):
        return f"{self.name} - Grade: {self.grade}, Credit: {self.credit}"
Handle Business Logic in Views
views.py : In below code, Django application includes views for a CGPA calculator, subject editing, subject deletion, and a result view. It also has user authentication functionalities, including a login page, registration page, and a logout function. The CGPA calculator computes the CGPA based on subjects and their grades, while the result view displays the result in a PDF template. User authentication is implemented with login, registration, and logout functionalities. Error messages are displayed for incorrect login attempts or registration issues.
from django.shortcuts import render, redirect, get_object_or_404
from .models import Subject
from .forms import SubjectForm
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.contrib import messages
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required 
from django.contrib.auth.models import User
from django.contrib.auth import logout
# Mapping of letter grades to numeric values
GRADE_POINTS = {'A': 9, 'S': 10, 'B': 8, 'C': 7, 'D': 6, 'F': 0}
@login_required(login_url='/login/')
def cgpa_calculator(request):
    subjects = Subject.objects.all()
    form = SubjectForm()
    if request.method == 'POST':
        form = SubjectForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('cgpa_calculator')
    # Calculate CGPA
    total_credits = 0
    total_grade_points = 0
    for subject in subjects:
        total_credits += subject.credit
        total_grade_points += subject.credit * GRADE_POINTS.get(subject.grade, 0)
    if total_credits != 0:
        cgpa = total_grade_points / total_credits
    else:
        cgpa = 0
    context = {
        'subjects': subjects,
        'form': form,
        'cgpa': cgpa,
    }
    return render(request, 'index.html', context)
@login_required(login_url='/login/')
def edit_subject(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    if request.method == 'POST':
        form = SubjectForm(request.POST, instance=subject)
        if form.is_valid():
            form.save()
            return redirect('cgpa_calculator')
    else:
        form = SubjectForm(instance=subject)
    context = {
        'form': form,
        'subject_id': subject_id,
    }
    return render(request, 'edit_subject.html', context)
@login_required(login_url='/login/')
def delete_subject(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    subject.delete()
    return redirect('cgpa_calculator')
@login_required(login_url='/login/')
def result(request):
    subjects = Subject.objects.all()
    form = SubjectForm()
    if request.method == 'POST':
        form = SubjectForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('cgpa_calculator')
    # Calculate CGPA
    total_credits = 0
    total_grade_points = 0
    for subject in subjects:
        total_credits += subject.credit
        total_grade_points += subject.credit * GRADE_POINTS.get(subject.grade, 0)
    if total_credits != 0:
        cgpa = total_grade_points / total_credits
    else:
        cgpa = 0
    context = {
        'subjects': subjects,
        'form': form,
        'cgpa': cgpa,
    }
    return render(request, 'pdf.html', context)
#login page for user
def login_page(request):
    if request.method == "POST":
        try:
            username = request.POST.get('username')
            password = request.POST.get('password')
            user_obj = User.objects.filter(username=username)
            if not user_obj.exists():
                messages.error(request, "Username not found")
                return redirect('/login/')
            user_obj = authenticate(username=username, password=password)
            if user_obj:
                login(request, user_obj)
                return redirect('receipts')
            messages.error(request, "Wrong Password")
            return redirect('/login/')
        except Exception as e:
            messages.error(request, "Something went wrong")
            return redirect('/register/')
    return render(request, "login.html")
#register page for user
def register_page(request):
    if request.method == "POST":
        try:
            username = request.POST.get('username')
            password = request.POST.get('password')
            user_obj = User.objects.filter(username=username)
            if user_obj.exists():
                messages.error(request, "Username is taken")
                return redirect('/register/')
            user_obj = User.objects.create(username=username)
            user_obj.set_password(password)
            user_obj.save()
            messages.success(request, "Account created")
            return redirect('/login')
        except Exception as e:
            messages.error(request, "Something went wrong")
            return redirect('/register')
    return render(request, "register.html")
#logout function
def custom_logout(request):
    logout(request)
    return redirect('login') 
Create Subject Form
forms.py : The "SubjectForm" in Django is a ModelForm linked to the "Subject" model. It includes fields for subject name, credit, and grade, enabling easy creation and modification of Subject instances through user interfaces.
from django import forms
from .models import Subject
class SubjectForm(forms.ModelForm):
    class Meta:
        model = Subject
        fields = ['name','credit', 'grade']
Configure URLs
Project urls.py
The main `urls.py` file in this Django project includes paths for the admin interface and includes URLs from the 'home.urls' module using the 'include' function, promoting modularity and organization in the project's URL configuration.
from django.contrib import admin
from django.urls import include, path
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('home.urls')),
]
App urls.py
The 'urls.py' file in the 'home' app of this Django project includes paths for views like 'cgpa_calculator', 'edit_subject', 'delete_subject', 'result', 'login_page', 'custom_logout', and 'register_page'. These paths correspond to various functionalities, defining the URL patterns for navigation within the application.
from django.urls import path
from .views import *
urlpatterns = [
    path('', cgpa_calculator, name='cgpa_calculator'),
    path('edit/<int:subject_id>/', edit_subject, name='edit_subject'),
    path('delete/<int:subject_id>/', delete_subject, name='delete_subject'),
    path('result/', result, name='result'),
    
    path('login/' , login_page, name='login'),
    path('logout/', custom_logout, name="logout"),
    path('register/', register_page, name='register'),
 
     
]
Creating GUI
login.html: This HTML file implements a simple login form for a CGPA Calculator web application using Bootstrap. It includes fields for username and password, with messages displayed for login outcomes. The form is styled using Bootstrap classes for a clean and responsive design, and there's a link to the registration page.
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>CGPA Calculator</title>
</head>
<body>
    <br>
   <br>
   <br>
    
    <div class="container  mt-4 bg-white col-md-3 card shadow p-3 " id="log">
        <div class="login-form">
            {% if messages %}
            {% for message in messages %}
            <div class="alert alert-success {{ message.tags }} mt-4" role="alert">
                {{ message }}
            </div>
            {% endfor %}
            {% endif %}
            <form action="" method="post">
                {% csrf_token %}
                <h4 class="text-center" style="font-family: 'Times New Roman', Times, serif;">  Login </h4>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username" required
                        style="background-color: #fff; border: 1px solid #ddd; border-radius: 5px; padding: 10px;">
                </div>
                <div class="form-group mt-2">
                    <input type="password" class="form-control" name="password" placeholder="Password" required
                        style="background-color: #fff; border: 1px solid #ddd; border-radius: 5px; padding: 10px;">
                </div>
                <div class="form-group mt-2">
                    <button class="btn btn-light btn-block" style="margin-left: 138px;border: 0.5px solid black">Login</button>
                </div>
                <br>
            </form>
            <p class="text-center" style="color: #555;"><a href="{% url 'register' %}" style="color: #007bff;">Create an
                    Account.</a></p>
        </div>
    </div>
</body>
</html>
register.html: This HTML file implements a registration form for a CGPA Calculator web application using Bootstrap. It includes fields for username and password, with messages displayed for registration outcomes. The form is styled using Bootstrap classes for a clean and responsive design, and there's a link to the login page for existing users. The "Register" button has a style attribute for additional customization.
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>CGPA Calculator</title>
</head>
<body>
    <body>
        <br><br><br><br>
        <div class="container mt-4   bg-white mx-auto col-md-3 card shadow p-3">
            <div class="login-form">
                {% if messages %}
                {% for message in messages %}
                <div class="alert alert-success {{ message.tags }}" role="alert" >
                    {{ message }}
                </div>
                {% endfor %}
                {% endif %}
                <form action="" method="post">
                    {% csrf_token %}
                    <h4 class="text-center" style="font-family: 'Times New Roman', Times, serif;"> Register </h4>
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                    </div>
                    <div class="form-group mt-2">
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group mt-2">
                        <button class="btn btn-light btn-block" style="margin-left: 117px;border: 0.5px solid black">Register</button>
                    </div>
                    <br>
                </form>
                <p class="text-center" ><a href="{% url 'login' %}">Log In </a></p>
            </div>
        </div>
    </body>
</html>
index.html: This HTML file provides a clean and user-friendly web interface for a CGPA Calculator. It includes a form to add subjects, a table to display existing subjects with their grades and credits, and buttons for editing or deleting subjects. The styling is done using a combination of inline styles and embedded CSS. Additionally, there's a logout button at the bottom for user convenience.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGPA Calculator</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    #calculator {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    h1{
        color: #333;
        text-align: center;
        font-family: 'Times New Roman', Times, serif;
    }
    form {
        margin-bottom: 20px;
    }
    button {
        padding: 10px;
        color: black;
        border: none;
        font-size: 13px;
        font-weight: bold;
        border-radius: 3px;
        cursor: pointer;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #d9dad9d7;
        color: rgb(97, 93, 93);
    }
    #cgpa {
        font-weight: bold;
    }
    a{
        color: black;
    }
</style>
<body>
<div id="calculator">
    <h1 style="color: green;">GeeksforGeeks</h1>
    <h2 style="font-family: 'Times New Roman', Times, serif; text-align:center;">CGPA Calculator</h2>
    <br>
    <form method="post" action="{% url 'cgpa_calculator' %}">
        {% csrf_token %}
      {{form.as_p}}
        <button type="submit">Add Subject</button>
       <button> <a href="{% url 'result' %}">Generate Result</a></button>
    </form>
   <br>
    <table>
        <thead>
        <tr>
            <th>Subject</th>
            <th>Grade</th>
            <th>Credit</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        {% for subject in subjects %}
            <tr>
                <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.name }}</td>
                <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.grade }}</td>
                <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.credit }}</td>
                <td>
                  <button><a  href="{% url 'edit_subject' subject.id %}">Edit</a></button> 
                  <button><a href="{% url 'delete_subject' subject.id %}">Delete</a></button> 
                </td>
            </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
<br>
<button style="margin-left: 400px;"> <a class="ok" href="{% url 'logout' %}">Logout </a></button>
</body>
</html>
edit_subject.html: This HTML file offers a compact and centered layout for editing a subject. It includes a form with input fields, a "Save Changes" button linked to the 'edit_subject' view, and a "Cancel" button redirecting to the 'cgpa_calculator' view. Styling is kept minimal for a clean and focused editing experience.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #calculator {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h2 {
            font-family: 'Times New Roman', Times, serif;
        }
        button {
            padding: 10px;
            color: black;
            border: none;
            font-size: 13px;
            font-weight: bold;
            border-radius: 3px;
            cursor: pointer;
        }
        a {
            color: black;
        }
    </style>
    <div id="calculator">
        <br>
        <h2 style="text-align: center;">Edit Subject</h2>
        <br>
        <form method="post" action="{% url 'edit_subject' subject_id=subject_id %}">
            {% csrf_token %}
            {{ form.as_p }}
            <button type="submit">Save Changes</button>
        </form>
        <br>
        <button><a href="{% url 'cgpa_calculator' %}">Cancel</a></button>
    </div>
</body>
</html>
pdf.html: This HTML file represents a CGPA Calculator result page with a table displaying subjects, grades, and credits. It calculates and displays the CGPA. The "Generate Receipt" button triggers a JavaScript function to copy the content of the 'calculator' div, open a new window, and print the receipt. The styling is clean, and the jsPDF library is included for potential PDF generation, although not currently used in the provided code.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGPA Calculator</title>
    <!-- Add jsPDF library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    .calculator {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    form {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th,
    td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        color: rgb(97, 93, 93);
    }
    #cgpa {
        font-weight: bold;
    }
    button {
        padding: 10px;
        color: black;
        border: none;
        font-size: 13px;
        font-weight: bold;
        border-radius: 3px;
        cursor: pointer;
        margin-left:655px
    }
</style>
<body>
    <div id="mn" class="calculator" >
        <img style="width: 130px; height:130px; margin-left:230px" src="https://i.ibb.co/JkyXTWp/1696184885877pp.jpg" alt="">
        <br>
        <br>
        <table>
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Grade</th>
                    <th>Credit</th>
                </tr>
            </thead>
            <tbody>
                {% for subject in subjects %}
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.name }}</td>
                    <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.grade }}</td>
                    <td style="font-family: 'Times New Roman', Times, serif;">{{ subject.credit }}</td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
        <h3 style="font-family: 'Times New Roman', Times, serif;">CGPA: <span id="cgpa">{{cgpa}}</span></h3>
    </div>
    <br>
    <button onclick="myfun('mn')" type="button" class="btn btn-success btn1 ">Generate Receipt</button>
    <script type="text/javascript">
        function myfun(pa) {
            let d = document.getElementById(pa).innerHTML;
            document.body.innerHTML = d;
            window.print();
        }
    </script>
</body>
</html>
Deployment and Running
Run migrations:
python manage.py makemigrations
python manage.py migrate
Start the server:
python manage.py runserver
Visit http://127.0.0.1:8000/ to register, login, add subjects, and calculate your CGPA.
Output:

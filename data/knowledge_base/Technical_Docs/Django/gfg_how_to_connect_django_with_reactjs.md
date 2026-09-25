# How to Connect Django with Reactjs

> Source: https://www.geeksforgeeks.org/reactjs/how-to-connect-django-with-reactjs/

Connecting Django with React is a common way to build full-stack applications. Django handles the backend, database, and APIs, while React manages the frontend interface.
- Django and React are widely used and strong in their respective areas.
- React provides fast Single-Page Application (SPA) performance, and Django offers a powerful backend.
- Both have large communities that offer quick help and support.
- Together, they create a flexible and efficient full-stack development setup.
Connect front-end with back-end
While learning web development, work often begins with either the front-end (HTML, CSS, React, etc.) or the back-end (Django, Node.js, etc.). Connecting Django with React combines a strong backend with a dynamic frontend to build powerful applications.
- The backend creates APIs using Django REST Framework with methods like GET and POST.
- The frontend sends requests to these APIs from React to fetch or send data.
- Django handles data and business logic, while React manages the user interface.
- This interaction forms the basic workflow of modern web applications.
Setting Up the Backend
Consider a project named 'quotes' having an app named 'core'. We will create a simple application in which you can write a quote and the name of the author. Basically based on CRUD(Create Read Update and Delete) operations.
Folder Structure:
Step 1: Install Required Packages
pip install djangorestframework
pip install django-cors-headers
Step 2: Create Database
Let's create a database model. Name and detail are two fields that are used to store the name of the author and the quote submitted by the author respectively.
In core/models.py:
from django.db import models
class React(models.Model):
    name = models.CharField(max_length=30)
    detail = models.CharField(max_length=500)
    def __str__(self):
        return self.name
Step 3: Create Serializer
Create serializer.py inside the core folder. Here is the serializer for model React. Serializers are basically used to convert complex data to native Python datatypes that can then be easily rendered into JSON(Which we are going to use in React i.e. Client side).
from rest_framework import serializers
from .models import React
class ReactSerializer(serializers.ModelSerializer):
    class Meta:
        model = React
        fields = ['name', 'detail']
Step 4: Create Views
In views.py, methods such as GET, PUT, POST, and DELETE can be defined. GET and POST are implemented using Django class-based views. In the GET method, data is returned from the model by calling React.objects.all() and using list comprehension to convert authors and their quotes into Python dictionaries. In the POST method, data is stored by passing the incoming data to ReactSerializer().
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import React
from .serializer import ReactSerializer
class ReactView(APIView):
    serializer_class = ReactSerializer
    def get(self, request):
        detail = [
            {"name": obj.name, "detail": obj.detail}
            for obj in React.objects.all()
        ]
        return Response(detail)
    def post(self, request):
        serializer = ReactSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data)
Step 5: SetUp API Endpoints
Here is the main urls.py from the project quote. The localhost:8000/wel/ is the end-point of our ReactView.
from django.contrib import admin
from django.urls import path
from core.views import ReactView
urlpatterns = [
    path('admin/', admin.site.urls),
    path('wel/', ReactView.as_view(), name="react-view"),
]
Step 6: Update Configuration
There are few changes in settings.py file which are listed below:
- Add rest_framework , core, corsheaders to INSTALLED APPS
- Add corsheaders.middleware.CorsMiddleware to MIDDLEWARE list.
- Create a dictionary assigned to REST_FRAMEWORK variable in which insert 'DEFAULT_PERMISSION_CLASSES': [ 'rest_framework.permissions.AllowAny' ]
- Assign variable CORS_ORIGIN_ALLOW_ALL = True
INSTALLED_APPS = [
    ...
    'rest_framework',
     'corsheaders',
     'core',
]
MIDDLEWARE = [
    ...
   'corsheaders.middleware.CorsMiddleware',
   ...
]
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ]
}
CORS_ORIGIN_ALLOW_ALL = True
The corsheaders package is often associated with cross-origin access. This package informs the browser that a web application running at one origin is allowed to access selected resources from a different origin.
Step 7: Applying Migrations and Starting the Server
Run the following commands to create the required database tables:
python manage.py makemigrations
python manage.py migrate
Create a superuser for accessing the Django admin panel:
python manage.py createsuperuser --email admin@example.com --username admin
This command will run the server and the server should always be in running state:
python manage.py runserver
After the server starts, open the browser and access the endpoint: localhost:8000/wel/
Setting Up the Frontend
There is no requirement to place the front-end folder in the same directory as the back-end project. A React application also does not require a virtual environment. Use the following commands to set up the React application. Bootstrap is included for styling, and jQuery is added as a dependency for Bootstrap’s interactive components.
Step 1: Initialize React Project
npx create-react-app our-quote
Step 2: Switch to the Project Directory
Go to the project folder using the below command
cd our-quote
Step 3: Install Required Modules
npm install bootstrap jquery axios
Axios is the main tool for connecting back-end with front-end. All the requests will be sent to the server (back-end) with the help of Axios.
In our-quote/src/App.js:
import React from 'react'; 
class App extends React.Component { 
    render() { 
        return(
            <div>
                <div>
                    <div>
                        <h1>Quote is going to be written here</h1>
                        <footer>--- by
                          <cite title="Source Title"> 
                              written by meeeee 
                          </cite>
                        </footer>
                    </div>
                </div>
            </div>); 
    } 
} 
export default App;
Output: After running npm start development server of React will start and by default can view at localhost:3000:
Step 4: Fetch Data from API
Now we have to fetch data from the server by using Axios. The componentDidMount method is called when the component is rendered. This is the right time to request a server for the data. We have used Axios in this method to store the data in a state obtained from the server and later on rendered by the help of a map in JavaScript.
In our-quote/src/App.js:
import React from 'react';
import axios from 'axios';
class App extends React.Component {
    state = {
        details : [],
    }
    componentDidMount() {
        let data ;
        axios.get('http://localhost:8000/wel/')
        .then(res => {
            data = res.data;
            this.setState({
                details : data    
            });
        })
        .catch(err => {})
    }
  render() {
    return(
      <div>
            {this.state.details.map((detail, id) =>  (
            <div key={id}>
            <div >
                  <div >
                        <h1>{detail.detail} </h1>
                        <footer >--- by
                        <cite title="Source Title">
                        {detail.name}</cite>
                        </footer>
                  </div>
            </div>
            </div>
            )
        )}
      </div>
      );
  }
}
export default App;
Output: As there is no data to display so fill some data in the database from the server-side.
Step 5: Create Form for added Quotes
Now the only part left with this project is to create a form so that the user can fill the data from Client-side which is the correct way to do so. Here is the form submitting a response from Client-side along with bootstrap.
In our-quote/src/App.js:
// Filename - src/App.js
import React from "react";
import axios from "axios";
class App extends React.Component {
    state = {
        details: [],
        user: "",
        quote: "",
    };
    componentDidMount() {
        let data;
        axios
            .get("http://localhost:8000/wel/")
            .then((res) => {
                data = res.data;
                this.setState({
                    details: data,
                });
            })
            .catch((err) => {});
    }
    renderSwitch = (param) => {
        switch (param + 1) {
            case 1:
                return "primary ";
            case 2:
                return "secondary";
            case 3:
                return "success";
            case 4:
                return "danger";
            case 5:
                return "warning";
            case 6:
                return "info";
            default:
                return "yellow";
        }
    };
    handleInput = (e) => {
        this.setState({
            [e.target.name]: e.target.value,
        });
    };
    handleSubmit = (e) => {
        e.preventDefault();
        axios
            .post("http://localhost:8000/wel/", {
                name: this.state.user,
                detail: this.state.quote,
            })
            .then((res) => {
                this.setState({
                    user: "",
                    quote: "",
                });
            })
            .catch((err) => {});
    };
    render() {
        return (
            <div className="container jumbotron ">
                <form onSubmit={this.handleSubmit}>
                    <div className="input-group mb-3">
                        <div className="input-group-prepend">
                            <span className="input-group-text"
                                  id="basic-addon1">
                                {" "}
                                Author{" "}
                            </span>
                        </div>
                        <input type="text" className="form-control" 
                               placeholder="Name of the Poet/Author"
                               aria-label="Username"
                               aria-describedby="basic-addon1"
                               value={this.state.user} name="user"
                               onChange={this.handleInput} />
                    </div>
                    <div className="input-group mb-3">
                        <div className="input-group-prepend">
                            <span className="input-group-text">
                               Your Quote 
                            </span>
                        </div>
                        <textarea className="form-control " 
                                  aria-label="With textarea"
                                  placeholder="Tell us what you think of ....." 
                                  value={this.state.quote} name="quote" 
                                  onChange={this.handleInput}>
                        </textarea>
                    </div>
                    <button type="submit" className="btn btn-primary mb-5">
                        Submit
                    </button>
                </form>
                <hr
                    style={{
                        color: "#000000",
                        backgroundColor: "#000000",
                        height: 0.5,
                        borderColor: "#000000",
                    }}
                />
                {this.state.details.map((detail, id) => (
                    <div key={id}>
                        <div className="card shadow-lg">
                            <div className={"bg-" + this.renderSwitch(id % 6) + 
                                          " card-header"}>Quote {id + 1}</div>
                            <div className="card-body">
                                <blockquote className={"text-" + this.renderSwitch(id % 6) + 
                                                   " blockquote mb-0"}>
                                    <h1> {detail.detail} </h1>
                                    <footer className="blockquote-footer">
                                        {" "}
                                        <cite title="Source Title">{detail.name}</cite>
                                    </footer>
                                </blockquote>
                            </div>
                        </div>
                        <span className="border border-primary "></span>
                    </div>
                ))}
            </div>
        );
    }
}
export default App;
Output: The form will call handleSubmit which in return is using the POST method and submitting the response at end-point http://localhost:8000/wel/. The renderSwitch() is used for passing the index of the array which in return the color of bootstrap className.
Advantages
React and Django work independently, with one handling the frontend and the other handling the backend. Keeping them separate provides several advantages.
- Creates a clean separation between frontend and backend logic.
- Allows deploying the frontend or backend separately without affecting the other.
- Improves user experience by loading data in the background and refreshing only parts of the page.
- Supports independent work between frontend and backend teams.
- Makes it easier to build scalable apps for multiple clients (web or mobile) using the same API.

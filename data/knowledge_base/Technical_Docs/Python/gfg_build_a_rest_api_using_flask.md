# Build a REST API using Flask

> Source: https://www.geeksforgeeks.org/python/python-build-a-rest-api-using-flask/

REST (Representational State Transfer) is an approach used to build web services that interact using standard HTTP methods such as GET, POST, PUT and DELETE. APIs built using REST follow predictable rules, making them suitable for data exchange between applications.
To build a REST API using Flask, we can use two methods:
- Using Flask
- Using Flask-RESTful
Before starting this, let us install the necessary libraries.
Installation
Install all required packages in one command:
pip install flask flask-restful
This installs both Flask and Flask-RESTful, preparing the environment for building APIs using both methods.
Using Flask
This method use Flask framework only. Here, API is created using regular functions called "routes". Flask checks the URL the user visits and executes the matching function. One route sends a simple message and another route receives a number from the URL and returns its square.
from flask import Flask, jsonify
app = Flask(__name__)
@app.route('/', methods=['GET'])
def home():
    return jsonify({'data': 'hello world'})
@app.route('/home/<int:num>', methods=['GET'])
def disp(num):
    return jsonify({'data': num ** 2})
if __name__ == '__main__':
    app.run(debug=True)
Explanation:
- app = Flask(name) creates the main application object where routes are defined.
- Home Route ('/') returns a simple JSON message when opened in a browser.
- Square Route ('/home/<int:num>') receives a number through the URL and returns its square.
- app.run(debug=True) starts the server and reloads automatically while developing.
Output
Run the program and open browser to visit - http://127.0.0.1:5000/. You will see a JSON message returned as below:
Now, In the browser, visit: http://127.0.0.1:5000/home/22. The API reads the number 22 and returns its square.
This shows how passing values through the URL works in a REST API.
Using Flask-RESTful
This method uses the Flask-RESTful extension, which organizes APIs using classes called resources. Each resource represents an endpoint and contains methods such as get(), which run when a GET request is made. One resource returns a message, and another resource calculates the square of a number.
from flask import Flask, jsonify
from flask_restful import Resource, Api
app = Flask(__name__)
api = Api(app)
class Hello(Resource):
    def get(self):
        return {'message': 'hello world'}
class Square(Resource):
    def get(self, num):
        return {'square': num ** 2}
api.add_resource(Hello, '/')
api.add_resource(Square, '/square/<int:num>')
if __name__ == '__main__':
    app.run(debug=True)
Explanation:
- Resource represents an API endpoint using a class.
- Hello Resource (/) returns a message when accessed.
- Square Resource (/square/<int:num>) accepts a number in the URL and returns its square.
- api.add_resource() connects each class to a specific route.
Output
Open the browser and visit: http://127.0.0.1:5000/
Now, In the browser, visit: http://127.0.0.1:5000/square/3
This shows how Flask-RESTful handles different routes cleanly using class-based resources.

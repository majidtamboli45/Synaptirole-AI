# Testing FastAPI Application

> Source: https://www.geeksforgeeks.org/python/testing-fastapi-application/

FastAPI applications need to be tested to ensure their endpoints return correct responses and behave as expected. In Python, FastAPI APIs can be tested using TestClient for automated testing and the requests library for manual or integration testing.
Using TestClient
TestClient is an HTTPX-based testing utility provided by FastAPI. It allows you to test API endpoints without running the server, making it ideal for unit and automated testing. Below is the syntax:
client = TestClient(app)
def test_function_name():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "Message"}
- When using pytest, the test function name must start with test_ so that pytest can automatically discover and execute it.
- response.status_code verifies the HTTP response status.
- response.json() checks the response body.
Example: This example defines a FastAPI endpoint and tests it using TestClient. The test checks both the HTTP status code and the returned JSON response.
from fastapi import FastAPI
from fastapi.testclient import TestClient
app = FastAPI()
@app.get("/")
async def read_main():
    return {"msg": "Welcome to Geeks For Geeks"}
client = TestClient(app)
def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "Welcome to Geeks For Geeks"}
Now, open the terminal and run the following command to test the FastAPI application created.
pytest practice.py
here, practice.py is the name of the python script.
Output:
Explanation:
- TestClient(app) creates a test client for the FastAPI application.
- client.get("/") sends a GET request to the root endpoint.
- response.status_code verifies that the request was successful.
- response.json() checks whether the returned response matches the expected output.
- The function name test_read_main allows pytest to discover and run the test.
Using Requests Library
The requests library is used to send HTTP requests to a running FastAPI server. This approach is useful for manual testing or integration testing, but it is not suitable for unit tests.
Example: In this example, the API compares two messages and returns "Test Passed" if they match.
from fastapi import FastAPI
app = FastAPI()
@app.get("/")
async def read_main():
    msg = "Welcome to Geeks For Geeks"
    test_msg = "Welcome to Geeks For Geeks"
    if msg == test_msg:
        return {"msg": "Test Passed"}
    else:
        return {"msg": "Test Failed"}
Explanation:
- @app.get("/") defines a GET endpoint.
- msg and test_msg store sample values for comparison.
- A conditional check determines the response message returned by the API.
Now, open the terminal and run the following command to run your FastAPI application. This command will also let the app to reload in case of any changes made in app.
uvicorn practice:app --reload
Create a separate file named test.py to test the running FastAPI application.
import requests
response = requests.get("http://127.0.0.1:8000/")
print(response.json())
Output:
Explanation:
- requests.get() sends an HTTP GET request to the running FastAPI server.
- The URL http://127.0.0.1:8000/ must match the server address.
- response.json() prints the response returned by the API.

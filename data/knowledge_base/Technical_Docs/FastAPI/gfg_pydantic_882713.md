# FastAPI Pydantic

> Source: https://www.geeksforgeeks.org/python/fastapi-pydantic/

Before we dive into Pydantic, let's briefly introduce FastAPI. FastAPI is a modern Python web framework that simplifies the process of creating APIs. Its rapid adoption within the Python community is attributed to its exceptional performance and developer-friendly features. With FastAPI, developers can build APIs with ease, and its seamless compatibility with Pydantic adds another layer of functionality for data validation and parsing. In this article, we will delve into the world of FastAPI-Pydantic, exploring the powerful synergy between these two technologies.
Role of Pydantic in FastAPI
Pydantic is a Python library that is commonly used with FastAPI. It plays a crucial role in FastAPI applications by providing data validation, parsing, and serialization capabilities. Specifically, Pydantic is used in FastAPI. Pydantic is a Python library that shines when it comes to data validation and parsing. In FastAPI, Pydantic plays a crucial role in several key areas:
Validation Data with Pydantic
Pydantic enables developers to define data models, also known as user-defined schemas. These models can include data types, validation rules, and default values. By establishing these models, developers can ensure that incoming data adheres to the expected structure and types. This validation process guarantees the reliability and integrity of the data used in your API.
Example: Basic Data Validation
Let's say you want to validate user input for a blog post. You can define a Pydantic model to ensure the data is in the expected format. In this example, we define a BlogPost model with fields for the title and content. Pydantic automatically validates that title and content are strings.
from pydantic import BaseModel, ValidationError
class BlogPost(BaseModel):
    title: str
    content: str
try:
    # Valid data
    post_data = BlogPost(title="Introduction to Pydantic", 
                         content="Pydantic is a Python library for data validation.")
    print(post_data)
    # Corrected invalid data
    invalid_post_data = BlogPost(title="123", content="42")
    print(invalid_post_data)
except ValidationError as e:
    print("Validation error:", e)
Output
title='Introduction to Pydantic' content='Pydantic is a Python library for data validation.'
title='123' content='42'
Parsing data with Pydantic
In addition to data validation, Pydantic is adept at automatically converting and parsing data from various formats, such as JSON or form data, into Python objects. These conversions are based on the previously defined models or user-defined schemas. This feature not only simplifies the data handling process but also ensures that the data is accurately transformed into a format suitable for further processing within your API.
Example: Data Parsing and Default Values
In this example, we define a User model with default values for the 'age' field. If 'age' is not provided, it defaults to 25. You can also override the default value by providing a value during data creation.
from pydantic import BaseModel
class User(BaseModel):
    username: str
    email: str
    age: int = 25  # Default value
# Valid data
user_data = User(username="john_doe", email="john@example.com")
print(user_data.age)  # Output: 25 (default value)
# Valid data with age specified
user_data2 = User(username="jane_doe", email="jane@example.com", age=30)
print(user_data2.age)  # Output: 30
# Invalid data
invalid_user_data = User(username="jim_doe", email=123)
# This will raise a ValidationError for 'email' since it should be a string.
Output
25 30 
Example
In this example, we are following the use case we previously discussed with Pydantic. We define a Pydantic model called 'TodoItem' to outline the data structure for Todo tasks, encompassing fields for 'title,' 'description,' and an optional 'completed' field, which defaults to 'False.' We establish an in-memory database, 'todo_db,' represented as a Python list, to store Todo items. The code encompasses two API endpoints:
- A POST endpoint at '/todos/' is designed to handle incoming requests for creating new Todo items. It expects data in the 'TodoItem' model format, appends this data to the 'todo_db' list, and responds with the newly created Todo item.
- A GET endpoint at '/todos/' retrieves a list of all existing Todo items from 'todo_db' and returns it as a response in the form of a list of 'TodoItem' objects.
In simple terms, this is a Todo task API that facilitates the creation and retrieval of Todo items. The Pydantic model ensures that the data adheres to the specified structure, and FastAPI streamlines the route creation for managing incoming requests and generating responses.
# Import required modules
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
# Create a FastAPI app instance
app = FastAPI()
# Define a Pydantic model for Todo items
class TodoItem(BaseModel):
    title: str
    description: str
    completed: bool = False
# Initialize an in-memory database (list) to store Todo items
todo_db = []
# Endpoint to create a new Todo item
@app.post("/todos/", response_model=TodoItem)
def create_todo(todo: TodoItem):
    todo_db.append(todo)  # Add the new Todo item to the database
    return todo  # Return the created Todo item as a response
# Endpoint to retrieve all Todo items
@app.get("/todos/", response_model=List[TodoItem])
def read_todos():
    return todo_db  # Return the list of all Todo items
# Add the code to run the FastAPI app directly using uvicorn
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
Output

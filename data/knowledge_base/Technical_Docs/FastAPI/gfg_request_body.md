# FastAPI Request Body

> Source: https://www.geeksforgeeks.org/python/fastapi-request-body/

In web development, request body contains the data sent by the client to the server as part of an HTTP request. It carries the information required for processing. FastAPI provides efficient handling of request bodies, enabling smooth data exchange between clients and servers.
Types of Request Body
FastAPI supports various types of request bodies, each tailored to different data formats and use cases:
- JSON Request Body: Sending data in JSON format is standard in modern APIs and FastAPI simplifies this process. It automatically parses and validates JSON request bodies using Pydantic. Pydantic defines data models and ensures that incoming data follows expected structure, improving reliability and data integrity.
- Form Data Request Body: Traditional HTML forms use form data for user input. FastAPI handles form data efficiently, enabling easy integration with web forms. This simplifies processing inputs submitted through HTML forms.
Examples
Handling JSON Request Body
This example demonstrates a blog post API. It uses Pydantic for data validation and includes an in-memory database. Two endpoints are defined: create_blog_post for adding posts with validation and get_blog_posts for retrieving posts. The code showcases FastAPI’s simplicity, automatic validation and asynchronous request handling.
from fastapi import FastAPI, HTTPException
from typing import List, Optional
from pydantic import BaseModel
app = FastAPI()
# Imaginary database class
class Database:
    def __init__(self):
        self.db = []
    def add_blog_post(self, blog_post: dict):
        self.db.append(blog_post)
    def get_blog_posts(self):
        return self.db
db = Database()
class BlogPost(BaseModel):
    title: str
    # Making content optional
    content: Optional[str] = None  
@app.post("/create_blog_post")
async def create_blog_post(blog_post: BlogPost):
    # Input validation
    if not blog_post.title:
        raise HTTPException(status_code=400, detail="Title is required")
    # Database operation
    db.add_blog_post(blog_post.dict())
    # Returning a confirmation message
    return {"message": "Blog post created successfully"}
@app.get("/get_blog_posts", response_model=List[BlogPost])
async def get_blog_posts():
    # Returning the list of blog posts from the imaginary database
    return db.get_blog_posts()
Run the server:
uvicorn main:app --reload
Output
Form Data Request Body
This example demonstrates a application with "/login/ " endpoint that handles POST requests containing username and password form data. An asynchronous function returns a response indicating the login attempt and received username. The application runs on localhost:8000 using Uvicorn.
from fastapi import FastAPI, Form
app = FastAPI()
# Endpoint to handle POST requests with form data
@app.post("/login/")
async def login(username: str = Form(...), password: str = Form(...)):
    """
    Handle user login using form data.
    Parameters:
    - username (str): The username received from the form.
    - password (str): The password received from the form.
    Returns:
    - dict: A dictionary containing the message and username.
    """
    response_message = {"message": "The user attempted to log in", "username": username}
    return response_message
# Run the FastAPI development server
if __name__ == "__main__":
    import uvicorn
    # Start the server on 127.0.0.1:8000
    uvicorn.run(app, host="127.0.0.1", port=8000)

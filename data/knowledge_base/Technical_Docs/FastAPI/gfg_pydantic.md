# FastAPI Pydantic 2

> Source: https://www.geeksforgeeks.org/python/fastapi-pydantic-2/

In this article, we will discuss FastAPI and Pydantic by using an example. So, let's get started. FastAPI and Pydantic are two potent tools within the Python ecosystem, highly acclaimed for their roles in crafting resilient and efficient web APIs. This article will guide you through the process of establishing a FastAPI project and utilizing Pydantic for data validation. Before embarking on a project with FastAPI, it is advisable to gain a comprehensive understanding of both FastAPI and Pydantic. Following this, we will proceed to construct a project in which we harness the combined power of FastAPI and Pydantic to create an API. For those unfamiliar with these tools, you can refer to a resource like "Creating Your First REST API with FastAPI" to get started.
What is FastAPI?
FastAPI is a cutting-edge web framework that specializes in high-performance API development using Python. It stands out for its modern design and user-friendly approach, making it a popular choice among developers. One of FastAPI's key strengths lies in its integration with Python-type hints, which allows for automatic request validation. This means that you can define the data types expected in your API endpoints using standard Python type hints, and FastAPI will automatically validate incoming requests against these expectations
What is Pydantic?
Pydantic, on the other hand, is a Python library designed for data validation and parsing. It offers a straightforward way to define data models and ensures that incoming data adheres to those models. This validation and parsing process simplifies the task of guaranteeing that your application receives data in the correct format, promoting robustness and data integrity. Pydantic models allow you to specify the structure and expected data types for various inputs, such as API request payloads.
FastAPI and Pydantic
FastAPI and Pydantic form a dynamic and robust pairing that significantly enhances the development of web APIs. FastAPI seamlessly incorporates Pydantic models to carry out request and response validation, a critical aspect of any API development. This integration equips you with the means to ensure the safety and reliability of your API. The Pydantic models not only serve as documentation for your data structures but also play a pivotal role in the validation process.
Example
We will create a project for a simple "Bookstore" API. This API will enable users to perform basic CRUD (Create, Read, Update, Delete) operations, allowing them to add, retrieve, update, and delete books from a virtual bookstore. To represent book data, we define a Pydantic model called "Book," which includes attributes like title, author, publication year, and ISBN. Pydantic models are used for data validation and serialization. The project's goal is to provide users with essential functionality, including adding new books, retrieving a list of all books, fetching a specific book by its unique ISBN, updating book details, and deleting books from the collection. We will develop this project using the FastAPI framework, offering a practical demonstration of how to build a RESTful API with CRUD functionality.
Step 1 : Install libraries
To create an API using FastAPI, install both FastAPI and Uvicorn. FastAPI is used for building the API, and Uvicorn is used to run the server. Therefore, it is necessary to install both of these libraries on your system.
pip install fastapi
pip install uvicorn
Step 2: Python code
The code defines endpoints for creating, retrieving, updating, and deleting books. Below is an explanation of the code:
1) Import necessary libraries
- FastAPI is imported from thefastapi library for creating the web application.
- HTTPException is imported fromfastapi for handling HTTP exceptions.
- BaseModel is imported frompydantic to create a Pydantic model for book data.
- List is imported from thetyping module to specify that some endpoints return lists of books.
2) Create a FastAPI application instance
- app is an instance ofFastAPI used to define routes and handlers for the web application.
3)Define a Pydantic model for books:
- The Book class is created, inheriting fromBaseModel , and it defines the expected structure of book data.
- It has four fields: title ,author ,publication_year , andISBN , each with their respective data types.
4) Initialize an empty list to store book data
- books is an empty list used to store book objects.
5) Define various endpoints for the API
- /books/ (POST): Used to create a new book. Thecreate_book function is responsible for processing this request. It expects aBook object as input, appends it to thebooks list, and returns the created book.
- /books/ (GET): Retrieves a list of all books using theget_books function, returning a list of books.
- /books/{ISBN} (GET): Retrieves a specific book by its ISBN. Theget_book function searches for a book with the provided ISBN and returns it. If not found, it raises an HTTP 404 error.
- /books/{ISBN} (PUT): Updates a book with a specific ISBN. Theupdate_book function finds the book by ISBN, updates its details with the provided data, and returns the updated book. If not found, it raises an HTTP 404 error.
- /books/{ISBN} (DELETE): Deletes a book by ISBN. Thedelete_book function removes the book from thebooks list and returns the deleted book. If not found, it raises an HTTP 404 error.
6) Run the FastAPI application
- The if __name__ == "__main__": block checks if the script is being run as the main program. If so, it importsuvicorn and runs the FastAPI application on the specified host and port (127.0.0.1:8000).
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel  
from typing import List  
# Create a FastAPI application instance
app = FastAPI()
# Define a Pydantic model for books
class Book(BaseModel):
    title: str
    author: str
    publication_year: int
    ISBN: str
# Initialize an empty list to store book data
books = []
# Create a book - POST request
@app.post("/books/", response_model=Book)
async def create_book(book: Book):
    # Add the provided book to the list of books
    books.append(book)
    # Return the created book as the response
    return book  
# Get all books - GET request
@app.get("/books/", response_model=List[Book])
async def get_books():
    return books  # Return the list of books as the response
# Get a specific book by ISBN - GET request
@app.get("/books/{ISBN}", response_model=Book)
async def get_book(ISBN: str):
    # Search for the book with the specified ISBN
    book = next((b for b in books if b.ISBN == ISBN), None)
    if book is None:
        # If book is not found, raise an HTTP 404 error
        raise HTTPException(status_code=404, detail="Book not found")
    return book  # Return the found book as the response
# Update a book by ISBN - PUT request
@app.put("/books/{ISBN}", response_model=Book)
async def update_book(ISBN: str, updated_book: Book):
    # Search for the book with the specified ISBN
    book = next((b for b in books if b.ISBN == ISBN), None)
    if book is None:
        # If book is not found, raise an HTTP 404 error
        raise HTTPException(status_code=404, detail="Book not found")
    # Update book details with the provided data
    for field in updated_book.dict(exclude_unset=True):
        setattr(book, field, getattr(updated_book, field))
    return book  # Return the updated book as the response
# Delete a book by ISBN - DELETE request
@app.delete("/books/{ISBN}", response_model=Book)
async def delete_book(ISBN: str):
    # Search for the book with the specified ISBN
    book = next((b for b in books if b.ISBN == ISBN), None)
    if book is None:
        # If book is not found, raise an HTTP 404 error
        raise HTTPException(status_code=404, detail="Book not found")
    # Remove the book from the list of books
    books.remove(book)
    return book  # Return the deleted book as the response
# Run the FastAPI application using Uvicorn if this script is the main program
if __name__ == "__main__":
    import uvicorn
    # Run the FastAPI application on the specified host and port
    uvicorn.run(app, host="127.0.0.1", port=8000)
Output

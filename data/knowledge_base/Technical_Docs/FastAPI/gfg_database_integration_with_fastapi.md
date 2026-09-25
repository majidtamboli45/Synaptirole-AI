# Database Integration with FastAPI

> Source: https://www.geeksforgeeks.org/python/database-integration-with-fastapi/

MongoDB is a flexible and scalable NoSQL database widely used by developers. It can be integrated with FastAPI using PyMongo, the official Python driver. Below are the steps to perform this integration.
Step By Step Implementation
Step 1: Setting Up MongoDB
Ensure MongoDB is installed and running locally, or use a cloud service like MongoDB Atlas. Also, verify that you have permissions to perform CRUD operations.
Step 2: Installing Dependencies
You'll need to install the necessary Python packages for FastAPI, Pydantic, PyMongo and any other dependencies required for your project. You can install these packages using pip:
pip install fastapi uvicorn pymongo
Step 3: Creating Models
Define Pydantic models to represent the data structures that will be stored in MongoDB. These models will also handle data validation and serialization/deserialization.
from pydantic import BaseModel
class Address(BaseModel):
    city: str
    country: str
class Student(BaseModel):
    name: str
    age: int
    address: Address
Step 4: Connecting to MongoDB
Use PyMongo to connect to your MongoDB database. Specify the connection URL and database name to establish a connection.
from pymongo import MongoClient
# Connect to MongoDB
client = MongoClient("mongodb://localhost:27017")
db = client["library_management"]
students_collection = db["students"]
Step 5: Defining API Endpoints
Now, define the API endpoints using FastAPI decorators. These endpoints will handle CRUD (Create, Read, Update, Delete) operations on the MongoDB database.
from fastapi import FastAPI, HTTPException
app = FastAPI()
Step 6: Implementing CRUD Operations
Implement API endpoints for CRUD operations and use PyMongo methods like insert_one, find, update_one and delete_one to interact with the database.
# CREATE operation
@app.post("/students")
async def create_student(student: Student):
    # code implementation here
    return {"message": "Student created"}
# READ operation 
@app.get("/students")
async def list_students():
    # code implementation here
    return {"message": "List of students"}
# UPDATE operation
@app.patch("/students/{id}")
async def update_student(id: str, student: Student):
    # code implementation here
    return {"message": "Student updated"}
# DELETE operation
@app.delete("/students/{id}")
async def delete_student(id: str):
    # code implementation here
    return {"message": "Student deleted"}
Complete Code
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from pymongo import MongoClient
from bson import ObjectId
app = FastAPI()
# Connect to local MongoDB
client = MongoClient("mongodb://localhost:27017")
db = client["library_management"]
students_collection = db["students"]
class Address(BaseModel):
    city: str
    country: str
class Student(BaseModel):
    name: str
    age: int
    address: Address
@app.post("/students", status_code=201)
async def create_student(student: Student):
    result = students_collection.insert_one(student.model_dump())
    return {"id": str(result.inserted_id)}
@app.get("/students", response_model=list[Student])
async def list_students(country: str = None, age: int = None):
    query = {}
    if country:
        query["address.country"] = country
    if age:
        query["age"] = {"$gte": age}
    students = list(students_collection.find(query, {"_id": 0}))
    return students
@app.get("/students/{id}", response_model=Student)
async def get_student(id: str):
    student = students_collection.find_one({"_id": ObjectId(id)}, {"_id": 0})
    if student:
        return student
    else:
        raise HTTPException(status_code=404, detail="Student not found")
@app.patch("/students/{id}", status_code=204)
async def update_student(id: str, student: Student):
    updated_student = student.model_dump(exclude_unset=True)
    result = students_collection.update_one(
        {"_id": ObjectId(id)}, {"$set": updated_student})
    if result.modified_count == 0:
        raise HTTPException(status_code=404, detail="Student not found")
    else:
        return
@app.delete("/students/{id}", status_code=200)
async def delete_student(id: str):
    result = students_collection.delete_one({"_id": ObjectId(id)})
    if result.deleted_count == 0:
        raise HTTPException(status_code=404, detail="Student not found")
    else:
        return {"message": "Student deleted successfully"}
Explanation:
- Defines an Address model to structure nested address data.
- Defines a Student model with name, age, and embedded address for validation.
- POST /students: Inserts a new student into MongoDB and returns the generated ID.
- GET /students/{id}: Fetches a student by ID and raises a 404 error if not found.
- PATCH /students/{id}: Updates a student’s details and returns 404 if no record is modified.
- DELETE /students/{id}: Deletes a student by ID and returns a success message or 404 if not found.
Run the Application
Run the FastAPI application using an ASGI server such as Uvicorn.
uvicorn main:app --reload
Output:

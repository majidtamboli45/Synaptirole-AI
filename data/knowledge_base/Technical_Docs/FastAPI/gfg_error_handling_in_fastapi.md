# Error Handling in FastAPI

> Source: https://www.geeksforgeeks.org/python/error-handling-in-fastapi/

Error handling in FastAPI ensures your API responds properly to invalid requests or unexpected issues. It helps return meaningful HTTP responses and improves reliability.
Ways to Handle Errors in FastAPI
- Using HTTP status codes
- Using built-in exception handlers
- Using custom exception handlers
- Using middleware
- Using logging
Error Handling using HTTP Status Codes
FastAPI uses HTTP status codes to indicate how a request was processed and to handle errors effectively. These status codes are grouped into five classes:
| HTTP Messages | Status Codes | 
|---|---|
| Informational responses | 100-199 | 
| Successful responses | 200-299 | 
| Redirection messages | 300-399 | 
| Client error responses | 400-499 | 
| Server error responses | 500-599 | 
Syntax:
def function_name() -> Item:
    if condition:
        raise HTTPException(status_code=404, detail="Error message")
    return Item(...)
Here,
- condition: It is the check which you want to add to return the error.
- error_message_1, error_message_2: These are the messages shown to user when there is an error.
- HTTP_Code_1, HTTP_Code_2: These are the HTTP status codes which we want to display to user along with error message.
Example: Returns student details with 200 when the roll number exists, and returns 404 when it is not found.
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
app = FastAPI()
class Student(BaseModel):
    name: str
    roll_number: int
students = {
    1: Student(name="Abhishek", roll_number=1),
    2: Student(name="Ishita", roll_number=2),
    3: Student(name="Vinayak", roll_number=3),
}
@app.get("/items/{roll_number}")
def query_student_by_roll_number(roll_number: int) -> Student:
    if roll_number not in students:
        raise HTTPException(status_code=404, detail=f"Student with {roll_number=} does not exist.")
    else:
        raise HTTPException(status_code=200, detail=f"Student details are as follows: {students[roll_number]}")
Output: On calling the roll number 2 which exists in the student list, it displays an error message as follows:
On calling the roll number 4 which doesn't exist in the student list, it displays an error message as follows:
Built-In Exception Handlers in FastAPI
FastAPI provides a built-in exception handler using HTTPException, a standard Python exception with additional response data, to handle errors effectively.
def function_name() -> Item:
    if condition:
        raise HTTPException(status_code=HTTP_Code, detail=f"error_message")
Here,
- condition: It is the check which you want to add to return the error.
- error_message: It is the message shown to user when there is an error.
- HTTP_Code: It is the HTTP status code which we want to display to user along with error message.
Example: In this example, if the roll number of a student exists in the list of students, then that student value is returned else an error message is displayed.
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
app = FastAPI()
class Student(BaseModel):
    name: str
    roll_number: int
students = {
    1: Student(name="Abhishek", roll_number=1),
    2: Student(name="Ishita", roll_number=2),
    3: Student(name="Vinayak", roll_number=3),
}
@app.get("/items/{roll_number}")
def query_student_by_roll_number(roll_number: int) -> Student:
    if roll_number not in students:
        raise HTTPException(status_code=404, detail=f"Student with {roll_number=} does not exist.")
    return students[roll_number]
Output: On calling the roll number 4 which doesn't exist in the student list, it displays an error message as follows:
Custom Exception Handlers in FastAPI
FastAPI uses Starlette’s exception handling to define and manage custom exceptions, allowing you to handle errors in a structured way.
class UnicornException(Exception):
    def __init__(self, value: str):
        self.value = value
#Create a custom exception
@app.exception_handler(UnicornException)
async def unicorn_exception_handler(request: Request, exc: UnicornException):
    return JSONResponse(status_code=404, content={"message": f"error_message"}, )
async def function_name(roll_number: int):
    if condition:
        raise UnicornException(value=condition_value)
Example: In this example, if the roll number of a student exists in the list of students, then that student value is returned else an error message is displayed.
from fastapi import FastAPI, Request
from pydantic import BaseModel
from fastapi.responses import JSONResponse
app = FastAPI()
class UnicornException(Exception):
    def __init__(self, value: str):
        self.value = value
class Student(BaseModel):
    name: str
    roll_number: int
students = {
    1: Student(name="Abhishek", roll_number=1),
    2: Student(name="Ishita", roll_number=2),
    3: Student(name="Vinayak", roll_number=3),
}
@app.exception_handler(UnicornException)
async def unicorn_exception_handler(request: Request, exc: UnicornException):
    return JSONResponse(
        status_code=404,
        content={"message": f"Student with particular roll number does not exist."},
    )
@app.get("/items/{roll_number}")
async def read_unicorn(roll_number: int):
    if roll_number not in students:
        raise UnicornException(value=roll_number)
    return students[roll_number]
Output: On calling the roll number 4 which doesn't exist in the student list, it displays an error message as follows:
Middleware in FastAPI
A function in FastAPI that works with each request before it is processed is known as middleware. This method handles errors using middleware.
Syntax:
app.add_middleware(GZipMiddleware)
async def function_name():
    if condition:
        return (f"error_message")
Example: In this example, if the roll number of a student exists in the list of students, then that student value is returned else an error message is displayed.
from fastapi import FastAPI, Request
from pydantic import BaseModel
from fastapi.middleware.gzip import GZipMiddleware
app = FastAPI()
app.add_middleware(GZipMiddleware)
class Student(BaseModel):
    name: str
    roll_number: int
students = {
    1: Student(name="Abhishek", roll_number=1),
    2: Student(name="Ishita", roll_number=2),
    3: Student(name="Vinayak", roll_number=3),
}
@app.get("/items/{roll_number}")
async def query_student_by_roll_number(roll_number: int):
    if roll_number not in students:
        return (f"Student with {roll_number=} does not exist.")
    return students[roll_number]
Output: On calling the roll number 4 which doesn't exist in the student list, it displays an error message as follows:
Logging in FastAPI
The crucial set of functions, such as debug, catch are provided by the logging in Python. This method handles errors in FastAPI using logging.
Syntax:
logger = logging.getLogger(__name__)
async def function_name():
    try:
        if condition:
            return (f"error_message")
        return students[roll_number]
    except Exception as e:
        logger.exception(e)
    raise HTTPException(status_code=500, detail="Internal server error")
Example: In this example, if the roll number of a student exists in the list of students, then that student value is returned else an error message is displayed.
from fastapi import FastAPI, Request, HTTPException
from pydantic import BaseModel
import logging
app = FastAPI()
logger = logging.getLogger(__name__)
class Student(BaseModel):
    name: str
    roll_number: int
students = {
    1: Student(name="Abhishek", roll_number=1),
    2: Student(name="Ishita", roll_number=2),
    3: Student(name="Vinayak", roll_number=3),
}
@app.get("/items/{roll_number}")
async def query_student_by_roll_number(roll_number: int):
    try:
        if roll_number not in students:
            return (f"Student with {roll_number=} does not exist.")
        return students[roll_number]
    except Exception as e:
        logger.exception(e)
    raise HTTPException(status_code=500, detail="Internal server error")
Output: On calling the roll number 4 which doesn't exist in the student list, it displays an error message as follows:

# To-Do List App using FastAPI

> Source: https://www.geeksforgeeks.org/python/to-do-list-app-using-fastapi/

In this project, we build a To-Do List web application using FastAPI, Jinja2 templates and SQLite. This app allows users to register, log in, add tasks, edit tasks and delete tasks. It’s a perfect project for beginners to learn FastAPI and web development.
Key Features
1. User Authentication
- Users can register and log in securely.
- Passwords are hashed using bcrypt via passlib for security.
2. Task Management
- Add new tasks with titles and optional descriptions.
- Edit existing tasks.
- Delete tasks easily.
3. Responsive UI
- Clean, modern design using CSS.
- Task cards color-coded for easy visualization.
- User info displayed at the top-right corner with a logout button.
Technologies Used
- FastAPI : Python web framework for building APIs.
- Jinja2 : Template engine to render HTML pages dynamically.
- SQLite : Lightweight database to store user and task information.
- Passlib & bcrypt : For secure password hashing.
- HTML/CSS : Frontend styling.
- Uvicorn : ASGI server to run the app.
Project Structure
Step-by-Step Guide
1. Install Dependencies
Before starting, install all required Python packages:
pip install fastapi uvicorn sqlalchemy jinja2 passlib[bcrypt] python-multipart
2. Database Setup (database.py)
The database setup file initializes the connection to a SQLite database and provides a base for creating ORM models.
- DATABASE_URL: The path to the SQLite database (todo.db).
- engine: Connects to the database.
- SessionLocal: Creates sessions to perform CRUD operations.
- Base: Base class for all ORM models (User, Task).
This allows your app to interact with the database easily using SQLAlchemy.
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
DATABASE_URL = "sqlite:///./todo.db"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()
3. Models (models.py)
Models define the structure of database tables:
1. User Model:
- Fields: id, username, hashed_password.
- Relationships: tasks links tasks to a user.
2. Task Model:
- Fields: id, title, completed, owner_id.
- Relationships: owner links task back to its user.
Purpose: Models provide a structured representation of data in the database and handle relationships between users and tasks.
from sqlalchemy import Column, Integer, String, Boolean, ForeignKey
from sqlalchemy.orm import relationship
from database import Base
class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    hashed_password = Column(String)
    tasks = relationship("Task", back_populates="owner")
class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    completed = Column(Boolean, default=False)
    owner_id = Column(Integer, ForeignKey("users.id"))
    owner = relationship("User", back_populates="tasks")
4. Schemas (schemas.py)
Schemas are Pydantic models used to validate and serialize data for requests and responses.
- UserCreate: Validates user registration input (username, password).
- TaskCreate: Validates new task creation input (task title).
- TaskResponse: Defines the structure of a task when sending it back to the client, including task ID, title, completion status and owner ID.
Purpose: Schemas ensure that data received and sent by the API is consistent and properly validated.
from pydantic import BaseModel
class UserCreate(BaseModel):
    username: str
    password: str
class TaskCreate(BaseModel):
    title: str
class TaskResponse(BaseModel):
    id: int
    title: str
    completed: bool
    owner_id: int
    class Config:
        orm_mode = True
5. Main App (app.py)
The main FastAPI application contains all routes and logic:
1. App Initialization:
- Creates database tables automatically.
- Initializes FastAPI and Jinja2 templates.
- Sets up a password hashing context with bcrypt.
2. Database Dependency: get_db() function provides a database session for routes.
3. Registration Routes:
- GET /register: Show registration form.
- POST /register: Create new user, hash password, prevent duplicate usernames.
4. Login Routes:
- GET /login: Show login form.
- POST /login: Authenticate user, verify password, set cookie for logged-in session.
5. Logout Route: GET /logout: Delete session cookie and redirect to login page.
6. Home Page:
- GET /: Displays all tasks for the logged-in user.
- Uses cookies to identify logged-in users.
7. Task Management:
- POST /tasks: Add new tasks.
- POST /tasks/{task_id}/toggle: Mark a task as completed/uncompleted.
- POST /tasks/{task_id}/update: Update task title.
- POST /tasks/{task_id}/delete: Delete a task.
8. Add Task Page: GET /add-task: Shows a form for adding a new task.
Purpose: Handles all server-side logic, database interactions, user authentication, and task CRUD operations.
from fastapi import FastAPI, Depends, Request, Form, HTTPException
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from database import SessionLocal, engine, Base
from models import User, Task
from passlib.context import CryptContext
# Create tables
Base.metadata.create_all(bind=engine)
app = FastAPI()
templates = Jinja2Templates(directory="templates")
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
# Database dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
# Registration
@app.get("/register", response_class=HTMLResponse)
def register_page(request: Request):
    return templates.TemplateResponse("register.html", {"request": request})
@app.post("/register")
def register(
    request: Request, 
    username: str = Form(...), 
    password: str = Form(...), 
    db: Session = Depends(get_db)
):
    if db.query(User).filter(User.username == username).first():
        return templates.TemplateResponse(
            "register.html", {"request": request, "error": "Username already exists"}
        )
    hashed_password = pwd_context.hash(password)
    user = User(username=username, hashed_password=hashed_password)
    db.add(user)
    db.commit()
    return RedirectResponse(url="/login", status_code=303)
# Login
@app.get("/login", response_class=HTMLResponse)
def login_page(request: Request):
    return templates.TemplateResponse("login.html", {"request": request})
@app.post("/login")
def login(
    request: Request, 
    username: str = Form(...), 
    password: str = Form(...), 
    db: Session = Depends(get_db)
):
    user = db.query(User).filter(User.username == username).first()
    if not user:
        return templates.TemplateResponse(
            "login.html", {"request": request, "error": "User not found"}
        )
    if not pwd_context.verify(password, user.hashed_password):
        return templates.TemplateResponse(
            "login.html", {"request": request, "error": "Incorrect password"}
        )
    
    response = RedirectResponse(url="/", status_code=303)
    response.set_cookie(key="user_id", value=str(user.id), httponly=True)
    return response
# Logout
@app.get("/logout")
def logout():
    response = RedirectResponse(url="/login", status_code=303)
    response.delete_cookie("user_id")
    return response
# Home Page
@app.get("/", response_class=HTMLResponse)
def read_index(request: Request, db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    user = None
    tasks = []
    if user_id:
        user = db.query(User).filter(User.id == int(user_id)).first()
        if user:
            tasks = db.query(Task).filter(Task.owner_id == int(user_id)).all()
    return templates.TemplateResponse(
        "index.html",
        {
            "request": request,
            "tasks": tasks,
            "user": user
        }
    )
# Add Task
@app.post("/tasks")
def add_task(request: Request, title: str = Form(...), db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=303)
    task = Task(title=title, owner_id=int(user_id))
    db.add(task)
    db.commit()
    return RedirectResponse(url="/", status_code=303)
# Toggle Complete
@app.post("/tasks/{task_id}/toggle")
def toggle_task(task_id: int, request: Request, db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=303)
    task = db.query(Task).filter(Task.id == task_id, Task.owner_id == int(user_id)).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    task.completed = not task.completed
    db.commit()
    return RedirectResponse(url="/", status_code=303)
# Delete Task
@app.post("/tasks/{task_id}/delete")
def delete_task(task_id: int, request: Request, db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=303)
    task = db.query(Task).filter(Task.id == task_id, Task.owner_id == int(user_id)).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    db.delete(task)
    db.commit()
    return RedirectResponse(url="/", status_code=303)
# Update Task
@app.post("/tasks/{task_id}/update")
def update_task(task_id: int, request: Request, title: str = Form(...), db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=303)
    task = db.query(Task).filter(Task.id == task_id, Task.owner_id == int(user_id)).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    task.title = title
    db.commit()
    return RedirectResponse(url="/", status_code=303)
@app.get("/add-task", response_class=HTMLResponse)
def add_task_page(request: Request, db: Session = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=303)
    user = db.query(User).filter(User.id == int(user_id)).first()
    if not user:
        return RedirectResponse(url="/login", status_code=303)
    return templates.TemplateResponse("add_task.html", {"request": request, "user": user})
6. HTML Templates (templates/)
6.1 Index.html
Main dashboard showing tasks with edit/delete options, greeting message and “Add Task” button. Displays logged-in user info.
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Tasks</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', sans-serif;
        background: #f3f3ff;
        margin: 0;
        padding: 0;
    }
    header {
        padding: 20px;
        text-align: center;
    }
    header h1 {
        font-weight: 700;
        color: #4b00ff;
    }
    .tasks-container {
        max-width: 600px;
        margin: 20px auto;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    .task-card {
        padding: 15px;
        border-radius: 16px;
        color: #fff;
        position: relative;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    .task-card.yellow { background: #e5c9e1ff; color: #000; }
    .task-card.purple { background: #A020F0; }
    .task-title {
        font-weight: 600;
        font-size: 1.1rem;
    }
    .task-desc {
        margin-top: 5px;
        font-size: 0.9rem;
    }
    .task-actions {
        position: absolute;
        top: 15px;
        right: 15px;
        display: flex;
        gap: 5px;
    }
    .task-actions button {
        background: rgba(255,255,255,0.3);
        border: none;
        padding: 5px 8px;
        border-radius: 8px;
        cursor: pointer;
    }
    .add-task-btn {
        display: block;
        max-width: 200px;
        margin: 30px auto;
        background: #A020F0;
        color: #fff;
        text-align: center;
        padding: 12px;
        border-radius: 50px;
        font-weight: 600;
        text-decoration: none;
        transition: transform 0.2s ease;
    }
    .add-task-btn:hover {
        transform: scale(1.05);
    }
    /* User Info (Top Right) */
    .user-info {
        position: fixed;
        top: 20px;
        right: 20px;
        background: #fff;
        border-radius: 12px;
        padding: 10px 18px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        display: flex;
        align-items: center;
        gap: 10px;
        font-weight: 600;
        color: #333;
        font-family: 'Inter', sans-serif;
    }
    .user-info button {
        background: #A020F0;
        color: #fff;
        border: none;
        padding: 6px 12px;
        border-radius: 8px;
        cursor: pointer;
        transition: transform 0.2s ease, background 0.2s ease;
    }
    .user-info button:hover {
        transform: scale(1.05);
        background: #8a1ad8;
    }
    /* Hero Section */
    .hero { 
        font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; 
        padding: 1.25rem 1rem; 
        border-radius: 14px; 
        background: #f6f7fb; 
    }
    .hero h1 { margin: 0 0 .25rem; font-size: 1.8rem; }
    .hero p  { margin: 0; color: #444; }
</style>
</head>
<body>
<header class="hero">
  <h1 id="greeting">👋 Hello</h1>
  <p id="subtext">Make today count!</p>
</header>
<div class="user-info">
    {% if user %}
    <span>Logged in as {{ user.username }}</span>
    <a href="/logout"><button>Logout</button></a>
    {% endif %}
</div>
<div class="tasks-container">
    {% for task in tasks %}
    <div class="task-card {{ loop.index % 2 == 0 and 'purple' or 'yellow' }}">
        <div class="task-title">{{ task.title }}</div>
        <div class="task-desc">{{ task.description if task.description else '' }}</div>
        <div class="task-actions">
            <button onclick="editTask({{ task.id }})">✏️</button>
            <form method="post" action="/tasks/{{ task.id }}/delete" style="display:inline;">
                <button type="submit">🗑️</button>
            </form>
        </div>
    </div>
    {% endfor %}
</div>
<a href="/add-task" class="add-task-btn">+ Add New Task</a>
<script>
  // Greeting Logic
 function getGreetingParts(date = new Date()) {
  const h = date.getHours();
  if (h >= 5 && h < 12)   // Morning until 11:59 AM
      return { text: "Good Morning",  emoji: "🌅", sub: "Fresh start. Let’s get it!" };
  if (h >= 12 && h < 16)  // 12:00 PM - 3:59 PM
      return { text: "Good Afternoon", emoji: "🌤️", sub: "Keep up the momentum!" };
  if (h >= 16 && h < 20)  // 4:00 PM - 7:59 PM
      return { text: "Good Evening",   emoji: "🌇", sub: "You’re almost there—finish strong!" };
  return { text: "Good Night", emoji: "🌙", sub: "Wrap up and recharge for tomorrow." };
}
function updateGreeting() {
  const { text, emoji, sub } = getGreetingParts();
  document.getElementById("greeting").innerHTML = `${emoji} ${text}`;
  document.getElementById("subtext").innerText = sub;
}
  // Run immediately on page load
  document.addEventListener("DOMContentLoaded", () => {
    updateGreeting();
    setInterval(updateGreeting, 60_000); // update every 1 minute
  });
  // Task Editing
  function editTask(taskId) {
    const newTitle = prompt("Edit Task");
    if (newTitle) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = `/tasks/${taskId}/update`;
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'title';
        input.value = newTitle;
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
  }
</script>
</body>
</html>
6.2 register.html
User registration page with username/password inputs, error messages and link to login.
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - To-Do App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', sans-serif;
        background: #f3f3ff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .auth-card {
        background: #fff;
        padding: 30px 40px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
    .auth-card h1 {
        color: #4b00ff;
        margin-bottom: 20px;
        font-weight: 700;
    }
    .auth-card input {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0;
        border-radius: 12px;
        border: 1px solid #ccc;
        font-size: 1rem;
        outline: none;
    }
    .auth-card button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        border-radius: 50px;
        border: none;
        background: #A020F0;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.2s ease, background 0.2s ease;
    }
    .auth-card button:hover {
        background: #8a1ad8;
        transform: scale(1.05);
    }
    .auth-card p {
        margin-top: 15px;
        font-size: 0.9rem;
    }
    .auth-card a {
        color: #A020F0;
        text-decoration: none;
        font-weight: 600;
    }
    .error {
        color: red;
        font-weight: 600;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<div class="auth-card">
    <h1>Register</h1>
    {% if error %}
        <div class="error">{{ error }}</div>
    {% endif %}
    <form method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="/login">Login here</a></p>
</div>
</body>
</html>
6.3 login.html
User login page with username/password inputs, error messages and link to register.
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - To-Do App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', sans-serif;
        background: #f3f3ff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .auth-card {
        background: #fff;
        padding: 30px 40px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
    .auth-card h1 {
        color: #4b00ff;
        margin-bottom: 20px;
        font-weight: 700;
    }
    .auth-card input {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0;
        border-radius: 12px;
        border: 1px solid #ccc;
        font-size: 1rem;
        outline: none;
    }
    .auth-card button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        border-radius: 50px;
        border: none;
        background: #A020F0;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.2s ease, background 0.2s ease;
    }
    .auth-card button:hover {
        background: #8a1ad8;
        transform: scale(1.05);
    }
    .auth-card p {
        margin-top: 15px;
        font-size: 0.9rem;
    }
    .auth-card a {
        color: #A020F0;
        text-decoration: none;
        font-weight: 600;
    }
    .error {
        color: red;
        font-weight: 600;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<div class="auth-card">
    <h1>Login</h1>
    {% if error %}
        <div class="error">{{ error }}</div>
    {% endif %}
    <form method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="/register">Register here</a></p>
</div>
</body>
</html>
6.4 add_task.html
Form to create a new task with title, optional description, deadline and category.
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Task</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', sans-serif;
        background: #f3f3ff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .add-task-form {
        background: #fff;
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 400px;
    }
    .add-task-form h2 {
        text-align: center;
        color: #A020F0;
        margin-bottom: 20px;
    }
    .add-task-form input,
    .add-task-form textarea,
    .add-task-form select {
        width: 100%;
        padding: 10px 15px;
        margin: 10px 0;
        border-radius: 12px;
        border: 1px solid #A020F0;
        outline: none;
        font-size: 1rem;
    }
    .add-task-form button {
        width: 100%;
        background: #A020F0;
        color: #fff;
        padding: 12px;
        font-weight: 600;
        border: none;
        border-radius: 50px;
        margin-top: 10px;
        cursor: pointer;
        transition: transform 0.2s ease;
    }
    .add-task-form button:hover {
        transform: scale(1.05);
    }
</style>
</head>
<body>
<form class="add-task-form" method="post" action="/tasks">
    <h2>Add New Task</h2>
    <input type="text" name="title" placeholder="Task Name *" required>
    <textarea name="description" placeholder="Task Description (optional)" rows="4"></textarea>
    <input type="datetime-local" name="deadline" placeholder="Task Deadline (optional)">
    <select name="category">
        <option value="">Select Category</option>
        <option value="work">Work</option>
        <option value="personal">Personal</option>
    </select>
    <button type="submit">Create Task</button>
</form>
</body>
</html>
7. How to Run the App
Open terminal in project folder and Run the FastAPI server:
uvicorn app:app --reload
Open browser and visit:
http://127.0.0.1:8000
Output: First page of the app:
Register as a new User
Log-in after successfull registration
Add task page
Add new task:
Add another task:
Update task by clicking on the pencil icon:
Output after updating the task
Delete a task by clicking the bin icon in the right side:

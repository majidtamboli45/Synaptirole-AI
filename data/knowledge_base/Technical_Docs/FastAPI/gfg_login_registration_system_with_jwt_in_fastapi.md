# Login & Registration System with JWT in FastAPI

> Source: https://www.geeksforgeeks.org/python/login-registration-system-with-jwt-in-fastapi/

FastAPI authentication system using JWT enables secure user registration, login with token generation and access to protected routes. Passwords are hashed for security and user data is stored in a SQLite database to ensure safe and reliable authentication.
Project setup
Run the following in your terminal to install dependencies:
pip install fastapi uvicorn python-jose[cryptography] passlib[bcrypt]
Next, create a folder named JWT Auth System. Inside it, create two files:
- main.py will contain the FastAPI app, routes and authentication logic.
- database.py will handle the SQLite database connection and initialization logic.
This will be the file structure:
Step by step Implementation
Now, let’s see all the steps to create JWT-based authentication system.
Step 1: Imports (main.py)
from datetime import datetime, timedelta, timezone
from typing import Optional
from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel, Field
from jose import jwt, JWTError
from passlib.context import CryptContext
from contextlib import asynccontextmanager
from database import init_db, get_user, create_user  
@asynccontextmanager
async def lifespan(app: FastAPI):
    init_db()
    yield
Explanation:
- datetime handles token expiry timestamps
- fastapi create app, inject dependencies, raise HTTP errors.
- OAuth2PasswordBearer extracts JWT token from Authorization header
- OAuth2PasswordRequestForm parses login form (username & password)
- pydantic request/response validation with models
- jose.jwt encode/decode JWTs
- passlib.CryptContext hash/verify passwords using bcrypt
- database functions for DB creation and user operations
Step 2: Config
Define security settings like secret key, JWT algorithm, and token expiration for generating and validating tokens.
SECRET_KEY = "CHANGE_ME_IN_PRODUCTION"          # Use an env var in real apps
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60
- SECRET_KEY symmetric key used to sign JWTs Replace with an environment variable in production.
- ALGORITHM digital signing algorithm used to ensure the integrity of the JWT. It uses SECRET_KEY to create a signature so the server can verify the token hasn't been tampered with.
- ACCESS_TOKEN_EXPIRE_MINUTES default token lifetime (used when creating tokens).
Step 3: App & Security setup
Initialize the FastAPI app, set up password hashing, and configure OAuth2 to handle JWT extraction from requests.
app = FastAPI(title="JWT Auth Demo (SQLite)", lifespan=lifespan)
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")  # token comes from /login
This initializes the FastAPI app and authentication utilities. Passwords are hashed using bcrypt. OAuth2 scheme will extract tokens from headers.
Step 4: SQLite Database Setup (database.py)
Create and connect to a SQLite database to store user info. Define functions to create, retrieve and manage users.
import sqlite3
from fastapi import HTTPException
from typing import Optional
DB_PATH = "users.db"
def init_db():
    conn = sqlite3.connect(DB_PATH)
    conn.execute("""
        CREATE TABLE IF NOT EXISTS users (
            username TEXT PRIMARY KEY,
            hashed_password TEXT NOT NULL,
            full_name TEXT
        )
    """)
    conn.commit()
    conn.close()
def get_user(username: str) -> Optional[dict]:
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    row = conn.execute(
        "SELECT username, hashed_password, full_name FROM users WHERE username = ?",
        (username,)
    ).fetchone()
    conn.close()
    if row:
        return {"username": row["username"], "hashed_password": row["hashed_password"], "full_name": row["full_name"]}
    return None
def create_user(username: str, hashed_password: str, full_name: str = ""):
    conn = sqlite3.connect(DB_PATH)
    try:
        conn.execute(
            "INSERT INTO users (username, hashed_password, full_name) VALUES (?, ?, ?)",
            (username, hashed_password, full_name)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=409, detail="Username already taken")
    finally:
        conn.close()
This function connects to SQLite database and ensures a users table is created to store usernames, hashed passwords and full names. Whereas, get_user retrieves user details from SQLite database and create_user inserts a new user into database while preventing duplicates
Rest of the code will be in main.py.
Step 5: Pydantic Models
Define data schemas for user registration, public user info and JWT token responses to ensure input/output validation.
class UserCreate(BaseModel):
    username: str = Field(..., min_length=3, max_length=20)
    password: str = Field(..., min_length=6)
    full_name: Optional[str] = None
class UserPublic(BaseModel):
    username: str
    full_name: Optional[str] = None
class Token(BaseModel):
    access_token: str
    token_type: str = "bearer"
We define data models to structure and validate inputs/outputs.
- UserCreate for registration (validates username/password)
- UserPublic public user info (exposed in responses) and Token format of JWT token response.
Step 6: Helper functions (Security)
Implement functions to hash and verify passwords, authenticate users and create JWT access tokens.
def hash_password(password: str) -> str:
    return pwd_context.hash(password)
def verify_password(plain: str, hashed: str) -> bool:
    return pwd_context.verify(plain, hashed)
def create_access_token(data: dict, expires_minutes: int = ACCESS_TOKEN_EXPIRE_MINUTES) -> str:
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=expires_minutes)
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
def authenticate_user(username: str, password: str) -> Optional[dict]:
    user = get_user(username)
    if not user or not verify_password(password, user["hashed_password"]):
        return None
    return user
These utility functions handle the core logic for authentication:
- hash_password securely hashes a plain text password and verify_password checks if entered password matches stored hash.
- create_access_token generates a signed JWT with an expiry time and authenticate_user validates username and password, returning user if correct.
Step 7: Dependency extracting current user from token
Create a function that extracts and validates the current user from the JWT token for protected routes.
async def get_current_user(token: str = Depends(oauth2_scheme)) -> UserPublic:
    cred_exc = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: Optional[str] = payload.get("sub")
        if username is None:
            raise cred_exc
    except JWTError:
        raise cred_exc
    user = get_user(username)
    if not user:
        raise cred_exc
    return UserPublic(username=user["username"], full_name=user.get("full_name"))
get_current_user() automatically runs on protected routes. It extracts JWT token, verifies it, checks expiry, decodes the username and ensures the user still exists. If valid, it returns user info; if not, it raises a 401 Unauthorized error.
Step 8: Routes - register, login and protected
Now we define the actual API endpoints:
Register: allows new users to sign up. Passwords are hashed before saving.
@app.post("/register", status_code=201, summary="Create a new user")
def register_user(body: UserCreate):
    hashed = hash_password(body.password)
    create_user(body.username, hashed, body.full_name or "")
    return {"message": "User registered successfully"}
Login: checks credentials and returns a signed JWT token if valid.
@app.post("/login", response_model=Token)
async def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user = authenticate_user(form_data.username, form_data.password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    access_token = create_access_token({"sub": user["username"]})
    return {"access_token": access_token, "token_type": "bearer"}
Protected profile (/me): only accessible with a valid JWT; returns the current user’s info.
@app.get("/me", response_model=UserPublic, summary="Get my profile (protected)")
def read_me(current_user: UserPublic = Depends(get_current_user)):
    return current_user
Initialize DB on startup: ensures SQLite database and users table are created automatically when FastAPI app starts.
@app.on_event("startup")
def on_startup():
    init_db()
Now, let’s run the app and see how to test it.
Testing
Step 1: Start the server
uvicorn main:app --reload
You will see Application startup complete in the terminal.
Step 2: Open interactive docs
Visit http://127.0.0.1:8000/docs, You’ll see the endpoints POST /register, POST /login and GET /me.
Step 3: Register a user
Expand POST /register -> click Try it out and Enter the details, For Example:
{
  "username": "Emma",
  "password": "123456",
  "full_name": "Emma Williams"
}
Click Execute and you will see below message:
{"message":"User registered successfully"}
At this point, a users.db file is created in same folder as main.py. As shown below:
After user registration, notice that the user data has been added to our user.db (you can see it using some sqlite viewer extension).
Step 4: Log in and Authorize
Click the Authorize button (top-right). Enter username, password and leave client_id, client_secret empty. Click Authorize -> then Close.
Swagger UI will call /login for you, receive access_token and automatically include Authorization: Bearer <token> on subsequent requests.
Step 5: Access protected route
Expand GET /me -> click Try it out -> Execute. You will see below message:
JWT authentication system is now complete with SQLite database. Users can register, log in and securely access protected endpoints.

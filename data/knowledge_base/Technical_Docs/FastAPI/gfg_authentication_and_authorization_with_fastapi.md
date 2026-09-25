# Authentication and Authorization with FastAPI

> Source: https://www.geeksforgeeks.org/python/authentication-and-authorization-with-fastapi/

Authentication is the process of verifying the identity of the user, while authorization determines whether the authenticated user has the right to perform certain actions. In the FastAPI, these concepts can be implemented using dependencies and middleware of the application.
Authentication Methods
We use two industry standards that work hand-in-hand to secure your API:
- OAuth2 (Framework): It's a protocol that defines how a user logs in. In this project, we use the Password Flow. It handles the "handshake" receiving the username/password and defining how the security "lock" appears in your FastAPI Swagger docs.
- JWT (Token): It is the actual "key card" issued after a successful OAuth2 login. It is a compact, signed string containing the user's identity. Because it is cryptographically signed, the server can trust it in subsequent requests without re-checking the password every time.
Implementing Authentication & Authorization
Let's create an example project to demonstrate how to add authentication and authorization from scratch:
Step 1: Create and activate venv
Create virtual environment to manage the dependencies for the FastAPI project. Use below command to install the venv:
python -m venv venv
Activate the virtual environment using the following command:
venv\Scripts\activate
Step 2: Install FastAPI and Uvicorn
Install dependencies within the virtual environment of the system.
pip install fastapi uvicorn
Step 3: Install the passlib
Install the passlib library for hashing passwords of the FastAPI Application.
pip install passlib[bcrypt]
Step 4: Install sqlalchemy
Install sqlalchemy library for SQL database connectivity.
pip install sqlalchemy
Step 5: Project Structure
Create the project structure as shown below.
Code Implementation
database.py: This file sets up the database connection for the application.
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
SQLALCHEMY_DATABASE_URL = "mysql+pymysql://root:@localhost:3306/example"
engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()
dependencies.py: Handles user authentication logic.
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt
from sqlalchemy.orm import Session
from .utils import verify_password, get_password_hash, create_access_token, SECRET_KEY, ALGORITHM
from .models import TokenData
from users.models import User
from .database import SessionLocal, engine, Base
Base.metadata.create_all(bind=engine)
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/token")
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
def get_user(db: Session, username: str):
    return db.query(User).filter(User.username == username).first()
def authenticate_user(db: Session, username: str, password: str):
    user = get_user(db, username)
    if not user:
        return False
    if not verify_password(password, user.hashed_password):
        return False
    return user
def get_current_user(db: Session = Depends(get_db), token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
        token_data = TokenData(username=username)
    except JWTError:
        raise credentials_exception
    user = get_user(db, username=token_data.username)
    if user is None:
        raise credentials_exception
    return user
model.py (auth): Defines token and token data models.
from pydantic import BaseModel
class Token(BaseModel):
    access_token: str
    token_type: str
class TokenData(BaseModel):
    username: str | None = None
routes.py (auth): Defines authentication routes.
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from .dependencies import get_db, authenticate_user, get_user
from .utils import create_access_token 
from .models import Token
from .schemas import UserCreate, UserResponse
from users.models import User
from .utils import get_password_hash
router = APIRouter()
@router.post("/token", response_model=Token)
def login_for_access_token(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user = authenticate_user(db, form_data.username, form_data.password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    access_token = create_access_token(data={"sub": user.username})
    return {"access_token": access_token, "token_type": "bearer"}
@router.post("/signup", response_model=UserResponse)
def signup(user: UserCreate, db: Session = Depends(get_db)):
    db_user = get_user(db, username=user.username)
    if db_user:
        raise HTTPException(status_code=400, detail="Username already registered")
    hashed_password = get_password_hash(user.password)
    db_user = User(username=user.username, hashed_password=hashed_password)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user
schemas.py (auth): Defines request and response schemas.
from pydantic import BaseModel
class UserBase(BaseModel):
    username: str
class UserCreate(UserBase):
    password: str
class UserResponse(UserBase):
    id: int
    class Config:
        orm_mode = True
utils.py: Handles password hashing and token generation.
from passlib.context import CryptContext
from jose import JWTError, jwt
from datetime import datetime, timedelta
SECRET_KEY = "your_secret_key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)
def get_password_hash(password):
    return pwd_context.hash(password)
def create_access_token(data: dict, expires_delta: timedelta | None = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt
User package
model.py (user): Defines user database model.
from sqlalchemy import Boolean, Column, Integer, String
from auth.database import Base
class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    hashed_password = Column(String)
    is_active = Column(Boolean, default=True)
routes.py (user):Defines user-related routes.
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from auth.dependencies import get_current_user, get_db
from .schemas import User
from .models import User as UserModel
router = APIRouter()
@router.get("/me", response_model=User)
def read_users_me(current_user: UserModel = Depends(get_current_user)):
    return current_user
schemas.py: This class can handles the user database schema of the application.
from pydantic import BaseModel
class UserBase(BaseModel):
    username: str
class UserCreate(UserBase):
    password: str
class User(UserBase):
    id: int
    is_active: bool
    class Config:
        orm_mode = True
main.py: Configures the app and includes routes.
from fastapi import FastAPI
from auth.routes import router as auth_router
from users.routes import router as users_router
app = FastAPI()
app.include_router(auth_router, prefix="/auth", tags=["auth"])
app.include_router(users_router, prefix="/users", tags=["users"])
@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI authentication and authorization example"}
Run the application
The following logs will appear in the output:
Testing the Endpoints
1. SignUp Endpoint
http://127.0.0.1:8000/auth/signup
Output:
2. Token Generation Endpoint
http://127.0.01.8000/auth/token
Result Image:
3. Authorization Token Endpoint
http://127.0.01.8000/users/me

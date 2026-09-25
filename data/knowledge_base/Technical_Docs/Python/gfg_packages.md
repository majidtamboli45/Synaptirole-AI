# Python Packages

> Source: https://www.geeksforgeeks.org/python/python-packages/

Python packages are a way to organize and structure code by grouping related modules into directories.
- A package is essentially a folder that contains an __init__.py file and one or more Python files (modules).
- Allows modules to be easily shared and distributed across different applications.
Key Components of a Python Package
- Module: A single Python file containing reusable code (e.g., math.py).
- Package: A directory containing modules and a special __init__.py file.
- Sub-Packages: Packages nested within other packages for deeper organization.
Creating and Accessing Packages
- Create a Directory: create a folder that will act as the package root.
- Add Modules: Inside the directory, add Python files (modules). Each module can contain related functions or classes.
- Add __init__.py: add an __init__.py file to the directory. This file tells Python that the directory should be treated as a package.
- Create Sub-packages (Optional): One can organize code further by creating subdirectories with their own __init__.py files.
- Import Modules: Modules or functions inside the package can be imported using dot notation, for example:
from mypackage.module1 import greet
Example
In this example, we create a package called math_operations to organize mathematical functions. The package contains two sub-packages:
- basic: addition and subtraction
- advanced: multiplication and division
Each operation is stored in its own module, which makes the code modular, reusable and easier to maintain.
math_operations/__init__.py - This file initializes the main package and exposes commonly used functions so they can be imported directly from the package.
from .calculate import calculate
from .basic import add, subtract
from .advanced import multiply, divide
math_operations/calculate.py - This module contains a simple function that prints a message indicating that a calculation is being performed.
def calculate():
    print("Performing calculation...")
math_operations/basic/__init__.py - This file initializes the basic sub-package and makes the add and subtract functions available when the sub-package is imported.
from .add import add
from .sub import subtract
math_operations/basic/add.py - This module contains the function for performing addition.
def add(a, b):
    return a + b
math_operations/basic/sub.py - This module contains the function for performing subtraction.
def subtract(a, b):
    return a - b
math_operations/advanced/__init__.py - This file initializes the advanced sub-package and exposes the multiply and divide functions from their respective modules.
from .mul import multiply
from .div import divide
math_operations/advanced/mul.py - This module contains the function for performing multiplication.
def multiply(a, b):
    return a * b
math_operations/advanced/div.py - This module contains the function for performing division.
def divide(a, b):
    return a / b
Using the Package
Now we can import functions from the package and use them in our program.
from math_operations import calculate, add, subtract, multiply, divide
# Using the placeholder calculate function
calculate()
# Perform basic operations
print("Addition:", add(5, 3))
print("Subtraction:", subtract(10, 4))
# Perform advanced operations
print("Multiplication:", multiply(4, 2))
print("Division:", divide(10, 2))
Output
Performing calculation...
Addition: 8
Subtraction: 6
Multiplication: 8
Division: 5.0
Python Packages for Web Frameworks
Web frameworks help developers build websites and APIs by providing tools for routing, request handling and database integration. These frameworks range from minimal setups for small apps to structured solutions for large-scale web projects.
Python Packages for AI & Machine Learning
Libraries here support tasks such as data preparation, model training, evaluation and visualization. They are commonly used in fields like predictive modeling, automation and intelligent systems.
1. Statistical Analysis
2. Data Visualization
3. Deep Learning
4. Natural Processing Language
5. Generative AI
6. Computer Vision
Python Packages for GUI Applications
GUI libraries allow developers to build desktop applications with visual components such as windows, buttons and menus. These tools help create interactive interfaces for software used on personal computers.
Python Packages for Web scraping & Automation
Web scraping and automation libraries help collect information from websites and perform repetitive tasks automatically. They support actions such as sending web requests, parsing page content and controlling browsers.
Python Packages for Game Development
Game development libraries provide tools for graphics rendering, sound handling and user input management. These frameworks help developers create 2D or 3D games and interactive multimedia applications.

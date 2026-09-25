# Python Inner Functions

> Source: https://www.geeksforgeeks.org/python/python-inner-functions/

In Python, an inner function (also called a nested function) is a function defined inside another function. They are mainly used for:
- Encapsulation: Hiding helper logic from external access.
- Code Organization: Grouping related functionality for cleaner code.
- Access to Outer Variables: Inner functions can use variables of the enclosing (outer) function.
- Closures and Decorators: Supporting advanced features like closures (functions that remember values) and function decorators.
Example: This example shows an inner function where the inner function prints a message from the outer function.
# outer function
def fun1(msg):  
    # inner function
    def fun2():
         # access variable from outer scope
        print(msg) 
    fun2()
fun1("Hello")
Output
Hello
Explanation: Here, fun2() is defined inside fun1() and it accesses the variable msg from the enclosing scope.
Scope of variables in inner functions
Inner functions follow Python’s LEGB rule (Local --> Enclosing --> Global --> Built-in). They can access outer function variables, but modifying them requires special keywords like nonlocal.
Example 1: This example demonstrates how an inner function can access a variable from its enclosing (outer) function.
def fun1(): 
    msg = "Geeks for geeks"
    def fun2(): 
        print(msg) 
    fun2()
fun1()
Output
Geeks for geeks
Explanation: fun1() creates a local variable msg and defines fun2(), which prints msg. Because of lexical scoping, fun2() can access msg from fun1() and calling fun1() runs fun2() and prints the message.
Example 2: This example shows how the nonlocal keyword allows the inner function to modify a variable from the outer function instead of creating a new local copy.
def fun1(): 
    a = 45
    def fun2(): 
        nonlocal a 
        a=54
        print(a)
    fun2()
    print(a)
fun1()
Output
54
54
Explanation: nonlocal tells Python to use the variable a from the outer scope instead of creating a new local one. Thus, both prints show 54.
Example 3: This example shows a closure, where the inner function remembers the value from the outer function even after it has finished executing.
def fun1(a):  
    def fun2():
        print(a)  
    return fun2 
closure_func = fun1("Hello, Closure!")
closure_func()
Output
Hello, Closure!
Explanation: Even after fun1() finishes, fun2() still remembers the value of a. This behavior is called a closure.
Real World Applications of Inner functions
Inner functions are useful in real-world scenarios for better code organization, encapsulation and reusability. Below are some practical applications:
Example1: This example uses an inner function to encapsulate a helper task of cleaning whitespace from a list of strings.
def process_data(data):
    def clean_data():
        return [item.strip() for item in data] 
    return clean_data()
print(process_data(["  Python  ", "  Inner Function  "]))  
Output
['Python', 'Inner Function']
Explanation: process_data() defines an inner clean_data() that trims spaces using .strip(). It returns the cleaned list: ['Python', 'Inner Function'].
Example 2: This example uses an inner function as a wrapper to log details before calling the actual function. It’s a common use case in decorators.
import logging
logging.basicConfig(level=logging.INFO) 
def logger(func):
    def wrapper(*args, **kwargs):
        logging.info(f"Executing {func.__name__} with {args}, {kwargs}") 
        return func(*args, **kwargs) 
    return wrapper
@logger
def add(a, b):
    return a + b  
print(add(3, 4))  
Output
INFO:root:Executing add with arguments (3, 4), {}
7
Explanation: logger function defines wrapper(), which logs the function name and arguments before calling it. *args collects positional arguments, **kwargs collects keyword arguments, so wrapper works for any function.

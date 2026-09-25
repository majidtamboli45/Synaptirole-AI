# Python Built

> Source: https://www.geeksforgeeks.org/python/built-exceptions-python/

Python provides a set of built-in exceptions, each designed to signal a specific type of error and helps to debug more effectively. These built-in exceptions can be viewed using the locals() built-in functions as follows :
>>> locals()['__builtins__']
This returns a dictionary of built-in exceptions, functions and attributes.
Examples of Built in Exceptions
1. BaseException
This class is the root of Python's exception hierarchy. All other exceptions directly or indirectly inherit from it. While it is rarely used directly in code, it is important because it forms the foundation of Python’s error-handling system.
Example: This example manually raises a BaseException and catches it to show how the root exception works.
try:
    raise BaseException("This is a BaseException")
except BaseException as e:
    print(e)
Output
This is a BaseException
Explanation: Here, we forcefully raise a BaseException. Since we catch it in the except block, message is printed instead of the program crashing.
2. Exception
Exception class is the base for all non-exit exceptions. You will often catch Exception in general error-handling code when you are not targeting a specific error type.
Example: This code raises a generic Exception and handles it inside the except block.
try:
    raise Exception("This is a generic exception")
except Exception as e:
    print(e)
Output
This is a generic exception
Explanation: We manually raise an Exception with a message. The error is caught and message is displayed instead of halting the program.
3. ArithmeticError
ArithmeticError class is the base for all errors related to mathematical operations. You don’t usually raise it directly, but it provides a way to catch all math-related errors in one block.
Example: This example raises an ArithmeticError manually to demonstrate how it works.
try:
    raise ArithmeticError("Arithmetic error occurred")
except ArithmeticError as e:
    print(e)
Output
Arithmetic error occurred
Explanation: We raise an ArithmeticError with a custom message. The program catches it and prints the error message, preventing a crash.
4. ZeroDivisionError
ZeroDivisionError occurs when you attempt to divide a number by zero. Since division by zero is undefined in mathematics, Python raises this exception to signal the error.
Example: This code attempts to divide 10 by 0, which triggers a ZeroDivisionError.
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(e)
Output
division by zero
Explanation: operation 10/0 is invalid. Python raises a ZeroDivisionError, which is then caught in the except block. Instead of crashing, program prints the error message.
5. OverflowError
OverflowError occurs when the result of a numerical operation is too large for Python to represent. While it handles large integers well, certain floating-point operations (like very large exponentials) can still cause this error.
Example: This example uses the math.exp() function with a very large input, which causes an overflow.
import math
try:
    result = math.exp(1000)  # Exponential function with a large argument
except OverflowError as e:
    print(e)
Output
math range error
Explanation: exponential function with input 1000 produces a number too large to handle. Python raises an OverflowError, which is caught and displayed as an error message.
6. FloatingPointError
FloatingPointError occurs when a floating-point calculation fails. By default, Python handles most floating-point issues silently (like dividing by zero results in inf or nan). However, you can explicitly enable floating-point error reporting with libraries like NumPy.
Example: This example enables error reporting in NumPy and performs a division by zero to trigger FloatingPointError.
import numpy as np
np.seterr(all='raise')
try:
    np.divide(1, 0)
except FloatingPointError as e:
    print("FloatingPointError caught:", e)
Output
FloatingPointError caught: divide by zero encountered in divide
Explanation: Normally, NumPy would return inf for 1/0. But since we enabled error raising, the division explicitly throws a FloatingPointError, which we catch and print.
7. AssertionError
AssertionError is raised when the assert statement fails. The assert keyword is often used for debugging or testing assumptions in code.
Example: This example checks if 1 == 2 using assert. Since the condition is false, it raises an AssertionError.
try:
    assert 1 == 2, "Assertion failed"
except AssertionError as e:
    print(e)
Output
Assertion failed
Explanation: assert statement expects 1 == 2 to be true, but it isn’t. Therefore, Python raises an AssertionError with the message "Assertion failed".
8. AttributeError
AttributeError occurs when you try to access or assign an attribute that does not exist for an object.
Example: This example tries to access a non-existent attribute in a class instance.
class MyClass:
    pass
obj = MyClass()
try:
    obj.some_attribute
except AttributeError as e:
    print(e)
Output
'MyClass' object has no attribute 'some_attribute'
Explanation: object obj is created from MyClass, which has no attributes. Attempting to access some_attribute raises an AttributeError.
9. IndexError
IndexError happens when you try to access a list (or any sequence) element with an index that is out of range.
Example: This example tries to access the 6th element of a list that only has 3 elements.
my_list = [1, 2, 3]
try:
    element = my_list[5]
except IndexError as e:
    print(e)
Output
list index out of range
Explanation: list has only indices 0, 1, 2. When we try to access index 5, Python raises an IndexError.
10. KeyError
KeyError occurs when you try to access a dictionary key that doesn’t exist.
Example: This example tries to access the key "key2" in a dictionary that only has "key1".
d = {"key1": "value1"}
try:
    val = d["key2"]
except KeyError as e:
    print(e)
Output
'key2'
Explanation: dictionary does not contain "key2". Attempting to retrieve it raises a KeyError, which is caught and printed.
11. MemoryError
MemoryError occurs when Python cannot allocate enough memory for an operation. This usually happens when trying to create extremely large data structures.
Example: This example tries to create a very large list, which may exceed memory limits.
try:
    li = [1] * (10**10)
except MemoryError as e:
    print(e)
Explanation: Attempting to create a list with 10**10 elements requires more memory than available. Python raises a MemoryError.
12. NameError
NameError occurs when you use a variable or function name that has not been defined.
Example: This example tries to print a variable that was never declared.
try:
    print(var)
except NameError as e:
    print(e)
Output
name 'var' is not defined
Explanation: Since var was never defined in the code, Python raises a NameError.
13. OSError (and related errors)
Raised when a system-related operation (like file I/O, opening files, or interacting with the OS) fails. In Python 3:
- IOError is just an alias for OSError (they are the same).
- FileNotFoundError is a subclass of OSError, specifically raised when a file or directory does not exist.
Example: This example attempts to open a missing file, which triggers FileNotFoundError (a subclass of OSError).
try:
    open("non_existent_file.txt")  # File does not exist
except FileNotFoundError as e:     # More specific
    print("FileNotFoundError caught:", e)
except OSError as e:               # General OS-related error
    print("OSError caught:", e)
Output
FileNotFoundError caught: [Errno 2] No such file or directory: 'non_existent_file.txt'
Explanation: missing file raises FileNotFoundError, which is a subclass of OSError. Since we catch it specifically, the error is displayed clearly.
More Built-in Exceptions
Apart from the exceptions we explored with examples above, Python provides several other built-in exceptions. These usually occur in specific situations. Below is a summary table of these exceptions and what they represent:
| Exception Name | Description | 
|---|---|
| TypeError | Raised when an operation or function is applied to an object of inappropriate type (e.g., adding a string to an integer). | 
| ValueError | Raised when a function receives an argument of the correct type but with an invalid value (e.g., converting "abc" to an integer). | 
| ImportError | Raised when there is a problem with an import statement. | 
| ModuleNotFoundError | Raised when a module cannot be found. | 
| IOError | Alias for OSError (in modern Python both refer to the same base error). | 
| FileNotFoundError | Raised when a file or directory is requested but cannot be found. | 
| StopIteration | Raised when the next() function is called but the iterator has no more items. | 
| KeyboardInterrupt | Raised when the user interrupts the program’s execution (e.g., pressing Ctrl+C). | 
| SystemExit | Raised when sys.exit() is called to terminate the program. | 
| NotImplementedError | Raised when a method that should be implemented in a subclass is not implemented. | 
| RuntimeError | Raised when an error occurs that doesn’t fall under other categories. | 
| RecursionError | Raised when maximum recursion depth is exceeded. | 
| SyntaxError | Raised when there is a mistake in Python syntax. | 
| IndentationError | Raised when indentation is not correct in Python code. | 
| TabError | Raised when there is inconsistent use of tabs and spaces in indentation. | 
| UnicodeError | Raised when encoding or decoding Unicode text fails. |

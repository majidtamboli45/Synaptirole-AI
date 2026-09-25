# Python Variables

> Source: https://www.geeksforgeeks.org/python/python-variables/

Variables are used to store data that can be referenced and manipulated during program execution. A variable is essentially a name that is assigned to a value.
- Unlike Java and many other languages, Python variables do not require explicit declaration of type.
- Type of the variable is inferred based on the value assigned.
x = 5
name = "Alex"  
print(x)
print(name)
Output
5
Alex
Rules for Naming Variables
To use variables correctly, the following naming rules should be followed:
- Names can contain letters, digits and underscores (_).
- The first character cannot be a digit.
- Names are case-sensitive, so myVar and myvar are treated differently.
- Keywords such as if, else and for cannot be used as variable names.
Below listed variable names are valid:
age = 21
_colour = "lilac"
total_score = 90
Below listed variables names are invalid:
1name = "Error"  # Starts with a digit
class = 10       # class is a reserved keyword
user-name = "Doe"  # Contains a hyphen
Assigning Values to Variables
1. Basic Assignment: Variables are assigned values using the = operator.
x = 5
y = 3.14
z = "Hi"
2. Dynamic Typing: Python is dynamically typed, so the same variable can store different data types during execution.
x = 10
x = "Now a string"
3. Assigning Same Value: same value can be assigned to multiple variables in a single line.
a = b = c = 100
print(a, b, c) 
Output
100 100 100
4. Assigning Different Values: Multiple variables can also be assigned different values in a single line.
x, y, z = 1, 2.5, "Python"
print(x, y, z) 
Output
1 2.5 Python
Concept of Object Reference
Let us assign a variable x to value 5.
x = 5
When x = 5 is executed, Python creates an object to represent the value 5 and makes x reference this object.
Now, let's assign another variable y to the variable x.
y = x
This statement creates y and references the same object as x, not x itself. This is called a Shared Reference, where multiple variables reference the same object.
Now, if we write
x = 'Geeks'
Python creates a new object for the value "Geeks" and makes x reference this new object.
The variable y remains unchanged, still referencing the original object 5. Now, If we assign a new value to y:
y = "Computer"
Python variables store references to objects, not the actual values themselves. When a variable is reassigned, it starts referencing a new object while the old unreferenced object becomes eligible for garbage collection.
Understanding Variable Reassignment
In this example, we check whether modifying one variable affects another when both initially reference the same object.
x = 1
y = x
y = y + 1
print(x)
print(y)
Output
1
2
Explanation:
- Initially, both x and y reference the object 1.
- After y = y + 1, y references a new object 2 while x still references 1, so changing y does not affect x.
Deleting a Variable
del keyword is used to delete a variable from memory. After deletion, the variable can no longer be accessed.
x = 10
del x
print(x) 
Output
ERROR!
Traceback (most recent call last):
  File "<main.py>", line 3, in <module>
NameError: name 'x' is not defined
Explanation: del x deletes the variable x. Accessing x after deletion raises a NameError because the variable no longer exists.
Practical Examples
1. Swapping Two Variables: Using multiple assignments, we can swap the values of two variables without needing a temporary variable.
a, b = 5, 10
a, b = b, a
print(a, b)  
Output
10 5
2. Counting Characters in a String: Assign the results of multiple operations on a string to variables in one line.
word = "Python"
length = len(word)
print("Length of the word:", length)

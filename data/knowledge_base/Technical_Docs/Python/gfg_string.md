# Python String

> Source: https://www.geeksforgeeks.org/python/python-string/

Strings are sequence of characters written inside quotes. It can include letters, numbers, symbols and spaces. Python does not have a separate character type.
- A single character is treated as a string of length one.
- Strings are commonly used for text handling and manipulation.
Creating a String
Strings can be created using either single ('...') or double ("...") quotes. Both behave the same.
a = 'GFG'  
b = "GeeksForGeeks"  
print(a)
print(b)
Output
GFG
GeeksForGeeks
Multi-line Strings
Use triple quotes ('''...''' ) or ( """...""") for strings that span multiple lines. Newlines are preserved.
s = """I am Learning
Python String on GeeksforGeeks"""
print(s)
s = '''I'm a 
Geek'''
print(s)
Output
I am Learning
Python String on GeeksforGeeks
I'm a 
Geek
Accessing Characters in String
Strings are indexed sequences. Positive indices start at 0 from the left, negative indices start at -1 from the right as represented in below image:
Example 1: Access specific characters through positive indexing.
s = "ABCDEF"
print(s[0])   
print(s[4])  
Output
A
E
Note: Accessing an index out of range will cause an IndexError. Only integers are allowed as indices and using a float or other types will result in a TypeError.
Example 2: Read characters from the end using negative indices.
s = "ABCDEF"
print(s[-3])  
print(s[-5]) 
Output
D
B
String Slicing
Slicing is a way to extract a portion of a string by specifying the start and end indexes. The syntax for slicing is string[start:end], where start starting index and end is stopping index (excluded).
s = "ABCDEF"
print(s[1:4])    
print(s[:3])     
print(s[3:])    
print(s[::-1])  
Output
BCD
ABC
DEF
FEDCBA
Looping Through Strings
Strings are iterable, which means we can access each character one by one using a loop.
s = "ABCDEF"
for char in s:
    print(char)
Output
A
B
C
D
E
F
Explanation: for loop goes through the string in order and each iteration prints the next character.
String Immutability
Strings are immutable, meaning their values cannot be changed after creation. Any modification to a string creates a new string instead of altering the original one.
s = "aBCDEF"
s = "A" + s[1:]  
print(s)
Output
ABCDEF
Explanation: original string "aBCDEF" is not modified. A new string is created by combining "A" with s[1:] (rest of the string).
Deleting a String
Individual characters of a string cannot be deleted because strings are immutable. However, an entire string variable can be removed using del keyword.
s = "ABC"
del s
Note: After deleting a string, if we try to access it, Python raises a NameError because the variable no longer exists in memory.
Updating a String
Strings cannot be changed directly after creation. So any modification results in a new string being created using slicing or methods like replace().
s = "ABCD EF"
s1 = "H" + s[1:]                  
s2 = s.replace("ABC", "abc")  
print(s1)
print(s2)
Output
HBCD EF
abcD EF
Explanation:
- s1: slice from index 1 onward and prepend "H".
- s2: replace("ABC", "abc") returns a new string.
Common String Methods
Python provides various built-in methods to manipulate strings. Below are some of the most useful methods:
1. len(): returns the total number of characters in a string (including spaces and punctuation).
s = "GeeksforGeeks"
print(len(s))
Output
13
2. upper() and lower(): upper() method converts all characters to uppercase whereas, lower() method converts all characters to lowercase.
s = "Hello World"
print(s.upper())
print(s.lower())
Output
HELLO WORLD
hello world
3. strip() and replace(): strip() removes leading and trailing whitespace from the string and replace() replaces all occurrences of a specified substring with another.
s = "   ABC   "
print(s.strip())    
s = "Python is fun"
print(s.replace("fun", "awesome"))
Output
ABC
Python is awesome
To learn more about string methods, please refer to Python String Methods.
Concatenating and Repeating Strings
1. Concatenation: Strings can be combined by using + operator.
s1 = "Hello"
s2 = "World"
print(s1 + " " + s2)
Output
Hello World
2. Repetition: A string can be repeated multiple times using *.
s = "Hello "
print(s * 3)
Output
Hello Hello Hello 
Formatting Strings
1. Using f-strings: f-strings allows to directly insert variables and expressions inside a string using {} brackets.
name = "Jake"
age = 22
print(f"Name: {name}, Age: {age}")
Output
Name: Jake, Age: 22
2. Using format(): format() method allows inserting values into placeholders {} inside a string.
s = "My name is {} and I am {} years old.".format( "Emily", 22)
print(s) 
Output
My name is Emily and I am 22 years old.
String Membership Testing
in keyword is used to check whether a substring exists inside a string. It returns True if the substring is found, otherwise it returns False.
s = "GeeksforGeeks"
print("Geeks" in s)
print("GfG" in s)

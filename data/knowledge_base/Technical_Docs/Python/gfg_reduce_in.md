# reduce() in Python

> Source: https://www.geeksforgeeks.org/python/reduce-in-python/

reduce() function (from the functools module) applies a function cumulatively to the elements of an iterable and returns a single final value. It processes elements step-by-step, combining two elements at a time until only one result remains.
Example: In this example, reduce() combines all strings in a list into one sentence.
from functools import reduce
a = ["Geeks", "for", "Geeks"]
r = reduce(lambda x, y: x + " " + y, a)
print(r)
Output
Geeks for Geeks
Explanation: reduce(lambda x, y: x + " " + y, a) joins elements step-by-step into one string.
Syntax
reduce(function, iterable[, initializer])
Parameters:
- function: A function that takes two arguments and returns a single value.
- iterable: The sequence to be reduced (list, tuple, etc.).
- initializer (optional): A starting value that is placed before first element.
Returns: Returns a single final value after processing all elements.
Examples
Example 1: Here, the code adds all numbers in a list using reduce(). The function combines two numbers at a time.
from functools import reduce
a = [2, 4, 6, 8]
r = reduce(lambda x, y: x + y, a)
print(r)
Output
20
Explanation: reduce(lambda x, y: x + y, a) adds elements step-by-step ((2 + 4) + 6) + 8 = 20.
Example 2: Here, the code finds the largest number from a list using reduce().
from functools import reduce
a = [5, 9, 3, 12, 7]
r = reduce(lambda x, y: x if x > y else y, a)
print(r)
Output
12
Explanation: lambda x, y: x if x > y else y compares two values at each step and keeps the larger one, resulting in the maximum value 12.
Example 3: This example uses functools.reduce() with built-in functions from operator module to perform sum, product and string concatenation on lists.
import functools
import operator
a = [1, 3, 5, 6, 2]
print(functools.reduce(operator.add, a))
print(functools.reduce(operator.mul, a)) 
print(functools.reduce(operator.add, ["geeks", "for", "geeks"]))
Output
17
180
geeksforgeeks
Explanation:
- functools.reduce(operator.add, a) adds all numbers in the list 1+3+5+6+2 = 17.
- functools.reduce(operator.mul, a) multiplies all numbers in the list 1*3*5*6*2 = 180.
- functools.reduce(operator.add, ["geeks", "for", "geeks"]) concatenates all strings in list "geeksforgeeks"
Difference Between reduce() and accumulate()
accumulate() function (from itertools) and reduce() both apply a function cumulatively to items in a sequence. However, accumulate() returns an iterator of intermediate results, while reduce() returns only final value.
Example: This code demonstrates how accumulate() from itertools module works it performs cumulative operations and returns all intermediate results instead of just a single final value.
from itertools import accumulate
from operator import add
a = [1, 2, 3, 4, 5]
res = accumulate(a, add)
print(list(res))
Output
[1, 3, 6, 10, 15]
Explanation: accumulate(a, add) - Adds elements cumulatively:
- Step 1: 1
- Step 2: 1 + 2 = 3
- Step 3: 3 + 3 = 6
- Step 4: 6 + 4 = 10
- Step 5: 10 + 5 = 15
Let's understand the difference between accumulate() and reduce() more clearly with the help of the table below:
| Feature | reduce() | accumulate() | 
|---|---|---|
| Return Value | A single final value (e.g., 15 ). | Intermediate results (e.g., [1, 3, 6, 10, 15]). | 
| Output Type | Returns a single value. | Returns an iterator. | 
| Use Case | Useful when only the final result is needed. | Useful when tracking cumulative steps. | 
| Import | From functools. | From itertools. |

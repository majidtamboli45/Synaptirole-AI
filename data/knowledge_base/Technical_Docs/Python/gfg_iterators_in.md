# Iterators in Python

> Source: https://www.geeksforgeeks.org/python/iterators-in-python/

An iterator in Python is an object used to traverse through all the elements of a collection (like lists, tuples or dictionaries) one element at a time. It follows the iterator protocol, which involves two key methods:
- __iter__(): Returns the iterator object itself.
- __next__(): Returns the next value from the sequence. Raises StopIteration when the sequence ends.
Need For Iterators
Here are some key benefits:
- Lazy Evaluation: Processes items only when needed, saving memory.
- Generator Integration: Pairs well with generators and functional tools.
- Stateful Traversal: Keeps track of where it left off.
- Uniform Looping: Same for loop works for lists, strings and more.
- Composable Logic: Easily build complex pipelines using tools like itertools.
Built-in Iterator
Python provides built-in iterators for iterable objects such as strings, lists, tuples, and dictionaries. These iterators allow elements to be accessed one at a time using the next() function.
Example: Let’s start with a simple example using a string. We will convert it into an iterator and fetch characters one by one:
s = "GFG"
it = iter(s)
print(next(it))
print(next(it))
print(next(it))
Output
G
F
G
Explanation:
- s is an iterable (string).
- iter(s) creates an iterator.
- next(it) retrieves characters one by one.
Creating a Custom Iterator
Creating a custom iterator in Python involves defining a class that implements the __iter__() and __next__() methods according to the Python iterator protocol.
Steps to follow:
- Define the Class: Start by defining a class that will act as the iterator.
- Initialize Attributes: In the __init__() method of the class, initialize any required attributes that will be used throughout the iteration process.
- Implement __iter__(): This method should return the iterator object itself. This is usually as simple as returning self.
- Implement __next__(): This method should provide the next item in the sequence each time it's called.
Below is an example of a custom class called EvenNumbers, which iterates through even numbers starting from 2:
class EvenNumbers:
    def __init__(self, limit):
        self.limit = limit
        self.n = 2
    def __iter__(self):
        return self
    def __next__(self):
        if self.n > self.limit:
            raise StopIteration
        x = self.n
        self.n += 2
        return x
# Create an iterator for even numbers up to 10
even = EvenNumbers(10)
for num in even:
    print(num)
Output
2
4
6
8
10
Explanation:
- Initialization: The __iter__() method initializes the iterator at 2, the first even number.
- Iteration: The __next__() method retrieves the current number and then increases it by 2, ensuring the next call returns the subsequent even number.
- Usage: We create an instance of EvenNumbers, turn it into an iterator and then use the next() function to fetch even numbers one at a time.
StopIteration Exception
StopIteration exception is integrated with Python’s iterator protocol. It signals that the iterator has no more items to return. Once this exception is raised, further calls to next() on the same iterator will continue raising StopIteration.
Example:
li = [100, 200, 300]
it = iter(li)
# Iterate until StopIteration is raised
while True:
    try:
        print(next(it))
    except StopIteration:
        print("End of iteration")
        break
Output
100
200
300
End of iteration
In this example, the StopIteration exception is manually handled in the while loop, allowing for custom handling when the iterator is exhausted.
Iterator vs Iterable
Although the terms iterator and iterable sound similar, they are not the same. An iterable is any object that can return an iterator, while an iterator is the actual object that performs iteration one element at a time.
Example: Let’s take a list (iterable) and create an iterator from it
# Iterable: list
numbers = [1, 2, 3]
# Iterator: created using iter()
it = iter(numbers)
print(next(it)) 
print(next(it))  
print(next(it))  
Output
1
2
3
Explanation:
- numbers is an iterable because it can return an iterator.
- iter(numbers) creates an iterator object it.
- next(it) function fetches elements one by one until no more items are left.
To make the difference even clearer, let’s summarize it in a simple table:
| Feature | Iterable | Iterator | 
|---|---|---|
| Definition | Any object that can return an iterator | Object with a state for iteration | 
| Key Method | Implements __iter__() | Implements both __iter__() and __next__() | 
| Examples | List, Tuple, String, Dictionary, Set | Objects returned by iter() | 
| Can use next() directly? | No | Yes |

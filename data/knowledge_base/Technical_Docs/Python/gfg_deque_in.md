# Deque in Python

> Source: https://www.geeksforgeeks.org/python/deque-in-python/

A deque stands for Double-Ended Queue. It is a type of data structure that allows to add and remove elements from both ends efficiently.
- Allows fast insertion and deletion from both the front and rear ends.
- Works as both a queue (FIFO) and a stack (LIFO).
- Useful in scheduling, sliding window problems and real-time data processing.
from collections import deque 
d = deque(['name','age','DOB']) 
print(d)
Output
deque(['name', 'age', 'DOB'])
Accessing Items in deque
A deque also supports indexing, which means elements can be accessed using their position just like lists. Positive indexing starts from the left and negative indexing starts from the right.
from collections import deque
dq = deque([1, 2, 3, 4])
print(dq[0])
print(dq[-1])
Output
1
4
Explanation:
- dq[0] accesses the first element of the deque.
- dq[-1] accesses the last element of the deque.
Operations on deque
1. append(): adds an element to the right end of the deque.
from collections import deque
dq = deque([10, 20, 30])
dq.append(40)
print(dq)
Output
deque([10, 20, 30, 40])
2. appendleft(): adds an element to the left end of the deque.
from collections import deque
dq = deque([10, 20, 30])
dq.appendleft(5)
print(dq)
Output
deque([5, 10, 20, 30])
3. extend(): adds multiple elements to the right end of the deque.
from collections import deque
dq = deque([10, 20, 30])
dq.extend([40, 50, 60])
print(dq)
Output
deque([10, 20, 30, 40, 50, 60])
4. extendleft(): adds multiple elements to the left end of the deque.
from collections import deque
dq = deque([10, 20, 30])
dq.extendleft([1, 2])
print(dq)
Output
deque([2, 1, 10, 20, 30])
5. remove(): removes the first occurrence of a specified value.
from collections import deque
dq = deque([10, 20, 30, 20])
dq.remove(20)
print(dq)
Output
deque([10, 30, 20])
6. pop(): removes and returns the element from the right end.
from collections import deque
dq = deque([10, 20, 30])
dq.pop()
print(dq)
Output
deque([10, 20])
7. popleft(): removes and returns the element from the left end.
from collections import deque
dq = deque([10, 20, 30])
dq.popleft()
print(dq)
Output
deque([20, 30])
8. clear(): removes all elements from the deque.
from collections import deque
dq = deque([10, 20, 30])
dq.clear()
print(dq)
Output
deque([])
9. len(): returns the total number of elements in the deque.
from collections import deque
dq = deque([1, 2, 3, 4, 5])
print(len(dq))
Output
5
10. count(): returns how many times a specific element appears in the deque.
from collections import deque
dq = deque([10, 20, 30, 20, 40, 20])
print(dq.count(20))
Output
3
11. rotate(): rotates the elements of the deque.
from collections import deque
dq = deque([10, 20, 30, 40])
dq.rotate(1)
print(dq)
Output
deque([40, 10, 20, 30])
12. reverse(): reverses the order of elements in the deque.
from collections import deque
dq = deque([10, 20, 30, 40])
dq.reverse()
print(dq)
Output
deque([40, 30, 20, 10])

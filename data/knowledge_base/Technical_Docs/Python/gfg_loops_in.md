# Loops in Python

> Source: https://www.geeksforgeeks.org/python/loops-in-python/

Loops are used to execute a block of code repeatedly until a condition is met or all items in a sequence are processed. The main types are For loops (iterating over sequences) and While loops (executing code based on a condition).
For Loop
For loops is used to iterate over a sequence such as a list, tuple, string or range. It executes a block of code once for each item in the sequence.
n = 4
for i in range(0, n):
    print(i)
Output
0
1
2
3
Explanation:
- n = 4 stores the ending value for the loop.
- range(0, n) generates numbers from 0 to 3.
- for i in range(0, n): iterates through each number in the range.
Below is the flowchart of For loop:
Iterating by Index of Sequences
A for loop can also iterate through sequence elements using their index values with the help of range() and len().
a = ["geeks", "for", "geeks"]
for idx in range(len(a)):
    print(a[idx])
Output
geeks
for
geeks
Explanation:
- len(a) returns the total number of elements in the list.
- range(len(a)) generates index values from 0 to 2.
- a[idx] accesses list elements using their index.
While Loop
While loop repeatedly executes a block of code as long as the given condition remains true. When the condition becomes false, the line immediately after the loop in the program is executed.
cnt = 0
while (cnt < 3):
    cnt = cnt + 1
    print("Hello Geek")
Output
Hello Geek
Hello Geek
Hello Geek
Explanation:
- cnt = 0 initializes the counter variable.
- while (cnt < 3): runs the loop while the condition is true.
- cnt = cnt + 1 increases the counter value by 1.
Below is the flowchart of While loop:
Infinite While Loop
An infinite while loop runs continuously because its condition always remains true.
while (True):
    print("Hello Geek")
Explanation:
- while(True): creates a loop with a condition that is always true.
- print("Hello Geek") keeps executing repeatedly inside the loop.
Note: It is suggested not to use this type of loop as it is a never-ending infinite loop where the condition is always true and we have to forcefully terminate the program (or loop execution).
Nested Loops
A nested loop is a loop inside another loop. The inner loop executes completely for every iteration of the outer loop.
for i in range(1, 5):
    for j in range(i):
        print(i, end=' ')
    print()
Output
1 
2 2 
3 3 3 
4 4 4 4 
Explanation:
- Outer loop for i in range(1, 5) controls the number of rows and Inner loop for j in range(i) runs i times for each row.
- print(i, end=' ') prints the value of i on the same line and print() moves output to the next line after each row.

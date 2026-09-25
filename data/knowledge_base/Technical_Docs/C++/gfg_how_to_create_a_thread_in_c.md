# How to Create a Thread in C++?

> Source: https://www.geeksforgeeks.org/cpp/how-to-create-a-thread-in-cpp/

A thread is a basic element of multithreading which represents the smallest sequence of instructions that can be executed independently by the CPU. In this article, we will discuss how to create a thread in C++.
How to Create a Thread in C++?
In C++, the std::thread is a class template that is used to create and manage threads. Also, while creating a thread, we need to pass the instructions that the thread should execute. These instructions can be passed in three forms:
- Function Pointers
- Functors
- Lambda Expressions
C++ Program to Create a New Thread Using Function Pointer
// C++ Program to Create a new thread using function pointer
// Function
#include <iostream>
#include <thread>
using namespace std;
// Function to be executed by the new thread
void myFunction()
{
    cout << "Hello from the new thread!" << endl;
}
int main()
{
    // Create a new thread that calls myFunction
    thread newThread(myFunction);
    // Wait for the new thread to finish execution
    newThread.join();
    cout << "Hello from the main thread!" << endl;
    return 0;
}
Output
Hello from the new thread!
Hello from the main thread!
In this program, we first define a function myFunction that will be executed by the new thread. We then create a new thread newThread and pass the function pointer to its constructor. The join method is called on newThread to wait for the new thread to finish execution before the main thread continues.
C++ Program to Create a New Thread Using Lambda Expression
We can also create this thread using lambda expression.
// C++ Program to Create a Thread with a Lambda Expression
#include <iostream>
#include <thread>
using namespace std;
int main()
{
    // Create a new thread that calls a lambda expression
    thread newThread([] {
        cout << "Hello from the new thread!" << endl;
    });
    // Wait for the new thread to finish execution
    newThread.join();
    cout << "Hello from the main thread!" << endl;
    return 0;
}
Output
Hello from the new thread!
Hello from the main thread!
In this program, we create a new thread newThread and pass a lambda expression to its constructor. The lambda expression outputs a message to the console. The join method is called on newThread to wait for the new thread to finish execution before the main thread continues.
To know more about multithreading, refer to the article - Multithreading in C++

# Exception Handling in C++

> Source: https://www.geeksforgeeks.org/cpp/exception-handling-c/

Exception Handling in C++ is a mechanism used to handle runtime errors and abnormal conditions, allowing a program to continue execution smoothly even in the presence of errors.
- Handles abnormal conditions that occur during program execution.
- Helps maintain program stability by preventing unexpected program termination.
Basic try-catch Example
The try block contains code that might throw an exception, while the catch block handles the exception if it occurs.
#include <iostream> 
using namespace std; 
int main() 
{ 
    int n = 10; 
    int m = 0; 
    
    try { 
        if (m == 0) 
        throw "Division by zero"; 
        cout << "Answer: " << n / m; 
        
    } 
    catch (const char* msg) {
        cout << "Error: " << msg; 
        
    } 
    return 0; 
    
}
Output
Error: Division by zero
Internal Working of try-catch Block
When an exception occurs:
- The runtime executes code inside the try block.
- If an exception is thrown, the remaining code inside the try block is skipped.
- The runtime searches for a matching catch block.
- If found, the exception is handled.
- If no matching handler is found, terminate() is called.
- During this process, stack unwinding occurs and local objects are destroyed automatically.
Note: If an exception is not handled, the program terminates abruptly.
throw Keyword
The throw keyword is used to explicitly throw an exception.
#include <iostream> 
using namespace std; 
void checkAge(int age) { 
    
    if (age < 18) 
        throw "Age must be 18 or above"; 
    
} 
int main() {
    
    try { 
        checkAge(15); 
        
    } 
    catch (const char* msg) { 
        cout << msg; 
        
    } 
    return 0; 
    
}
Output
Age must be 18 or above
C++ Exception Hierarchy
Most standard exceptions in C++ derive from the std::exception class.
Types of Exceptions
There are mainly three types of exceptions in C++:
Built-in Exceptions
Built-in exceptions involve throwing primitive data types such as int, char, or float. Although simple, built-in exceptions provide limited information about the error.
#include <bits/stdc++.h>
using namespace std;
int main() {
    int x = 7;
    try {
        if (x % 2 != 0) {
            
            // Throwing int
            throw -1;
        }
    }
    
    // Catching int
    catch (int e) {
        cout << "Exception Caught: " << e;
    }
    return 0;
}
Output
Exception Caught: -1
Standard Exceptions
C++ provides a hierarchy of standard exception classes defined in <exception> and <stdexcept>.
Some commonly used standard exceptions are:
- runtime_error
- logic_error
- out_of_range
- invalid_argument
- overflow_error
All standard exceptions derive from std::exception and provide the what() function.
#include <bits/stdc++.h>
using namespace std;
int main() {
    vector<int> v = {1, 2, 3};
    
    try {
        // Accessing out of bound element
        v.at(10);
    }
    catch (out_of_range e) {
        cout << "Caught: " << e.what();
    }
    return 0;
}
Output
Caught: vector::_M_range_check: __n (which is 10) >= this->size() (which is 3)
Note: We can also manually throw standard exceptions using throw statement.
Custom Exceptions
When standard exceptions are insufficient, custom exception classes can be created.
#include <iostream>
#include <exception>
using namespace std;
// Custom exception class
class NegativeValueException : public exception {
private:
    int value;
public:
    // Constructor
    NegativeValueException(int val) : value(val) {}
    // Override what() method
    const char* what() const noexcept override {
        return "Negative value error occurred!";
    }
    // Optional: method to get the invalid value
    int getValue() const {
        return value;
    }
};
// Function that throws the custom exception
void checkValue(int x) {
    if (x < 0) {
        throw NegativeValueException(x);
    }
    else {
        cout << "Value is: " << x << endl;
    }
}
int main() {
    int numbers[] = {10, -5, 20};
    for (int n : numbers) {
        try {
            checkValue(n);
        }
        catch (NegativeValueException &e) {
            cout << "Exception caught: " << e.what() 
                 << " Value = " << e.getValue() << endl;
        }
    }
    return 0;
}
Output
Value is: 10
Exception caught: Negative value error occurred! Value = -5
Value is: 20
Nested try-catch
In Nested try-catch, one try-catch block can be placed inside another.
#include <iostream>
using namespace std;
int main() {
    try {
        cout << "Outer try block\n";
        try {
            throw 10;
        }
        catch (int e) {
            cout << "Inner catch: " << e << endl;
        }
        throw "Error";
    }
    catch (const char* msg) {
        cout << "Outer catch: " << msg;
    }
}
Output
Outer try block
Inner catch: 10
Outer catch: Error
Handling Multiple Exceptions
Multiple exceptions can be handled using multiple catch blocks.
try {    
// code
}
catch (invalid_argument& e) {    
// handle invalid argument
}
catch (out_of_range& e) {   
 // handle out of range
}
catch (...) {   
 // handle unknown exception
}
The catch(...) block acts as a catch-all handler.
Exception Propagation (Stack Unwinding)
Exception propagation refers to the process by which exceptions travel through the call stack.
#include <iostream>
using namespace std;
class Demo {
public:
    Demo() {
        cout << "Object Created\n";
    }
    ~Demo() {
        cout << "Object Destroyed\n";
    }
};
int main() {
    try {
        Demo d;
        throw 100;
    }
    catch (int) {
        cout << "Exception Caught";
    }
}
Output
Object Created
Object Destroyed
Exception Caught
Need for Exception Handling
Exception handling provides several advantages:
- Separates error-handling code from normal program logic.
- Supports exception propagation across function calls.
- Improves readability and maintainability.
Best Practices of Exception Handling
Following these best practices helps improve code reliability, maintainability, and ensures that exceptions are handled efficiently and safely.
- Use exceptions only for exceptional situations.
- Catch exceptions by const reference.
- Prefer standard exception classes when possible.
- Use RAII for resource management.
- Avoid generic catch(...) unless necessary.

# Exception Handling using Classes in C++

> Source: https://www.geeksforgeeks.org/cpp/exception-handling-using-classes-in-cpp/

Exception handling in C++ allows programs to handle runtime errors gracefully using objects called exceptions. Instead of abruptly terminating the program, exceptions can be thrown and caught using try, throw, and catch blocks.
- Exception objects provide detailed information about errors.
- C++ supports both standard exception classes and user-defined exception classes.
Standard Exception Classes
C++ provides several built-in exception classes for representing common runtime errors. Most standard exceptions are derived from the std::exception class.
std::exception Base Class
class exception {
public:
    exception() noexcept;
    exception(const exception&) noexcept;
    exception& operator=(const exception&) noexcept;
    
    virtual ~exception();
    virtual const char* what() const noexcept;
};
The what() function returns a description of the exception. Since it is a virtual function, derived exception classes can provide their own error messages.
Common Standard Exception Classes
| Exception Class | Description | 
|---|---|
| invalid_argument | Invalid arguments passed to a function | 
| out_of_range | Access outside valid range | 
| domain_error | Mathematical domain errors | 
| runtime_error | Runtime errors | 
| overflow_error | Arithmetic overflow | 
| underflow_error | Arithmetic underflow | 
| ios_base::failure | Input/output operation failures | 
| bad_cast | Failed dynamic_cast operation | 
| bad_alloc | Memory allocation failure | 
These exceptions are commonly thrown by C++ library components and should be handled appropriately.
Example: Handling a Standard Exception
#include <bits/stdc++.h>
using namespace std;
int main() {
    try {
        
        // Try allocating a huge block of memory
        int* bigArray = new int[100000000000000];  
        
    } catch (const bad_alloc& e) {
        cout << "Caught bad_alloc: " << e.what();
    }
    
    // Moving on to next part of the code
    return 0;
}
Output
Caught bad_alloc: std::bad_alloc
Explanation: The memory allocation fails and throws a std::bad_alloc exception, which is caught and handled using the catch block.
Throwing Standard Exception Objects
Programmers can also manually throw standard exception objects.
#include <bits/stdc++.h>
using namespace std;
int main() {
    int num = 10;
    int den = 0;
	int res;
	
	// Checking division by zero
    try {
        if (!den) {
            
            // Passing custom message
            throw runtime_error("Division by Zero");
        }
		res = num/den;
    }
	catch (const runtime_error& e) {
        cout << "Caught: " << e.what();
    }
    return 0;
}
Output
Caught: Division by Zero
Explanation: A runtime_error object is explicitly thrown with a custom error message and later handled in the corresponding catch block.
Creating Custom Exception Classes
When standard exception classes are insufficient, programmers can create their own exception classes.
There are mainly three ways to create custom exception classes in C++:
Deriving from std::exception
The simplest and most common approach is to inherit from std::exception and override the what() function.
#include <bits/stdc++.h>
using namespace std;
// Create an own custom class for
// exception handling
class CustomExcept : public exception {
public:
    
    // Override what() function
    const char* what() const noexcept override {
        return "This is a custom exception!";
    }
};
int main() {
    try {
        
        // Throwing our custom exception
        throw CustomExcept();  
    }
    catch (const CustomExcept& e) {
        cout << "Caught an exception: " << e.what();  
    }
    return 0;
}
Output
Caught an exception: This is a custom exception!
Explanation: The custom exception class overrides what() to provide its own error message.
Deriving from Other Standard Exceptions
Custom exceptions can also inherit from classes such as runtime_error or logic_error.
#include <bits/stdc++.h>
using namespace std;
class CustomExcept : public runtime_error {
public:
	// Using constructor for passing custom message
	CustomExcept(const string& message)
        : runtime_error(message) {}
};
int main() {
    try {
        throw CustomExcept(
            "This is a custom runtime_exception!"
        );
    }
    catch (const CustomExcept& e) {
        cout << e.what();
    }
    return 0;
}
Output
This is a custom runtime_exception!
Explanation: The custom exception inherits the functionality of runtime_error, including support for custom messages.
Creating a Non-Standard Exception Class
A custom exception class can also be created without inheriting from any standard exception class.
#include <bits/stdc++.h>
using namespace std;
class CustomExcept {
public:
	CustomExcept(const string& msg) : message(msg) {}
    
    // Handle custom exception using
    // what() method.
    const char* what() const {
        return message.c_str();
    }
private:
    string message;
};
int main() {
    try {
        throw CustomExcept(
            "This is a custom exception!"
        );
    }
    catch (const CustomExcept& e) {
        cout << e.what();
    }
    return 0;
}
Output
This is a custom exception!
Explanation: The exception class stores and returns its own error message without relying on the standard exception hierarchy.
Best Practices
The following practices help create effective exception classes in C++:
- Prefer deriving custom exceptions from std::exception.
- Override the what() function to provide meaningful error messages.
- Catch exceptions using const references.
- Use standard exception classes whenever possible.

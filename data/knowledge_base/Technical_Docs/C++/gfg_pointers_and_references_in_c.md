# Pointers and References in C++

> Source: https://www.geeksforgeeks.org/cpp/pointers-and-references-in-c/

Pointers and references are important C++ features used to access and manipulate data efficiently. A pointer stores the memory address of a variable, while a reference acts as an alias for an existing variable.
- Pointers store memory addresses and provide indirect access to data.
- References create an alternative name for an existing variable.
- Both are commonly used for efficient parameter passing and data manipulation.
Pointers in C++
Pointers are variables that store the memory address of another variable. They provide direct access to memory locations and are commonly used for dynamic memory allocation, efficient parameter passing, and implementing complex data structures.
- Store the address of a variable or memory location.
- Can be reassigned to point to different variables.
- Can store a nullptr value when not pointing to any valid memory location.
- Require the dereference operator (*) to access the value stored at the address.
- Have their own memory address independent of the variable they point to.
Syntax
datatype *var_name;
or
datatype* var_name;
where:
- datatype represents the type of data being pointed to
- var_name is the name of the pointer variable
#include <iostream>
using namespace std;
int main(){
    int x = 10; // variable declared
    int* myptr; // pointer variable
    // storing address of x in pointer myptr
    myptr = &x;
    cout << "Value of x is: ";
    cout << x << endl;
    // print the address stored in myptr pointer variable
    cout << "Address stored in myptr is: ";
    cout << myptr << endl;
    // printing value of x using pointer myptr
    cout << "Value of x using *myptr is: ";
    cout << *myptr << endl;
    return 0;
}
Output
Value of x is: 10
Address stored in myptr is: 0x7ffd2b32c7f4
Value of x using *myptr is: 10
Explanation
- An integer variable x is initialized with the value 10.
- The pointer variable myptr stores the address of x using the address-of operator (&).
- Printing myptr displays the memory address of x.
- Dereferencing the pointer using *myptr accesses the value stored at that address.
- Since myptr points to x, *myptr prints the value 10.
References in C++
A reference is an alias or alternative name for an existing variable. Once a reference is initialized, it refers to the same memory location as the original variable, allowing both names to access the same data.
- Act as an alias for an existing variable
- Must be initialized at the time of declaration
- Cannot be reassigned to refer to another variable
- Do not require dereferencing to access the value
- Share the same memory location as the original variable
Uses of References
References are commonly used for passing arguments to functions efficiently. In C++, arguments can be passed in the following ways:
- Call by Value: A copy of the argument is passed to the function
- Call by Reference using Pointer: The address of the argument is passed using a pointer
- Call by Reference using Reference: The argument is passed using a reference variable
Syntax
datatype& ref_name = variable;
where:
- datatype represents the type of the referenced variable
- ref_name is the name of the reference variable
- variable is the existing variable being referenced
#include <iostream>
using namespace std;
int main(){
    int y = 10;
    // myref is a reference to y.
    int& myref = y;
    // changing value of y to 20
    y = 30;
    cout << "value of y is " << y << endl;
    cout << "value of myref after change in value of y is: "
         << myref << '\n';
    return 0;
}
Output
value of y is 30
value of myref after change in value of y is: 30
Explanation
- An integer variable y is initialized with the value 10
- myref is declared as a reference to y
- Both y and myref refer to the same memory location
- When the value of y is changed to 30, the value accessed through myref also becomes 30
- Printing either y or myref displays the same value because they refer to the same variable
Pointers Vs References
Pointers and references are both used to access and manipulate data indirectly, but they differ in how they store and refer to memory. The following table highlights the key differences between pointers and references in C++.
| Feature | Pointer | Reference | 
|---|---|---|
| Definition | A pointer stores the memory address of another variable | A reference is an alias (another name) for an existing variable | 
| Declaration | Uses * symbol | Uses & symbol | 
| Initialization | Can be declared without initialization | Must be initialized at the time of declaration | 
| Null Value | Can be NULL or nullptr | Cannot be null | 
| Reassignment | Can point to another variable | Cannot be reassigned to refer to another variable | 
| Memory Address | Has its own memory address | Shares the same memory address as the referenced variable | 
| Dereferencing | Requires dereferencing using * | No dereferencing needed | 
| Usage | Useful for dynamic memory, arrays, and data structures | Useful for function parameters and operator overloading | 
| Safety | Less safe (can cause dangling pointers) | Safer compared to pointers |

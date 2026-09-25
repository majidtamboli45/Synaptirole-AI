# Parameter Passing Techniques in C++

> Source: https://www.geeksforgeeks.org/cpp/parameter-passing-techniques-in-cpp/

In C++, data is passed to functions during a call to perform operations. This data is known as parameters or arguments, and C++ supports various parameter-passing techniques. Before exploring them, understand the following terms:
- Formal Parameters: Variables used in parameter list of a function as placeholders. Also called only parameters.
- Actual Parameters: The expressions or values passed in during a function call. Also called arguments.
There are 3 different methods using which we can pass parameters to a function in C++. These are:
Pass by Value
In pass by value method, a variable's value is copied and then passed to the function. As the result, any changes to the parameter inside the function will not affect the variable's original value in the caller. This method is simple, easy to implement but it is not preferred for large size of data structures as it involves copying the value.
#include <iostream>
using namespace std;
// Arguments are pass by value
void change(int a) {
  
  	// Modifying arguments
    a = 22;
}
int main() {
    int x = 5;
    // Passing x by value to change()
    change(x);
    
    cout << x;
    return 0;
}
Output
5
In this program, when the change function is called with x as the argument, a copy of x is created and passed to the function. Inside the function, the parameter a is modified, but this modification only affects the local copy of the value, not the original variable x, as demonstrated by the output.
Pass by Reference
In pass-by-reference method, instead of passing the value of the argument, we pass the reference of an argument to the function. This allows the function to change the value of the original argument. This is useful when you have to pass large size data.
#include <iostream>
using namespace std;
// Arguments are pass by value
void change(int& a) {
  
  	// Modifying arguments
    a = 22;
}
int main() {
    int x = 5;
    // Passing x by reference to change()
    change(x);
    
    cout << x;
    return 0;
}
Output
22
As we can see, the original value is modified. Just declaring the parameter a as a reference changes it from pass by value to pass by reference.
Pass by Pointer
The pass-by-pointer is very similar to the pass-by-reference method. The only difference is that we pass the raw address of the argument as the parameter to the function instead of reference.
#include <iostream>
using namespace std;
// Arguments are pass by value
void change(int* a) {
  
  	// Modifying arguments
    *a = 22;
}
int main() {
    int x = 5;
    // Passing address of x to change()
    change(&x);
    
    cout << x;
    return 0;
}
Output
22
The original value is modified, but it increases to complexity of the program as we need to be careful of referencing, referencing and passing addresses. So, passing reference is preferred over this method.

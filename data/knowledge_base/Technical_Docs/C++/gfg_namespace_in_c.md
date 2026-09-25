# Namespace in C++

> Source: https://www.geeksforgeeks.org/cpp/namespace-in-c/

A namespace in C++ is a container used to organize identifiers like variables, functions, and classes. It helps prevent naming conflicts when the same names are used in different parts of a program.
- Groups related code under a unique name.
- Prevents collisions between identifiers having the same name.
- Improves code organization and readability.
#include <iostream>  
namespace Room1 {
    // Function greet inside namespace Room1
    void greet() {
        std::cout << "Hello from Room 1!" << std::endl;
    }
}
namespace Room2 {
    // Function greet inside namespace Room2
    void greet() {
        std::cout << "Hello from Room 2!" << std::endl;
    }
}
int main() {
    // Use the scope resolution operator (::) to access greet() function inside namespace Room1
    Room1::greet();  
    Room2::greet(); 
    
    return 0;  
}
Output
Hello from Room 1!
Hello from Room 2!
Using Namespace Members
Members of a namespace can be accessed either by using the scope resolution operator, a using directive, or a using declaration.
Using Directive
The using directive imports all members of a namespace into the current scope, eliminating the need to prefix each member with the namespace name.
Syntax:
using namespace namespace_name;
#include <iostream>
namespace first_space {
void func()
{
    std::cout << "Inside first_space";
}
}
using namespace first_space;
int main()
{
    func();
    return 0;
}
Output
Inside first_space
Explanation
- using namespace first_space; makes all members of first_space directly accessible.
- The function func() can be called without writing first_space::func().
Note: Importing an entire namespace into the global scope is generally discouraged in large projects because it may introduce naming conflicts.
Using Declaration
Instead of importing the entire namespace, C++ also allows importing only specific members using a using declaration. This approach is generally preferred because it avoids unnecessary namespace pollution.
Syntax:
using namespace_name::member_name;
#include <iostream>
namespace first_space {
void func()
{
    std::cout << "Inside first_space";
}
}
using first_space::func;
int main()
{
    func();
    return 0;
}
Output
Inside first_space
Explanation
- Only the function func() is imported into the current scope.
- Other members of first_space still require the scope resolution operator.
- This approach reduces unnecessary namespace pollution and is generally preferred over importing the entire namespace.
Types of Namespaces
Nested Namespace
A namespace can contain another namespace. Such namespaces are called nested namespaces and help organize related components into multiple levels.
#include <iostream>
using namespace std;
// Outer namespace
namespace outer {
    void fun(){
        cout << "Inside outer namespace" << endl;
    }
    
    // Inner namespace
    namespace inner {
        void func() {
            cout << "Inside inner namespace";
        }
    }
}
int main() {
    
    // Accessing member of inner 
    // namespace
    outer::inner::func();  
    return 0;
}
Output
Inside inner namespace
Anonymous Namespace
An anonymous namespace is a namespace without a name. Its members are accessible only within the current source file, making it useful for internal linkage.
#include <iostream>
using namespace std;
// Anonymous namespace
namespace {
int value = 10;
}
int main()
{
    cout << value;
    return 0;
}
Output
10
Inline Namespace
An inline namespace allows the members of a nested namespace to be accessed as if they were declared in the enclosing namespace. It is commonly used for library versioning.
#include <iostream>
using namespace std;
namespace Library {
inline namespace Version1 {
void display()
{
    cout << "Inside inline namespace";
}
}
}
int main()
{
    Library::display();
    return 0;
}
Output
Inside inline namespace
Built-in Namespaces
C++ provides several built-in namespaces that are widely used in programs.
std Namespace
In C++, std namespace is the part of standard library, which contains most of the standard functions, objects, and classes like cin, cout, vector, etc. It also avoids conflicts between user-defined and library-defined functions or variables.
#include <iostream>
using namespace std;
int main() {
    int a = 3, b = 7;
    
    // 'cout' and 'endl' are part of the std namespace
    cout << "Sum: " << a + b ;  
    return 0;
}
Output
Sum: 10
Global Namespace
Identifiers declared outside any namespace belong to the global namespace. The global scope resolution operator (::) is used to access global identifiers when a local identifier has the same name.
#include <bits/stdc++.h>
using namespace std;
int n = 3;
int main() {
    int n = 7;
    
    // Accessing global namespace
    cout << ::n << endl;
    cout << n;
    return 0;
}
Output
3
7
Namespace Alias
A namespace alias provides a shorter name for an existing namespace. It is useful when working with deeply nested or lengthy namespace names.
#include <iostream>
namespace Mathematics {
int square(int x)
{
    return x * x;
}
}
// Creating an alias
namespace Math = Mathematics;
int main()
{
    std::cout << Math::square(5);
    return 0;
}
Output
25
Extending a Namespace
A namespace can be defined in multiple places within the same program. Adding new declarations to an existing namespace is known as extending a namespace.
#include <iostream>
using namespace std;
namespace Demo {
void func()
{
    cout << "Function 1" << endl;
}
}
// Extending the same namespace
namespace Demo {
void func2()
{
    cout << "Function 2";
}
}
int main()
{
    Demo::func();
    Demo::func2();
    return 0;
}
Output
Function 1
Function 2
Advantages of Namespaces
Namespaces provide several benefits in C++:
- Prevent naming conflicts between identifiers with the same name.
- Organize related classes, functions, and variables.
- Allow large projects and libraries to be divided into logical modules.
- Support library development by keeping identifiers separate.
Related article: differences between namespaces and classes

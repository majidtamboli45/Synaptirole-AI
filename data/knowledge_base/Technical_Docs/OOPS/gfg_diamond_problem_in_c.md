# Diamond Problem in C++

> Source: https://www.geeksforgeeks.org/cpp/diamond-problem-in-cpp/

The Diamond Problem occurs in C++ during multiple inheritance when a derived class inherits from two base classes that themselves inherit from a common base class. This creates ambiguity because the derived class ends up with multiple copies of the same base class members, making member access unclear.
In simple words:
- A child class inherits from two parent classes
- Both parent classes already inherit from the same base class
- So the child class gets two copies of the same base class, creating confusion (ambiguity)
The structure looks like a diamond shape, so it is called the Diamond Problem. The inheritance structure resembles a diamond, hence the name.
Example of Diamond Problem
#include <iostream>
using namespace std;
// Base class
class Base {
public:
    void fun() { cout << "Base" << endl; }
};
// Parent class 1
class Parent1 : public Base {};
// Parent class 2
class Parent2 : public Base {};
// Child class inheriting from both parents
class Child : public Parent1, public Parent2 {};
int main() {
    Child obj;
    obj.fun();   // Ambiguity error
    return 0;
}
Output
main.cpp:30:9: error: request for member ‘fun’ is ambiguous
   30 |     obj.fun(); // Ambiguity error
      |         ^~~
main.cpp:8:10: note: candidates are: ‘void Base::fun()’
    8 |     void fun() { cout << "Base" << endl; }
      |          ^~~
main.cpp:20:10: note:                 ‘void Base::fun()’
Explanation:
- Base defines the function fun().
- Parent1 and Parent2 both inherit from Base.
- Child inherits from both Parent1 and Parent2, resulting in two copies of Base.
- The call obj.fun() is ambiguous because the compiler cannot decide which Base::fun() to invoke.
Solution to Diamond Problem
C++ resolves the Diamond Problem using virtual inheritance. Virtual inheritance ensures that only one shared instance of the base class exists, regardless of how many times it is inherited.
#include <iostream>
using namespace std;
// Base class
class Base {
public:
    void fun() { cout << "Base" << endl; }
};
// Parent classes with virtual inheritance
class Parent1 : virtual public Base {};
class Parent2 : virtual public Base {};
// Child class
class Child : public Parent1, public Parent2 {};
int main() {
    Child obj;
    obj.fun();   // No ambiguity
    return 0;
}
Output
Base
Explanation:
- virtual public Base ensures that only one Base object is shared.
- Child now has a single copy of Base.
- The call "obj.fun()" is resolved unambiguously.
Note: Another approach is to rename conflicting methods in the derived classes to avoid ambiguity. By providing distinct names for methods inherited from different base classes, developers can eliminate ambiguity without resorting to virtual inheritance. However, this approach may lead to less intuitive code and increased maintenance overhead.
Ambiguity in Inheritance
Ambiguity occurs when the compiler cannot determine which base class member to access. This typically happens in:
- Multiple inheritance where base classes have members with the same name.
- Common base class inheritance, where multiple parent classes inherit from the same base class.
#include <iostream>
using namespace std;
class A {
public:
    void print() { cout << "A" << endl; }
};
class B : public A {};
class C : public A {};
class D : public B, public C {};
int main() {
    D d;
    d.B::print();
    d.C::print();
    return 0;
}
Output
A
A
Explanation
- 'A' defines the function "print()".
- 'B' and 'C' inherit "print()" from 'A'.
- 'D' inherits from both 'B' and 'C', causing ambiguity.
- The ambiguity is resolved using scope resolution "(d.B::print() and d.C::print())".
Resolving Ambiguity Scope Resolution Operator (::)
Ambiguity can also be resolved using the scope resolution operator (::) by explicitly specifying which base class member should be accessed.
#include <iostream>
using namespace std;
class A {
public:
    void print() { cout << "A" << endl; }
};
class B : public A {};
class C : public A {};
class D : public B, public C {};
int main() {
    D d;
    // Resolving ambiguity using scope resolution
    d.B::print();
    d.C::print();
    return 0;
}
Output
A
A

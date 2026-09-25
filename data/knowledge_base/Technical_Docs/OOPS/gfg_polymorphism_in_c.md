# Polymorphism in C++

> Source: https://www.geeksforgeeks.org/cpp/cpp-polymorphism/

The word polymorphism means having many forms. In C++, polymorphism concept can be applied to functions and operators. A single function name can work differently in different situations. Similarly, an operator works different when used in different context.
- Same function or operator can behave differently depending on the context or object it is used with.
- Achieved through function overloading and function overriding, improving code reusability and flexibility.
#include <iostream>
using namespace std;
class Animal {
public:
    // Function to display animal sound
    void sound() {
        cout << "Animal makes a sound";
    }
};
class Dog : public Animal {
public:
    // Overriding the sound function
    void sound() {
        cout << "Dog barks";
    }
};
int main() {
    Dog d;
    // Calling the Dog class function
    d.sound();
    return 0;
}
Output
Dog barks
Explanation: The Dog class provides its own implementation of the sound() function. When d.sound() is called, the Dog class version is executed, showing how the same function name can have different behavior in different classes.
Types of Polymorphism
In C++, polymorphism is mainly divided into two types
Compile-Time Polymorphism
Compile-time polymorphism is also known as static polymorphism or early binding. In this type of polymorphism, the compiler decides which function or operator to call during compilation. It is achieved using:
1. Function Overloading
Function Overloading allows multiple functions to have the same name but different parameter lists.
- Functions differ by the number or type of parameters.
- The compiler selects the appropriate function during compilation.
- Improves code readability by using a common function name.
#include <bits/stdc++.h>
using namespace std;
class Geeks {
public:
    
    // Function to add two integers
    void add(int a, int b) {
        cout << "Integer Sum = " << a + b
        << endl;
    }
    
    // Function to add two floating point values
    void add(double a, double b) {
        cout << "Float Sum = " << a + b
        << endl ;
    }
};
int main() {
    Geeks gfg;
    
    // add() called with int values
    gfg.add(10, 2);
    // add() called with double value
    gfg.add(5.3, 6.2);
    return 0;
}
Output
Integer Sum = 12
Float Sum = 11.5
Explanation: The class contains two add() functions with different parameter types. The compiler selects the appropriate function based on the arguments passed during the function call.
2. Operator Overloading
Operator overloading allows operators such as +, -, and * to work with user-defined types.
- Gives custom meaning to existing operators.
- Makes user-defined objects easier to use.
- Improves code readability.
Note: Operators such as ::, ., .*, ?:, and sizeof cannot be overloaded because they are essential to the core functionality of the language.
#include <iostream>
using namespace std;
class Complex {
public:
    int real, imag;
    
    Complex(int r, int i) :
    real(r), imag(i) {}
    // Overloading the '+' operator
    Complex operator+(const Complex& obj) {
        return Complex(real + obj.real, imag + obj.imag);
    }
};
int main() {
    Complex c1(10, 5), c2(2, 4);
    
    // Adding c1 and c2 using + operator
    Complex c3 = c1 + c2;  
    cout << c3.real << " + i" << c3.imag;
    return 0;
}
Output
12 + i9
Explanation: The overloaded + operator adds the real and imaginary parts of two Complex objects. When c1 + c2 is used, the overloaded operator function is called automatically.
Runtime Polymorphism
Runtime polymorphism is also known as dynamic polymorphism or late binding. The decision about which function to execute is made while the program is running.
- Achieved using virtual functions.
- Implemented through function overriding.
- Allows base class pointers or references to invoke derived class functions.
Real-Life Example:
Different animals represent polymorphism, where the same method speak() produces different outputs such as Bark, Meow, and Moo depending on the object calling the method.
In above Diagram:
- A Dog object says Bark
- A Cat object says Meow
- A Cow object says Moo
Even though all animals use the same function name speak(), the behavior changes according to the object.
1. Function Overriding
Function Overriding occurs when a derived class provides its own implementation of a virtual function defined in the base class.
- Base class function must be declared as virtual.
- Derived class provides its own implementation.
- Function call is resolved at runtime.
#include <bits/stdc++.h>
using namespace std;
class Base {
public:
    // Virtual function
    virtual void display() {
        cout << "Base class function";
    }
};
class Derived : public Base {
public:
    // Overriding the base class function
    void display() override {
        cout << "Derived class function";
    }
};
int main() {
    
    // Creating a pointer of type Base
    Base* basePtr;
    
    // Creating an object of Derived class
    Derived derivedObj;
    // Pointing base class pointer to 
    // derived class object
    basePtr = &derivedObj;
    
    // Calling the display function 
    // using base class pointer
    basePtr->display();
    return 0;
}
Output
Derived class function
Explanation
- A virtual function display() is defined in the base class and is overridden in the derived class.
- A base class pointer is used to point to a derived class object.
- When display() is called using the base pointer, the derived class version is executed at runtime due to dynamic binding.
Advantages of Polymorphism
Polymorphism makes C++ programs more flexible and easier to maintain.
- Promotes code reusability by using a common interface.
- Simplifies program design by reducing duplicate code.
- Makes applications easier to extend with new classes.
- Improves maintainability through loose coupling.
- Enables dynamic behavior using inheritance and virtual functions.
Compile-Time Vs Runtime Polymorphism
The major difference between the compile-time and runtime polymorphism is:
| Compile Time Polymorphism | Run time Polymorphism | 
|---|---|
| Also called static binding | Also called dynamic binding | 
| Achieved using function overloading and operator overloading | Achieved using virtual functions and function overriding | 
| Decision made by the compiler at compile time | Decision made at runtime using vtables | 
| Faster due to early binding | More flexible but slightly slower |

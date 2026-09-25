# Access Modifiers in C++

> Source: https://www.geeksforgeeks.org/cpp/access-modifiers-in-c/

Access modifiers in C++ are keywords that control the accessibility of class members (data members and member functions). They are an important part of encapsulation and data hiding, allowing developers to restrict access to sensitive data and expose only the required functionality.
- Control the visibility of class members.
- Help implement data hiding and encapsulation.
- Improve security and maintainability of code.
Types of Access Modifiers in C++
Access modifiers specify the access level of class members and define where they can be used. C++ provides three access modifiers:
Public Specifier
The public access specifier allows class members to be accessed from anywhere in the program through an object of the class.
- Public members can be accessed both inside and outside the class.
- Commonly used for functions and data that should be available to users of the class.
- Helps expose the required functionality of a class.
#include <iostream>
using namespace std;
class Student {
public:
    string name;
};
int main() {
    Student s;
    // Accessing public member
    s.name = "John";
    cout << s.name;
    return 0;
}
Output
John
Explanation
- name is declared as a public member.
- It can be accessed directly using the object s.
- The value "John" is assigned and printed successfully.
Private Specifier
The private access specifier restricts access to class members so that they can only be accessed within the class itself.
- Private members cannot be accessed directly outside the class.
- Used to hide sensitive data and implementation details.
- Helps achieve data hiding and encapsulation.
- By default, all members of a C++ class are private.
#include <iostream>
using namespace std;
class Employee {
private:     
    // salary and empId cannot be accessed 
    // from outside the Class
    double salary;
    int empID;
public:                 
    string name; // Name can be accessed anywhere
    
    Employee(string n, double s, int id) {
        name = n;
        salary = s;
        empID = id;
    }
};
int main() {
    Employee emp("Fedrick", 50000, 101);
    cout << "Name: " << emp.name << endl;
    return 0;
}
Output
Name: Fedrick
Explanation
- salary and empID are declared as private members.
- These members cannot be accessed directly outside the class.
- name is declared as public, so it can be accessed using the object emp.
- Attempting to access emp.salary or emp.empID would result in a compilation error.
Attempting to Access Private Members
Trying to access a private member directly from outside the class results in a compilation error.
#include <iostream>
using namespace std;
class Employee {
private:               
    double salary;
    int empID;
public:                
    string name;
    // Constructor
    Employee(string n, double s, int id) {
        name = n;
        salary = s;
        empID = id;
    }
};
int main() {
    Employee emp("Fedrick", 50000, 101);
    cout << emp.salary << endl;   
    return 0;
}
Output
compilation error  
prog.cpp: In function ‘int main()’:
prog.cpp:22:17: error: ‘double Employee::salary’ is private within this context
cout << emp.salary << endl;
^~~~~~
prog.cpp:6:12: note: declared private here
double salary;
^~~~~~
Explanation
- salary is a private member of the Employee class.
- Private members are accessible only within the class.
- Therefore, accessing emp.salary from main() causes a compilation error.
Protected Specifier
The protected access specifier allows class members to be accessed within the class and its derived classes, while preventing direct access from outside the class.
- Accessible within the same class.
- Accessible in derived (child) classes through inheritance.
- Cannot be accessed directly using objects of the class.
- Commonly used when implementing inheritance.
#include <iostream>
using namespace std;
class Employee {
private:                 
    double salary;
protected:               
    int empID;
public:                  
    string name;
    Employee(string n, double s, int id) {
        name = n;
        salary = s;
        empID = id;
    }
};
// Derived class (inherits from Employee)
class Manager : public Employee {
public:
    Manager(string n, double s, int id) : Employee(n, s, id) {}
    void showDetails() {
        cout << "Manager Name: " << name << endl;     
        cout << "Manager ID: " << empID << endl;     
    }
};
int main() {
    Employee emp("Fedrick", 50000, 101);
    cout << "Employee Name: " << emp.name << endl;
    Manager m("Rohit", 70000, 102);
    m.showDetails();   
    return 0;
}
Output
Employee Name: Fedrick
Manager Name: Rohit
Manager ID: 102
Explanation
- empID is declared as a protected member of Employee.
- The derived class Manager can access empID directly inside its member function showDetails().
- The private member salary remains inaccessible to the derived class.
- Protected members help share data and functionality with derived classes while keeping them hidden from external code.
Note: This access through inheritance can alter the access modifier of the elements of base class in derived class depending on the mode of Inheritance.

# C++ Classes and Objects

> Source: https://www.geeksforgeeks.org/cpp/c-classes-and-objects/

In Object Oriented Programming, classes and objects are basic concepts that are used to represent real-world concepts and entities.
- A class is a template to create objects having similar properties and behavior, or in other words, we can say that a class is a blueprint for objects.
- An object is an instance of a class. For example, the animal type Dog is a class, while a particular dog named Tommy is an object of the Dog class.
C++ Classes
A class in C++ is a user-defined data type that combines data members and member functions into a single unit. It acts as a blueprint for creating objects and helps organize code in an object-oriented way.
- Data Members: Variables inside the class used to store data.
- Member Functions: Functions inside the class used to perform operations on the data.
Creating a Class
A class must be defined before creating its objects. In C++, a class is declared using the class keyword.
#include <iostream>
using namespace std;
class Car {
public:
    string brand;
    void display() {
        cout << "Car Brand: " << brand;
    }
};
int main() {
    Car car1;
    car1.brand = "Toyota";
    car1.display();
    return 0;
}
Output
Car Brand: Toyota
Explanation: In the above program defines a Car class containing a data member brand and a member function display() to print the car brand. In the main() function, an object car1 is created, the brand is assigned as "Toyota", and the display() function is called to show the output.
C++ Objects
An object in C++ is an instance of a class created to access the data members and member functions defined inside the class. Each object has its own separate copy of data members while sharing the common structure and behavior defined by the class.
- State: Represents the values stored in data members of the object.
- Behavior: Represents the actions performed using member functions.
- Identity: Each object has its own unique existence in memory.
Example: Objects in C++ represent real-world entities such as cars, students, employees, or circles. Memory for objects is allocated when they are created.
Object Creation
Once the class is defined, we can create its object in the same way we declare the variables of any other inbuilt data type.
Syntax
ClassName objectName;
Example
Dog tuffy;
Here, tuffy is an object of the Dog class.
Object Initialization
Objects can be initialized using constructors while creating them.
Example: Dog tuffy("Tuffy", "Papillon", 5, "White");
In the above example:
- "Tuffy" represents the dog name.
- "Papillon" represents the breed.
- 5 represents the age.
- "White" represents the color.
The constructor initializes the object with the provided values.
Accessing Class Members
Members of the class can be accessed inside the class itself simply by using their assigned name and access them outside, the (.) dot operator is used with the object of the class.
Syntax
object.dataMember;
object.memberFunction();
#include <iostream>
using namespace std;
class Dog {
public:
    string name;
    string breed;
    void display() {
        cout << "Dog Name: " << name << endl;
        cout << "Breed: " << breed << endl;
    }
};
int main() {
    Dog tuffy;
    tuffy.name = "Tuffy";
    tuffy.breed = "Papillon";
    tuffy.display();
    return 0;
}
Output
Dog Name: Tuffy
Breed: Papillon
Explanation: Above program defines a Dog class with two data members, name and breed, along with a member function display() to print their values. In the main() function, an object tuffy is created, values are assigned to its data members, and the display() function is called to show the dog details.

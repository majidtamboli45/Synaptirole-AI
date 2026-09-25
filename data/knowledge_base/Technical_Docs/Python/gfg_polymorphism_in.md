# Polymorphism in Python

> Source: https://www.geeksforgeeks.org/python/polymorphism-in-python/

Polymorphism means "many forms" and allows the same method, function or operator to behave differently depending on the object or data it works with. This flexibility helps create more reusable, maintainable and scalable code.
Real-Life Example: In a backend payment system, multiple payment options are available such as Credit Card, UPI, NetBanking and Wallet. All payment types use a common method named processPayment() but different implementations:
- Credit Card Payment: validates card, talks to bank API
- UPI Payment: redirects to UPI gateway
- Wallet Payment: checks wallet balance
- NetBanking Payment: redirects to bank login
The method name remains the same, but the action changes based on the payment type.
Types of Polymorphism
Polymorphism refers to the ability of the same method or operation to behave differently based on object or context. It mainly includes compile-time and runtime polymorphism.
Let's discuss each type in detail.
1. Compile-time Polymorphism
Compile-time polymorphism involves selecting a method or operation before program execution, typically through method or operator overloading. Languages such as Java and C++ support this feature.
Python does not support true compile-time polymorphism because method calls are resolved at runtime. However, similar behavior can be achieved using default arguments, variable-length arguments (*args), or keyword arguments (**kwargs).
Example: This code demonstrates overloading-like behavior using default and variable-length arguments. While Python does not support true method overloading, the same method can handle different numbers of arguments.
class Calculator:
    def multiply(self, a=1, b=1, *args):
        result = a * b
        for num in args:
            result *= num
        return result
# Create object
calc = Calculator()
# Using default arguments
print(calc.multiply())            
print(calc.multiply(4))           
# Using multiple arguments
print(calc.multiply(2, 3))       
print(calc.multiply(2, 3, 4))     
Output
1
4
6
24
Explanation:
- Dog andCat override thesound() method inherited fromAnimal .
- The same method call, sound() , produces different results depending on the object.
2. Runtime Polymorphism (Overriding)
Runtime polymorphism means that the behavior of a method is decided while program is running, based on the object calling it. This happens through Method Overriding a child class provides its own version of a method already defined in the parent class.
Example: This code shows runtime polymorphism using method overriding. The sound() method is defined in base class Animal and overridden in Dog and Cat. At runtime, correct method is called based on object's class.
class Animal:
    def sound(self):
        return "Some generic sound"
class Dog(Animal):
    def sound(self):
        return "Bark"
class Cat(Animal):
    def sound(self):
        return "Meow"
# Polymorphic behavior
animals = [Dog(), Cat(), Animal()]
for animal in animals:
    print(animal.sound())
Output
Bark
Meow
Some generic sound
Explanation: Here, sound method behaves differently depending on whether object is a Dog, Cat or Animal and this decision happens at runtime. This dynamic nature makes Python particularly powerful for runtime polymorphism.
Polymorphism in Built-in Functions
Python's built-in functions such as len() and max() are polymorphic because they work with different data types and return results based on type of object passed. This showcases it's dynamic nature, where same function name adapts its behavior depending on input.
Example: This code demonstrates polymorphism in built-in functions handling strings, lists, numbers and characters differently while using same function name.
print(len("Hello"))  # String length
print(len([1, 2, 3]))  # List length
print(max(1, 3, 2))  # Maximum of integers
print(max("a", "z", "m"))  # Maximum in strings
Output
5
3
3
z
Explanation: len() works with different iterable types such as strings and lists and max() returns the largest value for both numbers and strings.
Polymorphism in Functions
Polymorphism allows functions to work with different object types as long as they support the required behavior. Using duck typing, it focuses on whether an object has the required methods rather than its type, enabling flexible and reusable code.
Example: This code demonstrates polymorphism using duck typing as perform_task() function works with different object types (Pen and Eraser), as long as they have a .use() method showing flexible and reusable function design.
class Pen:
    def use(self):
        return "Writing"
class Eraser:
    def use(self):
        return "Erasing"
def perform_task(tool):
    print(tool.use())
perform_task(Pen())
perform_task(Eraser())
Output
Writing
Erasing
Polymorphism in Operators
Same operator (+) can perform different tasks depending on operand types. This is known as operator overloading. This flexibility is a key aspect of polymorphism.
Example: This code shows operator polymorphism as + operator behaves differently based on data types adding integers, concatenating strings and merging lists all using same operator.
print(5 + 10)  # Integer addition
print("Hello " + "World!")  # String concatenation
print([1, 2] + [3, 4])  # List concatenation

# Abstraction in Python

> Source: https://www.geeksforgeeks.org/python/data-abstraction-in-python/

Abstraction is the process of hiding implementation details and exposing only the essential functionality to the user. It is used to hide the implementation details from the user and expose only necessary parts, making the code simpler and easier to interact with.
Real Life Example: In a graphics software, multiple shapes are available such as Circle, Rectangle and Triangle. All shapes share common data and support the same set of actions, but the internal details are hidden:
- Common data: name, color, border thickness, fill style.
- Common actions: draw(), resize(), getArea().
- Each shape implements these actions differently Circle uses radius, Rectangle uses length and width and Triangle uses base and height.
The software only knows that a shape can be drawn and its area can be calculated. How the shape is drawn or how the area is calculated is hidden.
Abstract Base Class
Abstract Base Class (ABC) is used to achieve data abstraction by defining a common interface for its subclasses. It cannot be instantiated directly and serves as a blueprint for other classes.
Abstract classes are created using abc module and @abstractmethod decorator, allowing developers to enforce method implementation in subclasses while hiding complex internal logic.
from abc import ABC, abstractmethod
class Greet(ABC):
    @abstractmethod
    def say_hello(self):
        pass  # Abstract method
class English(Greet):
    def say_hello(self):
        return "Hello!"
g = English()
print(g.say_hello()) 
Output
Hello!
Explanation:
- Greet is an abstract class with a method say_hello() that has no implementation.
- English implements this method and returns a greeting.
- This keeps structure fixed while letting subclasses define their own behavior.
Components of Abstraction
Abstraction is made up of key components, these elements work together to define a clear and enforced structure for subclasses while hiding unnecessary implementation details. Let's discuss them one by one.
1. Abstract Method
Abstract methods are method declarations without a body defined inside an abstract class. They act as placeholders that force subclasses to provide their own specific implementation, ensuring consistent structure across derived classes.
from abc import ABC, abstractmethod
class Animal(ABC):
    @abstractmethod
    def make_sound(self):
        pass  # Abstract method, no implementation here
Explanation: make_sound() is an abstract method in Animal class, so it doesn't have any code inside it.
2. Concrete Method
Concrete methods are fully implemented methods within an abstract class. Subclasses can inherit and use them directly, promoting code reuse without needing to redefine common functionality.
from abc import ABC, abstractmethod
class Animal(ABC):
    @abstractmethod
    def make_sound(self):
        pass
    def move(self):
        return "Moving"
class Dog(Animal):
    def make_sound(self):
        return "Bark"
dog = Dog()
print(dog.move())
Output
Moving
Explanation: move() is a concrete method defined in the abstract class Animal. Since it already has an implementation, subclasses such as Dog can use it directly without overriding it.
3. Abstract Properties
Abstract properties work like abstract methods but are used for properties. These properties are declared with @property decorator and marked as abstract using @abstractmethod. Subclasses must implement these properties.
from abc import ABC, abstractmethod
class Animal(ABC):
    @property
    @abstractmethod
    def species(self):
        pass  # Abstract property, must be implemented by subclasses
class Dog(Animal):
    @property
    def species(self):
        return "Canine"
# Instantiate the concrete subclass
dog = Dog()
print(dog.species)
Output
Canine
Explanation:
- species is an abstract property in Animal class and it is marked as @abstractmethod.
- Dog class implements species property, making it a concrete subclass that can be instantiated.
- Abstract properties enforce that a subclass provides property’s implementation.
4. Abstract Class Instantiation
Abstract classes cannot be instantiated directly. This is because they contain one or more abstract methods or properties that lack implementations. Attempting to instantiate an abstract class results in a TypeError.
from abc import ABC, abstractmethod
class Animal(ABC):
    @abstractmethod
    def make_sound(self):
        pass
animal = Animal() 
Explanation:
- Animal class is abstract because it has make_sound() method as an abstract method.
- Instantiating Animal() raises a TypeError because abstract classes with unimplemented methods can't be instantiated, only fully implemented subclasses can.

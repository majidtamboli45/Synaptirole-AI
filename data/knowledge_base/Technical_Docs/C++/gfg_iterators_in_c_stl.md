# Iterators in C++ STL

> Source: https://www.geeksforgeeks.org/cpp/iterators-c-stl/

An iterator is an object that behaves like a pointer to traverse and access elements of a container.
- They allow container traversal without exposing internal structure.
- Support container-independent algorithms like sort(), count(), and find().
- Types include Input, Output, Forward, Bidirectional, and Random Access.
- They are declared as container_type::iterator it; or auto it = container.begin();.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40};
    // Using iterator to traverse the vector
    for (vector<int>::iterator it = v.begin(); it != v.end(); ++it)
        cout << *it << " "; 
    return 0;
}
Output
10 20 30 40 
Container Iterator Functions
- STL containers provide member functions that return iterators.
- These iterators usually point to the first and last elements of the container.
- Most STL containers support these functions; exceptions include containers with limited access like stack and queue.
- The functions have consistent names across containers for uniformity.
List of all methods that returns the iterator to the containers:
- begin(): Returns an iterator to the beginning of container.
- end(): Returns an iterator to the theoretical element just after the last element of the container.
- cbegin(): Returns a constant iterator to the beginning of container. A constant iterator cannot modify the value of the element it is pointing to.
- cend(): Returns a constant iterator to the theoretical element just after the last element of the container.
- rbegin(): Returns a reverse iterator to the beginning of container.
- rend(): Returns a reverse iterator to the theoretical element just after the last element of the container.
- crbegin(): Returns a constant reverse iterator to the beginning of container.
- crend(): Returns a constant reverse iterator to the theoretical element just after the last element of the container.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> vec = {10, 20, 30, 40, 50};
    // Normal iterator
    cout << "Forward iteration: ";
    for (auto it = vec.begin(); it != vec.end(); ++it)
    {
        cout << *it << " ";
    }
    cout << endl;
    // Constant iterator
    cout << "Forward (read-only) iteration: ";
    for (auto it = vec.cbegin(); it != vec.cend(); ++it)
    {
        cout << *it << " ";
    }
    cout << endl;
    // Reverse iterator
    cout << "Reverse iteration: ";
    for (auto it = vec.rbegin(); it != vec.rend(); ++it)
    {
        cout << *it << " ";
    }
    cout << endl;
    return 0;
}
Output
Forward iteration: 10 20 30 40 50 
Forward (read-only) iteration: 10 20 30 40 50 
Reverse iteration: 50 40 30 20 10 
Iterators Operations
Just like pointer arithmetic, there are some operations that are allowed on C++ iterators. They are used to provide different functionalities that increases the importance of iterators. There are 5 valid iterator operations in C++:
Dereferencing Iterators
- Dereferencing operation allows the users to access or update the value of the element pointed by the iterator.
- We use the (*) indirection operator to dereference iterators just like pointers.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40};
    // Iterator pointing to the first element
    auto it = v.begin();
    // Dereferencing iterator to access value
    cout << "First element: " << *it << endl;
    // Dereferencing iterator to update value
    *it = 100;
    // Printing updated first element
    cout << "Updated first element: " << *it << endl;
    return 0;
}
Output
First element: 10
Updated first element: 100
Incrementing/Decrementing Iterators
- We can increment or decrement the iterator by 1 using (++) or (--) operators respectively.
- Increment operation moves the iterator to the next element in the container while the decrement operation moves the iterator to the previous element.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40, 50};
    // Iterator pointing to the beginning
    auto it = v.begin();
    // Incrementing iterator to move to the next element
    ++it;
    cout << "After increment: " << *it << endl;
    // Decrementing iterator to move back to the previous element
    --it;
    cout << "After decrement: " << *it << endl;
    return 0;
}
Output
After increment: 20
After decrement: 10
Adding/Subtracting Integer to Iterators
- Adding or subtracting an integer to an iterator moves it forward or backward, but only for random access iterators like vector and deque.
- Other iterators, like those in list, set, or map, do not support arithmetic.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40, 50};
    // Iterator pointing to the beginning
    auto it = v.begin();
    // Moving iterator forward by 2 positions
    it = it + 2;
    cout << "Element after moving forward by 2: " << *it << endl;
    // Moving iterator backward by 1 position
    it = it - 1;
    cout << "Element after moving backward by 1: " << *it << endl;
    return 0;
}
Output
Element after moving forward by 2: 30
Element after moving backward by 1: 20
Subtracting Another Iterator
We can subtract one iterator from another to find the distance (or the number of elements) between the memory they are pointing to.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40, 50};
    // Defining two iterators
    auto it1 = v.begin();
    auto it2 = v.begin() + 3;
    // Finding the distance between iterators
    cout << "Distance between it1 and it2: " << it2 - it1 << endl;
    return 0;
}
Output
Distance between it1 and it2: 3
Comparing Iterators
- We can compare two iterators of the same container to see their relationship.
- Relational operators like ==, !=, <, >, <=, and >= can be used for comparison.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> v = {10, 20, 30, 40};
    // Defining two iterators
    auto it1 = v.begin();
    auto it2 = v.begin() + 2;
    // Comparing iterators
    if (it1 != it2)
    {
        cout << "Iterators point to different elements." << endl;
    }
    if (it1 < it2)
    {
        cout << "it1 comes before it2 in the vector." << endl;
    }
    return 0;
}
Output
Iterators point to different elements.
it1 comes before it2 in the vector.
Types of Iterators in C++
STL iterators can be divided on the basis of the operations that can be performed on them.
1. Input Iterator
- Input Iterator can read elements from a container sequentially (one pass).
- Supported in containers like istream_iterator, single-pass algorithms; supports *, ++, ==, !=.
2. Output Iterator
- Output Iterator can write elements to a container sequentially (one pass).
- Supported in containers like ostream_iterator, single-pass algorithms; supports *, ++.
3. Forward Iterator
- Can read and write, allows multiple passes through the container.
- Supported in containers like forward_list, unordered_set, unordered_map; supports *, ++, ==, !=.
4. Bidirectional Iterator
- Can move forward and backward in a container.
- Supported in list, set, map, multiset, multimap; supports *, ++, --, ==, !=.
5. Random Access Iterator
- Can move freely to any position using arithmetic operations.
- Supported in vector, deque, array; supports *, ++, --, +, -, [], <, >, <=, >=.
Iterator Adaptors
Iterator adaptors in C++ are the special type of iterators that are built over traditional iterators to provide specialized functionality. There are many iterator adaptors in C++ some of which are given below:
| Iterator Adaptors Type | Description | 
|---|---|
| Reverse Iterator | The reverse iterator is built over bidirectional or above type of operator and allows users to traverse the container in the reverse direction. | 
| Stream Iterators | The stream iterators namely, istream and ostream iterators are built on the input and output iterators respectively. These iterators allow the users to use the streams as containers. | 
| Move Iterators | Move iterators are used to introduce the move semantics in STL algorithms. The move iterators move the ownership of the copied container data to the copying container without creating the extra copies. | 
| Inserter Iterator | The insertor iterators allows you to insert the given elements at some position in the container. There are three insertor iterators in C++:  These iterators can be created using back_inserter(), front_inserter(), inserter() functions in C++. | 
Iterator Utility Functions in C++
C++ STL provide the various function to simplify the working with iterators. They are listed in the below table:
| Function | Description | Syntax | 
|---|---|---|
| std::advance | Advances an iterator by a specific number of positions. | advance(it, n) | 
| std::next | Returns the iterator that is a specified number of positions ahead of the given iterator. | next(it, n) | 
| std::prev | Returns the iterator that is a specified number of positions behind the given iterator. | prev(it, n) | 
| std::distance | Returns the number of elements between two iterators. | distance(it1, it2) | 
| std::begin | Returns an iterator to the first element of the given container. | begin(container) | 
| std::end | Returns an iterator to the element following the last element of the given container. | end(container) | 
| std::rbegin | Returns a reverse iterator to the last element of the given container. | rbegin(container) | 
| std::rend | Returns a reverse iterator to the element preceding the first element of the given container. | rend(container) | 
| std::inserter | Creates an insert iterator that inserts elements into a container at a specified position. | inserter(container, position) | 
| std::back_inserter | Creates a back insert iterator that appends elements to the end of a container. | back_inserter(container) | 
| std::front_inserter | Creates a front insert iterator that inserts elements at the front of a container. | front_inserter(container) | 
Applications of Iterators with Examples
Iterators are extensively used in C++ for many different purposes while working with STL containers and algorithms. Following are some primary applications of iterators in C++ which their code examples:
Traversing Containers
Traversing STL containers is the most basic application of iterators. In this, we use the begin() and end() functions to get the begin and end iterators to traverse the whole container. Basically, we keep incrementing the begin iterator till it is not equal to the end.
#include <iostream>
#include <set>
using namespace std;
int main()
{
    set<int> s = {10, 20, 30, 40, 50};
    // Iterator to the beginning of the set
    auto it = s.begin();
    // Iterating through the set
    while (it != s.end())
    {
        // Accessing value via iterator
        cout << *it << " ";
        // Moving to the next element
        ++it;
    }
    return 0;
}
Output
10 20 30 40 50 
Explanation: As shown in the code above, we traverse the set container. Similarly, we can use the same approach to traverse any container.
Reversing a Container
Reverse iterators allow you to traverse a container from the end to the beginning without needing to manually handling the reversal.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> vec = {10, 20, 30, 40, 50};
    // Defining a reverse iterator pointing to the last element
    auto it = vec.rbegin();
    // Iterating the vector in reverse
    while (it != vec.rend())
    {
        cout << *it << " ";
        ++it;
    }
    return 0;
}
Output
50 40 30 20 10 
Container-Independent Algorithms
Iterators allow algorithms to work with any container type, making functions like std::sort(), std::find(), and std::for_each() more flexible. You can pass iterators instead of the actual container.
#include <algorithm>
#include <iostream>
#include <set>
#include <vector>
using namespace std;
int main()
{
    vector<int> vec = {30, 10, 40, 10, 50};
    multiset<int> ms = {10, 30, 10, 20, 40, 10};
    // Count the number of occurrences of 10 in vector and multiset
    cout << "10s in Vector: " << count(vec.begin(), vec.end(), 10) << endl;
    cout << "10s in Multiset: " << count(ms.begin(), ms.end(), 10);
    return 0;
}
Output
10s in Vector: 2
10s in Multiset: 3
Additional Applications of Iterators
- Distance Calculation: std::distance() computes the number of elements between two iterators.
- Stream Iteration: Stream iterators let you treat input/output streams like containers for easier reading and writing.
- Move Semantics: Move iterators improve efficiency by transferring data without unnecessary copying.
- Custom Iterators: Can be implemented for non-STL structures (e.g., trees, graphs) to support STL-like operations.
Note: Most iterator operations like ++, --, *, and comparison take O(1) time, while operations like distance() and advance() take O(n) for non-random iterators and O(1) for random access iterators.

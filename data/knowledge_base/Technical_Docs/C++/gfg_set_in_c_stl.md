# Set in C++ STL

> Source: https://www.geeksforgeeks.org/cpp/set-in-cpp-stl/

A std::set is an associative container that stores unique elements in sorted order. It typically uses a self-balancing binary search tree, such as a Red-Black Tree.
- Provides O(log n) time complexity for search, insertion, and deletion.
- Maintains sorted elements and supports operations like upper_bound() and lower_bound().
#include <iostream>
#include <set>
using namespace std;
int main() {
    // Creating an empty set
    set<int> s1;
    // Initialize set with list 
    set<int> s2 = {1, 2, 3, 2, 1}; 
    // Traversing the set
    for (auto& x : s2)
        cout << x << " ";
    cout << endl;
    return 0;
}
Output
1 2 3 
Explanation: The code creates an empty set and initializes another set with duplicate values. Since a set stores only unique elements, the duplicates are automatically ignored. The elements are then printed in ascending order.
Syntax
The set container is defined as std::set class template inside <set> header file.
set<T> s;
where,
- T: Data type of elements in the set.
- s: Name assigned to the set.
Basic Operations on Set
The commonly used operations on a set are discussed below.
1. Inserting Elements
The insert() function adds an element to the set if it is not already present. Time complexity: O(log n).
- Duplicate elements are ignored.
- Elements are automatically placed according to the set's ordering rule.
#include <iostream>
#include <set>
using namespace std;
int main() {
    // Initialize set with values
    set<int> s = {2, 3};
    // Inserting an element
    s.insert(1);
    // Traversing the set
    for (auto x : s)
        cout << x << endl;
    return 0;
}
Output
1
2
3
Explanation: The code creates a set containing 2 and 3, then inserts 1 using insert(). The set automatically maintains the elements in ascending order.
2. Searching Elements
The find() and count() functions can be used to check whether an element exists in a set. Both operations take O(log n) time.
- find() returns an iterator to the element if found; otherwise, it returns end().
- count() returns 1 if the element exists and 0 otherwise.
#include <iostream>
#include <set>
using namespace std;
int main()
{
    set<int> s = {1, 2, 3};
    // Search for an element using find()
    auto it = s.find(1);
    if (it != s.end())
        cout << "Element found: " << *it << endl;
    // Check whether an element exists using count()
    if (s.count(2))
        cout << "2 exists in the set" << endl;
    return 0;
}
Output
Element found: 1
2 exists in the set
Explanation: The code uses find() to search for 1 and count() to check whether 2 exists. Since both elements are present, the corresponding messages are printed.
3. Traversing Elements
A set can be traversed using a range-based for loop or iterators. The elements are visited according to the set's ordering rule. Traversing all elements takes O(n) time.
- By default, elements are traversed in ascending order.
- A custom comparator can be used to change the traversal order.
#include <iostream>
#include <set>
using namespace std;
int main() {
    set<int> s = {1, 2, 3};
    // Traversing using iterators
    for (auto it = s.begin(); it != s.end(); ++it)
        cout << *it << endl;  
    return 0;
}
Output
1
2
3
Explanation: The code uses an iterator to traverse the set from begin() to end(). Each element is accessed using the dereference operator * and printed in ascending order.
4. Deleting Elements
The erase() function removes elements from a set. Erasing an element by value takes O(log n) time.
- erase(value) removes the specified element if it exists.
- erase(iterator) removes the element pointed to by the iterator.
#include <iostream>
#include <set>
using namespace std;
int main()
{
    set<int> s = {1, 2, 3, 4};
    // Delete an element by value
    s.erase(2);
    // Delete the first element using an iterator
    s.erase(s.begin());
    // Traverse the remaining elements
    for (auto x : s)
        cout << x << " ";
    return 0;
}
Output
3 4 
Explanation: The code first removes the element 2 using erase(2). It then removes the first element, 1, using the iterator returned by begin(). The remaining elements 3 and 4 are printed.
Set vs Unordered Set
| Feature | set | unordered_set | 
|---|---|---|
| Ordering | Sorted order | No guaranteed order | 
| Underlying structure | Self-balancing BST, typically Red-Black Tree | Hash table | 
| Search | O(log n) | O(1) average | 
| Insertion | O(log n) | O(1) average | 
| Deletion | O(log n) | O(1) average | 
| Range operations | Supports lower_bound() andupper_bound() | Does not support these ordered operations | 
Note: The standard specifies the behavior and complexity requirements of std::set, but does not mandate a particular underlying data structure. A Red-Black Tree is the typical implementation.

# Containers in C++ STL

> Source: https://www.geeksforgeeks.org/cpp/containers-cpp-stl/

Containers are class templates in the Standard Template Library (STL) that store and manage collections of elements efficiently.
- Provide ready-to-use implementations of common data structures.
- Support efficient storage, retrieval, insertion, and deletion of elements.
- Work with different data types through templates.
Common Operations on STL Containers
Most STL containers support a common set of operations for managing and accessing elements.
| Operation | Description | 
|---|---|
| insert() | Adds an element to the container | 
| erase() | Removes an element from the container | 
| size() | Returns the number of elements in the container | 
| empty() | Checks whether the container is empty | 
| clear() | Removes all elements from the container | 
| begin() | Returns an iterator to the first element | 
| end() | Returns an iterator to the position after the last element | 
Types of Containers in C++ STL
STL containers are broadly classified into four categories based on how they store and organize elements.
1. Sequence Containers
Sequence containers implement linear data structures in which the elements can be accessed sequentially. Following are the sequence containers in C++ STL:
| Container Name | Description | 
|---|---|
| Array | Container that wraps over fixed size static array. | 
| Vector | Automatically resizable dynamic array. | 
| Deque | Dynamic array of fixed-size arrays that allows fast insertions and deletions at both ends. | 
| List | Implementation of Doubly Linked List data structure. | 
| Forward List | Implementation of Singly Linked List data structure. | 
2. Associative Containers
Associative containers store data in some sorted order. It provides fast search, insert and delete in O(log n) time by using balanced trees like Red Black Trees.
| Container Name | Description | 
|---|---|
| Set | Collection of unique elements sorted on the basis of their values. | 
| Map | Collection of key-value pairs sorted on the basis of the keys where no two pairs have same keys. | 
| Multiset | Collection of elements sorted on the basis of their values but allows multiple copies of values. | 
| Multimap | Collection of key-value pairs sorted on the basis of the keys where multiple pairs can have same keys. | 
3. Unordered Associative Containers
Unordered associative containers implement unsorted hashed data structures that can be quickly searched (O(1) amortized, O(n) worst-case complexity).
| Container Name | Description | 
|---|---|
| Unordered Set | Collection of unique elements hashed by their values. | 
| Unordered Map | Collection of key-value pairs that are hashed by their keys where no two pairs have same keys. | 
| Unordered Multiset | Collection of elements hashed by their values and allows multiple copies of values. | 
| Unordered Multimap | Collection of key-value pairs that are hashed by their keys where multiple pairs can have same keys. | 
4. Container Adapters
Container adapters provide a different interface for other containers. They adapt the behavior of underlying containers to fit specific use cases.
| Container Name | Description | 
|---|---|
| Stack | Adapts a container to provide stack (LIFO) data structure. | 
| Queue | Adapts a container to provide queue (FIFO) data structure. | 
| Priority Queue | Adapts a container to provide heap data structure. | 
Advantages of STL Containers
STL containers offer several advantages by providing optimized implementations of commonly used data structures.
- Simplify programming through reusable and well-tested implementations.
- Support efficient insertion, deletion, searching, and traversal operations.
- Work with any data type using templates.
Limitations of STL Containers
Despite their advantages, STL containers also have some limitations.
- Choosing the wrong container may lead to inefficient performance.
- Some containers require additional memory for internal management.
- Performance varies depending on the underlying implementation and operation.

# C++ DSA

> Source: https://www.geeksforgeeks.org/cpp/learn-dsa-in-cpp/

This beginner-friendly guide covers DSA in C++, including built-in structures like arrays, strings, vectors, sets, and maps, as well as user-defined structures such as linked lists, stacks, queues, trees, heaps, and graphs, along with an introduction to analyzing algorithm efficiency using time and space complexity.
It is recommended to familiarize yourself with the Analysis of Algorithms before starting this tutorial .
1. Array
In C++, there are mainly two types of arrays.
- Array: Fixed-size and ideal when the number of elements is known.
- Vector: Dynamic in nature and can grow or shrink as needed. It is part of the C++ Standard Template Library (STL), suitable when the number of elements varies.
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    // Array example
    int arr[] = {10, 20, 30, 40, 50};
    
    int n = sizeof(arr) / sizeof(arr[0]);
    cout << "Array elements: ";
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;
    // Vector Example
    vector<int> list;
    
    list.push_back(10);
    list.push_back(20);
    list.push_back(30);
    cout << "Vector elements: ";
    for (int i = 0; i < list.size(); i++)
        cout << list[i] << " ";
    return 0;
}
Output
Array elements: 10 20 30 40 50 
Vector elements: 10 20 30 
Related Posts:
Recommended DSA Problems:
2. Searching Algorithms
Searching algorithms help locate an element in data structures like arrays or vectors. C++ provides both linear search and binary search (using functions like std::find and std::binary_search from the <algorithm> library).
#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;
int main() {
    vector<int> vec = {2, 4, 6, 6, 8, 10};
    int key = 6;
    // Linear search (works on unsorted too)
    bool found = (find(vec.begin(), vec.end(), key) != vec.end());
    cout << "Found (linear): " << found << "\n";
    // Binary search (requires sorted)
    bool binaryFound = binary_search(vec.begin(), vec.end(), key);
    cout << "Found (binary): " << binaryFound << "\n";
    // lower_bound: first position not less than key (i.e. first ≥ key)
    int firstIndex = lower_bound(vec.begin(), vec.end(), key) - vec.begin();
    cout << "First ≥ key at index: " << firstIndex << "\n";
    // upper_bound: first position greater than key
    int afterIndex = upper_bound(vec.begin(), vec.end(), key) - vec.begin();
    cout << "First > key at index: " << afterIndex << "\n";
    return 0;
}
Output
Found (linear): 1
Found (binary): 1
First ≥ key at index: 2
First > key at index: 4
Related Posts:
Recommended DSA Problems:
3. Sorting Algorithms
Sorting arranges elements in ascending or descending order. C++ provides built-in sorting using std::sort() from the <algorithm> library, but you can also implement algorithms like Bubble Sort, QuickSort, and MergeSort.
#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;
int main()
{
    // Array example
    int nums[] = {5, 3, 8, 1};
    int n = sizeof(nums) / sizeof(nums[0]);
    sort(nums, nums + n);
    cout << "Sorted array: ";
    for (int i = 0; i < n; i++)
        cout << nums[i] << " ";
    cout << endl;
    // Vector example
    vector<int> list = {5, 3, 8, 1};
    sort(list.begin(), list.end());
    cout << "Sorted vector: ";
    for (int num : list)
        cout << num << " ";
    return 0;
}
Output
Sorted array: 1 3 5 8 
Sorted vector: 1 3 5 8 
Related Posts:
Recommended DSA Problems:
4. String
In C++, there are mainly two commonly used ways to handle text:
- String: A mutable sequence of characters used to store and manipulate text.
- Stringstream: A mutable sequence of characters used for efficient text construction and modification.
#include <iostream>
#include <sstream> // for stringstream
using namespace std;
int main()
{
    // Mutable string
    string s = "Hello Geeks";
    cout << s << endl;
    // Using stringstream for efficient string modification
    stringstream ss;
    ss << "Hello";
    ss << " Geeks";
    cout << ss.str() << endl;
    return 0;
}
Output
Hello Geeks
Hello Geeks
Related Posts:
Recommended DSA Problems:
5. Set
A Set in C++ is a collection that does not allow duplicate elements. Implementations include unordered_set, set, and multiset.
- Unordered_set: Implements hashing where elements are stored without any specific order. Provides fast search, insert, and delete operations.
- Set: Implements a self-balancing binary search tree (usually Red-Black Tree). Maintains elements in sorted order and allows moderate time for insertion, search, and deletion.
- Multiset: Similar to set but allows duplicate elements.
#include <iostream>
#include <set>
#include <unordered_set>
using namespace std;
int main()
{
    // set (sorted, unique elements)
    set<int> s{10, 20, 20, 30};
    cout << "set: ";
    for (auto &x : s)
        cout << x << " ";
    cout << endl;
    // unordered_set (no order, unique elements)
    unordered_set<int> us{10, 20, 20, 30};
    cout << "unordered_set: ";
    for (auto &x : us)
        cout << x << " ";
    cout << endl;
    // multiset (sorted, allows duplicates)
    multiset<int> ms{10, 20, 20, 30};
    cout << "multiset: ";
    for (auto &x : ms)
        cout << x << " ";
    cout << endl;
    return 0;
}
Output
set: 10 20 30 
unordered_set: 30 20 10 
multiset: 10 20 20 30 
Related Posts:
Recommended DSA Problems:
6. Map
A Map in C++ is a collection of key-value pairs that associates unique keys with values. Implementations include unordered_map, map, and multimap.
- Map: Implements a self-balancing binary search tree (usually Red-Black Tree). Maintains elements in sorted order by key.
- Unordered Map: Implements hashing where elements are stored without any specific order. Provides fast average-case search, insertion, and deletion operations .
- Multimap: Similar to map, but allows duplicate keys and maintains elements in sorted order by key.
#include <iostream>
#include <map>
#include <unordered_map>
using namespace std;
int main()
{
    // map (sorted by keys)
    map<int, string> m{{1, "apple"}, {3, "banana"}, {2, "cherry"}};
    cout << "map: ";
    for (auto &p : m)
        cout << p.first << "->" << p.second << " ";
    cout << endl;
    // unordered_map (no specific order)
    unordered_map<int, string> um{{1, "red"}, {2, "green"}, {3, "blue"}};
    cout << "unordered_map: ";
    for (auto &p : um)
        cout << p.first << "->" << p.second << " ";
    cout << endl;
    // multimap (allows duplicate keys)
    multimap<int, string> mm{{1, "cat"}, {1, "dog"}, {2, "bird"}};
    cout << "multimap: ";
    for (auto &p : mm)
        cout << p.first << "->" << p.second << " ";
    cout << endl;
    return 0;
}
Output
map: 1->apple 2->cherry 3->banana 
unordered_map: 3->blue 2->green 1->red 
multimap: 1->cat 1->dog 2->bird 
Related Posts:
Recommended DSA Problems:
7. Recursion
Recursion is a technique where a method calls itself to solve smaller subproblems.
#include <iostream>
using namespace std;
int fact(int n)
{
    if (n == 0)
        return 1;
    return n * fact(n - 1);
}
int main()
{
    cout << fact(5); 
    return 0;
}
Output
120
Related Posts:
Recommended DSA Problems:
8. Queue
A queue follows the FIFO (First In First Out) principle. C++ provides the queue container in the <queue> header, and you can also use priority queues using priority_queue.
#include <iostream>
#include <queue>
using namespace std;
int main()
{
    queue<int> q;
    // Add elements to the queue
    q.push(10);
    q.push(20);
    q.push(30);
    // Remove elements from the queue (FIFO)
    while (!q.empty())
    {
        cout << q.front() << " ";
        q.pop();
    }
    return 0;
}
Output
10 20 30 
Related Posts:
Recommended DSA Problems:
9. Stack
A stack follows the LIFO (Last In First Out) principle. In C++, you can use the stack container provided in the <stack> header. It is a simple and efficient implementation for typical stack operations. For more flexibility, you can also use vector or deque as underlying containers, since stack by default uses deque.
#include <iostream>
#include <stack>
using namespace std;
int main()
{
    stack<string> st;
    // Push elements onto the stack
    st.push("g");
    st.push("f");
    st.push("h");
    // Print the initial stack by popping elements
    cout << "Stack Content (top to bottom): ";
    while (!st.empty())
    {
        cout << st.top() << " ";
        st.pop();
    }
    return 0;
}
Output
Stack Content (top to bottom): h f g 
Related Posts:
Recommended DSA Problems:
10. Linked List
A Linked List is a linear data structure where each element (node) contains data and a reference to the next node.
#include <iostream>
using namespace std;
class Node
{
  public:
    int data;
    Node *next;
    Node(int d)
    {
        data = d;
        next = nullptr;
    }
};
int main()
{
    // Create nodes
    Node *head = new Node(10);
    head->next = new Node(20);
    head->next->next = new Node(30);
    // Traverse and print the linked list
    Node *temp = head;
    while (temp != nullptr)
    {
        cout << temp->data << " ";
        temp = temp->next;
    }
    return 0;
}
Output
10 20 30 
Related Posts:
Recommended DSA Problems:
11. Tree
A Tree is a hierarchical data structure with nodes connected by edges. The top node is the root.
#include <iostream>
using namespace std;
class Node
{
  public:
    int data;
    Node *left;
    Node *right;
    Node(int val)
    {
        data = val;
        left = nullptr;
        right = nullptr;
    }
};
// Inorder traversal
void inorder(Node *root)
{
    if (root == nullptr)
        return;
    inorder(root->left);
    cout << root->data << " ";
    inorder(root->right);
}
int main()
{
    // Create tree nodes
    Node *root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->left = new Node(4);
    // Print inorder traversal
    inorder(root);
    return 0;
}
Output
4 2 1 3 
Related Posts:
Recommended DSA Problems:
12. Heap
A Heap is a special tree-based structure that satisfies the heap property (Min-Heap or Max-Heap). In C++, we can use priority_queue.
#include <iostream>
#include <queue>
#include <vector>
using namespace std;
int main()
{
    priority_queue<int, vector<int>, greater<int>> pq; // Min-Heap
    pq.push(10);
    pq.push(30);
    pq.push(20);
    cout << "Min-Heap elements: ";
    while (!pq.empty())
    {
        cout << pq.top() << " "; 
        pq.pop();
    }
    return 0;
}
Output
Min-Heap elements: 10 20 30 
Related Posts:
Recommended DSA Problems:
13. Graphs
A Graph consists of nodes (vertices) connected by edges. In C++, it can be represented using an adjacency list with vector or list.
#include <iostream>
#include <vector>
using namespace std;
// Function to add an edge between two vertices
void addEdge(vector<vector<int>> &adj, int i, int j)
{
    adj[i].push_back(j);
    adj[j].push_back(i);
}
// Function to display the adjacency list
void displayAdjList(const vector<vector<int>> &adj)
{
    for (int i = 0; i < adj.size(); i++)
    {
        cout << i << ": ";
        for (int j : adj[i])
        {
            cout << j << " ";
        }
        cout << endl;
    }
}
int main()
{
    int V = 4;
    // Create an adjacency list with V empty lists
    vector<vector<int>> adj(V);
    // Add edges
    addEdge(adj, 0, 1);
    addEdge(adj, 0, 2);
    addEdge(adj, 1, 2);
    addEdge(adj, 2, 3);
    cout << "Adjacency List Representation:" << endl;
    displayAdjList(adj);
    return 0;
}
Output
Adjacency List Representation:
0: 1 2 
1: 0 2 
2: 0 1 3 
3: 2 
Related Posts:
Recommended DSA Problems:
14. Dynamic Programming (DP)
DP is used when problems have overlapping subproblems and optimal substructure. Example: Fibonacci series using DP.
#include <iostream>
#include <vector>
using namespace std;
int fib(int n, vector<int> &dp)
{
    if (n <= 1)
        return n;
    if (dp[n] != -1)
        return dp[n];
    return dp[n] = fib(n - 1, dp) + fib(n - 2, dp);
}
int main()
{
    int n = 10;
    vector<int> dp(n + 1, -1);
    cout << "Fibonacci(" << n << "): " << fib(n, dp) << endl;
    return 0;
}

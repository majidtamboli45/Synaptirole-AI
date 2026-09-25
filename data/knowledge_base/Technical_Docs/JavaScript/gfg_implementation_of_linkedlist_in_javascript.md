# Implementation of LinkedList in Javascript

> Source: https://www.geeksforgeeks.org/javascript/implementation-linkedlist-javascript/

A linked list is a linear data structure where elements are stored in nodes. Each node contains:
- A value (the data it holds).
- A reference (or pointer) to the next node in the sequence.
This structure forms a chain of nodes, starting from a head (the first node) and ending at a node whose next reference is null. Linked lists are dynamic, meaning they can grow or shrink as needed, unlike arrays with fixed sizes.
Syntax :
class Node{
constructor(value)
{
this.value=value;
this.next=null;
}
}
Implementation of a linked list
1. Creating a Linked List
To create a simple linked list in JavaScript, the provided code defines a LinkedList class and a Node class to represent individual elements.
class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}
class LinkedList {
    constructor() {
        this.head = null;
    }
    append(value) {
        let newnode = new Node(value);
        if (!this.head) {
            this.head = newnode;
            return;
        }
        let current = this.head;
        while (current.next) {
            current = current.next;
        }
        current.next = newnode;
    }
    printList() {
        let current = this.head;
        let result = "";
        while (current) {
            result += current.value + '->';
            current = current.next;
        }
        console.log(result + 'null');
    }
}
let list = new LinkedList();
list.append(10);
list.append(20);
list.append(30);
list.printList();
- Node class: Each node holds a value and a reference (next) to the next node.
- LinkedList class: Manages the list, starting with an empty list (head is null).
- append method: Adds a new node with the given value at the end of the list.
- printList method: Prints all node values in the format value->value->...->null.
- Usage: A linked list is created, and values 10, 20, and 30 are appended to it, then printed.
2. Operations on Linked List
This code demonstrates the basic functionality of a singly linked list in JavaScript, with methods for appending, prepending, inserting at specific position, printing, and deleting nodes.
class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}
class LinkedList {
    constructor() {
        this.head = null;
    }
    append(value) {
        let newNode = new Node(value);
        if (!this.head) {
            this.head = newNode;
            return;
        }
        let current = this.head;
        while (current.next) {
            current = current.next;
        }
        current.next = newNode;
    }
    prepend(value) {
        let newNode = new Node(value);
        newNode.next = this.head;
        this.head = newNode;
    }
    insertAt(value, position) {
        let newNode = new Node(value);
        if (position === 0 || !this.head) {
            newNode.next = this.head;
            this.head = newNode;
            return;
        }
        let current = this.head;
        let previous = null;
        let index = 0;
        while (current && index < position) {
            previous = current;
            current = current.next;
            index++;
        }
        previous.next = newNode;
        newNode.next = current;
    }
    deleteNode(value) {
        if (!this.head) return;
        // If head node contains the value
        if (this.head.value === value) {
            this.head = this.head.next;
            return;
        }
        let current = this.head;
        while (current.next && current.next.value !== value) {
            current = current.next;
        }
        if (current.next) {
            current.next = current.next.next;
        }
    }
    printList() {
        let current = this.head;
        let result = "";
        while (current) {
            result += current.value + "->";
            current = current.next;
        }
        console.log(result + "null");
    }
}
let list = new LinkedList();
list.append(10);
list.append(20);
list.append(30);
list.prepend(5);
list.insertAt(15, 2);
list.deleteNode(20);
list.printList();
- Nodes store data and links: Each "Node" holds a value and a "next" pointer, connecting it to the next Node.
- LinkedList manages the first Node: The "LinkedList" class uses a "head" to keep track of the start of the list.
- Append adds to the end: "append" puts new Nodes at the end of the existing chain.
- Prepend adds to the beginning: "prepend" creates a new Node and makes it the new head of the list.
- InsertAt adds Nodes at a specific position: "insertAt" places a new Node at the specified index by adjusting the links between existing Nodes.
- Delete removes specific Nodes: "delete" finds a Node by its value and removes it by adjusting the links.
- Print shows the list's content: "printList" displays the values of all Nodes in the list, in order.
Use cases of Linked list
- Web Browser History: Linked lists are used to store the history of pages visited, allowing users to navigate forward and backward through the list of visited pages.
- Music Playlist: In music or video streaming apps, linked lists help manage playlists, enabling efficient addition or removal of songs from any position in the list.
- Memory Management: Operating systems use linked lists for memory management, where blocks of memory are dynamically allocated or freed in a non-contiguous manner.
- Real-time Event Scheduling: Linked lists are often used in event-driven systems, such as handling tasks in real-time operating systems (RTOS), where tasks need to be added, removed, or rearranged efficiently.
- Social Media Feeds: Linked lists are used to implement social media timelines, where posts (or comments) can be added or removed dynamically, maintaining the order of posts efficiently.
Advantages of a Linked List
- Dynamic Size: Linked lists can grow or shrink as needed during program execution, unlike arrays with fixed sizes.
- Efficient Insertions/Deletions: Adding or removing elements in the middle of a linked list is generally faster than in an array (especially if you already have a reference to the node before the insertion/deletion point), as you only need to change pointers.
- No Memory Waste (Potentially): Linked lists only use as much memory as they need, as nodes are allocated individually. Arrays, on the other hand, might have unused space if they're allocated with a larger size than required.
- Flexible Data Structure: Linked lists are used to implement various other data structures, like stacks, queues, and graphs.
- Memory Allocation Flexibility: Nodes can be stored in non-contiguous memory locations, reducing the need for large, contiguous blocks of memory.

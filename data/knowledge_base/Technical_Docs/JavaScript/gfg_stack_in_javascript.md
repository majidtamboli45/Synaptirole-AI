# Stack in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/implementation-stack-javascript/

A stack is a linear data structure that allows operations to be performed at one end, called the top. The two primary operations are:
- Push: Adds an element to the top of the stack.
- Pop: Removes and returns the top element from the stack.
let stack = [];
// 2. The "Push" Operation // Adding elements to the top of the stack
stack.push('A'); // Stack is now: ['A']
stack.push('B'); // Stack is now: ['A', 'B']
console.log("Pushing 'C' onto the stack...");
stack.push('C'); // Stack is now: ['A', 'B', 'C']
console.log("Current Stack:", stack); 
console.log("Top of the stack is:", stack[stack.length - 1]); // Outputs 'C'
console.log("-----------------------------------");
// 3. The "Pop" Operation // Removing the top element from the stack
console.log("Popping the top element...");
let poppedElement = stack.pop(); // Removes 'C' and stores it
console.log("Popped element:", poppedElement); // Outputs 'C'
console.log("Stack after pop:", stack);        // Stack is now back to: ['A', 'B']
console.log("New Top of the stack is:", stack[stack.length - 1]); // Outputs 'B'
- It fundamental data structure in computer science that follows the Last In, First Out (LIFO) principle.
- This means that the last element added to the stack will be the first one to be removed.
- Stacks are widely used in various applications, such as function call management, undo mechanisms, and parsing expressions.
Extreme Conditions in a Stack
1. Stack Underflow:
- Occurs when you try to perform a pop or peek operation on an empty stack.
- Handling: Check if the stack is empty before performing these operations.
2. Stack Overflow:
- Occurs when you try to push an element into a stack that has reached its maximum capacity (in languages or implementations where the stack size is fixed).
- Handling: Check if the stack is full before performing a push operation.
Ways to Implement Stack in JavaScript
In JavaScript, stacks can be implemented using arrays or linked lists. Both approaches provide efficient insertion and removal of elements from the top of the stack.
1. Array Implementation of a Stack In JavaScript
- In a stack implementation, we need to do push and pop operations at the same end.
- In an array, we can do both operations at the end of the array (or last element) in O(1) time.
class Stack {
    constructor() { this.items = []; }
    push(element) { this.items.push(element); }
    pop() {
        if (this.isEmpty()) {
            return null;
        }
        return this.items.pop();
    }
    peek() {
        if (this.isEmpty()) {
            return null;
        }
        return this.items[this.items.length - 1];
    }
    isEmpty() { return this.items.length === 0; }
    size() { return this.items.length; }
    print() { console.log(this.items); }
}
// Example Usage
const stack = new Stack();
stack.push(10);
stack.push(20);
stack.push(30);
console.log(stack.peek()); 
console.log(stack.pop());    
console.log(stack.size());   
console.log(stack.isEmpty());
stack.print();                
Time Complexity:   All operations in the Stack Class ( Push , Pop, Peek,  isEmpty,   Size,)  have O(1) time complexity.  print Stack(), which is O(n).
Auxiliary Space:  O(1) for all operations, except print(), which is O(n)
2. Linked List Implementation of Stack in JavaScript
- In a stack implementation, we need to do push and pop operations at the same end.
- In a linked list, we can do both operations at the beginning of the list (or first element) in O(1) time.
// Node class representing each element in the stack
class Node {
    constructor(value)
    {
        this.value = value;
        this.next = null;
    }
}
// Stack class using a Linked List
class Stack {
    constructor()
    {
        this.top = null;
        this.size = 0;
    }
    // Push operation
    push(value)
    {
        const newNode = new Node(value);
        newNode.next = this.top;
        this.top = newNode;
        this.size++;
    }
    // Pop operation
    pop()
    {
        if (this.isEmpty()) {
            console.log("Stack is empty!");
            return null;
        }
        const poppedValue = this.top.value;
        this.top = this.top.next;
        this.size--;
        return poppedValue;
    }
    // Peek operation
    peek()
    {
        return this.isEmpty() ? null : this.top.value;
    }
    // Check if the stack is empty
    isEmpty() { return this.size === 0; }
    // Returns the size of the stack
    getSize() { return this.size; }
    // Print stack elements
    printStack()
    {
        let current = this.top;
        let stackValues = [];
        while (current) {
            stackValues.push(current.value);
            current = current.next;
        }
        console.log("Stack:", stackValues.join(" -> "));
    }
}
// Example Usage
const stack = new Stack();
stack.push(10);
stack.push(20);
stack.push(30);
stack.printStack();
console.log("Top Element:", stack.peek());
console.log("Popped Element:", stack.pop());
stack.printStack();
Time Complexity:   All operations in the Stack Class ( Push , Pop, Peek,  isEmpty,   Size,)  have O(1) time complexity. 
Auxiliary Space : O(1) for all operations except print(), which is O(n).
Also Check
Easy Problems
Medium Problems
Hard Problems

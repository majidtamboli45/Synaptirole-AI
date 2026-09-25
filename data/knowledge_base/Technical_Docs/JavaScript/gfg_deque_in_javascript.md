# Deque in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/deque-in-javascript/

A Deque (Double-Ended Queue) in JavaScript is a flexible data structure that functions like a horizontal container with both ends open, allowing data insertion and removal from both the front and the rear.
- A deque supports insertion and deletion at both ends. Efficient O(1) operations at both ends typically require specialized implementations such as linked lists or circular arrays.
- Useful for solving problems like sliding windows, task scheduling, and undo/redo functionality.
const deque = []; 
deque.unshift(10); 
deque.push(20);    
deque.unshift(5);  
deque.push(30); 
console.log("Deque after insertions:", deque);
deque.shift(); 
deque.pop();   
console.log("Deque after deletions:", deque); 
- An empty array deque is used to represent the deque.
- unshift() inserts at the front, and push() adds to the rear.
- shift() removes the front element, while pop() removes the rear.
- The console logs show the deque's state before and after deletions, demonstrating its functionality.
Working of Deque
- Elements can be added to both the front and rear of the deque.
- Elements can be removed from both the front and rear.
- Unlike regular queues, Deque allow quick access and modification at both ends.
- Deque can be implemented using JavaScript arrays with push(), pop(), unshift(), and shift().
- Deque are used in sliding window problems, scheduling, and caching mechanisms.
Components of a Deque
- Front: The starting position of the deque where elements can be added or removed.
- Rear (Back): The end position of the deque where elements can be inserted or deleted.
- Size: The total number of elements present in the deque at any given time.
- Capacity: The maximum number of elements a deque can hold (in case of a fixed-size deque).
- Insertion Operations: Allows adding elements at the front (unshift()) or rear (push()).
- Deletion Operations: Supports removal of elements from the front (shift()) or rear (pop()).
- Peek Operations: Lets you check the front or rear element without removing it.
- Empty Check: Determines if the deque is empty before performing operations.
- Full Check: In fixed-size Deque, ensures the deque is not full before adding element.
Implementation of Deque
In JavaScript there is no inbuilt class or method to implement deque it can be done using an array or a linked list .
1. Deque Implementation using array
This Deque (Double-Ended Queue) implementation in JavaScript uses an array to allow insertion and removal from both the front and the rear.
// Deque implementation using an array
class Deque {
    constructor() {
        this.items = [];
    }
    addFront(element) {
        this.items.unshift(element);
    }
    addRear(element) {
        this.items.push(element);
    }
    removeFront() {
        if (this.isEmpty()) {
            return "Deque is empty";
        }
        return this.items.shift();
    }
    removeRear() {
        if (this.isEmpty()) {
            return "Deque is empty";
        }
        return this.items.pop();
    }
    isEmpty() {
        return this.items.length === 0;
    }
    peekFront() {
        return this.isEmpty() ? "Deque is empty" : this.items[0];
    }
    peekRear() {
        return this.isEmpty() ? "Deque is empty" : this.items[this.items.length - 1];
    }
    size() {
        return this.items.length;
    }
    
    display() {
        console.log(this.items);
    }
}
const deque = new Deque();
deque.addFront(10);
deque.addRear(20);
deque.addFront(5);
deque.addRear(30);
console.log("Front Element:", deque.peekFront());
console.log("Rear Element:", deque.peekRear());
deque.display();  
deque.removeFront();
deque.removeRear();
deque.display(); 
console.log("Deque Size:", deque.size());
- Class & Initialization: The Deque class is created using an array (this.items) to store elements, making it easy to perform operations from both ends.
- Adding Elements: addFront(element) inserts an element at the front using unshift(), while addRear(element) appends an element to the rear using push().
- Removing Elements: removeFront() removes the front element using shift(), and removeRear() removes the last element using pop(). If the deque is empty, it returns "Deque is empty".
- Utility Functions: isEmpty() checks if the deque is empty, peekFront() and peekRear() retrieve the first and last elements, and size() returns the total number of elements.
2. Deque Implementation using circular array
In the case of circular deque the elements are arranged in a circular manner that means the first element is connected to the last one in the sequence.
Terms used
- capacity: the total number of values a deque can hold is called as a capacity
- size: the current number of elements present in a deque is called as the size of that deque
- front: the pointer that points to the first element of a deque is called as the front pointer
- rear: the pointer that points to the last element of a deque is called as the rear pointer
Formulas used
- Add Front: Update front = (front - 1 + capacity) % capacity to move it backward.
- Remove Front: Update front = (front + 1) % capacity to move it forward.
- Add Rear: Update rear = (rear + 1) % capacity to move it forward.
- Remove Rear: Update rear = (rear - 1 + capacity) % capacity to move it backward.
class CircularDeque {
    constructor(capacity) {
        this.capacity = capacity; 
        this.items = new Array(capacity); 
        this.front = -1; 
        this.rear = -1; 
        this.size = 0; 
    }
    isFull() {
        return this.size === this.capacity;
    }
    
    isEmpty() {
        return this.size === 0;
    }
    addFront(element) {
        if (this.isFull()) {
            console.log("Deque is full");
            return;
        }
        if (this.isEmpty()) {
            this.front = this.rear = 0; 
        } else {
            this.front = (this.front - 1 + this.capacity) % this.capacity; 
        }
        this.items[this.front] = element;
        this.size++; 
    }
    addRear(element) {
        if (this.isFull()) {
            console.log("Deque is full");
            return;
        }
        if (this.isEmpty()) {
            this.front = this.rear = 0; 
        } else {
            this.rear = (this.rear + 1) % this.capacity; 
        }
        this.items[this.rear] = element; 
        this.size++; 
    }
    removeFront() {
        if (this.isEmpty()) {
            console.log("Deque is empty");
            return;
        }
        const removedElement = this.items[this.front]; 
        if (this.front === this.rear) {
            this.front = this.rear = -1; 
        } else {
            this.front = (this.front + 1) % this.capacity; 
        }
        this.size--; 
        return removedElement; 
    }
    removeRear() {
        if (this.isEmpty()) {
            console.log("Deque is empty");
            return;
        }
        const removedElement = this.items[this.rear]; 
        if (this.front === this.rear) {
            this.front = this.rear = -1; 
        } else {
            this.rear = (this.rear - 1 + this.capacity) % this.capacity; 
        }
        this.size--; 
        return removedElement; 
    }
    peekFront() {
        return this.isEmpty() ? "Deque is empty" : this.items[this.front];
    }
    peekRear() {
        return this.isEmpty() ? "Deque is empty" : this.items[this.rear];
    }
    display() {
        if (this.isEmpty()) {
            console.log("Deque is empty");
            return;
        }
        let i = this.front;
        let elements = [];
        for (let count = 0; count < this.size; count++) {
            elements.push(this.items[i]);
            i = (i + 1) % this.capacity;
        }
        console.log("Deque elements:", elements);
    }
}
// Example Usage:
const deque = new CircularDeque(5);
deque.addRear(10);
deque.addRear(20);
deque.addFront(5);
deque.addFront(2);
deque.display(); 
console.log("Front Element:", deque.peekFront()); 
console.log("Rear Element:", deque.peekRear());   
deque.removeFront();
deque.removeRear();
deque.display(); 
- Uses a Fixed-Size Array: The deque is implemented using an array of a fixed capacity, with front and rear pointers for efficient operations.
- Insertion at Both Ends: Elements can be added at the front (addFront()) or rear (addRear()), updating the respective index in a circular manner.
- Deletion from Both Ends: Elements can be removed from the front (removeFront()) or rear (removeRear()), adjusting indices accordingly.
- Circular Behavior: The front and rear pointers wrap around using (index + capacity) % capacity to efficiently utilize space.
- Utility Functions: The deque provides methods to check if it's full or empty, peek at the front/rear elements, and display its contents.

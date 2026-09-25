# Queue in Javascript

> Source: https://www.geeksforgeeks.org/javascript/implementation-queue-javascript/

A Queue is a linear data structure that follows the FIFO (First In, First Out) principle. Elements are inserted at the rear and removed from the front.
- It is an ordered list in which insertions are done at one end which is known as the rear and deletions are done from the other end known as the front.
- A good example of a queue is any queue of consumers for a resource where the consumer that came first is served first.
// Queue Implementation
let queue = [];
// Enqueue Function
function enqueue(element) {
    queue.push(element);
    console.log(element + " inserted into the queue.");
}
// Insert Elements
enqueue(2);
enqueue(3);
enqueue(4);
enqueue(5);
enqueue(6);
// Display Queue
console.log("Queue:", queue);
// Front Element
console.log("Front:", queue[0]);
// Rear Element
console.log("Rear:", queue[queue.length - 1]);
- push() adds elements to the rear of the queue, maintaining the FIFO (First In, First Out) order.
- Front and rear elements are accessed using queue[0] andqueue[queue.length - 1] without removing them.
Queue Operations
- enqueue(item): Adds an element to the end of the queue.
- dequeue(): Removes and returns the first element from the queue.
- peek(): Returns the first element without removing it.
- isEmpty(): Checks if the queue is empty.
- size(): Returns the number of elements in the queue.
- clear(): Removes all elements from the queue.
- print(): Prints the elements of the queue.
Different ways of Implementations of Queue in JavaScript
1. Implementation of Queue Using Array in JavaScript
In this implementation, we use a JavaScript array to simulate a queue, with push() to add elements to the end and shift() to remove elements from the front.
class Queue {
  constructor() {
    this.items = [];
  }
  enqueue(element) {
    this.items.push(element); 
  }
  dequeue() {
    return this.isEmpty() ? null : this.items.shift();
  }
  peek() {
    return this.isEmpty() ? null : this.items[0];
  }
  isEmpty() {
    return this.items.length === 0;
  }
  size() {
    return this.items.length;
  }
  print() {
    console.log(this.items.join(" -> "));
  }
}
// Example Usage
const queue = new Queue();
queue.enqueue(1);
queue.enqueue(2);
queue.enqueue(3);
queue.print();         
console.log(queue.dequeue()); 
console.log(queue.peek());    
console.log(queue.size());   
Time complexity:
- enqueue() - O(1): Constant time to add an element.
- dequeue()- O(n): Linear time due to shifting elements.
- peek()- O(1): Constant time to access the first element.
- isEmpty()- O(1): Constant time to check if the array is empty.
- size() - O(1): Constant time to return the size.
- print() - O(n): Linear time to join and print elements.
Auxiliary Space: O(1) for all operations, except print(), which is O(n).
2. Implementations of Queue using Linked List in JavaScript
In a Queue using a Linked List, each element (node) contains a value and a reference to the next node. The queue follows the FIFO (First In, First Out) principle, with enqueue operations adding to the rear and dequeue operations removing from the front.
Implementing a queue using a linked list is often more efficient than using an array in JavaScript because:
- Adding or removing elements at the beginning or end of a linked list is O(1) (constant time). With arrays, adding/removing at the beginning is O(n) (linear time) because elements need to be shifted.
- Memory is allocated only when a new element is added. There’s no unused memory.
- If the queue size is smaller than the array capacity, memory is wasted. If the queue grows, resizing the array can also lead to temporary memory inefficiency.
class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
    }
}
class Queue {
    constructor() {
        this.front = null;  
        this.rear = null; 
        this.size = 0; 
    }
    enqueue(data) {
        const newNode = new Node(data);
        if (this.isEmpty()) {
            this.front = newNode;
            this.rear = newNode;
        } else {
            this.rear.next = newNode;
            this.rear = newNode;
        }
        this.size++;
    }
    dequeue() {
        if (this.isEmpty()) {
            return null; 
        }
        const removedNode = this.front;
        this.front = this.front.next;
        if (this.front === null) {
            this.rear = null;
        }
        this.size--;
        return removedNode.data;
    }
    peek() {
        if (this.isEmpty()) {
            return null;
        }
        return this.front.data;
    }
    isEmpty() {
        return this.size === 0;
    }
    getSize() {
        return this.size;
    }
    print() {
        let current = this.front;
        const elements = [];
        while (current) {
            elements.push(current.data);
            current = current.next;
        }
        console.log(elements.join(' -> '));
    }
}
// Example Usage:
const queue = new Queue();
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);
queue.print(); 
console.log(queue.dequeue());
queue.print();
console.log(queue.peek()); 
console.log(queue.getSize());
console.log(queue.isEmpty()); 
Time Complexity:
- enqueue(): O(1) (insert at tail)
- dequeue(): O(1) (remove head)
- peek(): O(1)
- isEmpty(): O(1)
- size(): O(1) (you maintained a size variable)
- print(): O(n) (traverse all nodes)
Auxiliary Space: O(1) for all operations, except print(), which is O(n)
3. Implementation of Queue Using Circular Array in JavaScript
In a Circular Array Queue, we use a fixed-size array to store the elements of the queue. However, the key idea is that the array is circular -meaning the last element connects back to the first element in a loop, forming a continuous, circular structure.
class CircularQueue {
  constructor(size) {
    this.size = size;
    this.queue = new Array(size); 
    this.front = -1;
    this.rear = -1;  
  }
  // Enqueue: Adds an element to the rear of the queue
  enqueue(element) {
    if ((this.rear + 1) % this.size === this.front) {
      console.log("Queue is full!");
      return;
    }
    if (this.front === -1) {
      this.front = 0;
    }
    this.rear = (this.rear + 1) % this.size;
    this.queue[this.rear] = element;
    console.log(`${element} added to the queue`);
  }
  // Dequeue: Removes and returns the front element of the queue
  dequeue() {
    if (this.front === -1) {
      console.log("Queue is empty!");
      return;
    }
    const dequeuedElement = this.queue[this.front];
    if (this.front === this.rear) {
      this.front = -1; 
      this.rear = -1;
    } else {
      this.front = (this.front + 1) % this.size;
    }
    console.log(`${dequeuedElement} removed from the queue`);
    return dequeuedElement;
  }
  // Peek: Returns the front element without removing it
  peek() {
    if (this.front === -1) {
      console.log("Queue is empty!");
      return null;
    }
    return this.queue[this.front];
  }
  // Check if the queue is empty
  isEmpty() {
    return this.front === -1;
  }
  // Check if the queue is full
  isFull() {
    return (this.rear + 1) % this.size === this.front;
  }
  // Print the queue elements
  printQueue() {
    if (this.front === -1) {
      console.log("Queue is empty!");
      return;
    }
    let elements = [];
    let i = this.front;
    while (i !== this.rear) {
      elements.push(this.queue[i]);
      i = (i + 1) % this.size;
    }
    elements.push(this.queue[this.rear]);
    console.log("Queue:", elements.join(' -> '));
  }
}
// Example usage:
const queue = new CircularQueue(5);
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);
queue.enqueue(40);
queue.enqueue(50);
queue.printQueue(); 
queue.dequeue(); 
queue.dequeue(); 
queue.printQueue(); 
queue.enqueue(60); 
queue.enqueue(70); 
queue.printQueue(); 
queue.dequeue(); 
queue.printQueue(); 
Time complexity: 
- enqueue(): O(1)
- dequeue(): O(1)
- peek(): O(1)
- isEmpty(): O(1)
- isFull(): O(1)
- printQueue(): O(n)
Auxiliary Space: O(1) for all operations, except printQueue(), which is O(n)
4. Alternative Implementation of Circular Queue (Without Rear)
In this approach, instead of maintaining both front and rear, we maintain only front and count. The rear position is computed dynamically.
class CircularQueue {
  constructor(size) {
    this.size = size;
    this.queue = new Array(size);
    this.front = -1;
    this.count = 0; 
  }
  enqueue(element) {
    if (this.isFull()) {
      console.log("Queue is full!");
      return;
    }
    if (this.front === -1) this.front = 0;
    let rear = (this.front + this.count) % this.size; 
    this.queue[rear] = element;
    this.count++; 
    console.log(`${element} added to the queue`);
  }
  dequeue() {
    if (this.isEmpty()) {
      console.log("Queue is empty!");
      return;
    }
    const dequeuedElement = this.queue[this.front];
    this.queue[this.front] = undefined;
    if (this.count === 1) {
      this.front = -1; 
    } else {
      this.front = (this.front + 1) % this.size; 
    }
    this.count--;
    console.log(`${dequeuedElement} removed from the queue`);
    return dequeuedElement;
  }
  peek() {
    if (this.isEmpty()) {
      console.log("Queue is empty!");
      return null;
    }
    return this.queue[this.front];
  }
  isEmpty() {
    return this.count === 0;
  }
  isFull() {
    return this.count === this.size;
  }
  printQueue() {
    if (this.isEmpty()) {
      console.log("Queue is empty!");
      return;
    }
    let elements = [];
    for (let i = 0; i < this.count; i++) {
      let index = (this.front + i) % this.size;
      elements.push(this.queue[index]);
    }
    console.log("Queue:", elements.join(" -> "));
  }
}
// Example usage:
const queue = new CircularQueue(5);
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);
queue.enqueue(40);
queue.enqueue(50);
queue.printQueue(); 
queue.dequeue(); 
queue.dequeue(); 
queue.printQueue(); 
queue.enqueue(60); 
queue.enqueue(70); 
queue.printQueue(); 
queue.dequeue(); 
queue.printQueue();
Time complexity: 
- enqueue(): O(1)
- dequeue(): O(1)
- peek(): O(1)
- isEmpty(): O(1)
- isFull(): O(1)
- printQueue(): O(n)
Auxiliary Space: O(1) for all operations, except printQueue(), which is O(n)

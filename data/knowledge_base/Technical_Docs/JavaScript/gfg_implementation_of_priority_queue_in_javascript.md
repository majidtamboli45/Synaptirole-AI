# Implementation of Priority Queue in Javascript

> Source: https://www.geeksforgeeks.org/javascript/implementation-priority-queue-javascript/

A Priority Queue in JavaScript is a data structure in which elements are stored with priorities. Elements with higher priority are removed before elements with lower priority.
- Priority Queue processes elements based on priority instead of FIFO order.
- Common operations include enqueue(), dequeue(), and peek().
- It is efficiently implemented using a binary heap.
Note: Assuming a Priority queue can grow dynamically we are not considering the overflow condition.
// User defined class
// to store element and its priority
class QElement {
    constructor(element, priority)
    {
        this.element = element;
        this.priority = priority;
    }
}
// PriorityQueue class
class PriorityQueue {
    // An array is used to implement priority
    constructor()
    {
        this.items = [];
    }
    // functions to be implemented
    // enqueue(item, priority)
    // dequeue()
    // front()
    // isEmpty()
    // printPQueue()
}
As you can see in the example above we have defined the skeleton of PriorityQueue class. We have used a user-defined class QElement having two propertoes: elements and priority. We have used an array in the PriorityQueue class to implement the priority queue, this array is a container of QElement.
1. enqueue(): It adds an element to the queue according to its priority.
// enqueue function to add element
// to the queue as per priority
enqueue(element, priority)
{
    // creating object from queue element
    let qElement = new QElement(element, priority);
    let contain = false;
    // iterating through the entire
    // item array to add element at the
    // correct location of the Queue
    for (let i = 0; i < this.items.length; i++) {
        if (this.items[i].priority > qElement.priority) {
            // Once the correct location is found it is
            // enqueued
            this.items.splice(i, 0, qElement);
            contain = true;
            break;
        }
    }
    // if the element has the highest priority
    // it is added at the end of the queue
    if (!contain) {
        this.items.push(qElement);
    }
}
Here, we create a qElement has property element and priority. Then we iterate over the queue to find the correct location of the qElement according to its priority and add it.
2. dequeue(): Removes an element from the priority queue
// dequeue method to remove
// element from the queue
dequeue()
{
    // return the dequeued element
    // and remove it.
    // if the queue is empty
    // returns Underflow
    if (this.isEmpty())
        return "Underflow";
    return this.items.shift();
}
This function removes an element from the front of a queue as the highest priority element is stored at the front of the priority queue. We have used the shift method of an array to remove an element from the queue.
3. front(): It returns the front element of the Priority queue
// front function
front()
{
    // returns the highest priority element
    // in the Priority queue without removing it.
    if (this.isEmpty())
        return "No elements in Queue";
    return this.items[0];
}
This function returns the front element of the Priority queue. We simply return the 0th element of an array to get the front of a Priority queue.
4. rear(): It returns the last element of the Priority queue
// rear function
rear()
{
    // returns the lowest priority
    // element of the queue
    if (this.isEmpty())
        return "No elements in Queue";
    return this.items[this.items.length - 1];
}
This function returns the last element of the queue or the lowest priority element.
Helper Methods: Let’s declare some helper method that is quite useful while working with the Priority queue.
1. isEmpty(): Returns true if the Priority queue is empty
// isEmpty function
isEmpty()
{
    // return true if the queue is empty.
    return this.items.length == 0;
}
We have used the length property of an array to get the length and if it's 0 then the priority queue is empty. 
 
2. printPQueue(): It prints the element of the queue as per the priority starting from highest to lowest
// printQueue function
// prints all the element of the queue
printPQueue()
{
    let str = "";
    for (let i = 0; i < this.items.length; i++)
        str += this.items[i].element + " ";
    return str;
}
Here, we concatenate the element property of each priority queue item into a string.
Note: Here we consider " 1 " as the highest priority element, you can modify this as per the requirement.
Implementation: Now let's use this Priority Queue class and its different method described above
// creating object for queue class
let priorityQueue = new PriorityQueue();
// testing isEmpty and front on an empty queue
// return true
console.log(priorityQueue.isEmpty());
// returns "No elements in Queue"
console.log(priorityQueue.front());
// adding elements to the queue
priorityQueue.enqueue("Sumit", 2);
priorityQueue.enqueue("Gourav", 1);
priorityQueue.enqueue("Piyush", 1);
priorityQueue.enqueue("Sunny", 2);
priorityQueue.enqueue("Sheru", 3);
// prints [Gourav Piyush Sumit Sunny Sheru]
console.log(priorityQueue.printPQueue());
// prints Gourav
console.log(priorityQueue.front().element);
// prints Sheru
console.log(priorityQueue.rear().element);
// removes Gouurav
// priorityQueue contains
// [Piyush Sumit Sunny Sheru]
console.log(priorityQueue.dequeue().element);
// Adding another element to the queue
priorityQueue.enqueue("Sunil", 2);
// prints [Piyush Sumit Sunny Sunil Sheru]
console.log(priorityQueue.printPQueue());
The above implementation is not efficient and is slower. We can further optimize this Priority by Using Heap.
Optimized Approach: We will store the elements of the Priority Queue in the heap structure. When using priority queues the highest priority element is always the root element. There are basically two kinds of the heap:
- Min Heap
- Max Heap
In Min Heap, the smallest element is basically the root element and the child elements are always greater than the parent element whereas in the case of Max Heap the root element is the largest
So, if we want the smallest element in our priority queue to have the highest priority we use Min Heap otherwise we use Max Heap
The time complexity using Min Heap or Max Heap for different methods is:
- Peek : O(1)
- Remove: O(log N)
- Add : O(log N)
To learn more about Min Heap and Max Heap, please refer to the Introduction to Heap – Data Structure and Algorithm Tutorials article.
Example: Let us now look at the implementation of Priority Queue using Min Heap
class PriorityQueue {
    constructor() {
        this.heap = [];
    }
    // Helper Methods
    getLeftChildIndex(parentIndex) {
        return 2 * parentIndex + 1;
    }
    getRightChildIndex(parentIndex) {
        return 2 * parentIndex + 2;
    }
    getParentIndex(childIndex) {
        return Math.floor((childIndex - 1) / 2);
    }
    hasLeftChild(index) {
        return this.getLeftChildIndex(index)
            < this.heap.length;
    }
    hasRightChild(index) {
        return this.getRightChildIndex(index)
            < this.heap.length;
    }
    hasParent(index) {
        return this.getParentIndex(index) >= 0;
    }
    leftChild(index) {
        return this.heap[this.getLeftChildIndex(index)];
    }
    rightChild(index) {
        return this.heap[this.getRightChildIndex(index)];
    }
    parent(index) {
        return this.heap[this.getParentIndex(index)];
    }
    swap(indexOne, indexTwo) {
        const temp = this.heap[indexOne];
        this.heap[indexOne] = this.heap[indexTwo];
        this.heap[indexTwo] = temp;
    }
    peek() {
        if (this.heap.length === 0) {
            return null;
        }
        return this.heap[0];
    }
    // Removing an element will remove the
    // top element with highest priority then
    // heapifyDown will be called 
    remove() {
        if (this.heap.length === 0) {
            return null;
        }
        const item = this.heap[0];
        this.heap[0] = this.heap[this.heap.length - 1];
        this.heap.pop();
        this.heapifyDown();
        return item;
    }
    add(item) {
        this.heap.push(item);
        this.heapifyUp();
    }
    heapifyUp() {
        let index = this.heap.length - 1;
        while (this.hasParent(index) && this.parent(index)
            > this.heap[index]) {
            this.swap(this.getParentIndex(index), index);
            index = this.getParentIndex(index);
        }
    }
    heapifyDown() {
        let index = 0;
        while (this.hasLeftChild(index)) {
            let smallerChildIndex = this.getLeftChildIndex(index);
            if (this.hasRightChild(index) && this.rightChild(index)
                < this.leftChild(index)) {
                smallerChildIndex = this.getRightChildIndex(index);
            }
            if (this.heap[index] < this.heap[smallerChildIndex]) {
                break;
            } else {
                this.swap(index, smallerChildIndex);
            }
            index = smallerChildIndex;
        }
    }
}
// Creating The Priority Queue
let PriQueue = new PriorityQueue();
// Adding the Elements
PriQueue.add(32);
PriQueue.add(45);
PriQueue.add(12);
PriQueue.add(65);
PriQueue.add(85);
console.log(PriQueue.peek());
console.log(PriQueue.remove());
console.log(PriQueue.peek());
console.log(PriQueue.remove());
console.log(PriQueue.peek());
console.log(PriQueue.remove());
Output
12
12
32
32
45
45
Internally an array is used to store the elements of the priority queue. Element with the minimum value is of the highest priority and is stored as root. We use the helper function peek() to access the element and remove() to pull the element out of the queue.
In the case of Max Heap implementation, we will see that the element with the maximum value should have the highest priority. Similar to Min Heap the highest priority element will be the root element. The helper functions will remain the same only the comparison operators sign in heapifyDown() and heapifyUp() will be reversed.
Example: Priority queue using Max Heap
class PriorityQueue {
    constructor() {
        this.heap = [];
    }
    // Helper Methods
    getLeftChildIndex(parentIndex) {
        return 2 * parentIndex + 1;
    }
    getRightChildIndex(parentIndex) {
        return 2 * parentIndex + 2;
    }
    getParentIndex(childIndex) {
        return Math.floor((childIndex - 1) / 2);
    }
    hasLeftChild(index) {
        return this.getLeftChildIndex(index)
            < this.heap.length;
    }
    hasRightChild(index) {
        return this.getRightChildIndex(index)
            < this.heap.length;
    }
    hasParent(index) {
        return this.getParentIndex(index) >= 0;
    }
    leftChild(index) {
        return this.heap[this.getLeftChildIndex(index)];
    }
    rightChild(index) {
        return this.heap[this.getRightChildIndex(index)];
    }
    parent(index) {
        return this.heap[this.getParentIndex(index)];
    }
    swap(indexOne, indexTwo) {
        const temp = this.heap[indexOne];
        this.heap[indexOne] = this.heap[indexTwo];
        this.heap[indexTwo] = temp;
    }
    peek() {
        if (this.heap.length === 0) {
            return null;
        }
        return this.heap[0];
    }
    // Removing an element will remove the
    // top element with highest priority then
    // heapifyDown will be called 
    remove() {
        if (this.heap.length === 0) {
            return null;
        }
        const item = this.heap[0];
        this.heap[0] = this.heap[this.heap.length - 1];
        this.heap.pop();
        this.heapifyDown();
        return item;
    }
    add(item) {
        this.heap.push(item);
        this.heapifyUp();
    }
    heapifyUp() {
        let index = this.heap.length - 1;
        while (this.hasParent(index) && this.parent(index)
            < this.heap[index]) {
            this.swap(this.getParentIndex(index), index);
            index = this.getParentIndex(index);
        }
    }
    heapifyDown() {
        let index = 0;
        while (this.hasLeftChild(index)) {
            let smallerChildIndex = this.getLeftChildIndex(index);
            if (this.hasRightChild(index) && this.rightChild(index)
                > this.leftChild(index)) {
                smallerChildIndex = this.getRightChildIndex(index);
            }
            if (this.heap[index] > this.heap[smallerChildIndex]) {
                break;
            } else {
                this.swap(index, smallerChildIndex);
            }
            index = smallerChildIndex;
        }
    }
}
// Creating The Priority Queue
let PriQueue = new PriorityQueue();
PriQueue.add(32);
PriQueue.add(45);
PriQueue.add(12);
PriQueue.add(65);
PriQueue.add(85);
// Removing and Checking elements of highest Priority
console.log(PriQueue.peek());
console.log(PriQueue.remove());
console.log(PriQueue.peek());
console.log(PriQueue.remove());
console.log(PriQueue.peek());
console.log(PriQueue.remove());
Output
85
85
65
65
45
45
Now the element with the highest priority is the one with the highest value. So insertion and deletion have changed but time complexities remain the same.

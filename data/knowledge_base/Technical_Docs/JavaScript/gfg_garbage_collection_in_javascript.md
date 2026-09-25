# Garbage Collection in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/garbage-collection-in-javascript/

Garbage Collection (GC) in JavaScript is an automatic memory management mechanism that frees up memory occupied by objects no longer in use. It helps ensure efficient memory usage and reduces the risk of memory leaks without manual intervention.
- Automatically identifies and removes objects that are no longer accessible.
- Eliminates the need for manual memory allocation and deallocation.
- Improves application performance and stability.
Working of Garbage Collection JavaScript
- JavaScript stores variables and objects in memory (the heap) during program execution.
- The engine tracks objects and variables in use, with unused ones becoming unreachable.
- Unreachable objects are automatically detected and removed by the JavaScript engine through garbage collection.
- Garbage collection runs in the background, periodically freeing memory by removing unused objects.
- It happens automatically, so developers don’t need to manage memory manually, preventing memory leaks.
Algorithm behind Garbage collection(Mark and Sweep)
The Mark-and-Sweep Garbage Collection algorithm helps manage memory by identifying and removing unused objects in JavaScript. This code simulates the process where objects are marked as reachable and then swept away if they are no longer needed.
class algo {
    constructor() {
        this.objects = [];
    }
    createObject(name) {
        const obj = { name: name, refCount: 1 };
        this.objects.push(obj);
        return obj;
    }
    mark() {
        this.objects.forEach(obj => {
            if (obj.refCount > 0) {
                obj.marked = true;
            }
        });
    }
    sweep() {
        this.objects = this.objects.filter(obj => obj.marked);
    }
    collectGarbage() {
        this.mark();
        this.sweep();
    }
    prints() {
        return this.objects
    }
}
const gc = new algo();
const obj1 = gc.createObject("Object 1");
const obj2 = gc.createObject("Object 2");
obj2.refCount = 0;
gc.collectGarbage();
console.log(gc.prints())
- The createObject() function creates an object with a name and a referenceCount, and adds it to an internal list of objects being tracked.
- The mark() function goes through all objects and marks them as "reachable" if their referenceCount is greater than 0.
- The sweep() function removes objects from the list that aren't marked, meaning they are no longer reachable by any references.
- The collectGarbage() function combines marking and sweeping to simulate the entire garbage collection process.
- After calling gc.collectGarbage(), objects that are no longer reachable (like obj2 with referenceCount = 0) are removed, and the remaining objects (like obj1) stay in memory.
Importance of Garbage Collection
- Prevents memory leaks.
- Improves application performance.
- Frees up unused memory, optimizing resource usage.
Use Cases of Garbage Collection in JavaScript
1. Unreachable Object Gets Collected
This JavaScript code demonstrates how objects are referenced by variables and how setting a variable to null can make an object eligible for garbage collection. It highlights the concept of memory management when objects become unreachable.
let obj1 = { name: "Object 1" };
let obj2 = { name: "Object 2" };
obj1 = null;
console.log(obj1)
- The obj1 and obj2 variables each reference a separate object, which is identified by its memory address.
- When obj1 is set to null, the reference to the object { name: "Object 1" } is removed, making it eligible for garbage collection.
- Since obj2 still holds a reference to { name: "Object 2" }, that object is still in use and won't be garbage collected. Only the object referenced by obj1 becomes unreachable.
2. Garbage Collection after Removing References
This code demonstrates how setting a variable to null removes the reference to an object, making it eligible for garbage collection. The object that was previously referenced is no longer accessible.
let user = { name: "Pranjal" }
user = null
console.log(user)
- The variable user initially references an object with the property name: "Pranjal".
- When user is set to null, it no longer points to the object, removing the reference.
- The object { name: "Pranjal" } becomes eligible for garbage collection since there are no remaining references to it.
3. Removing Array Elements
This code demonstrates how to remove an element from an array using the splice() method. In this case, the first element of the array is removed.
let a = [1, 2, 3, 4]
a.splice(0, 1)
console.log(a)
- The variable arr initially holds the array [1, 2, 3, 4].
- The splice(0, 1) method removes the first element of the array (the element at index 0).
- After the operation, the array becomes [2, 3, 4] as the first element (1) has been removed.
4. Function Creating Objects and Removing Them
This code shows how an object is created within a function and goes out of scope once the function finishes. The object becomes eligible for garbage collection since there are no external references to it.
function createObj() {
    let temp = { id: 1 };
}
createObj();
console.log(temp)
- Inside the createObj function, a local variable temp is assigned the object { id: 1 }.
- When the function finishes executing, the temp variable goes out of scope and is no longer accessible.
- The object { id: 1 } is no longer referenced and becomes eligible for garbage collection.
5. Memory Cleanup after Setting to Null
This code demonstrates how setting an object to null removes the reference to the object, making it eligible for garbage collection. After this, the object is no longer accessible.
let data = { name: "Test" };
data = null;
console.log(data)
- The variable data initially holds a reference to the object { name: "Test" }.
- When data is set to null, the reference to the object is removed.
- The object { name: "Test" } becomes eligible for garbage collection as there are no remaining references to it.
Advantages of Garbage Collection in JavaScript
- Automatic Memory Management: Frees developers from manual memory allocation and deallocation.
- Prevents Memory Leaks: Removes unreachable objects, ensuring efficient memory usage.
- Improves Performance: Reduces memory bloat, enhancing application speed and responsiveness.
- Simplifies Development: Eliminates the need for manual object tracking, allowing focus on core logic.
- Optimizes Resource Utilization: Cleans up unused objects, benefiting long-running and dynamic applications.
Best Practices for Efficient Garbage Collection
- Use let and const instead of var to avoid global variables.
- Remove event listeners when elements are deleted.
- Clear intervals and timeouts to free up memory.
- Avoid excessive object retention by nullifying references when they are no longer needed.
- Use WeakMap for temporary object references to prevent memory leaks.
- Monitor memory usage using DevTools to detect memory leaks early.

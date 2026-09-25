# JavaScript WeakSet

> Source: https://www.geeksforgeeks.org/javascript/javascript-weakset/

A WeakSet in JavaScript is a collection of unique objects where the values are weakly referenced. It works similarly to a Set, but the objects stored in a WeakSet can be garbage-collected when no longer in use.
- A WeakSet can only store objects, not primitive values like strings or numbers.
- Objects in a WeakSet can be automatically removed when they are no longer referenced elsewhere, helping to manage memory efficiently.
Syntax
const WeakSet=new WeakSet()
The syntax const WeakSet = new WeakSet(); initializes a new empty WeakSet in JavaScript. It creates a collection that can only store objects and automatically removes objects when they are no longer in use.
Working of WeakSet
- A WeakSet stores only objects; primitive values are not allowed.
- Objects in a WeakSet are weakly referenced and can be garbage collected if no other references exist.
- WeakSet is non-iterable, so methods like forEach() are unavailable.
- Unreferenced objects are automatically removed, helping prevent memory leaks.
- A WeakSet stores only unique objects and does not support direct element access or size checking.
Components of a WeakSet
- Objects as data: A WeakSet can only store objects, not primitive values like numbers or strings.
- Weak References: The objects in a WeakSet are weakly referenced, which means they can be garbage-collected when no longer in use.
- Uniqueness: Each object in a WeakSet must be unique; duplicate objects are not allowed.
- No Iteration: You cannot loop through or access the items in a WeakSet.
- No Size Property: Unlike other collections, a WeakSet does not provide a way to check how many items it contains.
Implementation of WeakSet
This code demonstrates how to use a WeakSet in JavaScript to store and manage unique objects. It shows adding, checking, and removing objects, as well as how objects can be garbage collected when no longer referenced.
// Create a new WeakSet
let weakSet = new WeakSet();
// Create objects to use in the WeakSet
let obj1 = { name: "Pranjal" };
let obj2 = { name: "Pranav" };
weakSet.add(obj1);
weakSet.add(obj2);
weakSet.delete(obj1)
obj2=null
console.log(weakSet.has(obj1))
console.log(weakSet.has(obj2))
- A WeakSet is created using let weakSet = new WeakSet(); to store object references.
- Objects obj1 and obj2 are added using weakSet.add().
- Setting obj2 = null removes its reference, allowing garbage collection.
- weakSet.has(obj1) returns true because obj1 still exists.
- weakSet.has(obj2) returns false since obj2 is no longer referenced and may be garbage collected.
Functions present in WeakSet
- add(value): Adds an object to the WeakSet. If the object is not already in the set, it is added.
- has(value): Checks if the specified object exists in the WeakSet. Returns true if it exists, otherwise false.
- delete(value): Removes the specified object from the WeakSet. Returns true if the object was removed, otherwise false.
Coding Problems on WeakSet
Advantages of WeakSet
- Memory Management: Objects in a WeakSet can be garbage collected when no longer in use, preventing memory leaks.
- No Duplicates: A WeakSet only stores unique objects, preventing duplicate entries and ensuring efficient data storage.
- Fast Lookups: Checking if an object is in a WeakSet is efficient, with constant time complexity (O(1)).
- Automatic Cleanup: When an object is no longer referenced elsewhere, it is automatically removed from the WeakSet, reducing the need for manual cleanup.
- Private Data: WeakSet is useful for storing private data, especially for associating metadata with objects without exposing it publicly.

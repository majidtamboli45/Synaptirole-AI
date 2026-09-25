# JavaScript WeakMap

> Source: https://www.geeksforgeeks.org/javascript/javascript-weakmap/

A WeakMap in JavaScript is a collection of key-value pairs where the keys are objects, and the values can be any arbitrary value. Unlike regular maps, WeakMap keys are weakly referenced, meaning they don't prevent garbage collection.
- The keys in a WeakMap can be automatically removed when no longer in use, helping save memory.
- You can't loop through the keys or values in a WeakMap.
Syntax
const WeakMap=new WeakMap()
To create a new WeakMap, the constructor function of the inbuilt WeakMap class is invoked with the help of the new keyword. This initiates a WeakMap object that can be used to invoke various properties present in itself as it is a class.
Working of WeakMap
- In WeakMap, keys are weakly referenced, so they do not prevent garbage collection.
- Only objects can be used as keys; primitive values are not allowed.
- WeakMap is non-iterable, so methods like keys(), values(), and forEach() are unavailable.
- When a key is garbage collected, its associated value is automatically removed, preventing memory leaks.
- WeakMap is commonly used for storing private object data securely.
Components of a WeakMap
- Keys: The keys in a WeakMap must be objects. Primitive values like strings, numbers, or booleans cannot be used as keys.
- Values: The values in a WeakMap can be any type of data, including primitives or objects, and are associated with the keys.
- Garbage Collection: The keys in a WeakMap are weakly referenced, meaning that if there are no other references to a key object, it can be garbage collected along with its associated value.
- No Iteration: Unlike regular maps, a WeakMap does not allow iteration (such as using forEach() or keys()) because of the weak references to keys.
- Size: There is no direct way to check the size of a WeakMap. Since the garbage collector may remove keys at any time, the size is not a reliable property to access.
Implementation of a WeakMap
Here’s a simple example demonstrating how to use a WeakMap in JavaScript. It shows how to associate object keys with values and how the garbage collector can remove key-value pairs when the key is no longer referenced.
let weakMap = new WeakMap();
let obj1 = { name: "Pranjal" };
let obj2 = { name: "Pranav" };
weakMap.set(obj1, "Engineer");
weakMap.set(obj2, "Designer");
console.log(weakMap.get(obj1)); 
console.log(weakMap.get(obj2)); 
obj2 = null;
- A WeakMap is created using let weakMap = new WeakMap(); to store object-based key-value pairs.
- Objects obj1 and obj2 are used as keys with values assigned through weakMap.set().
- Values are retrieved using weakMap.get(), returning "Engineer" for obj1 and "Designer" for obj2.
- Setting obj2 = null removes its reference from the code.
- Since WeakMap uses weak references, obj2 and its associated value can be garbage collected automatically.
Functions present in WeakMap
- set(key, value): Adds a key-value pair to the WeakMap. The key must be an object.
- get(key): Retrieves the value associated with the given key. If the key does not exist, it returns undefined.
- has(key): Checks if a specific key exists in the WeakMap. Returns true if the key is present, otherwise false.
- delete(key): Removes the specified key and its associated value from the WeakMap. Returns true if the key was successfully removed, otherwise false.
Background working of WeakMap
A WeakMap stores key-value pairs where the keys are objects. If there are no other references to a key, it can be garbage collected, and the entry in the WeakMap will be removed automatically. Unlike Map, you can’t loop through a WeakMap because keys can be removed at any time. Only objects can be used as keys, making it memory-efficient for temporary data storage without blocking object cleanup.
Advantages of WeakMap
- Memory Efficiency: Automatically frees memory by allowing garbage collection of unused keys.
- Garbage Collection: Keys can be garbage-collected when there are no other references to them.
- No Enumeration: Does not allow iteration over keys or values, protecting privacy.
- Key Constraints: Only objects can be used as keys, preventing issues with primitive types.
- Efficient Memory Management: Ideal for scenarios like caching, where unused data is automatically removed.

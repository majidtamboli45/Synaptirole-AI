# JavaScript Iterator

> Source: https://www.geeksforgeeks.org/javascript/javascript-iterator/

A JavaScript iterator is an object that allows sequential access to elements of a collection such as arrays, strings, maps, or sets. It provides a standard way to traverse data structures step-by-step without exposing their internal structure.
- Iterator Protocol: Iterators follow a protocol that defines how values are produced one at a time.
- next() Method: Each call to next() returns an object containing value and done.
- Works with Iterables: Commonly used with iterable objects like arrays, strings, maps, and sets.
Here are different methods of JavaScript Iterator
1. next() Method
The next() method is a core part of the JavaScript Iterator Protocol used to retrieve the next value from an iterator. Each time next() is called, it returns the next element in the sequence until the iteration is complete.
- Returns an Object: The method returns { value, done }.
- value: Contains the current element from the collection.
- done: A boolean indicating whether the iteration has finished.
const numbers = [1, 2, 3];
const iterator = numbers[Symbol.iterator]();
console.log(iterator.next()); // { value: 1, done: false }
console.log(iterator.next()); // { value: 2, done: false }
console.log(iterator.next()); // { value: 3, done: false }
console.log(iterator.next()); // { value: undefined, done: true }
- The array numbers creates an iterator using Symbol.iterator().
- Each call to iterator.next() returns the next element of the array along with a done flag indicating whether the iteration is complete.
- When all elements are accessed, next() returns { value: undefined, done: true }.
2. for...of Loop in JavaScript
The for...of loop is used to iterate over iterable objects such as arrays, strings, maps, and sets. It automatically accesses each element of the collection one by one without needing to manually call next().
- Works with Iterables: Commonly used with arrays, strings, maps, and sets.
- Simplifies Iteration: Automatically retrieves values from the iterator.
- Cleaner Syntax: Easier to read compared to manual iterator usage.
const array = ['a', 'b', 'c'];
const it = array[Symbol.iterator]()
for (let value of it) {
    console.log(value)
}
- The for...of loop iterates through each element of the array.
- In each iteration, the current value is assigned to value and printed to the console.
- The loop automatically stops after all elements are processed.
3. Custom Iterator in JavaScript
A custom iterator allows developers to define their own iteration behavior for an object. It is created by implementing the Symbol.iterator method, which returns an object containing the next() method.
- Defines Custom Traversal: Controls how values are accessed from an object.
- Uses Symbol.iterator: This method makes an object iterable.
- Returns next() Method: next() returns { value, done } during iteration.
Syntax
object[Symbol.iterator] = function () { 
return {
next() {
return { value: ..., done: ... };
}
};
};
const myObject = {
  values: [10, 20, 30],
  [Symbol.iterator]: function () {
    let index = 0;
    return {
      next: () => {
        if (index < this.values.length) {
          return { value: this.values[index++], done: false };
        } else {
          return { done: true };
        }
      }
    };
  }
};
for (const value of myObject) {
  console.log(value);
}
- The object defines Symbol.iterator, making it iterable.
- The next() method returns each value from the values array until all elements are accessed.
- The for...of loop automatically uses this iterator to print 10, 20, and 30.
Advantages of Iterators
- Provide controlled traversal of collections.
- Enable compatibility with for...of loops and spread operators.
- Help implement custom iteration logic for objects.

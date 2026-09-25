# JavaScript Set Reference

> Source: https://www.geeksforgeeks.org/javascript/javascript-set-reference/

JavaScript Set is a collection of items that are unique, meaning no element can be repeated. Elements of the set can be iterated in the insertion order. A Set can store any type of value, whether primitive or objects.
Syntax
new Set()
Example: This example will show the use of Set() constructor.
const mySet = new Set();
mySet.add("California");
mySet.add("India");
mySet.add("California");
mySet.add(10);
mySet.add(10);
const myObject = { a: 1, a: 5 };
mySet.add(myObject);
console.log(mySet);
Output:
Set(4) { 'California', 'India', 10, { a: 5 } }
The complete list of JavaScript Set has listed below:
JavaScript Set Constructor
A constructor is called when an object is created using the new keyword.
| Constructor | Description | 
|---|---|
| Set() | Create a set of unique values of any type, whether primitive values or object preferences. | 
JavaScript Set Properties
A JavaScript property is a member of an object that associates a key with a value.
Instance Property
An instance property is a property that has a new copy for every new instance of the class.
| Instance Properties | Description | 
|---|---|
| size | Returns the size of set | 
| constructor | Used to create a new instance of set | 
JavaScript Set Methods
Methods are actions that can be performed on objects.
Instance Method
If the method is called on an instance of a Set then it is called an instance method.
| Instance Methods | Description | 
|---|---|
| add() | Add an element to the set with the specified value | 
| clear() | Removes all the elements from the set | 
| delete() | Delete specified element if it exists in the set | 
| entries() | Used to iterate over each element of the set | 
| forEach() | Applies a function on each element of the set | 
| has() | Checks if a particular element exists in the set | 
| values() | Returns an iterator that contains all elements of the set | 
| keys() | Exactly equivalent to the values method | 
Comparison with JavaScript Arrays
- Uniqueness: Sets ensure all values are unique, whereas arrays can have duplicate values.
- Performance: Sets provide better performance for membership testing and uniqueness checks.
Examples and Use Cases
1. Creating a Set
Creating a Set and adding elements to the set.
const set1 = new Set(['apple', 'banana', 'cherry']);
console.log(set1);
Output
Set(3) { 'apple', 'banana', 'cherry' }
2. Adding and Deleting Elements
Adding new elements and Deleting the elements.
const set2 = new Set();
set2.add(1);
set2.add(5);
set2.add(5); // Duplicate element will not be added
set2.add('Hello');
console.log(set2); 
set2.delete(5);
console.log(set2);
Output
Set(3) { 1, 5, 'Hello' }
Set(2) { 1, 'Hello' }
3. Checking for Element Existence
Checking for already existing elements.
const set3 = new Set(['a', 'b', 'c']);
console.log(set3.has('a'));
console.log(set3.has('z'));
Output
true
false
4. Iterating Over a Set
Iterating over the set and printing one by one.
const set4 = new Set([1, 2, 3, 4]);
for (let item of set4) {
  console.log(item);
}
Output
1
2
3
4
5. Removing Duplicates
Removing the duplicate elements from the array using set.
const numbers = [1, 2, 2, 3, 4, 4, 5];
const uniqueNumbers = [...new Set(numbers)];
console.log(uniqueNumbers);
Output
[ 1, 2, 3, 4, 5 ]

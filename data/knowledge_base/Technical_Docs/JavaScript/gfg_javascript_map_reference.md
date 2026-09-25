# JavaScript Map Reference

> Source: https://www.geeksforgeeks.org/javascript/javascript-map-reference/

JavaScript Map is a collection of elements where each element is stored as a key, value pair. Map objects can hold both objects and primitive values as either key or value. When we iterate over the map object it returns the key, and value pair in the same order as inserted.
You can create a JavaScript Map by:
- Passing an Array to new Map()
- Create a Map and use Map.set()
Passing an Array to new Map()
Example: In this example, an array of key-value pairs is passed to the Map constructor to create a Map. Each sub-array [key, value] represents a key-value pair.
// Create a Map by passing an Array of key-value pairs to the Map constructor
const arrayMap = new Map([
    ['key1', 'value1'],
    ['key2', 'value2'],
    ['key3', 'value3']
]);
// Accessing values in the Map
console.log(arrayMap.get('key1'));  // Output: "value1"
console.log(arrayMap.get('key2'));  // Output: "value2"
console.log(arrayMap.get('key3'));  // Output: "value3"
Output
value1
value2
value3
Create a Map and use Map.set()
Example: In this example, an empty Map is created, and then key-value pairs are added using the Map.set() method. This approach is useful when you want to dynamically build a Map during runtime.
// Create an empty Map and use Map.set() to add key-value pairs
const setMap = new Map();
// Adding key-value pairs using Map.set()
setMap.set('name', 'John');
setMap.set('age', 25);
setMap.set('city', 'New York');
// Accessing values in the Map
console.log(setMap.get('name'));  // Output: "John"
console.log(setMap.get('age'));   // Output: 25
console.log(setMap.get('city'));  // Output: "New York"
Output
John
25
New York
The complete list of JavaScript Map is listed below:
JavaScript Map Constructor: In JavaScript, a constructor gets called when an object is created using the new keyword.
| Constructor | Description | 
|---|---|
| Map() | Create Map objects in JavaScript. | 
JavaScript Map Properties: A JavaScript property is a member of an object that associates a key with a value.
- Instance Properties: An instance property is a property that has a new copy for every new instance of the class.
| Instance Properties | Description | 
|---|---|
| constructor | It is used to return the constructor function of Map. | 
| size | Return the number of keys, and value pairs stored in a map. | 
JavaScript Map Methods: JavaScript methods are actions that can be performed on objects.
- Instance Methods: If the method is called on the instance of a Map then it is called an instance method of Map.
| Static Methods | Description | 
|---|---|
| clear( ) | Removal of all the elements from a map and making it empty. | 
| delete() | Delete the specified element among all the elements which are present in the map. | 
| entries( ) | Returning an iterator object which contains all the [key, value] pairs of each element of the map. | 
| forEach() | The map with the given function executes the given function over each key-value pair. | 
| get( ) | Returning a specific element among all the elements which are present in a map. | 
| has( ) | Check whether an element with a specified key exists in a map or not. | 
| keys() | The keys from a given map object return the iterator object of keys. | 
| set() | Add key-value pairs to a Map object. | 
| values() | Return a new Iterator object that contains the value of each element present in Map. |

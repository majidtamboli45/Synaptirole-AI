# JavaScript TypeError

> Source: https://www.geeksforgeeks.org/javascript/javascript-typeerror-invalid-array-prototype-sort-argument/

This JavaScript exception invalid Array.prototype.sort argument occurs if the parameter of Array.prototype.sort() is not from either undefined or a function which sorts accordingly.
Message:
TypeError: argument is not a function object (Edge)
TypeError: invalid Array.prototype.sort argument (Firefox)
Error Type:
TypeError
Cause of the Error: The argument is passed to the sort() method should be either undefined or a function which compares its operands.
Example 1: In this example, argument passed to sort() method is not expected, So the error has occurred.
[2, 5, 6, 1, 3].sort(3); // error here
Output:
TypeError: argument is not a function object
Example 2: In this example, argument passed to sort() method is not expected, So the error has occurred.
let compareFun = {
    Asc: (a, b) => a >= b,
    Dsc: (a, b) => a <= b
};
// TypeError
[1, 2, 3, 6, 5, 8].sort(
    compareFun[this.key] || 'Asc');
Output:
TypeError: argument is not a function object

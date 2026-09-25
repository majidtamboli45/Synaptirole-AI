# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/javascript/lodash/

Lodash is a JavaScript library that works on the top of underscore.js. It helps in working with arrays, strings, objects, numbers, etc. It provides us with various inbuilt functions and uses a functional programming approach which that coding in JavaScript easier to understand because instead of writing repetitive functions, tasks can be accomplished with a single line of code. It also makes it easier to work with objects in JavaScript if they require a lot of manipulation to be done on them.
Why Lodash?
It provides various inbuilt functions for collections, arrays, manipulated objects, and other utility methods that we can use directly instead of writing them from scratch. It makes it easier to iterate over the arrays, strings as well as objects. Its modular methods make the creation of composite functions easier.
What is Lodash npm ?
The Lodash npm is used to install and import Lodash library using npm module. The command for installation of Lodash using npm module is - npm i lodash 
How to Install Lodash ?
Lodash library can be used directly using the CDN link or can be installed using npm or yarn.
Using CDN Link
We can directly use the file in the browser. Go to the official documentation and copy the lodash.min.js file CDN link and paste this link inside the head section.
<script type="text/JavaScript" src = "https://cdn.jsdelivr.net/npm/lodash@4.17.20/lodash.min.js"></script> 
Installation using npm
We can install Lodash with npm. Make sure that you have Node.js and npm installed.
npm install lodash
If you are using yarn then you can use the following command:
yarn install lodash
Now in order to use the Lodash library, you need to require it in the code file.
const _ = require("lodash"); Now let's understand how to use Lodash with the help of the code example.
Learn more about Lodash
Lodash Array Methods
Lodash provides a set of functions to manipulate arrays, including methods for sorting, slicing, filtering, and transforming arrays. These methods help in efficiently handling array operations.
Lodash Collection Methods
Collection methods allow you to work with arrays and objects as collections. They include functions for iterating, filtering, searching, and transforming data within collections, such as map, filter, and reduce.
Lodash Functions
Lodash includes utilities for function manipulation, like binding, currying, and delaying function executions. These methods are useful for optimizing and controlling function behavior.
Lodash Lang Methods
Lang methods deal with data types, type checking, and value manipulation. They include utilities for cloning, comparing, and transforming various data types like objects, arrays, and strings.
Lodash Math Methods
Lodash provides basic math operations like addition, subtraction, rounding, and generating random numbers. These methods simplify mathematical calculations in JavaScript.
Lodash Object Methods
Object methods focus on manipulating and extracting properties from objects. They provide functionalities like deep cloning, merging, assigning, and transforming object properties.
Lodash Seq Methods
Seq methods enable chaining in Lodash, allowing multiple operations to be performed sequentially. They make it easier to build a sequence of transformations and computations.
Lodash String Methods
String methods cover tasks like case conversion, trimming, splitting, and formatting strings. They offer a consistent and easy-to-use API for string manipulation.
Lodash Util Methods
Utility methods provide various helpful functionalities like creating unique IDs, generating placeholders, and defining constants. They are miscellaneous helpers that simplify coding tasks.
How do I use Lodash in Node.js?
You can use Lodash in Node.js by installing it via npm and then requiring it in your script:
const _ = require('lodash');

# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/javascript/moment-js/

Moment.js is a JavaScript package that makes it simple to parse, validate, manipulate, and display date/time in JavaScript. It allows you to display dates in a human-readable way based on your location. It can be used in a browser using the script approach. Moment.js is also compatible with Node.js and can be installed via npm.
Why Moment.js?
You may find numerous simple ways to add, subtract, validate dates, retrieve the maximum and minimum dates, and so on in Moment.js. It's an open-source project, so you can easily contribute to it, and the add functionality in the form of plugins. You can parse the date into the desired format using parsing. We can also perform date validation.
Steps to Install Moment.js
We can install it in the following two ways.
Method 1: Go to the official documentation of https://momentjs.com/ and download the latest moment.js file available and then add the link inside the script tag. Without downloading the file, you can also use the CDN link to run the code.
<script type="text/JavaScript" src="https://momentjs.com/downloads/moment.js"></script> 
Method 2: We can install it using npm. Make sure that you have Node.js and npm installed.
npm install moment
Example: In this example, we will get the current time in hours.
// Importing moment module
const moment = require('moment');
var a = moment().hours();
console.log("Hours is: ",a);
Run index.js file using below command
node index.js
Output:
Hours is:  22

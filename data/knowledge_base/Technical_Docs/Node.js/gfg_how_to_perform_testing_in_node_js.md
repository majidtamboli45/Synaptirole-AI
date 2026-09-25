# How to Perform Testing in Node.js ?

> Source: https://www.geeksforgeeks.org/node-js/how-to-perform-testing-in-node-js/

Testing is a method to check whether the functionality of an application is the same as expected or not. It helps to ensure that the output is the same as the required output.
How Testing can be done in Node.js?
There are various methods by which tasting can be done in Node.js, but one of the simpler & easy to implement method is using Mocha. Mocha is a testing framework for Node.js. We will also use Chai which is an assertion library.
Approach:
Step 1: Create a new folder, let's call it the mochatest.
Step 2: Locate this folder into the terminal & type the command
npm init -y
It initializes our application & makes a package.json file.
Step 3: Inside package.json, inside scripts, change the value of the test to mocha.
Step 4: Now, we have to create a Server File ( app.js ) & a folder called test, by default Mocha is looking for a test folder for test files. Inside this, we have to create one more file which is used for testing, let's call this appTest.js.
Step 5: Inside app.js, let's create and export a simple function that returns a string hello.
module.exports = function(){
    return 'hello';
} 
Step 6: Inside appTest.js, let's create the const assert to require the Chai library & also a const app to call the app.js's function.
const assert = require('chai').assert;
const app = require('../app');
Step 7: Now for the test, we have to use describe & pass two-parameter, the first is describe name let's call this App & second is a function. Inside this function, we are going to use it. Inside this, we have to put the description of what we want this to test, in this case, it may be app should return hello & the second parameter is a function. Inside this, we will use assert that we require from chai & we want to use its equal method & inside this the actual value we want to test. In this case, it is the app(), & the second parameter is what should it return, in this case, it should be hello.
const assert = require('chai').assert;
const app = require('../app');
describe('App', function(){
    it('app should return hello', function(){
        assert.equal(app(), 'hello');
    });
});
Step to run the application: Then inside the terminal, we have to type to test the code.
npm run test
Output:

# Testing with Jest

> Source: https://www.geeksforgeeks.org/javascript/testing-with-jest/

Jest is a powerful JavaScript testing framework developed by Facebook, mainly used for testing React applications but suitable for any JavaScript project. It is popular due to its ease of use, fast performance, and rich built-in functionality.
- Provides zero-configuration setup for most JavaScript projects.
- Includes features like snapshot testing, mocking, and code coverage.
- Runs tests quickly with a clear and developer-friendly output.
Setting Up Jest
To get started with Jest
1. Install Jest
Run the following command to install Jest as a dev dependency.
npm install --save-dev jest
If you are using React (Create React App), Jest comes pre-installed.
2. Add a Test Script in package.json
In your package.json file, modify the scripts section to include a test command.
Now, you can run tests using
npm test
Writing Your First Jest Test
Jest makes it easy to write tests for your functions. Below is a simple example of testing a basic function.
//sum.test.js
const add=require('./sum.js')
test('first test',()=>{
    expect(add()).toBe(5)
})
//sum.js
function sum(){
    return 2+3
}
module.exports=sum
Run the Tests
Now that Jest is installed and your test is written, run the tests using the following command. Each time this command will be used to run the test case.
npm run test
- The sum function simply returns the sum of two numbers.
- The test function defines the test, and expect(sum(1, 2)).toBe(3) checks if the result matches the expected value.
- The test will pass if the result is 3, otherwise, Jest will report a failure.
Testing Asynchronous Code
Jest makes it easy to test asynchronous functions using async/await or returning promises.
// fetchD.js
function fetchD() {
  return new Promise((resolve) => {
    setTimeout(() => resolve('Data loaded'), 1000);
  });
}
module.exports = fetchD;
// fetchD.test.js
const fetchData = require('./fetchData');
test('fetches data successfully', async () => {
  const data = await fetchData();
  expect(data).toBe('Data loaded');
});
- The fetchD function returns a promise that resolves after 1 second with the value 'Data loaded'.
- The await keyword waits for the promise to resolve, and the result is checked using expect().
Mocking in Jest
Jest provides built-in functionality to mock functions, helping to isolate tests.
// api.js
function API() {
  return 'Real data from API';
}
module.exports =API;
const API = require('./api');
jest.mock('./api');
test('mocked fetchDataFromAPI returns mocked data', () => {
  API.mockReturnValue('Mocked data'); 
  const data =API();
  expect(data).toBe('Mocked data');
});
- jest.mock('./api') is used to mock the API function from the api.js file.
- API.mockReturnValue('Mocked data') ensures that when the mocked function is called, it returns 'Mocked data' instead of its original value.
Practical Cases of Testing with jest
1. Testing a normal function in jest
A function is written and exported in one file, imported in the test file, and tested using Jest's test() and expect() functions.
//sum.test.js
const add=require('./sum.js')
test('first test',()=>{
    expect(add()).toBe(5)
})
//sum.js
function sum(){
    return 2+3
}
module.exports=sum
- The sum function returns 5 and is exported using module.exports.
- The result is tested in sum.test.js with test() and expect().
- The test is run using npm run test.
2. Testing a function with parameter's in jest
In this function we will test function with parameter's in a dynamic way.
//sum.js
function sum(a,b){
    return a+b
}
module.exports=sum
//sum.test.js
const add=require('./sum.js')
test('first test',()=>{
    expect(add(2,3)).not.toBe(3)
})
- The sum function returns the sum of its two parameters a and b.
- In sum.test.js, test() and expect() check if the result matches the expected value.
- The test is run using npm run test.
3. Testing a object in jest
Object's can also be checked with the use of toEqual() function in jest.
//sum.js
function sum(){
    return {name:"Pranjal"}
}
module.exports=sum
//sum.test.js
const add=require('./sum.js')
test('first test',()=>{
    expect(add()).toEqual({name:"Pranjal"})
})
- The sum function returns an object { name: "Pranjal" }.
- In sum.test.js, test() and expect() with toEqual() check if the returned object matches the expected value.
- The test passes if the values match, otherwise it fails.
4. Testing callback functions
To test callback functions, use Jest's test() with done, pass the callback, and call done() after the assertion.
//sum.js
function fetchData(cb)
{
    return cb('Hi')
}
module.exports=fetchData
//sum.test.js
const fetchData = require('./sum.js')
test('first test', (done) => {
    function callback(data) {
        try {
            expect(data).toBe('Hello')
            done()
        }
        catch (err) {
            done(err)
        }
    }
    fetchData(callback)
})
- The fetchData function in sum.js takes a callback and passes 'Hi' as a string.
- In sum.test.js, fetchData is imported, and the callback is tested with done to check if the data matches the expected value.
- The test passes if the data matches, otherwise it fails.
Reasons to Use Jest
- Zero Configuration: Works out of the box with minimal setup.
- Fast and Efficient: Runs tests in parallel for improved performance.
- Snapshot Testing: Helps track UI changes over time.
- Mocking Capabilities: Easily mocks functions, modules, and APIs.
- Code Coverage: Provides insights into untested parts of your code.

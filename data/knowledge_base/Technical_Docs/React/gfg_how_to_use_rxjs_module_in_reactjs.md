# How to use rxjs module in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-rxjs-module-in-reactjs/

RXJS stands for Reactive Extensions for JavaScript. This module provides the implementation of observable type to work with reactive programming which is an asynchronous programming paradigm. We can use the following approach in ReactJS to use the rxjs module.
Approach: We have used the Rxjs module to demonstrate how we can use it in our ReactJS application. We can create a user-defined printData function that has a range function starting from 1 to 50, and it filters the number whose modulo 2 is equal to 1 and maps it to multiply itself, and then we print the resulting number in our console screen. We have a button on the UI and if the user clicks, this printData function is called.
Prerequisites:
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install rxjs
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"rxjs": "^7.8.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file.
import React from 'react';
import { range } from "rxjs";
import { map, filter } from "rxjs/operators";
const printData = () => {
  range(1, 50).pipe(filter(x => x % 2 === 1),
               map(x => x * x))
    .subscribe((item) => {
      console.log("Item: ", item)
    });
}
export default function App() {
  return (
    <div style={{ display: 'block', 
                  width: 700, padding: 30 }}>
      <h4>RXJS Module</h4>
      <div style={{ width: 660, height: 'auto' }}>
        <button onClick={printData}>
          Call Function
        </button>
      </div>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000

# How to Perform Debouncing in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-perform-debouncing-in-reactjs/

Debouncing in react is used to limit the frequent executions. It is implemented using the lodash debounce method.
Debouncing in React
Debouncing in React is a technique used to limit the execution rate. It prevents excessive function calls for frequent events, like changing the input, and helps improve the performance.
Approach
To perform debouncing in react we will be using lodash debounce method. we will pass a function to it on which we want to apply debouncing.
Syntax:
// import the method
import debounce from "lodash";
// call the funtion
debounce(function, timeInMilliseconds,[options]);
Props:
- function: the function to debounce
- time: delay time in milliseconds, default is 0.
- options: optional arguments like leading, trailing, and maxWait.
Steps to Implement Debouncing in React
Step 1: Create a React application using the following command:
npx create-react-app react-debouncing    Step 2: After creating your project folder i.e. react-debouncing, move to it using the following command:
cd react-debouncing
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install lodash
Project Structure: It will look like the following.
The updated dependencies in the package.json file are:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"lodash": "^4.17.21",
"react": "^18.3.1",
"react-dom": "^18.3.1",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
},
Example: This example uses Lodash Debounce method to perform debouncing for input change in react.
// Filename - App.js
import React, { Component } from "react";
import { debounce } from "lodash";
class WidgetText extends Component {
    state = { text: "" };
    handleChange = (e) => {
        this.setState({ text: e.target.value });
    };
    render() {
        return (
            <div>
                <input onChange={this.handleChange} />
                <textarea value={this.state.text} />
            </div>
        );
    }
}
class App extends Component {
    state = { show: true };
    handleToggle = debounce(() => {
        this.setState(prevState => ({ show: !prevState.show }));
    }, 500);
    render() {
        return (
            <div>
                <button onClick={this.handleToggle}>Toggle</button>
                {this.state.show ? <WidgetText /> : null}
            </div>
        );
    }
}
export default App;
Explanation:
- Have a simple page with a toggle button, if we click it the input fields go away and click it again to get the input field back and if we type in the input box the text will immediately mirror in the text area below.
- We have a React WidgetText component, and it essentially just has the input and text area and then the app component itself has the toggle button.
- Conditionally so if we click the toggle button it will come in into the handler grab, the previous state look at it shows bool off of the state and flip it, So if it was true then it will render the WidgetText if it is false we do not render the WidgetText.
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Conclusion
To implement debouncing in react we have used lodash debounce method to handle the frequent input change.

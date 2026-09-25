# Purpose of render() in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/explain-the-purpose-of-render-in-reactjs/

Render in React JS is a fundamental part of class components. It is used to display the component on the UI returned as HTML or JSX components. The ReactDOM.render() function takes two arguments, HTML code and an HTML element.
Purpose of render()
- React renders HTML to the web page by using a function called render().
- The purpose of the function is to display the specified HTML code inside the specified HTML element.
- In the render() method, we can read props and state and return our JSX code to the root component of our app.
- In the render() method, we cannot change the state, and we cannot cause side effects( such as making an HTTP request to the webserver).
Let's understand the render function with an example.
Steps to create React Application
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Project Structure:
Example: Render funtion display the html on the UI as given in App.js file.
import React, { Component } from "react";
export default class App extends Component {
    state = {
        PawriDays: [
            { id: "123s", Day: "Monday" },
            { id: "234r", Day: "Saturday" },
            { id: "12d5", Day: "Sunday" },
        ],
    };
    render() {
        const PartyDays = this.state.PawriDays.length;
        const style = {
            textAlign: "center",
            color: "green",
        };
        // Return JSX code
        return (
            <div style={style}>
                <h1>I am User</h1>
                <p> We party: {PartyDays} days a week </p>
            </div>
        );
    }
}
Step to Run Application: Run the application using the following command from the root directory of the project
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output

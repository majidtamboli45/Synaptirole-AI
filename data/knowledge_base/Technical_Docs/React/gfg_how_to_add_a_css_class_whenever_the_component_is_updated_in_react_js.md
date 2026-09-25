# How to add a CSS class whenever the component is updated in React JS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-add-a-css-class-whenever-the-component-is-updated-in-reactjs/

In this article, we will learn how to add a CSS class conditionally in React JS. If we want to update/add a CSS class when the component is updated or the state/props of components change then we have to conditionally apply the CSS based on the state/props value.
Syntax of adding CSS classes conditionally:
 <div className={`box ${flag === false ? "" : "hidden"}`}>
The class hidden will be applied when the value of the flag is true otherwise only the box CSS class will be applied.
Approach to add CSS when Component is Updated:
- Setting Initial State: At the beginning, the React app establishes a state with a flag initially set to true.
- Toggle Function Execution: When the button is clicked, the app runs a function called handleUpdate , flipping the flag between true and false.
- Rendering with Conditions: The visibility of the box relies on the flag's status. If the flag is false, the "hidden" class is used to make the box vanish, and if true, it stays visible.
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: As we can see from the below output the box will disappear when the CSS class hidden will be added to the HTML element based on the updated value of the state.
import React, { Component } from 'react';
import styles from './index.css';
class App extends Component {
    state = {
        flag: true
    };
    handleUpdate = () => {
        this.setState(
            prevstate =>
                ({ flag: !prevstate.flag })
        );
    };
    render() {
        const flag = this.state.flag;
        return (
            <div>
                <button
                    onClick={this.handleUpdate}>
                    Show Box
                </button>
                <div className=
                    {
                        `box ${flag
                            === false ?
                            "" :
                            "hidden"}`
                    }>
                    <p>click on button to hide and show the box</p>
                </div>
            </div>
        );
    }
}
export default App;
.box {
    width: 100px;
    height: 200;
    padding: 20px;
    border: 1px solid black;
}
.hidden {
    display: none;
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000

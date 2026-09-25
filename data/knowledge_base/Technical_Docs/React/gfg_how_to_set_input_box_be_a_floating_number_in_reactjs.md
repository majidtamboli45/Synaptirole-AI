# How to set input box to be a floating number in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-set-input-box-to-be-a-floating-number-in-reactjs/

When working with forms in ReactJS, you may encounter scenarios where you need to accept floating-point numbers as input from users. We will set an input box to accept floating numbers in ReactJS and handle the validation of the entered values.
Prerequisites
Approach
If we want to set the input box to be a floating number then we can use the step attribute of the input tag. We have to set the input type as the number and step value by which we want to increase/decrease the floating number.
Steps to create React Application
Step 1: Create a React application using the following command
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example implements input box for a floating number input.
import React from "react";
class App extends React.Component {
    state = {
        value: 10,
    };
    onValueChange = (event) => {
        this.setState({ value: event.target.value });
    };
    render() {
        return (
            <div
                style={{
                    textAlign: "center",
                    margin: "auto",
                }}
            >
                <h1 style={{ color: "green" }}>
                    GeeksforGeeks
                </h1>
                <h3>
                    React Example for Input Box with floatin
                    number
                </h3>
                <label> Floating Number: </label>
                <input
                    type="number"
                    step="0.1"
                    min="0"
                    max="20"
                    value={this.state.value}
                    onChange={(event) =>
                        this.onValueChange(event)
                    }
                />
                <h4>
                    Current input value is
                    {this.state.value}
                </h4>
            </div>
        );
    }
}
export default App;
Step to Run the App: use this command in the terminal in the project dirctory.
npm start
Output: This output will be visible on the http://localhost:3000/ on the browser window.

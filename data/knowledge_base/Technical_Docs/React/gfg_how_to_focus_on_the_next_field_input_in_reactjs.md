# How to focus on the next field input in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-focus-on-the-next-field-input-in-reactjs/

To focus on the next field input in ReactJS when the current input field reaches its max character capacity, we have to find the next input HTML element and make it focus.
Prerequisites:
Approach:
To focus on the next input field we will switch the focus to some event. Each time the user types in the current text field, we have to check whether the field has a maximum character that is specified. If yes, then we have to focus on the text input field. We can use focus() function to focus the particular input field.
Steps to Create React Application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder, i.e., foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example uses handleChange function to check the input lengeth and change the focus to next input.
// Filename - App.js
import React from "react";
class App extends React.Component {
    render() {
        return (
            <div>
                <InputFields></InputFields>
            </div>
        );
    }
}
class InputFields extends React.Component {
    handleChange = (e) => {
        const { maxLength, value, name } = e.target;
        const [fieldName, fieldIndex] = name.split("-");
        let fieldIntIndex = parseInt(fieldIndex, 10);
        // Check if no of char in field == maxlength
        if (value.length >= maxLength) {
            // It should not be last input field
            if (fieldIntIndex < 3) {
                // Get the next input field using it's name
                const nextfield = document.querySelector(
                    `input[name=field-${fieldIntIndex + 1}]`
                );
                // If found, focus the next field
                if (nextfield !== null) {
                    nextfield.focus();
                }
            }
        }
    };
    render() {
        return (
            <div style={{ padding: 30 }}>
                <InputFild name="field-1" length="3"
                    handleChange={this.handleChange} />
                <InputFild name="field-2" length="4"
                    handleChange={this.handleChange} />
                <InputFild name="field-3" length="3"
                    handleChange={this.handleChange} />
            </div>
        );
    }
}
class InputFild extends React.Component {
    render() {
        return (
            <input
                style={{ margin: 10 }}
                type="text"
                name={this.props.name}
                maxLength={this.props.length}
                onChange={this.props.handleChange}
            ></input>
        );
    }
}
export default App;
Steps to Run the Application: Use this command in the terminal inside the project directory.
npm start
Output: This output will be visible on http://localhost/3000 on the browser window.

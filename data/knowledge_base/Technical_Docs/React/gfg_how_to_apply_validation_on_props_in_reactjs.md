# How to apply validation on Props in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-apply-validation-on-props-in-reactjs/

Need of Validating Props in React JS Props are used to pass the read-only attributes to React components. For the proper functioning of components and to avoid future bugs and glitches it is necessary that props are passed correctly. Hence, it is required to use props validation to improve the react component's performance.
Prerequisites:
Syntax: The syntax to use propTypes is shown below.
class Component extends React.Component {
render() {}
}
Component.propTypes = {/* definition goes here*/};
Validators: The propTypes object contains a list of validators for basic data types, some of them are:
- PropTypes.any : This means the prop can be of any data type.
- PropTypes.bool: This means the prop should be a boolean.
- PropTypes.number: This means the prop should be a number.
- PropTypes.string: This means the prop should be a string.
- PropTypes.func: This means the prop should be a function.
- PropTypes.array: This means the prop should be an array.
- PropTypes.object: This means the prop should be an object.
- PropTypes.symbol: This means the prop should be a symbol.
- PropTypes.instanceOf: This means the prop should be an instance of a particular JavaScript class.
- PropTypes.isRequired: This means the prop should be provided.
- PropTypes.oneOf(): This means the props should be one of several types of specified values.
- PropTypes.element: This means the props must be an element.
Steps to Create the React Application And Installing Module:
Step 1: Create a React application by typing the following command in the terminal:
npx create-react-app PropValidation
Step 2: After creating your project folder i.e. PropValidation, move to it using the following command:
cd PropValidation
Step 3: After creating the ReactJS application, Install the required modules using the following command.
npm install prop-types
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"prop-types": "^15.8.1",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code. Here we have defined the props types for our component as well as the default props.
import React from 'react';
import PropTypes from 'prop-types';
class App extends React.Component {
    render() {
        return (
            <div>
                <h1>Welcome to GFG!!</h1>
                <h2>ReactJS Props validation example</h2>
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Value</th>
                        <th>Valid</th>
                    </tr>
                    <tr>
                        <td>Array</td>
                        <td>{this.props.propArray}</td>
                        <td>{this.props.propArray ? "true" : "False"}</td>
                    </tr>
                    <tr>
                        <td>Boolean</td>
                        <td>{this.props.propBool ? "true" : "False"}</td>
                        <td>{this.props.propBool ? "true" : "False"}</td>
                    </tr>
                    <tr>
                        <td>Function</td>
                        <td>{this.props.propFunc(5)}</td>
                        <td>{this.props.propFunc(5) ? "true" : "False"}</td>
                    </tr>
                    <tr>
                        <td>String</td>
                        <td>{this.props.propString}</td>
                        <td>{this.props.propString ? "true" : "False"}</td>
                    </tr>
                    <tr>
                        <td>Number</td>
                        <td>{this.props.propNumber}</td>
                        <td>{this.props.propNumber ? "true" : "False"}</td>
                    </tr>
                </table>
            </div>
        );
    }
}
// Prop types for our Component
App.propTypes = {
    propArray: PropTypes.array.isRequired,
    propBool: PropTypes.bool.isRequired,
    propFunc: PropTypes.func,
    propNumber: PropTypes.number,
    propString: PropTypes.string,
}
// Default Props for our Component
App.defaultProps = {
    propArray: [1, 2, 3, 4, 5],
    propBool: true,
    propFunc: function (x) { return x * 10 },
    propNumber: 1,
    propString: "GFG",
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000:

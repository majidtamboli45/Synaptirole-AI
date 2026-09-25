# Create a Password Validator using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-password-validator-using-reactjs/

Password must be strong so that hackers can not hack them easily. The following example shows how to check the password strength of the user input password in ReactJS. We will use the validator module to achieve this functionality. We will call the isStrongPassword function and pass the conditions as its parameters.
Let us have a look at how the final project will look like
Prerequisites:
Creating React Application And Installing Module:
Step 1: Create a React application using the following command
npm create vite@latest foldername --template react
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the validator module using the following command:
npm install validator
Project Structure: It will look like the following.
The updated dependencies in package.json will look like:
package.json:
"dependencies": {
"@vitejs/plugin-react": "^1.0.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"validator": "^13.9.0"
}
App.js: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React, { useState } from "react";
import validator from 'validator'
const App = () => {
    const [errorMessage, setErrorMessage] = useState('')
    const validate = (value) => {
        if (validator.isStrongPassword(value, {
            minLength: 8, minLowercase: 1,
            minUppercase: 1, minNumbers: 1, minSymbols: 1
        })) {
            setErrorMessage('Is Strong Password')
        } else {
            setErrorMessage('Is Not Strong Password')
        }
    }
    return (
        <div style={{
            marginLeft: '200px',
        }}>
            <pre>
                <h2>Checking Password Strength in ReactJS</h2>
                <span>Enter Password: </span><input type="text"
                    onChange={(e) => validate(e.target.value)}></input> <br />
                {errorMessage === '' ? null :
                    <span style={{
                        fontWeight: 'bold',
                        color: 'red',
                    }}>{errorMessage}</span>}
            </pre>
        </div>
    );
}
export default App
Step to Run Application: Run the application using the following command from the root directory of the project:
npm run dev
Output:

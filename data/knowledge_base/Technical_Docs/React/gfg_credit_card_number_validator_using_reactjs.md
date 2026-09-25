# Credit Card Number Validator using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/credit-card-number-validator-using-reactjs/

Credit card validation is an important step in every application in order to authenticate the user's credit card number so that the application can proceed to the payment process if needed. It can be achieved using the validator module in ReactJS. The following example shows how to validate the user entered credit card number and check whether it is valid or not using the npm module in the ReactJS application.
Let us take a look at how the final application will look like:
Prerequisites:
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npm create vite@latest creditcardvalidatedemo --template react
Step 2: Move to the project folder using the following command:
cd creditcardvalidatedemo
Step 3: After creating the ReactJS application, Install the validator module using the following command:
npm install validator
Project Structure: It will look like the following
The updated dependencies in package.json will look like:
package.json:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"validator": "^13.9.0",
"vite": "^4.0.0"
}
Example: Write the following code in the respective file
- App.js: App is our default component where we have written our code to validate credit card numbers with basic UI.
// App.js
import React, { useState } from "react";
import validator from 'validator'
const App = () => {
  const [errorMessage, setErrorMessage] = useState('')
  
  const validateCreditCard = (value) => {
  
    if (validator.isCreditCard(value)) {
      setErrorMessage('Valid CreditCard Number')
    } else {
      setErrorMessage('Enter valid CreditCard Number!')
    }
  }
  return (
    <div style={{
      marginLeft: '200px',
    }}>
      <pre>
        <h2>Validating CreditCard in ReactJS</h2>
        <span>Enter CreditCard: </span><input type="text" 
        onChange={(e) => validateCreditCard(e.target.value)}></input> <br />
        <span style={{
          fontWeight: 'bold',
          color: 'red',
        }}>{errorMessage}</span>
      </pre>
    </div>
  );
}
export default App
Step to Run Application:
- Run the application using the following command
npm run dev
- Open the web browser and type the following URL
http://localhost:5173/
Output:

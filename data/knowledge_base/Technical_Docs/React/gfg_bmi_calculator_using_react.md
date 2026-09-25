# BMI Calculator Using React

> Source: https://www.geeksforgeeks.org/reactjs/bmi-calculator-using-react/

In this article, we will create a BMI Calculator application using the ReactJS framework. A BMI calculator determines the relationship between a person's height and weight. It provides a numerical value that categorizes the individual as underweight, normal weight, overweight, or obese.
Output Preview: Let us have a look at how the final output will look like.
Technologies Used/Pre-requisites:
Approach:
- Create a new React app using npx create-react-app bmi-calculator.
- Create a new file named BmiCalculator.js in the src directory.
- Use a functional component for the BMI calculator.
- We will Use React’s useState to handle input values (height, weight), the calculated BMI, and the BMI category.
- Convert height from centimeters to meters and apply the BMI formula: BMI = weight / (height * height).
- Set the BMI state with the calculated value.
- Determine BMI categories (e.g., Underweight, Normal weight, Overweight, Obesity) based on the calculated BMI.
- Display the BMI result and category.
Steps to create the application:
Step 1: Set up React project using the below command in VSCode IDE.
npm create vite@latest bmi-calculator --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd bmi-calculator
Step 3: Insert the below code in the App.js and styles/App.css files mentioned in the above directory structure.
Project Structure:
The dependencies in package.json will look like this:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "^4.0.3",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example: Write following code in respective files(The name of the files is mentioned in the first line of each code block.
/* BmiCalculator.css */
.container {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
  }
  
  h1 {
    color: #333;
  }
  
  .input-group {
    margin: 10px 0;
  }
  
  .input-group label {
    font-size: 16px;
    color: #555;
    display: block;
    margin-bottom: 5px;
  }
  
  .input-group input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    width: calc(100% - 22px);
    box-sizing: border-box;
  }
  
  button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
  }
  
  button:hover {
    background-color: #0056b3;
  }
  
  .result {
    margin-top: 20px;
    color: #333;
  }
  
// App.js
import React from 'react';
import BmiCalculator from './BmiCalculator';
import './App.css';
function App() {
  return (
    <div className="App">
      <BmiCalculator />
    </div>
  );
}
export default App;
// BmiCalculator.js
import React, { useState } from 'react';
import './BmiCalculator.css';
const BmiCalculator = () => {
  const [weight, setWeight] = useState('');
  const [height, setHeight] = useState('');
  const [bmi, setBmi] = useState(null);
  const [status, setStatus] = useState('');
  const calculateBMI = () => {
    if (!weight || !height) {
      alert('Please enter both weight and height!');
      return;
    }
    const heightInMeters = parseFloat(height) / 100;
    const bmiValue = (parseFloat(weight) / (heightInMeters * heightInMeters)).toFixed(2);
    setBmi(bmiValue);
    let bmiStatus = '';
    if (bmiValue < 18.5) {
      bmiStatus = 'Underweight';
    } else if (bmiValue < 24.9) {
      bmiStatus = 'Normal weight';
    } else if (bmiValue < 29.9) {
      bmiStatus = 'Overweight';
    } else {
      bmiStatus = 'Obesity';
    }
    setStatus(bmiStatus);
  };
  return (
    <div className='container'>
      <h1>BMI Calculator</h1>
      <div className='input-group'>
        <label>
          Weight (kg):
          <input
            type="number"
            value={weight}
            onChange={(e) => setWeight(e.target.value)}
            placeholder='Enter your weight'
          />
        </label>
      </div>
      <div className='input-group'>
        <label>
          Height (cm):
          <input
            type="number"
            value={height}
            onChange={(e) => setHeight(e.target.value)}
            placeholder='Enter your height'
          />
        </label>
      </div>
      <button onClick={calculateBMI}>Calculate</button>
      {bmi && (
        <div className='result'>
          <h3>Your BMI: {bmi}</h3>
          <h3>Status: {status}</h3>
        </div>
      )}
    </div>
  );
};
export default BmiCalculator;
Steps to run the application:
1. Type the following command in the terminal from your VS Code IDE.
npm start
2. Open the web browser and type the following URL in the address bar, to see the live application.
http://localhost:3000/
Output:

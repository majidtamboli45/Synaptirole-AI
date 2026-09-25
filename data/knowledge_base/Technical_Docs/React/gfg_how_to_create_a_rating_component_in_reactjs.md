# How to create a rating component in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-rating-component-in-reactjs/

Creating a rating component in React application allows user to register their review and rate the items using clickable stars. Using a custom rating component enhances the UI and experience of users.
Prerequisite:
- Basic knowledge of npm or yarn.
- styled-components.
- Basic Knowledge of useState React hooks.
Approach
To create a Rating component in React we will use the react-icons and styled-components libraries. Import the star icons from react icons and add the styles using styled-components. Implement the rating logic to style the stars in click and display the provided rating.
Steps to create React App and Install required modules
Step 1: Initialize React Project
You will start a new project using create-react-app command.
npx create-react-app react-rating
Step 2: Switch to Project Directory
Now go to your react-rating folder by typing the given command in the terminal.
cd react-rating
Step 3: Install Required Packages
Install the dependencies required in this project by typing the given command in the terminal.
npm install --save styled-components
npm install --save react-icons
Now create the components folder in src then go to the components folder and create two files Rating.js and RatingStyles.js.
Project Structure:
The updated dependencies in package.json file are:
"dependencies": {
"@testing-library/jest-dom": "^5.11.4",
"@testing-library/react": "^11.1.0",
"@testing-library/user-event": "^12.1.10",
"react": "^18.0.0",
"react-dom": "^18.0.0",
"react-scripts": "5.0.0",
"styled-components": "^5.3.10",
"react-icons": "^4.10.1,
"web-vitals": "^1.0.1"
},
Example: In this example, we will design a rating component, for that we will need to manipulate the App.js file and other created components file.
// Filename - components/Rating.js
import React, { useState } from "react";
import { FaStar } from "react-icons/fa";
import { Container, Radio, Rating } from "./RatingStyles";
const Rate = () => {
    const [rate, setRate] = useState(0);
    return (
        <Container>
            {[...Array(5)].map((item, index) => {
                const givenRating = index + 1;
                return (
                    <label>
                        <Radio
                            type="radio"
                            value={givenRating}
                            onClick={() => {
                                setRate(givenRating);
                                alert(
                                    `Are you sure you want to give 
                                    ${givenRating} stars ?`
                                );
                            }}
                        />
                        <Rating>
                            <FaStar
                                color={
                                    givenRating < rate || givenRating === rate
                                        ? "000"
                                        : "rgb(192,192,192)"
                                }
                            />
                        </Rating>
                    </label>
                );
            })}
        </Container>
    );
};
export default Rate;
// Filename - components/RatingStyles.js
import styled from 'styled-components';
export const Container = styled.div`
   display: flex;
   justify-content: center;
   align-items: center;
   min-height: 60vh;
   font-size: 60px;
`
export const Radio = styled.input`
   display: none;
`
export const Rating = styled.div`
   cursor: pointer;
`
// Filename - App.js
import './App.css';
import Rating from './components/Rating';
function App() {
    return (
        <Rating />
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:

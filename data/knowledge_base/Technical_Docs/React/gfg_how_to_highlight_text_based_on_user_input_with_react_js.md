# How to highlight text based on user input with React.js ?

> Source: https://www.geeksforgeeks.org/reactjs/npm-install-save-styled-components/

One common feature in many applications is the ability to highlight specific portions of text based on user input. In this article, we will explore how to implement text highlighting functionality using React.js.
The following approach covers how to highlight text input given by users in ReactJS. It is a simple effect you can add to any ReactJS website.
Prerequisite:
Steps to Create React Application:
Step 1: Initialize new react project using this command in the terminal
npx create-react-app react-highlight-text
Step 2: Move to the project directory.
cd react-highlight-text
Step 3: Install the dependencies required in this project by typing the given command in the terminal:
npm i --save styled-components
Project Structure:
The updated dependencies in package.json file will look like.
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"styled-components": "^6.1.1",
"web-vitals": "^2.1.4
}
Example: This example implements highlighted text based on user input using the onchange event.
// Filename - App.js
import React, { useState } from "react";
import {
    InputContainer,
    Input,
    InputHighlighter,
    Heading,
} from "./AppStyles";
const App = () => {
    const [input, setInput] = useState("");
    const toggleInput = (e) => {
        setInput(e.target.value);
    };
    return (
        <InputContainer>
            <Heading>GeeksforGeeks</Heading>
            <Input
                onChange={toggleInput}
                placeholder="Type your name"
                value={input}
            />
            <InputHighlighter>{input}</InputHighlighter>
        </InputContainer>
    );
};
export default App;
// Filename - AppStyles.js
import styled from "styled-components";
export const InputContainer = styled.div`
    width: 600px;
    margin: 40px auto;
    position: relative;
`;
export const Heading = styled.h1`
    text-align: center;
    color: green;
`;
export const Input = styled.input`
    height: 70px;
    width: 100%;
    padding: 0;
    font-size: 35px;
    border: none;
    outline: none;
    border-bottom: 4px solid rgba(192, 192, 192);
`;
export const InputHighlighter = styled.span`
    font-size: 35px;
    border-top: 4px solid green;
    position: absolute;
    left: 0;
    bottom: 0;
    height: 0;
    overflow: hidden;
`;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output. See how borderline increases when we enter a text and starts decreasing when we remove the characters one by one.

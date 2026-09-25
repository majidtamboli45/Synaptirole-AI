# How To Copy Text To The Clipboard In ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-copy-text-to-the-clipboard-in-react-js/

In ReactJS, you can copy text to the clipboard using two methods. One way is to use the copy-to-clipboard package, which provides a simple copy() function to handle the task. Alternatively, you can use the browser's built-in window.navigator.clipboard.writeText() method, which copies text to the clipboard directly by calling navigator.clipboard.writeText('your text'). Both methods make it easy to copy text efficiently in your React applications.
Prerequisites
Below are 2 approaches mentioned to copy text to the clipboard using React:
Steps To Copy Text to the Clipboard
Step 1: Create React Project using the following command.
npm create-react-app react-copy-text
cd react-copy-text
Step 2: Install there required dependencies.
npm i --save styled-components copy-to-clipboard
Project Structure
Dependencies
dependencies": {
    "@testing-library/jest-dom": "^5.17.0",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "copy-to-clipboard": "^3.3.3",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "styled-components": "^6.0.9",
    "web-vitals": "^2.1.4"
}
Approach 1: Using copy-to-clipboard
To copy text to the clipboard in React we will use the NPM package copy-to-clipboard which enables the copying of any text from the input box or value stored in any component.
Example: Created to input box and link the first input box value to a useState hook instance. Pass this value in teh copy method that trrigers when the given button is clicked.
// Filename - App.js
import Clipboard from "./components/Clipboard.js";
function App() {
    return <Clipboard />;
}   
export default App;
//Filename - components/Clipboard.js
import React, { useState } from "react";
import copy from "copy-to-clipboard";
import {
    Heading,
    Input1,
    Input2,
    Container,
    Button,
} from "./Styles";
const Clipboard = () => {
    const [copyText, setCopyText] = useState("");
    const handleCopyText = (e) => {
        setCopyText(e.target.value);
    };
    const copyToClipboard = () => {
        copy(copyText);
        alert(`You have copied "${copyText}"`);
    };
    return (
        <div>
            <Heading>GeeksforGeeks </Heading>
            <Container>
                <h2> Copy To Clipboard in React JS</h2>
                <Input1
                    type="text"
                    value={copyText}
                    onChange={handleCopyText}
                    placeholder="Enter the text you want to copy"
                />
                <Button onClick={copyToClipboard}>
                    Copy to Clipboard
                </Button>
                <Input2
                    type="text"
                    placeholder="Enter the text you have copied"
                />
            </Container>
        </div>
    );
};
export default Clipboard;
// Filename - Styles.js
import styled from "styled-components";
export const Container = styled.div`
    padding: 2%;
    max-width: 600px;
    margin: 40px auto;
    position: relative;
    text-align: center;
`;
export const Heading = styled.h1`
    text-align: center;
    color: green;
    font-size: 40px;
`;
export const Input1 = styled.input`
    height: 50px;
    width: 80%;
    padding: 0;
    font-size: 25px;
    border-radius: 5px;
`;
export const Input2 = styled.input`
    height: 50px;
    width: 80%;
    padding: 0;
    font-size: 25px;
    margin-top: 50px;
    border-radius: 5px;
`;
export const Button = styled.button`
    padding: 10px;
    font-size: 20px;
    position: relative;
    // left: 30%;
    margin-top: 10px;
    cursor: pointer;
    color: white;
    background-color: green;
    border-radius: 10px;
`;
To start the application run the following command.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Approach 2: Using window.navigator.clipbord method
We will be using the navigator property from window global object to make the text copy to clipboard.
Example: This approach includes the use of window.navigator.clipboard.writeText method to write the data. The value in the textbox will be copied to clipboard when the button is clicked.
/* Filename - App.css */ 
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.App {
    width: 100%;
    max-width: 90%;
    margin: auto;
    text-align: center;
}
.geeks {
    text-align: center;
    color: green;
    font-size: 40px;
}
textarea {
    height: 50px;
    width: 80%;
    padding: 0;
    font-size: 25px;
    border-radius: 5px;
    margin: auto;
    margin-top: 2%;
}
button {
    margin: 2%;
    padding: 10px;
    font-size: 20px;
    position: relative;
    /* // left: 30%; */
    margin-top: 50px;
    cursor: pointer;
    color: white;
    background-color: green;
    border-radius: 10px;
}
// Filename - App.js
import Clipboard from "./components/Clipboard.js";
import "./App.css";
function App() {
    return <Clipboard />;
}
export default App;
//Filename - components/Clipboard.js
import React, { useState } from "react";
const Clipboard = () => {
    const [text, setText] = useState(
        "Add text you want to copy"
    );
    const handleCopyClick = async () => {
        try {
            await window.navigator.clipboard.writeText(text);
            alert("Copied to clipboard!");
        } catch (err) {
            console.error(
                "Unable to copy to clipboard.",
                err
            );
            alert("Copy to clipboard failed.");
        }
    };
    return (
        <div className="App">
            <h1 className="geeks">GeeksforGeeks</h1>
            <textarea
                value={text}
                onChange={(e) => setText(e.target.value)}
            />
            <br />
            <button onClick={handleCopyClick}>
                Copy to Clipboard
            </button>
            <textarea />
        </div>
    );
};
export default Clipboard;
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:

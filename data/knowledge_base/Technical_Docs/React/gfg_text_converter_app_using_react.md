# Text Converter App Using React

> Source: https://www.geeksforgeeks.org/reactjs/text-converter-app-using-react/

Text Converter application using React JS uses class components to create the application and Our focus will extend beyond mere functionality, as we'll enhance the user interface using a combination of custom and bootstrap styling. In this application user types the text in the block and converts the text according to the user's need.
Output Preview: Let us have a look at how the final output will look like.
Features of Text Converter App:
- Converted text to Upper Case.
- Converted text to lowercase.
- Clear Text
- Copy to Clipboard
- Clear Space
- Reverse the Sentence/word
Steps to create the Text Converter App:
Step 1: Create the project file using command.
npm create vite@latest TextConverter --template react
Step 2: Navigate to the folder using the command
cd  TextConverter
Step 3: Install required dependencies
Install the required dependencies using npm or yarn. For this tutorial, we’ll use npm:
npm install
Step 4: Create a folder named components in src file and create new files Nabvar.js, Alert.js, and TextForm.js
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"bootstrap": "^5.3.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-router-dom": "^6.21.1",
"vite": "^4.0.0"
}
Approach to create Text Converter App:
- App.js: This is our main file where all the logic for a text utility tool with a toggleable light/dark mode. The main functionality is contained within the toggleMode function, and the state of the application (mode and alerts) is managed using React's useState hook.
- Navbar.js: The Navbar component creates a Bootstrap navigation bar with dynamic styling based on the mode passed as a prop. It also includes a dark mode switch and enforces props types for the title. If no title is provided, a default title is set.
- Alert.js: The Alert component renders a dynamic alert message based on the type and message received as props. The alert type is capitalized using the capital helper function, and the alert is displayed with dynamic styling based on its type. The component also has a fixed height of 30 pixels.
- TextForm.js: The TextForm component provides a user interface for text manipulation, allowing users to convert text case, clear, copy, reverse words or sentences, and view a summary and preview of the entered text. The component maintains the state of the entered text using the useState hook.
Example: Below is the code example for the above explained approach:
// App.js
import './App.css';
import Navbar from './Components/Navbar';
import TextForm from './Components/TextForm';
import React, { useState } from 'react'
import Alert from './Components/Alert';
function App() {
    // < !--Using the React hook for 
    // the dark Mode functionality-- >
    const [mode, setMode] = useState('light');
    const [attension, setAttension] = useState(null)
    const showAlert =
        (message, type) => {
            setAttension({
                msg: message,
                type: type
            });
            setTimeout(() => {
                setAttension(null);
            }, 2000);
        }
    //   < !--Enable the dark mode-- >
    const toggleMode = () => {
        if (mode === 'light') {
            setMode('dark');
            document.body
                .style.backgroundColor = 
                    'rgb(110 118 131)';
            showAlert("Dark Mode", "success");
        } else {
            setMode('light')
            document.body
                .style.backgroundColor = 'white';
            showAlert("Light Mode", "success");
        }
    }
    return (
        <>
            <Navbar title="TextConverter"
                mode={mode}
                toggleMode={toggleMode} />
            <Alert attension={attension} />
            <div className="container my-3">
                {
                    <TextForm showAlert={showAlert}
                        heading="Enter the text to analyze below"
                        mode={mode} />
                }
            </div>
        </>
    );
}
export default App;
// TextForm.js
import React, { useState } from 'react'
export default function TextForm(props) {
    const ManageUpClick =
        () => {
            let newElement =
                word.toUpperCase();
            setWord(newElement);
            props.showAlert(
                "Converted to UpperCase",
                "success"
            );
        }
    const ManageLoClick =
        () => {
            let newElement =
                word.toLowerCase();
            setWord(newElement);
            props.showAlert(
                "Converted to LowerCase",
                "success"
            );
        }
    const ManageAllClick =
        () => {
            let newElement = '';
            setWord(newElement);
            props.showAlert(
                "Cleared word",
                "success"
            );
        }
    const ManageAllCopy =
        () => {
            var word =
                document.getElementById("myBox");
            word.select();
            navigator.clipboard
                .writeText(word.value);
            props.showAlert("All Copied", "success");
        }
    const ManageAllSpace =
        () => {
            let newElement =
                word.split(/[ ]+/);
            setWord(newElement.join(" "));
            props.showAlert(
                "Cleared Space",
                "success"
            );
        }
    const ManageReverseWord =
        () => {
            const reversedWords =
                word.split(' ')
                    .map(
                        word =>
                            word.split('')
                                .reverse()
                                .join('')).join(' ');
            setWord(reversedWords);
            props.showAlert(
                "Reverse word",
                "success"
            );
        }
    const ManageReverseSentence =
        () => {
            const reversedSentence =
                word.split(' ')
                    .reverse().join(' ');
            setWord(reversedSentence);
            props.showAlert(
                "Reverse Sentence",
                "success"
            );
        }
    const ManageOnChange =
        (events) => {
            console.log("On Change");
            setWord(events.target.value);
        }
    const [word, setWord] = useState('');
    return (
        <>
            <div className="container"
                style=
                {
                    {
                        color: props.mode === 'dark' ?
                            'white' : 'black'
                    }
                }>
                <h1>{props.heading}</h1>
                <div className="mb-3">
                    <textarea className="form-control"
                        value={word} onChange={ManageOnChange}
                        style={
                            {
                                backgroundColor:
                                    props.mode === 'dark' ?
                                        '#313142' : 'white',
                                color:
                                    props.mode === 'dark' ?
                                        'white' : 'black'
                            }} id="myBox" rows="8"></textarea>
                </div>
                <button disabled={word.length === 0}
                    className="btn btn-danger mx-2 my=1"
                    onClick={ManageUpClick}>
                    UPPER CASE
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-dark mx-2 my=1"
                    onClick={ManageLoClick}>
                    lower case
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-success mx-2 my=1"
                    onClick={ManageAllClick}>
                    Clear All
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-primary mx-2 my=1"
                    onClick={ManageAllCopy}>
                    Copy to clipboard
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-warning mx-2 my=1"
                    onClick={ManageAllSpace}>
                    Clear Space
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-info mx-2 my=1"
                    onClick={ManageReverseWord}>
                    Reverse Word
                </button>
                <button disabled={word.length === 0}
                    className="btn btn-primary mx-2 my=1"
                    onClick={ManageReverseSentence}>
                    Reverse Sentence
                </button>
            </div>
            <div className="container my-3"
                style=
                {
                    {
                        color: props.mode ===
                            'dark' ?
                            'white' : 'black'
                    }}>
                <h2>Word Summary</h2>
                <p>
                    {
                        word.split(" ").filter(
                            (element) => { return element.length !== 0 })
                            .length
                    } words and
                    {word.length}
                    character
                </p>
                <p>
                    {
                        0.008 * word.split(" ")
                            .filter(
                                (element) => {
                                    return element.length !== 0
                                }
                            ).length
                    }
                    Minutes read
                </p>
                <h2>Preview</h2>
                <p>
                    {
                        word.length >
                            0 ?
                            word :
                            "Enter the word to Preview"
                    }
                </p>
            </div>
        </>
    );
}
// Alert.js
import React from 'react'
function Alert(props) {
    const capital =
        (text) => {
            const lower = text.toLowerCase();
            return lower.charAt(0)
                .toUpperCase() + text.slice(1);
        }
    return (
        <div style=
            {
                {
                    height: '30px'
                }
            }>
            {
                props.attension &&
                <div className=
                    {
                        `alert alert-${props.attension.type} 
                    alert-dismissible fade show`
                    }
                    role="alert">
                    <strong>
                        {
                            capital(props.attension.type)
                        }
                    </strong>
                    :{props.attension.msg}
                </div>}
        </div>
    )
}
export default Alert
// Navbar.js
import React from 'react';
import PropTypes from 'prop-types'
export default
    function Navbar(props) {
    return (
        <nav className={
            `navbar navbar-expand-lg 
            navbar-${props.mode} 
            bg-${props.mode}`
        }>
            <div className="container-fluid">
                <a className="navbar-brand"
                    href="/">{props.title}</a>
                <button className="navbar-toggler"
                    type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span
                        className="navbar-toggler-icon">
                    </span>
                </button>
                <div className="collapse navbar-collapse"
                    id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <a className="nav-link active"
                                aria-current="page"
                                href="/">
                                Home
                            </a>
                        </li>
                        <li className="nav-item">
                            <a className="nav-link" href="/"></a>
                        </li>
                    </ul>
                    {/* <!--Dark Mode button functionality--> */}
                    <div className=
                        {
                            `form-check form-switch 
                            text-${props.mode === 'light'
                                ? 'dark' : 'light'}`
                        }>
                        <input className="form-check-input"
                            type="checkbox" onClick={props.toggleMode}
                            role="switch"
                            id="flexSwitchCheckDefault" />
                        <label className="form-check-label"
                            htmlFor="flexSwitchCheckDefault">
                            Dark Mode
                        </label>
                    </div>
                </div>
            </div>
        </nav>
    );
}
Navbar.prototypes = {
    title: PropTypes.string.isRequired,
}
Navbar.defaultProps = {
    title: "Set title here",
}
Steps to run the application:
npm  run dev
Output:

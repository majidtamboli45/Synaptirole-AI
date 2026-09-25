# Virtual Keyboard using React

> Source: https://www.geeksforgeeks.org/reactjs/virtual-keyboard-using-react/

In this article, we will create Virtual Keyboard using ReactJS. This project basically implements functional components and manages the state accordingly. Users can interact with the virtual keyboard by clicking on keys, and the interface will respond accordingly, allowing for a seamless typing experience. The keypress and character input logic are implemented using JSX.
Let’s have a look at what our final project will look like:
Technologies Used/Prerequisites:
Approach/Functionalities:
A virtual keyboard is a software-based input interface that mimics a physical keyboard on a digital device. Its key functionalities include:
- User Input Simulation: It allows users to input text and commands by clicking on virtual keys, replicating the functionality of a physical keyboard.
- Accessibility: They enhance accessibility for individuals with physical disabilities, providing alternative input methods.
- Security: Virtual keyboards can be used for secure data entry, protecting against keyloggers and other security threats.
- Integration: They can be integrated into various applications, including kiosks, touch-screen devices, and software interfaces, to facilitate text input and interaction.
Project Structure:
Steps to create the application:
Step 1: Set up React project using the command
npm create vite@latest <<name-of-project>> --template react
Step 2: Navigate to the project folder using
cd <<Name_of_project>>
Step 4. Install dependencies
Since we are using Vite, you will need to install dependencies:
npm install
Step 3: Create a folder “components” and add two new files in it namely Keyboard.js and Keyboard.css.
Step 4: Import the icon pack using the following command in the index.html file of the public folder.
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
Example: Write the following code in respective files
- index.html: This is an automatically created file in the public folder we just have to import the icon pack in its <head> tag.
- App.js: This file imports the Keyboard components and exports it.
- Keyboard.js: This file contains the logic for the virtual keyboard, keypress, and input text block with state variable which the computer chooses a value
- Keyboard.css: This file contains the design of the Virtual keyboard elements.
<!-- index.html -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/
    css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE
    +4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
/* keyboard.css */
.keyboard {
    display: flex;
    height: 100vh;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.textcontainer {
    width: 1018px;
    height: 100px;
    border: 1px solid rgba(0,0,0,0.25);
    overflow: auto;
    border-radius: 4px;
}
.textcontainer pre{
    text-align: left;
    display: block;
    width: calc(100% - 40px);
    height: calc(100% - 40px);
    margin: 0;
    padding: 20px;
    font-size: 20px;
}
.keyboardcontainer {
    width: 90%;
    display: flex;
    justify-content: center;
    margin-top: 15px;
}
.container {
    padding: 20px 20px;
    display: flex;
    flex-direction: column;
    max-width: 980px;
    justify-content: center;
    align-items: center;
    border-radius: 7px;
    background: #202124;
}
.row {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
}
.key {
    display: flex;
    width: 60px;
    height: 60px;
    margin: 5px;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    background-color: #445760;
    border-radius: 4px;
    color: #ffffff;
    font-size: 16px;
    cursor: pointer;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    transition: background-color ease-in-out 0.15s;
}
.key:hover{
    background-color: #3c4d56;
}
.row:first-child .key:first-child{
    width: 40px;
}
.row:first-child .key:last-child{
    width: 80px;
}
.row:nth-child(3) .key:first-child{
    width: 95px;
}
.row:nth-child(3) .key:last-child{
    width: 95px;
}
.row:nth-child(4) .key:first-child{
    width: 130px;
}
.row:nth-child(4) .key:last-child{
    width: 130px;
}
.row:nth-child(5) .key:nth-child(3){
    width: 550px;
}
// App.js
import './App.css';
import Keyboard from './components/Keyboard';
function App() {
  return (
    <div className="App">
      <Keyboard/>
    </div>
  );
}
export default App;
// keyboard.js
import React, { useState } from 'react';
import './Keyboard.css';
export default function Keyboard() {
    const [inputText, setInputText] = useState('');
    const [isCaps, setIsCaps] = useState(false);
    const [isShift, setIsShift] = useState(false);
    const handleKeyClick = (key) => {
        if (key === 'Enter') {
            handleEnterKey();
        } 
        else if(key === "Ctrl" || key === "Alt" || key === '<' || key === '>')
        {
        }else if (key === ' ') {
            handleSpaceKey();
        } else if (key === 'Caps Lock') {
            handleCapsLock();
        } else if (key === '<i className="fa-solid fa-delete-left"></i>') {
            handleDeleteKey();
        } else if (key === 'Shift') {
            handleShiftKey();
        } else if (key === 'Tab') {
            handleTabKey();
        } else {
            handleRegularKey(key);
        }
    };
    const handleSpaceKey = () => {
        const newContent = inputText + '\u00A0';
        setInputText(newContent);
    };
    const handleEnterKey = () => {
        const newContent = inputText + '\n';
        setInputText(newContent);
    };
    const handleCapsLock = () => {
        const updatedCaps = !isCaps;
        setIsCaps(updatedCaps);
        const keys = document.querySelectorAll('.key');
        keys.forEach((key) => {
            const firstSpanElement = key.querySelector('span:first-child');
            if (firstSpanElement) {
                const keyText = firstSpanElement.innerText.toLowerCase();
                if (!['shift', 'alt', 'ctrl', 'enter', 'caps lock', 'tab']
                    .includes(keyText)) {
                    firstSpanElement.innerText = 
                    ((updatedCaps && isShift) || (!updatedCaps && !isShift)) 
                    ? keyText.toLowerCase() : keyText.toUpperCase();
                }
                if (keyText === 'caps lock') {
                    firstSpanElement.parentElement.style.backgroundColor = 
                    (updatedCaps) ? 'blue' : '#445760';
                }
            }
        });
    };
    const handleTabKey = () => {
        const newContent = inputText + '    ';
        setInputText(newContent);
    };
    const handleDeleteKey = () => {
        if (inputText.length === 0) {
            return;
        }
        const newContent = inputText.slice(0, inputText.length - 1);
        setInputText(newContent);
    };
    const handleShiftKey = () => {
        const updatedShift = !isShift;
        setIsShift(updatedShift);
        const keys = document.querySelectorAll('.key');
        keys.forEach((key) => {
            const firstSpanElement = key.querySelector('span:first-child');
            if (firstSpanElement) {
                const keyText = firstSpanElement.innerText.toLowerCase();
                if (!['shift', 'alt', 'ctrl', 'enter', 'caps lock', 'tab'].
                    includes(keyText)) {
                    firstSpanElement.innerText = 
                    ((updatedShift && isCaps) || (!updatedShift && !isCaps)) 
                    ? keyText.toLowerCase() : keyText.toUpperCase();
                }
                if (keyText === 'shift') {
                    firstSpanElement.parentElement.style.backgroundColor = 
                    (updatedShift) ? 'blue' : '#445760';
                }
            }
        });
    }
    const handleRegularKey = (key) => {
        const keys = key.split(/[._]/);
        let newContent;
        if (keys.length > 1) {
            if (isShift) {
                if (keys.length === 3) {
                    if (keys[0] === '>') newContent = inputText + '>';
                    else newContent = inputText + '_';
                }
                else newContent = inputText + keys[0];
            } else {
                if (keys.length === 3) {
                    if (keys[0] === '>') newContent = inputText + '.';
                    else newContent = inputText + '-';
                }
                else newContent = inputText + keys[1];
            }
        } else {
            let character = ((isShift && isCaps) || (!isShift && !isCaps)) 
            ? key.toLowerCase() : key.toUpperCase();
            newContent = inputText + character;
        }
        setInputText(newContent);
    };
    return (
        <div className='keyboard'>
            <div className="textcontainer">
                <pre>{inputText}</pre>
            </div>
            <div className="keyboardcontainer">
                <div className="container">
                    <div className="row">
                        {['~.`', '!.1', '@.2', '#.3', '$.4', '%.5', 
                        '^.6', '&.7', '*.8', '(.9', ').0', '_.-', '+.=', 
                        '<i className="fa-solid fa-delete-left"></i>']
                        .map((keyvalue) => 
                        (
                            <div key={keyvalue} className='key' 
                                 onClick={() => handleKeyClick(keyvalue)}>
                                {keyvalue.includes('.') ? (
                                    keyvalue.split('.').map((part, index) => (
                                        <span key={index}>{part}</span>
                                    ))
                                ) : (
                                    keyvalue === 
                                      '<i className="fa-solid fa-delete-left"></i>' 
                                     ? (
                                        <i className="fa-solid fa-delete-left"></i>
                                    ) : (
                                        <span>{keyvalue}</span>
                                    )
                                )}
                            </div>
                        ))}
                    </div>
                    <div className="row">
                        {['Tab', 'q', 'w', 'e', 'r', 't', 'y',
                        'u', 'i', 'o', 'p', '{_[', '}_]', '|_\\']
                        .map((keyvalue) => (
                            <div key={keyvalue} className='key' 
                                 onClick={() => handleKeyClick(keyvalue)}>
                                {keyvalue.includes('_') ? (
                                    keyvalue.split('_').map((part, index) => (
                                        <span key={index}>{part}</span>
                                    ))
                                ) : (
                                    <span>{keyvalue}</span>
                                )}
                            </div>
                        ))}
                    </div>
                    <div className="row">
                        {['Caps Lock', 'a', 's', 'd', 'f', 'g', 'h', 
                        'j', 'k', 'l', ':_;', `"_'`, 'Enter']
                            .map((keyvalue) => (
                            <div key={keyvalue} className='key' 
                                 onClick={() => handleKeyClick(keyvalue)}>
                                {keyvalue.includes('_') ? (
                                    keyvalue.split('_').map((part, index) => (
                                        <span key={index}>{part}</span>
                                    ))
                                ) : (
                                    <span>{keyvalue}</span>
                                )}
                            </div>
                        ))}
                    </div>
                    <div className="row">
                        {['Shift', 'z', 'x', 'c', 'v', 'b', 'n', 'm',
                        '<_,', '>_.', '?_/', 'Shift'].map((keyvalue, index) => (
                            <div key={index} className='key' 
                                 onClick={() => handleKeyClick(keyvalue)}>
                                {keyvalue.includes('_') ? (
                                    keyvalue.split('_').map((part, index) => (
                                        <span key={index}>{part}</span>
                                    ))
                                ) : (
                                    <span>{keyvalue}</span>
                                )}
                            </div>
                        ))}
                    </div>
                    <div className="row">
                        {['Ctrl', 'Alt', ' ', 'Ctrl', 'Alt', '<', '>']
                            .map((keyvalue, index) => (
                            <div key={index} className='key' 
                            onClick={() => handleKeyClick(keyvalue)}>
                                <span>{keyvalue}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    )
}
Steps to run the application:
1. Type the following command in terminal.
npm run dev
2. Open web-browser and type the following URL
http://localhost:5173/
Output:

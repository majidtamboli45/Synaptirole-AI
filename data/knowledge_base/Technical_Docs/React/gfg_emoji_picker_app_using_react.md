# Emoji Picker App using React

> Source: https://www.geeksforgeeks.org/reactjs/emoji-picker-app-using-react/

In this article, we will create an Interactive Emoji Application using ReactJS Framework. This developed project basically implements functional components and manages the state accordingly.
The developed Application allows users to explore a wide range of emojis and select them for their communication. Once the user clicks on the emoji, the selected emoji gets copied to the clipboard. Users can paste it into the chat window and use it for communication and expression. A toast message is also provided to the user, stating that the selected emoji is been copied to the clipboard.
Let's have an interactive look at what our final project will look like:
Technologies Used/Pre-requisites:
Approach:
The given code represents an interactive Emoji Application project using ReactJS. The app allows users to use a wide range of emojis for communication and expression. The developed application provides a friendly user interface where users can easily browse through a collection of emojis which are provided by the module "emoji-picker-react". The main functionalities of the developed application consist of a feature that allows users to explore specific emojis by selecting the emoji. As users select the emoji, the application copies that emoji to the clipboard so users can paste it into the chat window. We have also used "react-toastify" package to show a stylish toast message to user stating that the emoji is been copied to the clipboard. This allows users to easily select the emoji and use them for their communication.
Project Structure:
The dependencies in package.json will look like this:
{
"name": "emoji-app",
"version": "0.1.0",
"private": true,
"dependencies": {
"emoji-picker-react": "^4.4.10",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-toastify": "^9.1.3",
"web-vitals": "^2.1.4"
}
}
Steps to create the application:
Step 1: Set up React project using the below command in VSCode IDE.
npm create vite@latest emoji-app --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd emoji-app
Step 3: As we are using emoji-picker-react and react-toastify them in this project, we need to install them using npm.
npm install emoji-picker-react react-toastify
Example: Insert the below code in the App.js and styles/App.css files mentioned in the above directory structure.
- App.js: This file represents the main component of the Emoji App, managing state, rendering other components, and displaying the list of emojis, and selected emoji details.
- App.css: This file consists of all the styling code, whether it is h1 tag styling or toast message styling. All the look and feel of the application are specified in this styling file.
/*App.css*/
body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}
.emoji-app {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px;
}
h1 {
    font-size: 36px;
    margin-bottom: 20px;
    color: #3deb08;
}
.selected-emoji {
    margin-top: 30px;
    padding: 10px;
    border-radius: 8px;
    background-color: #f7d794;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
}
.selected-emoji p {
    margin: 0;
    font-size: 16px;
    color: #2d3436;
}
.selected-emoji span {
    font-size: 40px;
    display: block;
    margin-top: 10px;
}
.emoji-picker {
    background-color: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
    padding: 20px;
}
.emoji-list {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 10px;
}
.emoji {
    font-size: 30px;
    cursor: pointer;
    text-align: center;
    transition: transform 0.2s ease-in-out;
    filter: brightness(100%);
}
.emoji:hover {
    transform: scale(1.2);
    filter: brightness(120%);
}
.Toastify__toast-container {
    z-index: 9999;
}
.Toastify__toast--success {
    background-color: #2ecc71;
}
.Toastify__toast--error {
    background-color: #e74c3c;
}
.Toastify__toast-body {
    font-size: 16px;
    color: #011af8;
}
.Toastify__progress-bar {
    background-color: rgba(255, 255, 255, 0.7);
}
//App.js
import React, { useState } from 'react';
import './App.css';
import EmojiPicker from 'emoji-picker-react';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
const App = () => {
    const [choosenEmoji, setChoosenEmoji] = useState('');
    const copyEmojiFunction = (text) => {
        const textArea = document.createElement('textarea');
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.select();
        document.execCommand('copy');
        document.body.removeChild(textArea);
    };
    const emojiPickerFunction = (emojiObject) => {
        const emoji = emojiObject.emoji;
        setChoosenEmoji(emoji);
        copyEmojiFunction(emoji);
        toast.success('Copied to Clipboard!', {
            position: 'top-right',
            autoClose: 2000,
            hideProgressBar: true,
            closeOnClick: true,
            pauseOnHover: false,
            draggable: false,
            progress: undefined,
        });
    };
    return (
        <div className="emoji-app">
            <h1>GeeksforGeeks Emoji Application</h1>
            {choosenEmoji && (
                <div className="selected-emoji">
                    <p>Selected Emoji:</p>
                    <span>{choosenEmoji}</span>
                </div>
            )}
            <div className="emoji-picker">
                <EmojiPicker onEmojiClick={emojiPickerFunction} />
            </div>
            <ToastContainer />
        </div>
    );
};
export default App;
Steps to run the application:
1. Execute the following command in the terminal.
npm run dev
2. Open the web browser and type the following URL in the address bar.
http://localhost:5173/
Output:

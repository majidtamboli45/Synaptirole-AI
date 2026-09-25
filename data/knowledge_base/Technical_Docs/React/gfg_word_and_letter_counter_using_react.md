# Word and Letter Counter using React

> Source: https://www.geeksforgeeks.org/reactjs/word-and-letter-counter-using-react/

The word and letter counter is an application that counts the number of letters and words entered in text and give the number (count) of each in output. Each element present in the text will be considered a letter, and a group of letters with a space will be considered a word. Using this approach, we implement the counter.
Preview of Final Output
Prerequisites
Approach
- The Words and Letters Counter project utilizes the capabilities of React JS to create an interactive web application.
- Created a simple and easy-to-use interface where users can enter text.
- As users type or paste text, the app shows the word count and letter count in real time.
- Used a clean and minimal design to keep the focus on the main feature.
- Used reactive state management, so the counts update instantly without needing to refresh the page.
Functionalities
- An input field where users can type or paste text.
- Real time updates of both word count and letter count as users enter their text.
Steps to create Project
Step 1: Create a new React JS project using the following command
npm create vite@latest word-letter-counter --template react
Step 2: Change to the project directory
cd word-letter-counter
Project Structure
Step 3: If you haven't done this already, install the project dependencies by running
npm install
Write the following code in respective files
- App.js: This serves as the entry point, for your React application. It takes care of rendering the structure of your web page. Includes the WordLetterCounter component.
- App.css: In this file you'll find the styles that define the structure of your web page. This includes things like the page title and the container that wraps around the WordLetterCounter component.
- WordLetterCounter.js: This particular component is responsible for handling both word and letter counting functionality.
- WordLetterCounter.css: Within this file you'll find all the styles to the WordLetterCounter component. It determines how things, like textarea input field and text displaying word and letter counts will appear on your web page.
/* App.css */
.App {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #f0f0f0;
    height: 100vh;
}
#top {
    font-size: 27px;
    margin: 20px 0;
    color: #2bc00d;
}
h1 {
    font-size: 27px;
    margin: 20px 0;
    color: #4c4e4b;
}
/* WordLetterCounter.css */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    font-family: Arial, sans-serif;
    margin: 20px;
}
textarea {
    width: 100%;
    padding: 10px;
    height: 300px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 25px;
}
p {
    font-size: 25px;
    margin: 5px 0;
    color: #333;
}
// App.js
import React from "react";
import WordLetterCounter from "./WordLetterCounter";
import "./App.css";
function App() {
    return (
        <div className="App">
            <h1 id="top">
            GeeksforGeeks
            </h1>
            <h1>
            Words and Letters
            Counter
            </h1>
            <WordLetterCounter />
        </div>
    );
}
export default App;
// WordLetterCounter.js
import React, { useState } from "react";
import "./WordLetterCounter.css";
function WordLetterCounter() {
    const [text, setText] =
        useState("");
    const wordCount = text
        .split(/\s+/)
        .filter(Boolean).length;
    const letterCount = text.length;
    const handleTextChange = (e) => {
        setText(e.target.value);
    };
    return (
        <div>
            <textarea
                placeholder=
                "Type your text here..."
                onChange={
                    handleTextChange
                }
                value={text}
                rows={5}
                cols={50}
            />
            <p>
                Word Count:
                {wordCount}
            </p>
            <p>
                Letter Count:{" "}
                {letterCount}
            </p>
        </div>
    );
}
export default WordLetterCounter;
Steps to run the project-
Type the following command in terminal.
npm run dev
Open web-browser and type the following URL
http://localhost:5173/
Output

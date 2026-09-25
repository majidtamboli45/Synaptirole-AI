# Hangman game using React

> Source: https://www.geeksforgeeks.org/reactjs/hangman-game-using-react/

React provides an excellent platform for creating interactive and engaging web applications. In this tutorial, you will be guided to build a classic Hangman game using React. Hangman is a word-guessing game that is not only entertaining but also a great way to practice your React skills.
Preview of final output: Let us have a look at how the final output will look like
Prerequisites:
Approach to create Hangman Game:
- Creating a cool Hangman game with React is our focus. We're using React for style, JavaScript for brains, and CSS for a sleek look. We're kicking off quickly with Create React App, setting up components for words, input, and the hangman visuals.
- We're adding a twist with random word choices to keep it exciting. When you guess, it updates live, and we're keeping track of your mistakes. Winning or losing will be based on your guesses and errors. The design will be snazzy for a fun time.
Steps to Create the Hangman Game:
Step 1: Set up a new React project using Create React App.
npm create vite@latest hangman-game --template react
cd hangman-game
Step 2: Install dependencies
npm install
Folder structure:
The updated dependencies in package.json file will look like:
{
"name": "hangman-game",
"version": "0.0.1",
"scripts": {
"dev": "vite",
"build": "vite build",
"serve": "vite preview"
},
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0"
},
"devDependencies": {
"@vitejs/plugin-react": "^3.0.0"
}
}
Example: Create the required files according to the folder structure and write the following code.
/* App.css */
.App {
    text-align: center;
    padding: 20px;
}
.hangman-canvas {
    display: flex;
    justify-content: center;
    margin: 20px;
}
.hangman-canvas>div {
    width: 20px;
    height: 20px;
    background-color: #333;
    margin: 0 5px;
    border-radius: 50%;
}
.word-display {
    margin: 20px;
    font-size: 24px;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}
.letter {
    margin: 0 5px;
    font-size: 24px;
    display: inline-block;
    border-bottom: 2px solid #333;
    padding-bottom: 5px;
    transition: all 0.3s ease;
}
.letter.guessed {
    color: rgb(106, 192, 238);
    border-bottom: 2px solid rgb(22, 96, 118);
}
/* App.css */
/* ... (previous code) */
.result-message {
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0;
    color: #062e5b;
}
/* ... (remaining code) */
.keyboard {
    margin: 20px;
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 10px;
}
.keyboard button {
    font-size: 18px;
    padding: 10px 15px;
    background-color: #7cbafc;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.keyboard button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}
.keyboard button:hover {
    background-color: #c2e2ff;
}
p {
    font-size: 24px;
    font-weight: bold;
    color: #002c4f;
    margin-top: 20px;
}
@keyframes bounce {
    0%,
    20%,
    50%,
    80%,
    100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-20px);
    }
    60% {
        transform: translateY(-10px);
    }
}
.bounce {
    animation: bounce 1s infinite;
}
/* HangmanGame.css */
.hangman-container {
    text-align: center;
    padding: 20px;
    background-color: #f2f2f2;
    border-radius: 10px;
    box-shadow: 10 10 10px rgba(0, 0, 0, 0.2);
}
h1 {
    color: #333;
}
.word-display {
    margin: 20px;
    font-size: 24px;
    display: flex;
    justify-content: center;
}
.letter {
    margin: 0 5px;
    font-size: 24px;
    display: inline-block;
    border-bottom: 2px solid #333;
    padding-bottom: 5px;
    transition: all 0.3s ease;
}
.letter.guessed {
    color: rgb(112, 159, 195);
    border-bottom: 2px solid green;
}
.keyboard {
    margin: 20px;
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 10px;
}
.keyboard button {
    font-size: 18px;
    padding: 10px 15px;
    background-color: #4c8eaf;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.keyboard button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}
.keyboard button:hover {
    background-color: #95e1fd;
}
.result-message {
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0;
    color: #000000;
}
.new-game-button {
    font-size: 18px;
    padding: 10px 15px;
    background-color: #2196f3;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    transition: all 0.3s ease;
}
.new-game-button:hover {
    background-color: #0b7dda;
}
// App.js
import React from 'react';
import './App.css';
import HangmanGame from './HangmanGame';
function App() {
    return (
        <div className="App">
            <HangmanGame />
        </div>
    );
}
export default App;
// HangmanCanvas.js
import React from 'react';
const HangmanCanvas = ({ mistakes }) => {
    const parts = [
        'head',
        'body',
        'left-arm',
        'right-arm',
        'left-leg',
        'right-leg',
    ];
    return (
        <div className="hangman-canvas">
            {parts.slice(0, mistakes).map((part, index) => (
                <div key={index} className={part} />
            ))}
        </div>
    );
};
export default HangmanCanvas;
// HangmanGame.js
import React, { useState, useEffect } from "react";
import HangmanCanvas from "./HangmanCanvas";
import "./HangmanGame.css"; // Import the additional CSS file
const words = ["REACT", "JAVASCRIPT", "DEVELOPER", "HANGMAN", "COMPONENT"];
const HangmanGame = () => {
    const [word, setWord] = useState("");
    const [guessedLetters, setGuessedLetters] = useState([]);
    const [mistakes, setMistakes] = useState(0);
    useEffect(() => {
        resetGame();
    }, []);
    const chooseRandomWord = () => {
        const randomIndex = Math.floor(Math.random() * words.length);
        return words[randomIndex].toUpperCase();
    };
    const handleGuess = (letter) => {
        if (!guessedLetters.includes(letter)) {
            setGuessedLetters([...guessedLetters, letter]);
            if (!word.includes(letter)) {
                setMistakes(mistakes + 1);
            }
        }
    };
    const isGameWon = () => {
        return word
            .split("")
            .every((letter) => guessedLetters.includes(letter));
    };
    const isGameLost = () => {
        return mistakes >= 6;
    };
    const resetGame = () => {
        setWord(chooseRandomWord());
        setGuessedLetters([]);
        setMistakes(0);
    };
    return (
        <div className="hangman-container">
            <h1>Hangman Game</h1>
            <h5>
                Hangman is a word-guessing game. Start a new game, guess letters
                to reveal the word, and avoid drawing the hangman by making
                incorrect guesses. Win by guessing the word before the hangman
                is complete. Have fun!
            </h5>
            <HangmanCanvas mistakes={mistakes} />
            <div className="word-display">
                {word.split("").map((letter, index) => (
                    <span key={index} className="letter">
                        {guessedLetters.includes(letter) ? letter : "_"}
                    </span>
                ))}
            </div>
            <div className="keyboard">
                {Array.from(Array(26)).map((_, index) => (
                    <button
                        key={index}
                        onClick={() =>
                            handleGuess(String.fromCharCode(65 + index))
                        }
                        disabled={guessedLetters.includes(
                            String.fromCharCode(65 + index)
                        )}
                    >
                        {String.fromCharCode(65 + index)}
                    </button>
                ))}
            </div>
            {isGameWon() && <p className="result-message">You won!</p>}
            {isGameLost() && (
                <p className="result-message">You lost! The word was: {word}</p>
            )}
            <button className="new-game-button" onClick={resetGame}>
                New Game
            </button>
        </div>
    );
};
export default HangmanGame;
To start the application type the following command:
npm run dev
Output:

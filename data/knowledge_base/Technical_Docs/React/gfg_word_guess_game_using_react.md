# Word Guess Game using React

> Source: https://www.geeksforgeeks.org/reactjs/word-guess-game-using-react/

In this article, we will create an Interactive Word Guess Game using ReactJS. Word Guess game is basically a guessing game, where a hint will be given based on the hint you have to guess the word.
This project basically implements functional components and manages the state accordingly. This Game allows users to interact with the game and guess the hidden words by selecting letters, motive of this fun game is to test the vocabulary in terms of an interactive game. The game provides a hint system where players can request a hint that reveals a single letter in the hidden word. This feature assists players who may be stuck or need a little help to progress. A game over screen is displayed when the user makes too many incorrect guesses.
Let's have an interactive look at what our final project will look like:
Technologies Used/Pre-requisites
Approach:
The developed Word Guess Game obeys a functional component-based approach to create an interactive and friendly engaging word guessing game. The game consists of ReactJS's efficient stat management capabilities and features for a smooth and responsive user interface. Users can select letters from an on-screen displayed English alphabet to guess the hidden word, the correct guesses update the word display and incorrect guesses decrement the remaining guesses count. The developed game also consists of features like Hint, which helps the user to get some hints about the hidden word. The game ends with the Winning and Losing scenarios according to the user's play.
Steps to create the application:
Step 1: Set up React project using the below command in VSCode IDE.
npm create vite@latest <name-of-project>
Step 2: Navigate to the newly created project folder by executing the below command.
cd <name-of-project>
Project Structure:
Step 3: Install dependencies
Inside the project folder, run:
npm install
The dependencies in package.json will look like this:
{
"name": "word-game-vite",
"version": "0.1.0",
"private": true,
"scripts": {
"dev": "vite",
"build": "vite build",
"preview": "vite preview"
},
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0"
},
"devDependencies": {
"vite": "^4.0.0",
"@vitejs/plugin-react": "^4.0.0"
}
}
Example: Insert the below code in the App.js and App.css files mentioned in the above directory structure.
- App.js: This file contains the entire logic, behavior, and structure of the game. There is a hook used (useState) that manages the state of the application. Various buttons are been created for controlling the application.
- App.css: This file is used to provide beautiful styling to the application, various effects, colors, and width-height management are done through this file.
/* App.css */
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}
h1 {
  font-size: 36px;
  margin-bottom: 30px;
  color: rgb(21, 228, 2);
}
.word-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 50px;
}
.letter {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 60px;
  height: 60px;
  margin: 0 5px;
  border-radius: 50%;
  font-size: 24px;
  font-weight: bold;
  color: #fff;
  background-color: #333;
  opacity: 1;
  transition: opacity 0.2s ease-in-out;
}
.letter.visible {
  opacity: 1;
}
.button-section {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.guess-section {
  margin-bottom: 30px;
}
.restart-button,
.remove-button {
  padding: 12px 20px;
  margin-right: 10px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #f44336;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}
.remove-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
.restart-button:hover,
.remove-button:hover {
  background-color: #d32f2f;
}
.restart-button:focus,
.remove-button:focus {
  outline: none;
}
.letter-selection {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-bottom: 30px;
}
.letter-button {
  padding: 10px 15px;
  margin: 5px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #2196f3;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}
.letter-button.selected {
  background-color: #1976d2;
}
.letter-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
.hints {
  margin-bottom: 20px;
  font-size: 20px;
  font-weight: bold;
  color: #333;
}
.hint-button {
  padding: 12px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #4caf50;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}
.hint-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
.hint-button:hover {
  background-color: #388e3c;
}
.hint-button:focus {
  outline: none;
}
.message {
  font-size: 24px;
  font-weight: bold;
  color: #333;
  text-align: center;
  margin-bottom: 20px;
}
.guess-button {
  padding: 12px 30px;
  margin-top: 20px;
  font-size: 18px;
  font-weight: bold;
  color: #fff;
  background-color: #ff5722;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}
.guess-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
.guess-button:hover {
  background-color: #e64a19;
}
.guess-button:focus {
  outline: none;
}
.word-description {
  font-size: 18px;
  font-style: bold;
  color: rgb(0, 0, 0);
  margin-bottom: 20px;
}
//App.js
import React, { useState, useEffect } from "react";
import "./App.css";
const sampleWords = [
    {
        word: "HELLO",
        description: "A common greeting to say hi."
    },
    {
        word: "WORLD",
        description: "The planet we live on, which is full of land and water."
    },
    {
        word: "JAVASCRIPT",
        description: 
"A popular programming language for building interactive websites and provides behaviour to applications."
    },
    {
        word: "REACT",
        description: "A Javascript library in which we have written this project code"
    },
    {
        word: "PROGRAMMING",
        description: "The process of developing code to assist computers to perform tasks."
    },
    {
        word: "GEEKSFORGEEKS",
        description: "An educational website for computer science 'geeks.'"
    }
];
const getRandomWord = () => {
    const randomPlace = Math.floor(Math.random() * sampleWords.length);
    return sampleWords[randomPlace];
};
const GFGWordGame = () => {
    const [wordData, setWordData] = useState(getRandomWord());
    const [msg, setMsg] = useState("");
    const [chosenLetters, setChosenLetters] = useState([]);
    const [hints, setHints] = useState(3);
    const [displayWord, setDisplayWord] = useState(false);
    const [gameOver, setGameOver] = useState(false);
    const [wrongGuesses, setWrongGuesses] = useState(0);
    useEffect(() => {
        if (wrongGuesses >= 3) {
            // Code to show the popup or message for game over
            window.alert("Game Over! You made too many wrong guesses.");
            restartGameFunction();
        }
    }, [wrongGuesses]);
    const letterSelectFunction = (letter) => {
        if (!chosenLetters.includes(letter)) {
            setChosenLetters([...chosenLetters, letter]);
            if (!wordData.word.includes(letter)) {
                setWrongGuesses(wrongGuesses + 1);
            }
        }
    };
    const hintFunction = () => {
        if (hints > 0) {
            const hiddenLetterIndex = wordData.word
                .split("")
                .findIndex((letter) => !chosenLetters.includes(letter));
            setChosenLetters([...chosenLetters, wordData.word[hiddenLetterIndex]]);
            setHints(hints - 1);
        }
    };
    const removeCharacterFunction = () => {
        setChosenLetters(chosenLetters.slice(0, -1));
    };
    const displayLettersFunction = () => {
        const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        return Array.from(letters).map((letter, index) => (
            <button
                key={index}
                onClick={() => letterSelectFunction(letter)}
                disabled={chosenLetters.includes(letter)}
                className={`letter-button ${
                    chosenLetters.includes(letter) ? "selected" : ""
                }`}
            >
                {letter}
            </button>
        ));
    };
    const checkWordGuessedFunction = () => {
        return wordData.word.split("").every((letter) => chosenLetters.includes(letter));
    };
    const guessFunction = () => {
        if (checkWordGuessedFunction()) {
            setMsg("Congo Geek! You have guessed the word correctly!");
        } else {
            setMsg("You made a Wrong Guess Geek!. Try again!");
            setDisplayWord(true);
        }
    };
    const restartGameFunction = () => {
        setWordData(getRandomWord());
        setMsg("");
        setChosenLetters([]);
        setHints(3);
        setDisplayWord(false);
        setGameOver(false);
        setWrongGuesses(0);
    };
    return (
        <div className="container">
            <h1>GeeksforGeeks Word Guess Game</h1>
            <div className="word-container">
                {Array.from(wordData.word).map((letter, index) => (
                    <div
                        key={index}
                        className={`letter ${
                            chosenLetters.includes(letter) ? "visible" : ""
                        }`}
                    >
                        {chosenLetters.includes(letter) ? letter : ""}
                    </div>
                ))}
            </div>
            <p className="word-description">Hint: {wordData.description}</p>
            {msg && (
                <div className="message">
                    <p>{msg}</p>
                    {displayWord && <p>Correct word was: {wordData.word}</p>}
                </div>
            )}
            <div className="button-section">
                <div className="guess-section">
                    <button
                        onClick={restartGameFunction}
                        className="restart-button"
                    >
                        Restart
                    </button>
                    <button
                        onClick={removeCharacterFunction}
                        disabled={!chosenLetters.length}
                        className="remove-button"
                    >
                        Remove Letter
                    </button>
                </div>
                <div className="letter-selection">
                    {displayLettersFunction()}
                </div>
                <div className="hints">
                    Hints Remaining: {hints}{" "}
                    <button
                        onClick={hintFunction}
                        disabled={hints === 0}
                        className="hint-button"
                    >
                        Get Hint
                    </button>
                </div>
                {!msg && (
                    <button
                        onClick={guessFunction}
                        disabled={!chosenLetters.length}
                        className="guess-button"
                    >
                        Guess
                    </button>
                )}
            </div>
        </div>
    );
};
export default GFGWordGame;
Steps to run the application:
1. Execute the following command in the terminal.
npm run dev 2. Open the web browser and type the following URL in the address bar.
http://localhost:5173/
Output:

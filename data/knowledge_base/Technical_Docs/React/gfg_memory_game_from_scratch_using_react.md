# Memory Game from scratch using React

> Source: https://www.geeksforgeeks.org/reactjs/memory-game-from-scratch-using-react/

In this article, we will create a Memory game using ReactJS. A memory game is a famous game in which a pair of cards are placed in front of a player with their face down. The two pairs are always going to have the same content. The player has the choice to select any two cards at a time and check if the faces of the card match or not. If the face content match then he can keep the images with their face up and continue else the players needs to put them back face down. The game is over when all the pairs have been matched.
Preview of Final Output:
Technologies Used:
Pre-requisites
Approach:
As most of the logic is contained by the GameBoard.js component we will mainly focus on it and break the logic in steps but first Import GameBoard.js into App.js and render it there as App.js is the parent component for the GameBoard.js. Inside the GamBoard functional Component, we will create another function named NewGame() which restarts the whole game by suffling the cards and resetting the other variables. This function will only be executed when the new game button is clicked. Now to handle the clicks on the image card we create a new function called handleSelectedCards() which will simply check which card is selected and store its value in the firstCard and secondCard variables for further checking.
Steps to create the project:
Step 1 : Choose a particular IDE of your choice (preferably VS Code) .
Step 2: Create React Project Folder by using the below commands.
npm create vite@latest <<projectname>> --template react
Step 3: Navigate to the project folder.
cd <<projectname>>
Step 4: Install the dependencies:
npm install
Step 5: Create a folder “Game” and add five new files GameBoard.js, Card.js, and Data.js.
Project Structure:
Example:
Write the following code in respective files:
- App.js:This file imports the GameBoard component and renders it.
- GameBoard.js: This file contains most of the logic from creation of individual cards to handling the various function calls and representing the cards in specific order.
- Card.js: This file contains the code to generate individual cards.
- Data.js:This file contains an array which has data regarding the images like image source, name and individual address it gets imported by GameBoard.js.
- App.css: This file contains the design for every component.
/* App.css */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.App {
    height: 100vh;
    width: 100vw;
    font-family: cursive;
    background-color: rgb(21, 56, 66);
}
/* CSS for GameBoard component */
.container {
    display: flex;
    flex-direction: column;
}
.header {
    display: flex;
    flex-direction: row;
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}
h1 {
    align-self: start;
    font-size: 2.5rem;
    color: rgb(247, 247, 247);
}
.button {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0.5rem 0.8rem;
    font-family: cursive;
    width: 200px;
    font-size: 1.2rem;
    font-weight: bolder;
    border-radius: 0.7rem;
    border-style: none;
    background-color: red;
    color: white;
    margin-top: 4px;
    margin-left: 55%;
}
.button:hover {
    border: 2px solid black;
    cursor: pointer;
}
.board {
    display: grid;
    margin: auto;
    margin-top: 3rem;
    grid-template-columns: repeat(4, 9rem);
    place-items: center;
    row-gap: 2rem;
}
.comments {
    padding: 0.25rem 1rem;
    background-color: white;
    margin: auto;
    margin-top: 40px;
    text-align: center;
    border-radius: 2rem;
}
/* CSS for Card component */
.face {
    height: 6rem;
}
.back {
    height: 6rem;
    width: 6rem;
    background-color: rgb(253, 218, 175);
    color: rgb(61, 21, 21);
    border: 1px solid black;
    border-radius: 50%;
}
.item .face {
    position: absolute;
    transform: rotateY(90deg);
    transition: all ease-in 0.25s;
}
.toggled .face {
    transform: rotateY(0deg);
    transition-delay: 0.25s;
}
.item .back {
    transition: all ease-in 0.25s;
    transition-delay: 0.25s;
}
.toggled .back {
    transform: rotateY(90deg);
    transition-delay: 0s;
}
// App.js
// Renders the GameBoardComponent
import "./App.css";
import GameBoard from "./Game/GameBoard";
function App() {
    return (
        <div className="App">
            <GameBoard />
        </div>
    );
}
export default App;
//GameBoard.js
import React from "react";
import Data from "./data";
import Card from "./Card";
function GameBoard() {
    const [cardsArray, setCardsArray] = React.useState([]); 
    const [moves, setMoves] = React.useState(0);
    const [firstCard, setFirstCard] = React.useState(null);
    const [secondCard, setSecondCard] = React.useState(null);
    const [stopFlip, setStopFlip] = React.useState(false); 
    const [won, setWon] = React.useState(0);
    //this function start new Game
    function NewGame() {
        setTimeout(() => {
            const randomOrderArray = Data.sort(() => 0.5 - Math.random());
            setCardsArray(randomOrderArray);
            setMoves(0);
            setFirstCard(null);
            setSecondCard(null);
            setWon(0);
        }, 1200);
    }
    //this function helps in storing the firstCard and secondCard value
    function handleSelectedCards(item) {
        console.log(typeof item);
        if (firstCard !== null && firstCard.id !== item.id) {
            setSecondCard(item);
        } else {
            setFirstCard(item);
        }
    }
    // if two have been selected then we check if the images are same or not,
    //if they are same then we stop the flipping ability
    // else we turn them back
    React.useEffect(() => {
        if (firstCard && secondCard) {
            setStopFlip(true);
            if (firstCard.name === secondCard.name) {
                setCardsArray((prevArray) => {
                    return prevArray.map((unit) => {
                        if (unit.name === firstCard.name) {
                            return { ...unit, matched: true };
                        } else {
                            return unit;
                        }
                    });
                });
                setWon((preVal) => preVal + 1);
                removeSelection();
            } else {
                setTimeout(() => {
                    removeSelection();
                }, 1000);
            }
        }
    }, [firstCard, secondCard]);
    //after the slected images have been checked for 
    //equivalency we empty the firstCard and secondCard component
    function removeSelection() {
        setFirstCard(null);
        setSecondCard(null);
        setStopFlip(false);
        setMoves((prevValue) => prevValue + 1);
    }
    //starts the game for the first time.
    React.useEffect(() => {
        NewGame();
    }, []);
    return (
        <div className="container">
            <div className="header">
                <h1>Memory Game</h1>
            </div>
            <div className="board">
                {
                    // cards component help in coverting the 
                    // data from array to visible data for screen
                    cardsArray.map((item) => (
                        <Card
                            item={item}
                            key={item.id}
                            handleSelectedCards={handleSelectedCards}
                            toggled={
                                item === firstCard ||
                                item === secondCard ||
                                item.matched === true
                            }
                            stopflip={stopFlip}
                        />
                    ))
                }
            </div>
            {won !== 6 ? (
                <div className="comments">Moves : {moves}</div>
            ) : (
                <div className="comments">
                    ???????? You Won in {moves} moves ????????
                </div>
            )}
            <button className="button" onClick={NewGame}>
                New Game
            </button>
        </div>
    );
}
export default GameBoard;
// Card.js
//working of individual cards like the ability to toggle or flip and there design
//is carried out in this file
function Card({ item, handleSelectedCards, toggled, stopflip }) {
    return (
        <div className="item">
            <div className={toggled ? "toggled" : ""}>
                <img className="face" src={item.img} alt="face" />
                <div
                    className="back"
                    onClick={() => !stopflip && handleSelectedCards(item)}
                >
                    {" "}
                </div>
            </div>
        </div>
    );
}
export default Card;
// Data.js
const Data = [
    {
        id: 1,
        name: "react",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165802/atom-4.png",
        matched: false,
    },
    {
        id: 2,
        name: "java",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165803/java.png",
        matched: false,
    },
    {
        id: 3,
        name: "css",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165803/css-3-1.png",
        matched: false,
    },
    {
        id: 4,
        name: "node",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165805/nodejs-1.png",
        matched: false,
    },
    {
        id: 5,
        name: "html",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165806/html-5-1.png",
        matched: false,
    },
    {
        id: 6,
        name: "js",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165804/js-3.png",
        matched: false,
    },
    {
        id: 7,
        name: "react",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165802/atom-4.png",
        matched: false,
    },
    {
        id: 8,
        name: "java",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165803/java.png",
        matched: false,
    },
    {
        id: 9,
        name: "css",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165803/css-3-1.png",
        matched: false,
    },
    {
        id: 10,
        name: "node",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165805/nodejs-1.png",
        matched: false,
    },
    {
        id: 11,
        name: "html",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165806/html-5-1.png",
        matched: false,
    },
    {
        id: 12,
        name: "js",
        img: 
"https://media.geeksforgeeks.org/wp-content/uploads/20230927165804/js-3.png",
        matched: false,
    },
];
export default Data;
Steps to run the application:
Step 1: Type the following command in the terminal.
npm run dev
Step 2: Open web browser and type the following URL.
http://localhost:5173/
Output:

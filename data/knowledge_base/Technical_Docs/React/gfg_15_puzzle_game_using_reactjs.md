# 15 Puzzle Game using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/15-puzzle-game-using-reactjs/

In this article, we will create the 15 Puzzle Game using ReactJS. 15 puzzle game is basically a tile-based game in which there are 16 tiles out of which 1 tile is left empty and the remaining tiles are filled with numbers from 1 to 15 in random order. The user has to arrange all the tiles in numerical order with the rule that they can only move the tile that is a direct neighbor of the empty tile.
In this project, we have basically used React Functional Components and used React hooks like useState, useEffect, etc. The player can drag the tile from its position to a neighboring empty position. The logic of dragging and winning is implemented using JSX.
Let’s have a look at what our final project will look like:
Technologies Used/Pre-requisites:
Approach:
Containers are Stateful React components (class Based). Components are  Stateless React Components (function based). In this project, I have used components (function based) and to make them stateful, I used hooks in ReactJs like useState, useEffect etc.
Project Structure:
Steps:
1. Set up React project using the command
npm create vite@latest <name-of-project> --template react
2. Navigate to the project folder using
cd <name_of_project>
3. Install necessary dependencies:
npm install 3. Create a folder named "components" for storing the components and a folder named "utils" where we'll create the utility function to randomly create an array of numbers. Inside the "components" folder, add 4 files namely "Game.js", "Puzzle.js", "Tile.js", "Timer.js" and inside the "utils" folder create a file named "shuffleFunction.js".
4. To add tailwindcss in your project, add the following script tag in the "index.html".
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
Write the following code in different files (The name of the files is mentioned in the first line of each code block)
Examples:
- index.html: Automatically created file where we need to import the tailwindcss tag.
- index.js: Automatically created which React uses for final rendering.
- App.js: This file imports the Game component and exports it.
- Game.js: This file container the overall logic of the game and all the required components.
- Puzzle.js: This file contains the component for the puzzle game.
- Tile.js: This file contains two components namely "EmptyTile" and "FilledTile" used inside Puzzle.js to render tiles.
- Timer.js: This file contains the logic for the timer and renders the time.
- shuffleFunction.js: This file contains the logic for shuffling the array from 1 to 16 where 16th position is empty string and return the shuffled array.
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
	<link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
	<title>Project | 15 Puzzle Game</title>
	<script src="https://cdn.tailwindcss.com/3.4.16"></script>
</head>
<body>
	<noscript>You need to enable JavaScript to run this app.</noscript>
	<div id="root"></div>
</body>
</html>
// index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
<React.StrictMode>
	<App />
</React.StrictMode>
);
// App.js
import Game from "./components/Game";
export default function App() {
return <Game />
}
// Game.js
import { useEffect, useState } from "react";
import shuffleArray from "../utils/shuffleFunction";
import Puzzle from "./Puzzle";
import Timer from "./Timer";
export default function Game() {
const [shuffledArray, setShuffledArray] = useState(shuffleArray());
const [moves, setMoves] = useState(0);
const [time, setTime] = useState(0);
const [timerActive, setTimerActive] = useState(false);
const [win, setWin] = useState(false);
useEffect(() => {
	if (moves === 1) setTimerActive(true);
	let won = true;
	for (let i = 0; i < shuffledArray.length - 1; i++) {
	const value = shuffledArray[i];
	if (i == value - 1) continue;
	else {
		won = false;
		break;
	}
	}
	if (won) {
	setWin(true);
	setTimerActive(false);
	}
	return;
}, [moves]);
const newGame = () => {
	setMoves(0);
	setTimerActive(false);
	setTime(0);
	setShuffledArray(shuffleArray());
	setWin(false);
};
const dragStart = (e) => e.dataTransfer.setData("tile", e.target.id);
const dragOver = (e) => e.preventDefault();
const dropped = (e) => {
	e.preventDefault();
	const tile = e.dataTransfer.getData("tile");
	const oldPlace = Number(document.getElementById(tile).parentElement.id.slice(6)) - 1;
	const newPlace = Number(e.target.id.slice(6)) - 1;
	if (!(Math.abs(oldPlace - newPlace) == 4 || Math.abs(oldPlace - newPlace) == 1)) return;
	const [i, j] = [Math.min(oldPlace, newPlace), Math.max(oldPlace, newPlace)];
	setShuffledArray([
	...shuffledArray.slice(0, i),
	shuffledArray[j],
	...shuffledArray.slice(i + 1, j),
	shuffledArray[i],
	...shuffledArray.slice(j + 1),
	]);
	setMoves(moves + 1);
};
return (
	<div className="h-screen flex text-gray-300 bg-gray-950">
	<div className="mx-auto mt-8">
		{win && (
		<div className="rounded-md border-l-4 border-green-500 bg-green-100 p-2 mb-2">
			<div className="flex items-center justify-center space-x-4">
			<p className="font-medium text-green-600">
				HURRAY!! You have won the game 
			</p>
			</div>
		</div>
		)}
		<h1 className="text-3xl text-emerald-600 font-bold text-center">
		GeeksforGeeks
		</h1>
		<h3 className="text-xl font-bold 
        text-center bg-clip-text 
        text-transparent bg-gradient-to-r 
        from-indigo-500 from-10% via-sky-500 
        via-30% to-emerald-500 to-90%">
		15 Puzzle Game
		</h3>
		<div className="flex justify-between px-6 mt-2">
		<p>Moves: {moves}</p>
		<Timer time={time} timerActive={timerActive} setTime={setTime} />
		</div>
		<Puzzle shuffledArray={shuffledArray} 
        		dragStart={dragStart} 
        		dragOver={dragOver} dropped={dropped}/>
		<div className="px-6 mt-4">
		<button
			onClick={newGame}
			className="text-black font-bold block 
            bg-gray-900 p-2 rounded w-full 
            h-full bg-gradient-to-r from-indigo-500 
            from-10% via-sky-500 via-30% to-emerald-500 to-90%"
		>
			New Game
		</button>
		</div>
	</div>
	</div>
);
}
// Puzzle.js
import { FilledTile, EmptyTile } from "./Tile";
export default function Puzzle({ shuffledArray, dragOver, dragStart, dropped }){
	return (
		<div className="grid grid-cols-4 gap-8 mt-6 px-6 rounded">
		{shuffledArray.map((value, index) => {
		if (value === "")
			return (
			<EmptyTile dragOver={dragOver} dropped={dropped} index={index} />
			);
		return (
			<FilledTile index={index} value={value} dragStart={dragStart} />
		);
		})}
	</div>
	)
}
// Tile.js
export function FilledTile({index, value, dragStart}) {
return (
	<div
	id={`place-${index + 1}`}
	className={
		"shadow w-20 h-20 rounded " +
		(index == value - 1
		? "bg-gradient-to-r from-pink-500 to-yellow-500"
		: "bg-gray-900")
	}
	>
	<p
		id={`tile-${value}`}
		draggable="true"
		onDragStart={dragStart}
		className="fw-bold text-xl 
        grid grid-cols-1 place-items-center 
        w-20 h-20 rounded cursor-pointer 
        hover:bg-gray-800"
	>
		{value}
	</p>
	</div>
);
}
export function EmptyTile({dragOver, dropped, index}) {
return (
	<div
	onDragOver={dragOver}
	onDrop={dropped}
	id={`place-${index + 1}`}
	className="bg-gray-900 shadow w-20 h-20 rounded"
	></div>
);
}
// Timer.js
import { useEffect } from "react";
export default function Timer({ time, setTime, timerActive }) {
useEffect(() => {
	let interval = null;
	if (timerActive)
	interval = setInterval(() => {
		setTime((time) => time + 1);
	}, 1000);
	else clearInterval(interval);
	return () => {
	clearInterval(interval);
	};
}, [timerActive]);
return <p>Time: {time}s</p>;
}
// shuffleFunction.js
export default function shuffleArray() {
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, ""];
for (let i = array.length - 1; i > 0; i--) {
	let j = Math.floor(Math.random() * (i + 1));
	[array[i], array[j]] = [array[j], array[i]];
}
return array;
}
Steps to run the application:
1. Type the following command in the terminal:
npm start
2. Open the following URL in the web browser:
http://localhost:3000/
Output:

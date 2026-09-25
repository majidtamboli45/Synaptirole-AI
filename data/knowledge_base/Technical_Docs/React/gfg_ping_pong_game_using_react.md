# Ping Pong Game using React

> Source: https://www.geeksforgeeks.org/reactjs/ping-pong-game-using-react/

Ping Pong is one of the earliest video games. It's a two-player game in which each player controls the paddle by dragging it from one side of the screen to the other to strike the ball back and forth. In this article, you will see how you can create a simple but exciting game of ping pong using React.
Preview of the project: Let us have a look at how the final application will look like.
Prerequisites
Approach to create Ping Pong Game:
- To create a game interface and to handle the state, we will use React components.
- The arrow keys and the "w" and "d" keys are used by the players to control the paddles.
- inside the playing field, paddles can move upwards and downwards.
- When the ball hits a paddle it goes off the top and bottom of the wall.
- When the ball comes to either side of the screen, the game is over.
- We can start, restar and stop the game with the helps of button provided.
- We are able to detect the ball collision with paddle or wall with the help of DOM element boundingClientRect properties.
Steps to Create the Project:
Step 1: Create a ReactJS project:
npm create vite@latest ping-pong-game --template react
Step 2: Navigate to the project:
cd ping-pong-game
Step 3: Start the project:
npm run dev 
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example : Write the following code in App.js file
/*App.css*/
.ping-pong-container {
    position: relative;
    width: 600px;
    height: 400px;
    border: 1px solid #ccc;
    margin: 20px auto;
    overflow: hidden;
}
.paddle {
    position: absolute;
    width: 20px;
    height: 100px;
    background-color: #333;
    transition: top 0.2s;
}
.paddle-left {
    left: 0;
}
.paddle-right {
    right: 0;
}
.ball {
    position: absolute;
    width: 20px;
    height: 20px;
    background-color: red;
    border-radius: 50%;
    transition: top 0.2s, left 0.2s;
}
.paused {
    animation-play-state: paused;
}
.controls {
    margin-top: 10px;
    display: flex;
    gap: 10px;
}
button {
    padding: 5px 10px;
    font-size: 16px;
    cursor: pointer;
}
.game-over {
    background-color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    height: 45vh;
}
//App.js
import React, { useState, useEffect, useRef } from 'react';
import './App.css'; // Import the CSS file for styling
const App = () => {
const initialBallState = { x: 300, y: 200, speedX: 5, speedY: 5 };
const initialPaddleState = { left: 150, right: 150 };
const [ball, setBall] = useState(initialBallState);
const [paddles, setPaddles] = useState(initialPaddleState);
const [gameOver, setGameOver] = useState(false);
const [gameRunning, setGameRunning] = useState(false);
const ballRef = useRef(null);
useEffect(() => {
	if (gameRunning) {
	const handleKeyPress = (e) => {
		switch (e.key) {
		case 'ArrowUp':
			setPaddles((prev) => ({ ...prev, right: Math.max(prev.right - 10, 0) }));
			break;
		case 'ArrowDown':
			setPaddles((prev) => ({ ...prev, right: Math.min(prev.right + 10, 300) }));
			break;
		case 'w':
			setPaddles((prev) => ({ ...prev, left: Math.max(prev.left - 10, 0) }));
			break;
		case 'd':
			setPaddles((prev) => ({ ...prev, left: Math.min(prev.left + 10, 300) }));
			break;
		default:
			break;
		}
	};
	const updateGame = () => {
		setBall((prevBall) => ({
		...prevBall,
		x: prevBall.x + prevBall.speedX,
		y: 200,
		}));
		const ballRect = ballRef.current.getBoundingClientRect();
		const paddleLeftRect = document.getElementById('paddle-left').getBoundingClientRect();
		const paddleRightRect = document.getElementById('paddle-right').getBoundingClientRect();
		// Check for collisions with paddles
		if (
		(ballRect.left <= paddleLeftRect.right &&
			ballRect.right >= paddleLeftRect.left &&
			ballRect.top <= paddleLeftRect.bottom &&
			ballRect.bottom >= paddleLeftRect.top) ||
		(ballRect.left <= paddleRightRect.right &&
			ballRect.right >= paddleRightRect.left &&
			ballRect.top <= paddleRightRect.bottom &&
			ballRect.bottom >= paddleRightRect.top)
		) {
		setBall((prevBall) => ({ ...prevBall, speedX: -prevBall.speedX }));
		}
		// Check for collisions with top and bottom walls
		if (ball.y <= 0 || ball.y >= 380) {
		setBall((prevBall) => ({ ...prevBall, speedY: -prevBall.speedY }));
		}
		// Check for game over
		if (ball.x < 0 || ball.x > 600) {
		setGameOver(true);
		pauseGame();
		}
	};
	const intervalId = setInterval(updateGame, 50);
	window.addEventListener('keydown', handleKeyPress);
	return () => {
		clearInterval(intervalId);
		window.removeEventListener('keydown', handleKeyPress);
	};
	}
}, [gameRunning, ball]);
const startGame = () => {
	setGameRunning(true);
};
const restartGame = () => {
	setBall(initialBallState);
	setPaddles(initialPaddleState);
	setGameOver(false);
};
const pauseGame = () => {
	setGameRunning(false);
};
return (
	<div className="ping-pong-container" tabIndex="0">
	<div
		className={`paddle paddle-left ${gameRunning ? '' : 'paused'}`}
		id="paddle-left"
		style={{ top: `${paddles.left}px` }}
	/>
	<div
		className={`paddle paddle-right ${gameRunning ? '' : 'paused'}`}
		id="paddle-right"
		style={{ top: `${paddles.right}px`, left: '580px' }}
	/>
	<div
		className={`ball ${gameRunning ? '' : 'paused'}`}
		ref={ballRef}
		style={{ top: `${ball.y}px`, left: `${ball.x}px` }}
	/>
	<div className="controls">
		<button onClick={startGame}>Start</button>
		<button onClick={restartGame}>Restart</button>
		<button onClick={pauseGame}>Pause</button>
	</div>
	{gameOver && <div className="game-over">Game Over</div>}
	</div>
);
};
export default App;
Output:

# Create a Snake Game in React

> Source: https://www.geeksforgeeks.org/reactjs/create-a-snake-game-in-react/

Snake Game using ReactJS project implements functional components and manages the state accordingly. The developed Game allows users to control a snake using the arrow keys or touch the buttons displayed on the screen to collect food and grow in length. The goal of the game is to eat as much food as possible without colliding with the walls or the snake's own body.
Let's have a quick look at what the final application will look like:
Steps to create Snake Game:
Step 1: Set up the React project using the below command in VSCode IDE.
npm create vite@latest Snake_Game
Step 2: Navigate to the newly created project folder by executing the below command.
cd Snake_Game
Step 3: Create a folder named Components. We will create various components and their styling files in this components folder such as Button.js, Food.js, Menu.js, Snake.js, Menu.css, and Button.css.
Folder Structure:
The updated dependencies in package.json will look like:
"dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0",
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Insert the below code in the App.js ad index.css files mentioned in the above directory structure.
/* index.css */
body {
    background-color: #1e1e1e;
}
.game-area {
    position: relative;
    width: 600px;
    height: 500px;
    border: 2px solid #dc042c;
    border-radius: 10px;
    margin: 50px auto;
    display: flex;
    flex-wrap: wrap;
    box-shadow: 0 0 10px #abbfc0;
}
@media only screen and (max-width: 800px) {
    .game-area {
        position: relative;
        width: 350px;
        height: 300px;
    }
    .snake {
        width: 12px;
        height: 12px;
    }
}
.snake {
    position: absolute;
    width: 2%;
    height: 2%;
    background-color: #dc042c;
    border: 1px solid white;
    z-index: 2;
}
.food {
    position: absolute;
    width: 12px;
    height: 12px;
    background-color: white;
    border-radius: 20px;
    z-index: 1;
}
// App.js
import React, { Component } from "react";
import Snake from "./Components/Snake";
import Food from "./Components/Food";
import Button from "./Components/Button";
import Menu from "./Components/Menu";
import "./App.css";
const getRandomFood = () => {
    let min = 1;
    let max = 98;
    let x = Math.floor((Math.random() * (max - min + 1) + min) / 2) * 2;
    let y = Math.floor((Math.random() * (max - min + 1) + min) / 2) * 2;
    return [x, y];
};
const initialState = {
    food: getRandomFood(),
    direction: "RIGHT",
    speed: 100,
    route: "menu",
    snakeDots: [
        [0, 0],
        [0, 2],
    ],
};
class App extends Component {
    constructor() {
        super();
        this.state = initialState;
    }
    componentDidMount() {
        setInterval(this.moveSnake, this.state.speed);
        document.onkeydown = this.onKeyDown;
    }
    componentDidUpdate() {
        this.onSnakeOutOfBounds();
        this.onSnakeCollapsed();
        this.onSnakeEats();
    }
    onKeyDown = (e) => {
        e.preventDefault();
        e = e || window.event;
        switch (e.keyCode) {
            case 37:
                this.setState({ direction: "LEFT" });
                break;
            case 38:
                this.setState({ direction: "UP" });
                break;
            case 39:
                this.setState({ direction: "RIGHT" });
                break;
            case 40:
                this.setState({ direction: "DOWN" });
                break;
        }
    };
    moveSnake = () => {
        let dots = [...this.state.snakeDots];
        let head = dots[dots.length - 1];
        if (this.state.route === "game") {
            switch (this.state.direction) {
                case "RIGHT":
                    head = [head[0] + 2, head[1]];
                    break;
                case "LEFT":
                    head = [head[0] - 2, head[1]];
                    break;
                case "DOWN":
                    head = [head[0], head[1] + 2];
                    break;
                case "UP":
                    head = [head[0], head[1] - 2];
                    break;
            }
            dots.push(head);
            dots.shift();
            this.setState({
                snakeDots: dots,
            });
        }
    };
    onSnakeOutOfBounds() {
        let head = this.state.snakeDots[this.state.snakeDots.length - 1];
        if (this.state.route === "game") {
            if (
                head[0] >= 100 ||
                head[1] >= 100 ||
                head[0] < 0 ||
                head[1] < 0
            ) {
                this.gameOver();
            }
        }
    }
    onSnakeCollapsed() {
        let snake = [...this.state.snakeDots];
        let head = snake[snake.length - 1];
        snake.pop();
        snake.forEach((dot) => {
            if (head[0] == dot[0] && head[1] == dot[1]) {
                this.gameOver();
            }
        });
    }
    onSnakeEats() {
        let head = this.state.snakeDots[this.state.snakeDots.length - 1];
        let food = this.state.food;
        if (head[0] == food[0] && head[1] == food[1]) {
            this.setState({
                food: getRandomFood(),
            });
            this.increaseSnake();
            this.increaseSpeed();
        }
    }
    increaseSnake() {
        let newSnake = [...this.state.snakeDots];
        newSnake.unshift([]);
        this.setState({
            snakeDots: newSnake,
        });
    }
    increaseSpeed() {
        if (this.state.speed > 10) {
            this.setState({
                speed: this.state.speed - 20,
            });
        }
    }
    onRouteChange = () => {
        this.setState({
            route: "game",
        });
    };
    gameOver() {
        alert(`GAME OVER, your score is ${this.state.snakeDots.length - 2}`);
        this.setState(initialState);
    }
    onDown = () => {
        let dots = [...this.state.snakeDots];
        let head = dots[dots.length - 1];
        head = [head[0], head[1] + 2];
        dots.push(head);
        dots.shift();
        this.setState({
            direction: "DOWN",
            snakeDots: dots,
        });
    };
    onUp = () => {
        let dots = [...this.state.snakeDots];
        let head = dots[dots.length - 1];
        head = [head[0], head[1] - 2];
        dots.push(head);
        dots.shift();
        this.setState({
            direction: "UP",
            snakeDots: dots,
        });
    };
    onRight = () => {
        let dots = [...this.state.snakeDots];
        let head = dots[dots.length - 1];
        head = [head[0] + 2, head[1]];
        dots.push(head);
        dots.shift();
        this.setState({
            direction: "RIGHT",
            snakeDots: dots,
        });
    };
    onLeft = () => {
        let dots = [...this.state.snakeDots];
        let head = dots[dots.length - 1];
        head = [head[0] - 2, head[1]];
        dots.push(head);
        dots.shift();
        this.setState({
            direction: "LEFT",
            snakeDots: dots,
        });
    };
    render() {
        const { route, snakeDots, food } = this.state;
        return (
            <div>
                {route === "menu" ? (
                    <div>
                        <Menu onRouteChange={this.onRouteChange} />
                    </div>
                ) : (
                    <div>
                        <div className="game-area">
                            <Snake snakeDots={snakeDots} />
                            <Food dot={food} />
                        </div>
                        <Button
                            onDown={this.onDown}
                            onLeft={this.onLeft}
                            onRight={this.onRight}
                            onUp={this.onUp}
                        />
                    </div>
                )}
            </div>
        );
    }
}
export default App;
Write the following mentioned code in different files(The name of the files is mentioned in the first line of each code block).
- Button.js: Button.js represents a React functional component that renders buttons for controlling the snake's movement in the Snake Game.
- Menu.js: Menu.js file code renders a menu for the Snake Game. It displays a "Start Game" button and triggers the onRouteChange function when clicked. The menu is styled using CSS from the "Menu.css" file
- Food.js: Food.js is a React component that renders the food item in a game based on the provided coordinates.
- Snake.js: Snake.js file code is a React component that renders the snake in a game based on an array of coordinates representing its dots.
/* Button.css */
.upwards,
.downwards {
    display: flex;
    justify-content: center;
}
.sideways {
    display: flex;
    justify-content: center;
    margin: 10px;
}
.left,
.right {
    margin: 50px;
    padding: 20px;
    border: 0px solid;
    border-radius: 20px;
    border: 1px solid white;
    color: #dc042c;
    background: #1e1e1e;
    box-shadow: 5px -5px 10px rgba(0, 0, 0, 0.6);
}
.up,
.down {
    padding: 20px;
    border: 0px solid;
    border-radius: 20px;
    border: 1px solid white;
    color: #dc042c;
    background: #1e1e1e;
    box-shadow: 5px -5px 10px rgba(0, 0, 0, 0.6);
}
/* Menu.css */
.wrapper {
    position: relative;
    width: 200px;
    height: 250px;
    border: 2px solid #dc042c;
    /* border-radius: 10px; */
    margin: 50px auto;
    margin-top: 200px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    /* box-shadow: 0 0 10px #abbfc0; */
}
.start {
    margin: 100px;
    background: #1e1e1e;
    color: white;
    border-radius: 7px;
    border: 0px;
    padding: 10px;
    font-size: 1.2em;
    box-shadow: 0 0 70px #abbfc0;
    font-family: "Courier New", Courier, monospace;
}
//Button.js
import React from "react";
import "./Button.css";
const Button = ({ onUp, onDown, onLeft, onRight }) => {
    return (
        <div className="buttons">
            <div className="upwards">
                <input className="up" onClick={onUp} type="button" value="UP" />
            </div>
            <div className="sideways">
                <input
                    className="left"
                    onClick={onLeft}
                    type="button"
                    value="LEFT"
                />
                <input
                    className="right"
                    onClick={onRight}
                    type="button"
                    value="RIGHT"
                />
            </div>
            <div className="downwards">
                <input
                    className="down"
                    onClick={onDown}
                    type="button"
                    value="DOWN"
                />
            </div>
        </div>
    );
};
export default Button;
//Food.js
import React from "react";
const Food = (props) => {
    const style = {
        left: `${props.dot[0]}%`,
        top: `${props.dot[1]}%`,
    };
    return <div className="food" style={style} />;
};
export default Food;
//Menu.js
import React from "react";
import "./Menu.css";
const Menu = ({ onRouteChange }) => {
    return (
        <div className="wrapper">
            <div>
                <input
                    onClick={onRouteChange}
                    className="start"
                    type="button"
                    value="start game"
                />
            </div>
        </div>
    );
};
export default Menu;
//Snake.js
import React from "react";
const Snake = (props) => {
    return (
        <div>
            {props.snakeDots.map((dot, i) => {
                const style = {
                    left: `${dot[0]}%`,
                    top: `${dot[1]}%`,
                };
                return <div className="snake" key={i} style={style} />;
            })}
        </div>
    );
};
export default Snake;
Steps to run the application:
- Execute the following command in the terminal.
npm run dev
- Open the web browser and type the following URL in the address bar.
http://localhost:5173/

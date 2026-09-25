# Create a S Watch using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-stop-watch-using-reactjs/

We can create Stop Watch in ReactJS using the following approach. Our StopWatch will have the functionality of Start, Pause, Resume and Reset.
Creating React Application And Installing Module:
Step 1: Create a React application using the following command.
npm create vite@latest stopwatch --template react
Step 2: After creating your project folder i.e. stopwatch, move to it using the following command.
cd stopwatch
Step 3: Install project dependencies.
After initializing your Vite project, install the required dependencies by running:
npm install
Create a Components folder insider the src folder. Inside the Components folder create three different subfolders with the names StopWatch, Timer, ControlButtons. Now make a .jsx and a .css for each components.
Project Structure: It will look like the following.
Components used in our applications are:
Example: The outer component is StopWatch, the blue marked is the Timer, and the green-colored component will be denoted as ControlButtons.
index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
ReactDOM.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
    document.getElementById('root')
);
App.js
import './App.css';
import StopWatch from './Components/StopWatch/StopWatch.js';
function App() {
    return (
        <div className="App">
            <StopWatch />
        </div>
    );
}
export default App;
App.css
.App {
    background-color: rgb(238, 238, 238);
    width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
StopWatch.jsx
import React, { useState } from "react";
import "./StopWatch.css";
import Timer from "../Timer/Timer";
import ControlButtons from "../ControlButtons/ControlButtons";
function StopWatch() {
    const [isActive, setIsActive] = useState(false);
    const [isPaused, setIsPaused] = useState(true);
    const [time, setTime] = useState(0);
    React.useEffect(() => {
        let interval = null;
        if (isActive && isPaused === false) {
            interval = setInterval(() => {
                setTime((time) => time + 10);
            }, 10);
        } else {
            clearInterval(interval);
        }
        return () => {
            clearInterval(interval);
        };
    }, [isActive, isPaused]);
    const handleStart = () => {
        setIsActive(true);
        setIsPaused(false);
    };
    const handlePauseResume = () => {
        setIsPaused(!isPaused);
    };
    const handleReset = () => {
        setIsActive(false);
        setTime(0);
    };
    return (
        <div className="stop-watch">
            <Timer time={time} />
            <ControlButtons
                active={isActive}
                isPaused={isPaused}
                handleStart={handleStart}
                handlePauseResume={handlePauseResume}
                handleReset={handleReset}
            />
        </div>
    );
}
export default StopWatch;
StopWatch.css
.stop-watch {
    height: 85vh;
    width: 23vw;
    background-color: #0d0c1b;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
}
Three states used in the StopWatch component.
- time: It stores the time elapsed since you pressed start.
- isActive: It tells if the stop watch is in active state (i.e it is running, or it is being paused).
- isPaused: It tells if the stop watch is in active state and is paused or not.
Timer.jsx
import React from "react";
import "./Timer.css";
export default function Timer(props) {
    return (
        <div className="timer">
            <span className="digits">
                {("0" + Math.floor((props.time / 60000) % 60)).slice(-2)}:
            </span>
            <span className="digits">
                {("0" + Math.floor((props.time / 1000) % 60)).slice(-2)}.
            </span>
            <span className="digits mili-sec">
                {("0" + ((props.time / 10) % 100)).slice(-2)}
            </span>
        </div>
    );
}
Timer.css
.timer {
    margin: 3rem 0;
    width: 100%;
    display: flex;
    height: 12%;
    justify-content: center;
    align-items: center;
}
.digits {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 3rem;
    color: #f5f5f5;
}
.mili-sec {
    color: #e42a2a;
}
ControlButtons.jsx
import React from "react";
import "./ControlButtons.css";
export default function ControlButtons(props) {
    const StartButton = (
        <div className="btn btn-one btn-start"
            onClick={props.handleStart}>
            Start
        </div>
    );
    const ActiveButtons = (
        <div className="btn-grp">
            <div className="btn btn-two"
                onClick={props.handleReset}>
                Reset
            </div>
            <div className="btn btn-one"
                onClick={props.handlePauseResume}>
                {props.isPaused ? "Resume" : "Pause"}
            </div>
        </div>
    );
    return (
        <div className="Control-Buttons">
            <div>{props.active ? ActiveButtons : StartButton}</div>
        </div>
    );
}
ContolButtons.css
<pre>.Control-Buttons {
    margin: 3rem 0;
    width: 100%;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-grp {
    display: flex;
    align-items: center;
    justify-content: space-around;
}
.btn {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    width: 10vw;
    height: 5vh;
    border-radius: 14px;
    margin: 0px 6px;
    display: flex;
    border: 2px solid #e42a2a;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    color: #f5f5f5;
}
.btn-one {
    background-color: #e42a2a;
}
ControlButtons Rendering: If user haven't started the stop watch then you are supposed to show only the start button. If the user have started the stop watch then you are supposed to show the reset and resume/pause buttons.
Step to Run Application: Run the application using the following command from the root directory of the project.
npm run dev Output: Now open your browser and go to http://localhost:5173/, you will see the following output.

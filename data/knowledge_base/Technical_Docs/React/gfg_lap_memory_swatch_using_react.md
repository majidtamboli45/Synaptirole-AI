# Lap Memory Swatch using React

> Source: https://www.geeksforgeeks.org/reactjs/lap-memory-stopwatch-using-react/

Stopwatch is an application which helps to track time in hours, minutes, seconds, and milliseconds. This application implements all the basic operations of a stopwatch such as start, pause and reset button. It has an additional feature using which we can keep a record of laps which is useful when we have to note time for certain checkpoints.
Final Preview
Prerequisites
Approach
This program creates a functional stopwatch timer with start, pause, reset, and lap features. It maintains state variables for hours, minutes, seconds, and milliseconds, ensuring real-time updates using the "useEffect" hook. Proper interval clearing prevents memory leaks, delivering a straightforward and reliable stopwatch for time tracking.
Functionalities:
- When users click "Start," the timer begins, disabling the button with a "not-allowed" cursor.
- "Pause" stops the timer, and "Reset" sets all time units to zero.
- The program also offers a "Lap" feature for recording lap times, allowing users to track multiple intervals
Steps to create the application
Step 1: Set up React project using the command
npm create vite@latest <<name-of-project>> --template react
Step 2: Navigate to the project folder using
cd <<name-of-project>>
Step 3: Install the required dependencies:
npm install
Step 4: Create a folder “components” and add three new files in it namely StopWatch.js, Lap.js and StopWatch.css.
Project Structure:
The updated dependencies in package.json will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"vite": "^4.0.0"
}
Example: Write the following code in respective files
- App.js: This file imports the StopWatch components and exports it.
- StopWatch.js: This file contains the logic to track time in hours, minutes, seconds, and milliseconds, offering user-friendly controls for starting, pausing, and resetting the timer.
- Lap.js : This file contains the logic for displaying the laps in a list. From StopWatch.js file we send a prop laps to this file.
- StopWatch.css: This file contains the design of the StopWatch.js elements.
/* StopWatch.css */
body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}
.container {
    padding: 30px;
    border: 1px solid #ced4da;
    border-radius: 10px;
    background: #fff;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.25);
    margin: 5px;
    width: 100%;
    max-width: 400px;
    box-sizing: border-box;
}
.timeDisplay {
    padding: 20px;
    font-size: 30px;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.25);
    border-radius: 0.25em;
    text-align: center;
}
.buttons {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
button.btn {
    padding: 10px 20px;
    outline: none;
    border: 1px solid #ced4da;
    margin: 5px;
    border-radius: 4px;
    cursor: pointer;
    background: #1d9bf0;
    color: #fff;
    font-size: 16px;
    transition: all 0.5s;
}
button.btn:hover {
    background-color: #1879ba;
}
.laps {
    margin-top: 20px;
}
.laps h3 {
    text-align: left;
    display: flex;
    justify-content: space-between;
    margin: 5px;
}
.laps ul {
    list-style-type: none;
    padding: 0;
}
.laps li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0px 5px 10px 5px;
}
@media screen and (max-width: 420px) {
    .buttons {
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
}
// App.js
import './App.css';
import StopWatch from './components/StopWatch';
function App() {
    return (
        <div className="App">
            <StopWatch />
        </div>
    );
}
export default App;
// StopWatch.js
import React, { useState, useEffect } from "react";
import "./StopWatch.css";
import Lap from "./Lap";
export default function StopWatch() {
    const [seconds, setSeconds] = useState(0);
    const [minutes, setMinutes] = useState(0);
    const [hours, setHours] = useState(0);
    const [miliSeconds, setMiliSeconds] = useState(0);
    const [laps, setLaps] = useState([]);
    const [isRunning, setIsRunning] = useState(false);
    const formatWithLeadingZero = (number) => {
        if (number < 10) return "0" + number;
        else return number.toString();
    };
    useEffect(() => {
        let interval;
        if (isRunning) {
            interval = setInterval(() => {
                setMiliSeconds((miliSeconds) => {
                    if (miliSeconds >= 99) {
                        setSeconds((seconds) => {
                            if (seconds >= 59) {
                                setMinutes((minutes) => {
                                    if (minutes >= 59) {
                                        setHours((prevHours) => prevHours + 1);
                                        return 0;
                                    } else {
                                        return minutes + 1;
                                    }
                                });
                                return 0;
                            } else {
                                return seconds + 1;
                            }
                        });
                        return 0;
                    } else {
                        return miliSeconds + 1;
                    }
                });
            }, 10);
        }
        return () => clearInterval(interval);
    }, [isRunning]);
    const handleStart = () => {
        setIsRunning(true);
    };
    const handlePause = () => {
        setIsRunning(false);
    };
    const handleLap = () => {
        const lapTime =
            formatWithLeadingZero(hours) +
            ":" +
            formatWithLeadingZero(minutes) +
            ":" +
            formatWithLeadingZero(seconds) +
            "." +
            formatWithLeadingZero(miliSeconds);
        setLaps((prevLaps) => [...prevLaps, lapTime]);
    };
    const handleReset = () => {
        setIsRunning(false);
        setMiliSeconds(0);
        setSeconds(0);
        setMinutes(0);
        setHours(0);
        setLaps([]);
    };
    return (
        <div className="container">
            <div className="timeDisplay">
                {formatWithLeadingZero(hours)} : {formatWithLeadingZero(minutes)} :{" "}
                {formatWithLeadingZero(seconds)} : {formatWithLeadingZero(miliSeconds)}
            </div>
            <div className="buttons">
                <button
                    className="btn"
                    onClick={handleStart}
                    disabled={isRunning}
                    style={{ cursor: isRunning ? "not-allowed" : "pointer" }}
                >
                    Start
                </button>
                <button className="btn" onClick={handlePause}>
                    Pause
                </button>
                <button className="btn" onClick={handleLap}>
                    Lap
                </button>
                <button className="btn" onClick={handleReset}>
                    Reset
                </button>
            </div>
            <Lap laps={laps} />
        </div>
    );
}
// Lap.js
import React from "react";
export default function Laps({ laps }) {
    const calculateTimeDifference = (timeString1, timeString2) => {
        const time1 = new Date(`1970-01-01T${timeString1}Z`);
        const time2 = new Date(`1970-01-01T${timeString2}Z`);
        const timeDiff = Math.abs(time2 - time1);
        const hours = Math.floor(timeDiff / 3600000).toString().padStart(2, '0');
        const minutes = Math.floor((timeDiff % 3600000) / 60000).toString().padStart(2, '0');
        const seconds = Math.floor((timeDiff % 60000) / 1000).toString().padStart(2, '0');
        const milliseconds = ((timeDiff % 1000) / 10).toString().padStart(2, '0');
        const resultString = `${hours}:${minutes}:${seconds}.${milliseconds}`;
        return resultString;
    }
    return (
        <div className="laps" style={{ display: (laps.length) ? 'block' : 'none' }}>
            <h3><span>Lap</span><span>Time</span><span>Total Time</span></h3>
            <ul>
                {laps.map((lap, index) => (
                    <li key={index}>
                        <span>{`Lap ${index + 1}`}</span>
                        <span>{calculateTimeDifference(lap, (index !== 0) ? laps[index - 1] : "00:00:00.00")}</span>
                        <span>{lap}</span>
                    </li>
                ))}
            </ul>
        </div>
    );
};
To start the application run the following command
npm start
Output

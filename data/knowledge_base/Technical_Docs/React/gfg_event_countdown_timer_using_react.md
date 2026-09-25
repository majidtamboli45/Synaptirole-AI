# Event Countdown Timer Using React

> Source: https://www.geeksforgeeks.org/reactjs/event-countdown-timer-using-react/

Event Countdown Timer is an application where you can create an event with the name, date, and category of the event and it will create a card that will show you the remaining time of the event. After reaching that time of the day it will notify you.
The application will provide the option to start, stop and pause the countdown timer . Project will contain elegant UI to display countdown timer . So lets start building it.
Preview of Final Output:
Prerequisites and Technologies:
Approach:
We will build a single-page application in React that will display a countdown timer on the home page. The event countdown timer will be created as a separate component in React. The component is then rendered in app file. Bootstrap will be added to display options for an event countdown timer. The timer will start by taking time as input from the user.
Functionalities:
- Add Timer: This will add multiple countdown timers as required. set Title , Category and time of countdown timer.
- Remove Timer: This will remove a countdown timer.
- Calculate Time: The calculateTimeRemaining will calculate remaining time for each timer.
- Format Time: The formatTime will convert time in seconds to Days, Hours , Minutes and Seconds .
- Add Time: The addTimer and removeTimer will add and remove timers respectively by updating timers state.
Finally we will use useEffect to set interval with time . Time will be updated in the interval itself . when time reaches 0 the isRunning state is set to false. Thats it now we can add render code . The render code will consist of input field for taking time as input in seconds. This will update time state in our code . Then we will display current time in division . Three buttons will be used for three functionalities respectively .
Steps to create the application:
Step 1: First we need to create react app using below command
npm create vite@latest <<Project_Name>> --template react
Step 2: Navigate to the folder
cd <<Project_Name>>
Step 3: Install bootstrap for css using below command.
npm install bootstrap
Step 4: Create a folder components in src directory and inside the folder create files Countdown.js and Countdown.css
Project Structure:
Example: Here we we have created two JS file App.js, Countdown.js and CSS file to style the interface.
body {
    background-color: rgb(230, 227, 223);
}
.main-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: auto;
}
.timers {
    height: fit-content;
    margin: auto;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}
.card {
    display: flex;
    flex-direction: column;
}
// src/App.js 
import './App.css';
import Countdown from './components/Countdown';
function App() {
  return (
    <div className="App">
      <Countdown />
    </div>
  );
}
export default App;
// src/components/Countdown.js
import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.css";
import "./Countdown.css";
function Countdown() {
    const [timers, setTimers] = useState([]);
    const [newTimerTitle, setNewTimerTitle] = useState("");
    const [newTimerCategory, setNewTimerCategory] = useState("");
    const [newTimerDateTime, setNewTimerDateTime] = useState("");
    const categoryColors = {
        Meeting: "bg-primary",
        Birthday: "bg-danger",
        Reminder: "bg-success",
    };
    useEffect(() => {
        const intervalIds = {};
        const updateTimers = () => {
            setTimers((prevTimers) =>
                prevTimers.map((timer) => {
                    const targetTime = new Date(timer.targetDateTime)
                                       .getTime();
                    const currentTime = new Date().getTime();
                    const timeRemaining = Math.max(
                        Math.floor((targetTime - currentTime) / 1000),
                        0
                    );
                    if (timeRemaining === 0) {
                        clearInterval(intervalIds[timer.id]);
                        return { 
                        ...timer, isRunning: false, timeRemaining: 0 };
                    }
                    return { ...timer, timeRemaining };
                })
            );
        };
        timers.forEach((timer) => {
            if (timer.isRunning && timer.timeRemaining > 0) {
                intervalIds[timer.id] = setInterval(updateTimers, 1000);
            }
        });
        return () => {
            Object.values(intervalIds).forEach((intervalId) =>
                clearInterval(intervalId)
            );
        };
    }, [timers]);
    const removeTimer = (timerId) => {
        setTimers((prevTimers) =>
            prevTimers.filter((timer) => timer.id !== timerId)
        );
    };
    const calculateTimeRemaining = (targetTime) => {
        const currentTime = new Date().getTime();
        const timeDifference = targetTime - currentTime;
        const secondsRemaining = 
                Math.max(Math.floor(timeDifference / 1000), 0);
        return secondsRemaining;
    };
    const formatTimeRemaining = (seconds) => {
        const days = Math.floor(seconds / (3600 * 24));
        const hours = Math.floor((seconds % (3600 * 24)) / 3600);
        const minutes = Math.floor((seconds % 3600) / 60);
        const remainingSeconds = seconds % 60;
        return {
            days,
            hours,
            minutes,
            seconds: remainingSeconds,
        };
    };
    const addTimer = () => {
        if (!newTimerTitle || !newTimerCategory || !newTimerDateTime) 
            return;
            
        // Convert to milliseconds since epoch
        const targetDateTime = new Date(newTimerDateTime).getTime(); 
        
        const newTimer = {
            id: timers.length + 1,
            category: newTimerCategory,
            targetDateTime,
            // Calculate time remaining here
            timeRemaining: calculateTimeRemaining(targetDateTime), 
            isRunning: true,
            title: newTimerTitle,
            showTitleInput: false,
        };
        setTimers([...timers, newTimer]);
        setNewTimerTitle("");
        setNewTimerCategory("");
        setNewTimerDateTime("");
    };
    return (
        <div className="countdown-container">
            <div className="main-container">
                <div className="input-container m-3">
                    <h1 className="text-center text-success">
                        GeeksForGeeks Countdown Timer
                    </h1>
                    <input
                        type="text"
                        className="form-control m-2"
                        placeholder="Timer Title"
                        value={newTimerTitle}
                        onChange={
                            (e) => setNewTimerTitle(e.target.value)
                        }
                    />
                    <select
                        className="form-select m-2"
                        value={newTimerCategory}
                        onChange={
                            (e) => setNewTimerCategory(e.target.value)
                        }
                    >
                        <option value="">Select a Category</option>
                        <option value="Meeting">Meeting</option>
                        <option value="Birthday">Birthday</option>
                        <option value="Reminder">Reminder</option>
                    </select>
                    <input
                        className="form-control m-2"
                        type="datetime-local"
                        value={newTimerDateTime}
                        onChange={
                            (e) => setNewTimerDateTime(e.target.value)
                        }
                    />
                    <button
                        className="btn btn-primary m-2"
                        onClick={addTimer}
                        disabled={
                            !newTimerTitle ||
                            !newTimerCategory ||
                            !newTimerDateTime
                        }
                    >
                        Add Timer
                    </button>
                </div>
                <div className="timers-div m-auto d-flex">
                    {timers.map((timer) => {
                        const timeRemaining = formatTimeRemaining(
                            timer.timeRemaining
                        );
                        return (
                            <div
                                key={timer.id}
                                className={`card m-4 ${
                                    categoryColors[timer.category] || ""
                                }`}
                            >
                               <h3 className="card-title m-2 text-light">
                                    {timer.title}
                               </h3>
                                <h4 className="card-title m-2 text-dark">
                                    {timer.category}
                                </h4>
                                <div className="card-body d-flex">
                                    {timeRemaining.days > 0 && (
                                        <div className="container 
                                                        bg-light 
                                                        text-dark 
                                                        rounded m-2">
                                            <div>
                                                <h1>
                                                    <strong>
                                                    {timeRemaining.days}
                                                    </strong>
                                                </h1>
                                            </div>
                                            <div>days </div>
                                        </div>
                                    )}
                                    <div className="container bg-light 
                                    text-dark rounded m-2">
                                        <div>
                                            <h1>
                                                <strong>
                                                    {timeRemaining.hours}
                                                </strong>
                                            </h1>
                                        </div>
                                        <div>hours </div>
                                    </div>
                                    <div className="container 
                                                    bg-light 
                                                    text-dark 
                                                    rounded m-2">
                                        <div>
                                            <h1>
                                                <strong>
                                                {timeRemaining.minutes}
                                                </strong>
                                            </h1>
                                        </div>
                                        <div>minutes </div>
                                    </div>
                                    <div className="container 
                                                    bg-light 
                                                    text-dark 
                                                    rounded m-2">
                                        <div>
                                            <h1>
                                                <strong>
                                                {timeRemaining.seconds}
                                                </strong>
                                            </h1>
                                        </div>
                                        <div>seconds </div>
                                    </div>
                                </div>
                                <button
                                    className="btn btn-dark m-2"
                                    onClick={() => removeTimer(timer.id)}
                                    disabled={timer.timeRemaining <= 0}
                                >
                                    Remove
                                </button>
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
export default Countdown;
Steps to run the application:
Step 1: Open terminal in project folder and run below command
npm run dev
Step 2: Open the following link in your browser
http://localhost:5173/
Output:

# How to Create Countdown Timer in React JS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-countdown-timer-using-reactjs/

React timers are very common UI components that are widely used in various applications and websites to visually display the remaining time for a specific activity or event. React timers are mostly used to highlight the commencement or conclusion of events or offers on commercial websites.
This tutorial explores the process of creating a countdown timer using React JS, a popular JavaScript user interface toolkit.
Preview of final output:
Prerequisites
Approach to Create a Countdown Timer Using React JS
Here, we have 2 approaches to create the countdown timer given below
- Using React Hooks with Functional Components
- Using React State with the Class based Components
Steps to Create Countdown Timer Using React JS
Before creating a timer in React JS, you should be familiar with these terminologies:
- getTimeRemaining: Compute the difference between the target timer and the current time we have. This function will check the time left from the target timer by doing calculations and return a total number of hours, minutes, and seconds.
- StartTimer: This function will start timing down from getting a total number of hours, minutes, and seconds from the getTimeRemaining function.
- ClearTimer: This function is used to reset the timer, which means If you restart the timer it clears the time remaining from the previous countdown, otherwise it starts parallel two-timing down or it may collapse each other.
- getDeadTimer: This function provides the deadline of the timer means it gives time from where you want to start the countdown. In this, you have to add time if you want to extend. We have used this in two scenarios first when the page is loaded and second when someone clicks the reset button.
Steps to Create React Application
Countdown timers are great for various applications, including events and promotions.
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Approach 1: Create Countdown Timer Using React Hooks
We can create a countdown timer using React hooks and the setInterval method of JavaScript.
We use React hooks like useState, useRef and useEffect
We have provided the working code to properly demonstrate how to create a countdown timer using the React Hooks with Functional Components.
React Countdown Timer using React Hooks Example
This example implements a countdown timer in React using React Hooks and the JavaScript setInterval() method.
// Filename - App.js
import React, { useState, useRef, useEffect } from "react";
const App = () => {
    // We need ref in this, because we are dealing
    // with JS setInterval to keep track of it and
    // stop it when needed
    const Ref = useRef(null);
    // The state for our timer
    const [timer, setTimer] = useState("00:00:00");
    const getTimeRemaining = (e) => {
        const total =
            Date.parse(e) - Date.parse(new Date());
        const seconds = Math.floor((total / 1000) % 60);
        const minutes = Math.floor(
            (total / 1000 / 60) % 60
        );
        const hours = Math.floor(
            (total / 1000 / 60 / 60) % 24
        );
        return {
            total,
            hours,
            minutes,
            seconds,
        };
    };
    const startTimer = (e) => {
        let { total, hours, minutes, seconds } =
            getTimeRemaining(e);
        if (total >= 0) {
            // update the timer
            // check if less than 10 then we need to
            // add '0' at the beginning of the variable
            setTimer(
                (hours > 9 ? hours : "0" + hours) +
                ":" +
                (minutes > 9
                    ? minutes
                    : "0" + minutes) +
                ":" +
                (seconds > 9 ? seconds : "0" + seconds)
            );
        }
    };
    const clearTimer = (e) => {
        // If you adjust it you should also need to
        // adjust the Endtime formula we are about
        // to code next
        setTimer("00:00:10");
        // If you try to remove this line the
        // updating of timer Variable will be
        // after 1000ms or 1sec
        if (Ref.current) clearInterval(Ref.current);
        const id = setInterval(() => {
            startTimer(e);
        }, 1000);
        Ref.current = id;
    };
    const getDeadTime = () => {
        let deadline = new Date();
        // This is where you need to adjust if
        // you entend to add more time
        deadline.setSeconds(deadline.getSeconds() + 10);
        return deadline;
    };
    // We can use useEffect so that when the component
    // mount the timer will start as soon as possible
    // We put empty array to act as componentDid
    // mount only
    useEffect(() => {
        clearTimer(getDeadTime());
    }, []);
    // Another way to call the clearTimer() to start
    // the countdown is via action event from the
    // button first we create function to be called
    // by the button
    const onClickReset = () => {
        clearTimer(getDeadTime());
    };
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}>
            <h1 style={{ color: "green" }}>
                GeeksforGeeks
            </h1>
            <h3>Countdown Timer Using React JS</h3>
            <h2>{timer}</h2>
            <button onClick={onClickReset}>Reset</button>
        </div>
    );
};
export default App;
Steps To Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
Explanation:
- First, initialize a state 'timer' and a ref 'Ref' to manage time and interval.
- useEffect Hook starts the timer by calling clearTimer.
- getTimeRemaining Function calculates the remaining time from a future deadline
- startTimer Function updates the timer display every second based on the remaining time.
- clearTimer Function resets the timer to 10 seconds and starts the countdown.
- getDeadTime Function calculates the deadline time for the countdown.
- onClickReset Function resets the timer to 10 seconds when the "Reset" button is clicked.
- Return JSX displays the timer value and a "Reset" button in the UI.
Approach 2: Create Countdown Timer Using React State in Class Components
We can create a countdown timer using React states in class components and the setInterval method of JavaScript.
We will be using the React setState method and createRef methods to updated the timer in the state variable.
We have provided the working code to properly demonstrate how to create a countdown timer using the React States with Class Components.
Countdown timer using React States Example:
// Filename - App.js
import React, { Component } from "react";
class App extends Component {
    constructor(props) {
        super(props);
        // We need ref in this, because we are dealing
        // with JS setInterval to keep track of it and
        // stop it when needed
        this.Ref = React.createRef();
        // The state for our timer
        this.state = {
            timer: "00:00:00",
        };
    }
    getTimeRemaining = (e) => {
        const total = Date.parse(e) - Date.parse(new Date());
        const seconds = Math.floor((total / 1000) % 60);
        const minutes = Math.floor((total / 1000 / 60) % 60);
        const hours = Math.floor((total / 1000 / 60 / 60) % 24);
        return {
            total,
            hours,
            minutes,
            seconds,
        };
    };
    startTimer = (e) => {
        let { total, hours, minutes, seconds } = this.getTimeRemaining(e);
        if (total >= 0) {
            // update the timer
            // check if less than 10 then we need to
            // add '0' at the beginning of the variable
            this.setState({
                timer:
                    (hours > 9 ? hours : "0" + hours) +
                    ":" +
                    (minutes > 9 ? minutes : "0" + minutes) +
                    ":" +
                    (seconds > 9 ? seconds : "0" + seconds),
            });
        }
    };
    clearTimer = (e) => {
        // If you adjust it you should also need to
        // adjust the Endtime formula we are about
        // to code next
        this.setState({ timer: "00:00:10" });
        // If you try to remove this line the
        // updating of timer Variable will be
        // after 1000ms or 1sec
        if (this.Ref.current) clearInterval(this.Ref.current);
        const id = setInterval(() => {
            this.startTimer(e);
        }, 1000);
        this.Ref.current = id;
    };
    getDeadTime = () => {
        let deadline = new Date();
        // This is where you need to adjust if
        // you extend to add more time
        deadline.setSeconds(deadline.getSeconds() + 10);
        return deadline;
    };
    // We can use componentDidMount so that when the component
    // mount the timer will start as soon as possible
    componentDidMount() {
        this.clearTimer(this.getDeadTime());
    }
    // Another way to call the clearTimer() to start
    // the countdown is via action event from the
    // button first we create function to be called
    // by the button
    onClickReset = () => {
        this.clearTimer(this.getDeadTime());
    };
    render() {
        return (
            <div style={{ textAlign: "center", margin: "auto" }}>
                <h1 style={{ color: "green" }}>GeeksforGeeks</h1>
                <h3>Countdown Timer Using React JS</h3>
                <h2>{this.state.timer}</h2>
                <button onClick={this.onClickReset}>Reset</button>
            </div>
        );
    }
}
export default App;
Output: Now open your browser and go to http://localhost:3000
Explanation:
- First, initialize a state 'timer' and a ref 'Ref' using createRef() to manage time and interval.
- In componentDidMount initiate the countdown by calling theclearTimer function.
- getTimeRemaining Function calculates the remaining time from a future deadline
- startTimer Function updates the timer display every second based on the remaining time.
- clearTimer Function resets the timer to 10 seconds and starts the countdown.
- getDeadTime Function calculates the deadline time for the countdown.
- onClickReset Function resets the timer to 10 seconds when the "Reset" button is clicked.
- Return JSX displays the timer value and a "Reset" button in the UI.
Wrapping Up
React timer is a very useful component in website UI, as it helps in making events more interactive. This tutorial teaches how to create a countdown timer using React JS for your projects. Explained with live working code, this guide provides an easy solution to build a React timer.
We have used React Hooks and setTimer() method to create a countdown timer in React JS. Hope this guide, helps you build your first timer using React JS.

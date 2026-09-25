# JavaScript Throttling

> Source: https://www.geeksforgeeks.org/javascript/javascript-throttling/

Throttling is a JavaScript technique that controls how often a function executes within a fixed time interval. It improves performance by ensuring functions run at a consistent rate during frequent events.
- Limits function execution to once per specified time frame.
- Prevents performance issues during heavy events like scrolling.
- Ensures smoother and more efficient event handling.
function throttle(fn, delay) {
    let lastTime = 0;
    return function (...args) {
        let now = Date.now();
        if (now - lastTime >= delay) {
            fn.apply(this, args);
            lastTime = now;
        }
    };
}
// Function to be throttled
function printMessage() {
    console.log("Function executed at", new Date().toLocaleTimeString());
}
// Create throttled version
const throttledPrint = throttle(printMessage, 1000);
// Call it repeatedly
setInterval(throttledPrint, 200);
- throttle(fn, delay) returns a function that limits execution frequency.
- The last execution time is tracked to enforce the delay.
- The function runs only when the specified time gap has passed.
- Ensures execution occurs once per defined time interval.
Requirement of Throttling
Certain user interactions, like scrolling or window resizing, trigger events multiple times per second. Executing event handlers at such a high frequency can lead to performance issues, including:
- Increased CPU and memory usage.
- Unresponsive user interfaces.
- Inefficient API calls leading to server strain.
By throttling a function, we can ensure it executes at a controlled rate, reducing resource consumption and improving responsiveness.
Working of Throttling
Throttling works by restricting the execution of a function so that it runs at most once every predefined period, even if the event is triggered multiple times within that interval.
- A function is triggered multiple times due to an event (e.g., scroll, resize).
- Throttling ensures that the function executes only once within the defined interval.
- Any additional triggers during the interval are ignored until the next cycle starts.
- Once the interval is over, the function can execute again if triggered.
Implementing Throttling in JavaScript
1. Using setTimeout
A simple way to implement throttling is by using setTimeout. The function executes immediately and then ignores further calls until the delay period ends.
function throttle(fn, delay) {
    let isThr = false;
    return function (...args) {
        if (!isThr) {
            fn.apply(this, args);
            isThr = true;
            setTimeout(() => {
                isThr = false;
            }, delay);
        }
    };
}
window.addEventListener('scroll', throttle(() => {
    console.log('Scroll event triggered!');
}, 1000));
- throttle() creates a throttled version of a function using a boolean flag (isThr).
- The function executes immediately on the first scroll event.
- Further scroll events are ignored until the delay (1000 ms) completes.
- After the delay, throttling resets and the function can execute again.
2. Using Date.now()
Another approach is to use Date.now() to keep track of the last execution time and determine when the function should be called again.
function throttle(fn, delay) {
    let t = 0;
    return function (...args) {
        let now = Date.now();
        if (now - t >= delay) {
            fn.apply(this, args);
            t = now;
        }
    };
}
window.addEventListener('resize', throttle(() => {
    console.log('Resize event triggered!');
}, 500));
- throttle() limits how often a function can execute using a time-stamp (t).
- The function runs only if the specified delay (500 ms) has passed since the last call.
- Rapid resize events are ignored until the time gap condition is met.
- Ensures controlled execution during frequent resize events.
Difference Between Throttling and Debouncing
Both throttling and debouncing are techniques for controlling function execution, but they serve different purposes:
| Throttling | Debouncing | 
|---|---|
| Ensures function runs at most once per interval | Delays function execution until event stops | 
| Scroll events, API calls, keypress handling | Search input, auto-save, form validation | 
| Runs at regular intervals | Runs only once after a delay | 
| Executes during continuous events at a controlled rate. | Executes only after the event completely stops. | 
| Useful when intermediate results are needed. | Useful when only the final result matters. | 
| Maintains consistent performance under constant activity. | Prevents unnecessary execution during repeated activity. | 
Use Cases of Throttling
Throttling is commonly used in cases where frequent execution of a function can cause performance issues.
- Handling Scroll Events: Optimizing infinite scrolling by limiting API calls.
- Window Resize Events: Preventing excessive recalculations and re-renders.
- API Rate Limiting: Ensuring a function making API requests does not exceed allowed limits.
- Mouse Move Events: Improving efficiency in drag-and-drop interactions.

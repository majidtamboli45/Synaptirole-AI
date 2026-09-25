# Debouncing in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/debouncing-in-javascript/

Debouncing is a JavaScript technique used to control how often a function executes during rapidly triggered events. It ensures better performance by delaying execution until user activity has stopped for a defined time.
- Limits function calls during frequent events like typing, scrolling, or resizing.
- Delays execution so the function runs only after a specific pause.
- Prevents performance overload by avoiding unnecessary repeated executions.
// Debounce function
function debounce(func, delay) {
    let timeout;
    return function (...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            func.apply(this, args);
        }, delay);
    };
}
// Function to be debounced
function search(query) {
    console.log('Searching for:', query);
}
// Create a debounced version of the search function
const dSearch = debounce(search, 100);
// Simulate typing with multiple calls to the debounced function
dSearch('Hello');
dSearch('Hello, ');
dSearch('Hello, World!');  // Only this call will trigger after 100ms
- debounce() function: It is a higher-order function that takes a function (func) and a delay as arguments. It returns a new function that will wait for the specified delay before calling the original function.
- clearTimeout(): It is used to clear any previously set timeout so that if the event is triggered repeatedly the function call does not happen too quickly.
- setTimeout(): This method is used to set the timeout after clearing the previous timeouts.
- Search function: It is the placeholder for the function we want to debounce.
Working of Debouncing
- Debouncing starts working when an event is triggered.
- The function does not execute immediately; it waits for a specified delay.
- If the event triggers again before the delay ends, the previous call is canceled.
- The timer resets with each new event trigger.
- The function executes only after the events stop for the defined period.
Use Cases for Debouncing in JavaScript
The use cases of debouncing in JavaScript are:
- Search Input Field: In the search bar, the user types characters one after another due to which for each key press an API request is triggered. Debouncing makes sure that the API request is only sent when the user has finished typing.
let timer;
document.getElementById("searchInput").addEventListener("input", () => {
clearTimeout(timer);
timer = setTimeout(() => console.log("Searching..."), 300);
});
- Window Resizing: When we resize the window browser, in a short interval of time the resize event gets fired multiple times. Debouncing can be used in handling this event.
let timer;
window.addEventListener("resize", () => {
clearTimeout(timer);
timer = setTimeout(() => console.log("Window resized"), 500);
});
- Scroll Events: When the user scrolls the webpage the scroll event is triggered multiple times per second. By debouncing the event, the scroll handler function is executed only after the user has stopped scrolling for a specific duration.
let timer;
window.addEventListener("scroll", () => {
clearTimeout(timer);
timer = setTimeout(() => console.log("Scrolling stopped"), 300);
});
- Form Validation: If in real-time we are validating a form as the user types, debouncing can be used to ensure that for every keystroke the validation function is not repeatedly triggered.
let timer;
document.getElementById("formInput").addEventListener("input", () => {
clearTimeout(timer);
timer = setTimeout(() => console.log("Validating..."), 500);
});
Benefits of Debouncing
- Improved Performance: Debouncing helps in optimizing the performance by reducing the number of function executions, especially when handling frequent events like typing. This reduces unnecessary resource usage.
- Better User Experience: When the events are rapidly triggered then also the application remains responsive with debouncing.
- Prevents Redundant API Calls: Debouncing ensures that the API requests are only sent when the user stops interacting with the page for a specific time. This helps the server from crashing with repeated requests.
Debouncing vs Throttling
Debouncing and Throttling both are used for limiting the function calls during an event, but they both work in different ways:
- Debouncing: In Debouncing the function is called only when the event stops occurring for a specific time.
- Throttling: In throttling at regular intervals the function is called (every 100ms), even if the event has occurred multiple times during that duration.
| Features | Debouncing | Throttling | 
|---|---|---|
| Definition | Executes a function only after a specified delay with no further events during that time. | Executes a function at regular intervals, no matter how frequently the event occurs. | 
| Execution Trigger | After the event stops firing for a set time. | At fixed intervals, regardless of the event frequency. | 
| Delay/Interval | Delays the function call until the event stops. | Limits the function call to a specific interval, regardless of continuous events. | 
| Function Calls | The function is called once after the event stops firing for a defined time. | The function is called every X milliseconds, even if the event triggers more frequently. | 
| Example | Typing in a search box | Scroll event | 
When to Use Debouncing
We can use the debouncing in the following conditions:
- When we are dealing with operations like API calls then we can prevent unnecessary network requests to optimize the performance.
- We can prevent the lags or delays due to repeated function execution to improve the user experience.
- We can limit the function calls triggered by frequent user actions such as typing, and scrolling.

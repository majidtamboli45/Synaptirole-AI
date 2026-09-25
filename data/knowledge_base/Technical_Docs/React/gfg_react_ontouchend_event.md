# React onTouchEnd Event

> Source: https://www.geeksforgeeks.org/reactjs/react-ontouchend-event/

React onTouchEnd event event fires when the user touches screen and releases the touch. Similar to other elements in it, we have to pass a function for process execution.
It is similar to the HTML DOM ontouchend event but uses the camelCase convention in React.
Syntax:
onTouchEnd={function}
Parameter :
function that will call once the user touches and releases screen.
Return type:
- event: It is an event object containing information about the event like target element and values
Example 1 : In this example we implemented TouchEnd area where user touch and release then event fires and display a message in console.
/*App.css*/
.App {
    min-width: 30vw;
    margin: auto;
    text-align: center;
    color: green;
    font-size: 23px;
}
.Shaded {
    background-color: lightgray;
    height: 200px;
    width: 300px;
    margin: auto;
    border-radius: 6px;
}
// App.js
import "./App.css"
const App = () => {
    const function1 = (event) => {
        console.log("Touch End Fires!")
    }
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            <h2>Touch and Release to fire Event</h2>
            <div className="Shaded" onTouchEnd={function1}>
            </div>
        </div>
    );
}
export default App;
Output :
Example 2 : In this example, we implemented an area where the user, when touch and release, will get an alert that a touch event is fired.
/*App.css*/
.App {
    min-width: 30vw;
    margin: auto;
    text-align: center;
    color: green;
    font-size: 23px;
}
.Shaded {
    background-color: lightgray;
    height: 200px;
    width: 300px;
    margin: auto;
    border-radius: 6px;
}
// App.js
import "./App.css"
const App = () => {
    const function1 = (event) => {
        alert("Touch End Fires!")
    }
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            <h2>Touch and Release to fire Event</h2>
            <div className="Shaded" onTouchEnd={function1}>
            </div>
        </div>
    );
}
export default App;
Output:

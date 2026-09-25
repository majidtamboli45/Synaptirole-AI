# React Events Reference

> Source: https://www.geeksforgeeks.org/reactjs/react-events-reference/

React handles events as user interactions (like clicks or typing) that trigger functions in your app. It uses a synthetic event system to ensure consistent behavior across all browsers.
- Use camelCase for event names (e.g., onClick, onChange).
- Pass event handlers as functions inside curly braces {}.
- Use event.preventDefault() to stop default browser behavior.
Syntax:
onEvent={function}
/*App.css*/
.App {
    min-width: 30vw;
    margin: auto;
    text-align: center;
    color: green;
    font-size: 23px;
}
button {
    background-color: lightgray;
    height: 50px;
    width: 150px;
    margin: auto;
    border-radius: 6px;
    cursor: pointer;
}
// App.js
import "./App.css"
const App = () => {
    const function1 = (event) => {
        alert("Click Event Fired")
    }
    return (
        <div className="App">
            <h1>GeeksforGeeks</h1>
            <button onClick={function1}>
                Click Me!
            </button>
        </div>
    );
}
export default App;
- Inside the App component, a function (function1) is defined that triggers an alert saying "Click Event Fired" when the button is clicked.
- The button uses the onClick event handler to call function1 when clicked, displaying the alert.
Output:
The Complete list of Events are listed below
Below is a comprehensive list of React events used to handle various user interactions in applications.
Mouse Events
In React, handling mouse events is important for creating interactive user interfaces.
| Event | Description | 
|---|---|
| onClick | This event fires when user click mouse left button. | 
| onDoubleClick | This event triggers when user click mouse button twice. | 
| onMouseDown | This event occurs when mouse button pressed on any tag. | 
| onMouseUp | This event triggers when button released after press. | 
| onMouseMove | This event occurs when mouse cursor move on a particular tag or element. | 
| onMouseEnter | This event fires when a mouse cursor move inside in a HTML Element. | 
| onMouseLeave | This event occurs when mouse cursor leaves HTML Element boundaries. | 
Form Event
In React, handling form events is a crucial part of creating interactive and dynamic user interfaces.
| Event | Description | 
|---|---|
| onChange | This event triggers when the value of input tag changes. | 
| onInput | This event fires when the value of input field gets changed. | 
| onSubmit | This event triggers when user submit a form using Submit button. | 
| onFocus | This event fires when user click on any input tag and that tag active to enter data. | 
| onBlur | This event occurs when element is not longer active. | 
Clipboard Events
Clipboard events in React allow you to interact with the user's clipboard, providing a way to handle copy, cut, and paste operations.
| Event | Description | 
|---|---|
| onCopy | This event occurs when user copy data from any particular element. | 
| onCut | This event occurs when user cut data from any particular element. | 
| onPaste | This event occurs when user paste data from any particular element. | 
Touch Events
In React, you can handle touch events to create touch-friendly and mobile-responsive user interfaces.
| Event | Description | 
|---|---|
| onTouchStart | This event occurs when a user touches the screen. | 
| onTouchMove | This event fires when user touch and move their finger without removing finger. | 
| onTouchEnd | This event occurs one touch released by user. | 
| onTouchCancel | This event hits when touch cancels by user. | 
Pointer Events
Pointer events in React are a set of events that handle different input devices, including mouse, touch, and pen interactions.
| Event | Description | 
|---|---|
| onPointerDown | This event works when a pointing device inititates pointing screen. | 
| onPointerMove | This event works when pointing device starts initiating and moving the pointer. | 
| onPointerUp | This event triggers when user released the button from pointing device after pointing a tag. | 
| onPointerCancel | This event occurs when user cancels their touch on screen. | 
UI Events
It seems there might be a bit of confusion in your question. The term "UI event" is quite broad and could refer to various types of events that occur in a user interface.
| Event | Description | 
|---|---|
| onScroll | This event occurs when user start scrolling the page. | 
| onResize | This event occurs when the size of browser is changed. | 
Keyboard Events
In React, you can handle keyboard events using synthetic events provided by React.
| Event | Description | 
|---|---|
| onKeyDown | This event occurs when a user presses the key from keyboard. | 
| onKeyPress | This event occurs when a user presses the key from keyboard. | 
| onKeyUp | This event occurs when a user presses and released the key from keyboard. |

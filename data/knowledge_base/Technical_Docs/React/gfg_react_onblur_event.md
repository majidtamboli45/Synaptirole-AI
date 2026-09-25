# React onBlur Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onblur-event/

onBlur is a React event triggered when an element loses focus, helping manage user interactions and focus behavior.
- Triggered on Focus Loss: Fires when an element (input, textarea, button) loses focus.
- Form Handling: Commonly used for validation when the user leaves a field.
- Keyboard and Mouse Support: Works when navigating via Tab key or clicking elsewhere.
- Improves UX: Helps provide feedback after user interaction.
Syntax:
<Element onBlur={handleBlur} />
- <Element>: The React component or HTML element (like input, textarea, etc.) you want to track the focus loss for.
- handleBlur: The function that will be executed when the element loses focus. This function can be defined in your component.
It is similar to the HTML DOM onblur event but uses the camelCase convention in React.
Behaviour of the onBlur Event in React
The onBlur event gets triggered when an element loses focus. This can happen in several ways:
- The user clicks outside the element.
- The user presses the Tab key to navigate to another element.
- The user clicks or focuses on another interactive element, such as a button or link.
Handling the onBlur Event
The onBlur event in React is fired when an element loses focus. This event is commonly used for performing actions after a user finishes interacting with an input field, such as form validation, UI updates, or saving data.
import React, { useState } from 'react';
function App() {
    const [value, setValue] = useState('');
    const handleBlur = () => {
        console.log('Input blurred');
    };
    return (
        <form action="">
            <label htmlFor="">Name:</label>
            <input
                type="text"
                value={value}
                placeholder='Write Your Name'
                onChange={
                    (e) => 
                    setValue(e.target.value)}
                onBlur={handleBlur}
            />
        </form>
    );
}
export default App;
Output:
- A React component with a controlled input field using the useState hook.
- The value state holds the input's current value.
- The onChange event updates the value state as the user types.
- The onBlur event triggers the handleBlur function and logs "Input blurred" when the input loses focus.
Preventing Default Behavior
In React, event.preventDefault() is used to override default behaviors such as form submission or unintended UI changes, allowing controlled and programmatic handling of events like onSubmit or onBlur.
import React, { useState } from "react";
function PreventDefault() {
    const [value, setValue] = useState("");
    const [message, setMessage] = useState("");
    
    const handleSubmit = (event) => {
        event.preventDefault();
        if (!value.trim()) {
            setMessage("Please enter something in the input field!");
        } else {
            setMessage(`Form submitted successfully with value: ${value}`);
        }
    };
    const handleChange = (event) => {
        setValue(event.target.value);
        setMessage(""); 
    };
    return (
        <div>
            <h2>Form with Prevented Default Submission</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Enter Text:
                    <input
                        type="text"
                        value={value}
                        onChange={handleChange}
                        placeholder="Type something"
                    />
                </label>
                <button type="submit">Submit</button>
            </form>
            {/* Display the message based on form submission */}
            {message && <p>{message}</p>}
        </div>
    );
}
export default PreventDefault;
Output:
- This React component prevents form submission from reloading the page using event.preventDefault().
- It validates the input field on submission, displaying an error message if empty, or a success message with the entered value.
- The input is managed using state, and the message is cleared when the user types.
Accessing the Event Object
The onBlur event handler in React receives an event object that provides details about the focus change. This event object is useful for accessing information such as the element that lost focus, the previous element, and other relevant data.
import React, { useState } from "react";
function AccessEvent() {
    const [value, setValue] = useState("");
    const handleChange = (event) => {
        console.log("Event Object:", event); 
        console.log("Input Value:", event.target.value); 
        setValue(event.target.value); 
    };
    return (
        <div>
            <h2>Access Event Object Example</h2>
            <input
                type="text"
                value={value}
                onChange={handleChange} 
                placeholder="Type something"
            />
            <p>Input Value: {value}</p>
        </div>
    );
}
export default AccessEvent;
Output:
- This React component logs the event object and input value whenever the user types in the input field.
- The handleChange function updates the state with the input value (event.target.value) and logs the event details.
- The current input value is displayed below the input field.
Using onBlur for Focus Validation
One common use case for the onBlur event is focus validation, which allows you to validate user input when they move focus away from an input field (e.g., checking if an email address is valid after they leave the input field).
import React, { useState } from "react";
function FocusValidation() {
    const [email, setEmail] = useState("");
    const [error, setError] = useState("");
    const handleBlur = () => {
        const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!regex.test(email)) {
            setError("Please enter a valid email.");
        } else {
            setError("");
        }
    };
    const handleChange = (event) => {
        setEmail(event.target.value);
    };
    return (
        <div>
            <input
                type="email"
                value={email}
                onChange={handleChange}
                onBlur={handleBlur}
            />
            {error && <p style={{ color: "red" }}>{error}</p>}
        </div>
    );
}
export default FocusValidation;
Output:
Using onBlur for Toggling Edit Modes
We can also use the onBlur event to toggle between edit and view modes in a UI component, allowing users to edit a field and then automatically switch it back to a display mode when they finish.
import React, { useState } from "react";
function ToggleEdit() {
    const [isEditing, setIsEditing] = useState(false);
    const [value, setValue] = useState("Click to Edit");
    const handleBlur = () => {
        setIsEditing(false); 
    };
    const handleChange = (event) => {
        setValue(event.target.value);
    };
    return (
        <div>
            {isEditing ? (
                <input
                    type="text"
                    value={value}
                    onChange={handleChange}
                    onBlur={handleBlur} 
                />
            ) : (
                <p onClick={() => setIsEditing(true)}>{value}</p> 
            )}
        </div>
    );
}
export default ToggleEdit;
Output:
- Edit Mode: Clicking the text switches it to an input field for editing, and the onBlur event exits edit mode when the input loses focus.
- Display Mode: The text is displayed as a paragraph (<p>). Clicking on the text switches it to edit mode.
Use Cases
The onBlur event in React is highly versatile and can be used to handle various interactions and enhance user experience. Below are some common use cases where onBlur can be particularly useful:
- Form Validation: Trigger validation when a user exits an input field (e.g., check if an email is valid).
- Auto-Saving: Automatically save data when the user finishes editing a field.
- UI Updates: Change UI elements, like showing validation feedback or changing field styles.
- Focus Management: Automatically move focus to the next field or step in a form.
- Hide UI Elements: Hide tooltips, dropdowns, or popups when focus is lost.
- Closing Modals: Close modals or popups when the user clicks away or moves focus.

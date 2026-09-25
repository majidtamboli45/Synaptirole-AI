# onSubmit Event in React

> Source: https://www.geeksforgeeks.org/reactjs/react-onsubmit-event/

onSubmit is a React event triggered when a form is submitted, allowing control over submission behavior and handling of form data. It is commonly used for validation and executing custom logic.
- Triggered on Form Submit: Fires when a form is submitted.
- Prevent Default Behavior: Use event.preventDefault() to stop page reload.
- Form Validation: Validate inputs before processing.
- Custom Logic: Send data to APIs or process form data.
Syntax:
<form onSubmit={handleSubmit} >
    <input type="text">
</form>
- onSubmit = {handleSubmit}: The event handler function handleSubmit is called when the form is submitted.
- handleSubmit: A custom function where you can define actions (like validation or API calls) when the form is submitted.
Behaviour of the onSubmit Event in React
- A user clicks the submit button inside a form.
- A user presses the Enter key while focused on an input field within the form.
- The form submission event is programmatically dispatched using JavaScript.
Note: When a user submits a form, React triggers the event handler and gives you access to the form’s data via the event object.
// Filename - App.js
import React, { useState } from "react";
function App() {
    const [value, setValue] = useState("");
    const [result, setResult] = useState("");
    function handleSubmit(e) {
        e.preventDefault();
        setResult(
            "Form has been submitted with with Input: " +
                value
        );
    }
    function handleChange(e) {
        setValue(e.target.value);
        setResult("");
    }
    return (
        <div
            style={{ textAlign: "center", margin: "auto" }}
        >
            <h1 style={{ color: "Green" }}>
                GeeksforGeeks
            </h1>
            <h3>
                Exemple for React onSubmit Event Handler
            </h3>
            <form onSubmit={handleSubmit}>
                <label>Add input here: </label>
                <input
                    value={value}
                    onInput={handleChange}
                    required
                />
                <br />
                <br />
                <button type="submit">Submit</button>
            </form>
            <br />
            <div>
                <h4>{result}</h4>
            </div>
        </div>
    );
}
export default App;
Output:
- The app uses React state (value and result) to manage form input and display the result.
- handleSubmit updates result with the input value when the form is submitted.
- handleChange updates value and clears result whenever the input changes.
- The form includes a labeled input field and a submit button.
Accessing the Event Object
React provides access to the event object within the onSubmit handler. This allows you to access form data, prevent default submission, and handle other event-related tasks efficiently.
import React, { useState } from "react";
function AccessEvent() {
    const [value, setValue] = useState("");
    const handleSubmit = (event) => {
        console.log("Event object:", event);
        alert(`Form submitted with value: ${value}`);
    };
    const handleChange = (event) => {
        setValue(event.target.value);
    };
    return (
        <div>
            <form onSubmit={handleSubmit}>
                <label>
                    Enter Text:
                    <input type="text" value={value} onChange={handleChange} />
                </label>
                <button type="submit">Submit</button>
            </form>
        </div>
    );
}
export default AccessEvent;
Output:
- State Management: value stores the input text.
- handleSubmit: On form submission, it logs the event object and shows an alert with the input value.
- handleChange: Updates the value state as the user types in the input field.
Preventing Default Form Submission
In React, when a form is submitted, the default behavior is for the page to reload, which is typically undesirable for single-page applications (SPA). To prevent this, we use the event.preventDefault() method. This allows us to handle the form submission programmatically without reloading the page.
import React, { useState } from "react";
function PreventForm() {
    const [value, setValue] = useState("");
    const [result, setResult] = useState("");
    const handleSubmit = (event) => {
        event.preventDefault();
        if (!value.trim()) {
            alert("Input cannot be empty!");
        } else {
            setResult(value);
            alert("Form submitted successfully!");
        }
    };
    const handleChange = (event) => {
        setValue(event.target.value);
        setResult(""); 
    };
    return (
        <div>
            <form onSubmit={handleSubmit}>
                <label>
                    Enter Text:
                    <input type="text" value={value} onChange={handleChange} />
                </label>
                <button type="submit">Submit</button>
            </form>
            <p>Result: {result}</p>
        </div>
    );
}
export default PreventForm;
Output:
- State Management: value stores the input text, and result stores the result after form submission.
- handleSubmit: Prevents the default form submission (page reload) using event.preventDefault(). If the input is empty, it shows an alert; otherwise, it sets result with the input value and displays a success message.
- handleChange: Updates the value state as the user types and clears the result when the input changes.
Features of onSubmit
onSubmit enables controlled and customizable handling of form submission events.
- Handles Form Submissions: It captures form submission events, triggered by a user pressing a submit button or pressing Enter in a form field.
- Prevents Default Behavior: The default form submission can be prevented, allowing you to handle the submission programmatically.
- Works with All Form Elements: Can be used to handle submissions from any form element, including <input>, <textarea>, <select>, etc.
- Flexible Callback: You can perform custom actions like validation, API calls, or state updates within the onSubmit event handler.
Use Cases
onSubmit is commonly used to manage form behavior and process user input efficiently.
- Form Validation: Check if all required fields are filled or if the data entered is valid before submitting.
- Submitting Data: Send form data to a server or API when the form is submitted.
- Prevent Page Reload: Prevent the default form behavior (page reload) and handle form submission with JavaScript.
- Displaying Confirmation: Show a confirmation message or update the UI after a successful form submission.
- Resetting Fields: Clear form fields or reset the form after submission.
Note: It is similar to the HTML DOM onsubmit event but uses the camelCase convention in React.

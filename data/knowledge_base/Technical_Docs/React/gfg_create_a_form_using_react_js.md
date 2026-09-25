# Create a Form using React JS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-form-using-reactjs/

Creating a Form in React includes the use of JSX elements to build interactive interfaces for user inputs. We will be using HTML elements to create different input fields and functional component with useState to manage states and handle inputs.
Prerequisites:
Preview Image: Let us have a look at what the final project will look like:
Approach to Build Form in React
To create a form in React we will structure the form with HTML inputs, add styles using CSS, manage input state using useState, and handle form data updates via onChange events.
Steps to Create a Form Using React JS
Follow these steps to create a form in React with Vite:
Step 1. Set Up the React Project Using Vite:
Instead of using create-react-app, we will use Vite to quickly set up a React project. Open your terminal and run the following command:
npm create vite@latest my-react-form --template react
Step 2. Navigate to the Project Directory:
After the project is created, navigate to the project directory
cd my-react-form
Step 3. Install Dependencies:
Install the project dependencies:
npm install
Step 4. Structure the Form Using HTML:
Inside your src folder, locate App.jsx and start by creating the form structure using HTML. We will use input fields, textarea, radio, checkbox, and a select dropdown for different user inputs.
Step 5. Add Button for Reset and Submit Actions:
Create buttons for both reset and submit actions.
Step 6. Style the Form Using CSS:
Use CSS to style the form elements, including labels, inputs, and buttons. You can add the styles directly in App.css or create a separate CSS file for the form.
Step 7. Use the useState Hook:
Use React's useState hook to store and manage the form input values.
Step 8. Define Event Handlers:
Define functions to handle the onChange events for each input field and update the respective state variables accordingly.
Example: This example demonstrate how to create basic form in react with the help of HTML inputs.
/* Filename - App.css */
/* It containds the Form and Page Styling*/
body {
    background: #f3f3f3;
    text-align: center;
}
.App {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    padding: 10px 20px;
    transition: transform 0.2s;
    width: 500px;
    text-align: center;
    margin: auto;
    margin-top: 20px;
}
h1 {
    font-size: x-large;
    text-align: center;
    color: #327c35;
}
fieldset {
    border: none;
}
input {
    display: block;
    width: 100%;
    /* margin-bottom: 15px; */
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 3px;
    font-size: 12px;
}
input[type="radio"],
input[type="checkbox"] {
    display: inline;
    width: 10%;
}
select {
    display: block;
    width: 100%;
    margin-bottom: 15px;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
}
label {
    font-size: 15px;
    display: block;
    width: 100%;
    margin-top: 8px;
    margin-bottom: 5px;
    text-align: left;
    color: #555;
    font-weight: bold;
}
button {
    padding: 15px;
    border-radius: 10px;
    margin: 15px;
    border: none;
    color: white;
    cursor: pointer;
    background-color: #4caf50;
    width: 40%;
    font-size: 16px;
}
textarea {
    resize: none;
    width: 98%;
    min-height: 100px;
    max-height: 150px;
}
// Filename - App.js
// It contains the Form, its Structure
// and Basic Form Functionalities
import "./App.css";
import { React, useState } from "react";
function App() {
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [email, setEmail] = useState("");
    const [contact, setContact] = useState("");
    const [gender, setGender] = useState("male");
    const [subjects, setSubjects] = useState({
        english: true,
        maths: false,
        physics: false,
    });
    const [resume, setResume] = useState("");
    const [url, setUrl] = useState();
    const [selectedOption, setSelectedOption] =
        useState("");
    const [about, setAbout] = useState("");
    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(
            firstName,
            lastName,
            email,
            contact,
            gender,
            selectedOption,
            subjects,
            resume,
            url,
            about
        );
        // Add your form submission logic here
    };
    const handleSubjectChange = (sub) => {
        setSubjects((prev) => ({
            ...prev,
            [sub]: !prev[sub],
        }));
    };
    const handleReset = () => {
        // Reset all state variables here
        setFirstName("");
        setLastName("");
        setEmail("");
        setContact("");
        setGender("male");
        setSubjects({
            english: true,
            maths: false,
            physics: false,
        });
        setResume("");
        setUrl("");
        setSelectedOption("");
        setAbout("");
    };
    return (
        <div className="App">
            <h1>Form in React</h1>
            <fieldset>
                <form action="#" method="get">
                    <label for="firstname">
                        First Name*
                    </label>
                    <input
                        type="text"
                        name="firstname"
                        id="firstname"
                        value={firstName}
                        onChange={(e) =>
                            setFirstName(e.target.value)
                        }
                        placeholder="Enter First Name"
                        required
                    />
                    <label for="lastname">Last Name*</label>
                    <input
                        type="text"
                        name="lastname"
                        id="lastname"
                        value={lastName}
                        onChange={(e) =>
                            setLastName(e.target.value)
                        }
                        placeholder="Enter Last Name"
                        required
                    />
                    <label for="email">Enter Email* </label>
                    <input
                        type="email"
                        name="email"
                        id="email"
                        value={email}
                        onChange={(e) =>
                            setEmail(e.target.value)
                        }
                        placeholder="Enter email"
                        required
                    />
                    <label for="tel">Contact*</label>
                    <input
                        type="tel"
                        name="contact"
                        id="contact"
                        value={contact}
                        onChange={(e) =>
                            setContact(e.target.value)
                        }
                        placeholder="Enter Mobile number"
                        required
                    />
                    <label for="gender">Gender*</label>
                    <input
                        type="radio"
                        name="gender"
                        value="male"
                        id="male"
                        checked={gender === "male"}
                        onChange={(e) =>
                            setGender(e.target.value)
                        }
                    />
                    Male
                    <input
                        type="radio"
                        name="gender"
                        value="female"
                        id="female"
                        checked={gender === "female"}
                        onChange={(e) =>
                            setGender(e.target.value)
                        }
                    />
                    Female
                    <input
                        type="radio"
                        name="gender"
                        value="other"
                        id="other"
                        checked={gender === "other"}
                        onChange={(e) =>
                            setGender(e.target.value)
                        }
                    />
                    Other
                    <label for="lang">
                        Your best Subject
                    </label>
                    <input
                        type="checkbox"
                        name="lang"
                        id="english"
                        checked={subjects.english === true}
                        onChange={(e) =>
                            handleSubjectChange("english")
                        }
                    />
                    English
                    <input
                        type="checkbox"
                        name="lang"
                        id="maths"
                        checked={subjects.maths === true}
                        onChange={(e) =>
                            handleSubjectChange("maths")
                        }
                    />
                    Maths
                    <input
                        type="checkbox"
                        name="lang"
                        id="physics"
                        checked={subjects.physics === true}
                        onChange={(e) =>
                            handleSubjectChange("physics")
                        }
                    />
                    Physics
                    <label for="file">Upload Resume*</label>
                    <input
                        type="file"
                        name="file"
                        id="file"
                        onChange={(e) =>
                            setResume(e.target.files[0])
                        }
                        placeholder="Enter Upload File"
                        required
                    />
                    <label for="url">Enter URL*</label>
                    <input
                        type="url"
                        name="url"
                        id="url"
                        onChange={(e) =>
                            setUrl(e.target.value)
                        }
                        placeholder="Enter url"
                        required
                    />
                    <label>Select your choice</label>
                    <select
                        name="select"
                        id="select"
                        value={selectedOption}
                        onChange={(e) =>
                            setSelectedOption(
                                e.target.value
                            )
                        }
                    >
                        <option
                            value=""
                            disabled
                            selected={selectedOption === ""}
                        >
                            Select your Ans
                        </option>
                        <optgroup label="Beginers">
                            <option value="1">HTML</option>
                            <option value="2">CSS</option>
                            <option value="3">
                                JavaScript
                            </option>
                        </optgroup>
                        <optgroup label="Advance">
                            <option value="4">React</option>
                            <option value="5">Node</option>
                            <option value="6">
                                Express
                            </option>
                            <option value="t">
                                MongoDB
                            </option>
                        </optgroup>
                    </select>
                    <label for="about">About</label>
                    <textarea
                        name="about"
                        id="about"
                        cols="30"
                        rows="10"
                        onChange={(e) =>
                            setAbout(e.target.value)
                        }
                        placeholder="About your self"
                        required
                    ></textarea>
                    <button
                        type="reset"
                        value="reset"
                        onClick={() => handleReset()}
                    >
                        Reset
                    </button>
                    <button
                        type="submit"
                        value="Submit"
                        onClick={(e) => handleSubmit(e)}
                    >
                        Submit
                    </button>
                </form>
            </fieldset>
        </div>
    );
}
export default App;
Step 9. Run the application by executing the following command in the terminal.
npm run dev
Output: This output will be visible on localhost:5173/ on the browser window.

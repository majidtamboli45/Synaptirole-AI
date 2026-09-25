# How To Set Default Value In Select using ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-set-default-value-in-select-using-reactjs/

When building forms in ReactJS, it is common to work with select dropdowns where users can choose an option from a list. Sometimes, you may want to set a default value in the select dropdown to pre-select an option when the form loads.
In this article, we’ll explore different approaches to set a default value in a select dropdown using ReactJS.
Steps To Create React Application
Before we dive into setting default values in select dropdowns, let's create a basic React application.
1. Create React Project:
Use the following command to create a new React project:
npx create-react-app myreactapp
cd myreactapp
2. Navigate to the Project Directory:
cd myreactapp
3. Project Structure
Approach to Set Default Value in Select Using ReactJS
When building forms in ReactJS, it's common to work with <select> dropdowns where users can choose an option from a list. Often, you may want to set a default value in the <select> dropdown to pre-select an option when the form loads.
1. Using the HTML <select> Tag
For simple use cases, you can use the native HTML <select> tag in ReactJS to create a dropdown and set the default value. To achieve this, you can use the selected attribute on the <option> element.
/* App.css */
.App {
    text-align: center;
}
.geeks {
    color: green;
}
.container {
    display: flex;
    justify-content: center;
}
.item {
    min-width: 10rem;
    text-align: left;
}
// Filename - App.js
import { Component } from "react";
import "./App.css";
class App extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div className="App">
                <h1 className="geeks">Geeks For Geeks</h1>
                <form className="container">
                    <select
                        className="item"
                        name="languages"
                        style={{ width: "200px" }}
                    >
                        <option value="JAVA">JAVA</option>
                        <option value="C++">C++</option>
                        <option value="Javascript" selected>
                            Javascript
                        </option>
                        <option value="Python">
                            Python
                        </option>
                        <option value="R">R</option>
                        <option value="Scala">Scala</option>
                        <option value="Swift">Swift</option>
                    </select>
                </form>
            </div>
        );
    }
}
export default App;
Output
Follow this article for more details => How to set the default value for an HTML <select> element ?
2. Using React Select component
To set default value in react-select you can use the defaultValue attrubute in the Select menu. If none option is integrated with this attribute first option is selected by default. You can create an Array of the object where you will store all options to be displayed and any single object is passed in the defaultValue attribute.
Step to Install react-select:
Install the react-select module using the following command in the project directory.
npm i react-select
/* App.css */
.App {
    text-align: center;
}
.geeks {
    color: green;
}
.container {
    display: flex;
    justify-content: center;
}
.item {
    min-width: 10rem;
    text-align: left;
}
// App.js
import { Component } from "react";
import Select from "react-select";
import "./App.css";
const options = [
    { value: "C++", label: "C++" },
    { value: "JAVA", label: "JAVA" },
    { value: "Javascript", label: "Javascript" },
    { value: "Python", label: "Python" },
    { value: "Swift", label: "Swift" },
];
class App extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div className="App">
                <h1 className="geeks">Geeks For Geeks</h1>
                <div className="container">
                    <Select
                        className="item"
                        styles={{ width: "20px" }}
                        value={options.value}
                        options={options}
                        defaultValue={options[1]}
                    />
                </div>
            </div>
        );
    }
}
export default App;
Output
Conclusion
In ReactJS, you can set a default value in a select dropdown using either the native HTML <select> tag for simple use cases or the react-select component for more advanced features like search and custom styling. Use HTML <select> for basic forms and react-select for more complex requirements.

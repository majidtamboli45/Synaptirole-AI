# How to access nested object in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-access-nested-object-in-reactjs/

To access a nested object in react we can use the dot notation. But if we want to access an object with multi-level nesting we have to use recursion to get the values out of it.
Prerequisites
Approach
The structure of an object in React JS can be nested many times and can get complicated quickly. If we want to access all the values of nested objects then we have to use recursion to access each and every level of that object.
Example of a Nested object:
let company = {
"Name": "GeeksforGeeks",
"Domain": {
"Web": "HTML, CSS, JavaScript",
"DSA": "Cpp, java",
"Data Science": "Python, R"
}
}
And it can get more complicated according to the nesting of the object. That is why we have to use recursion to get all the values and access the whole nested object.
Steps to Create React Application:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
Example: This example implements recursion to get the values form nested object and display then onm console window.
// Filename - App.js
import React from "react";
class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            company: {
                name: {
                    fullname: "GeeksforGeeks",
                    shortname: "GFG",
                },
                webURL: "geeksforgeeks.org",
                key1: {
                    key2: {
                        key3: {
                            val: "Welcome to GeeksforGeeks",
                        },
                    },
                },
            },
        };
    }
    helper = (obj) => {
        const values = Object.values(obj);
        values.forEach((val) =>
            val && typeof val === "object"
                ? this.helper(val)
                : this.addtoConsole(val)
        );
    };
    addtoConsole = (val) => {
        console.log(val);
    };
    render() {
        return (
            <div>
                <h1 style={{ color: "green" }}>
                    GeeksforGeeks
                </h1>
                <label> Log details</label>
                <button
                    onClick={() => {
                        this.helper(this.state.company);
                    }}
                >
                    click here
                </button>
            </div>
        );
    }
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:

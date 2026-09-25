# How to Create a Toggle Switch in React as a Reusable Component ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-toggle-switch-in-react-as-a-reusable-component/

Creating a reusable toggle switch in React enhances the UI. This component can customized as required with the props and can be reused. It can be done using CSS or CSS frameworks like MUI and tailwindCSS.
In this article, we’re going to create a Toggle Switch in React as a reusable component.
Prerequisites:
Approach
To Create a Toggle Switch in React as a Reusable Component
- First, Create a ToggleSwitch Component with a label prop.
- Define an input of type checkbox inside the component.
- Style the Switch using CSS :before, :after selectors.
- Add a label for the input and export the component to get the required output.
Steps to Create Reusable Toggle Switch
Step 1: Initialize React Project
Create a React application using the following command:
npx create-react-app toggle-switch
Step 2: Navigate to Project directory
After creating your project folder i.e. toggle-switch, move to it using the following command:
cd toggle-switch
Project Structure:
Step 3: Define Toogle Component
Create toggleSwitch file and define the toogle switch component, taking a chackbox input and add style to make it toggle switch.
const ToggleSwitch = ({ label }) => {
	return (
		<div className="container">
			{label}{" "}
			<div className="toggle-switch">
				<input
					type="checkbox"
					className="checkbox"
					name={label}
					id={label}
				/>
				<label className="label" htmlFor={label}>
					<span className="inner" />
					<span className="switch" />
				</label>
			</div>
		</div>
	);
};
Step 4: Import and Use
Import the toggleswitch component in app.js file.
<ToggleSwitch label="ComponentName" />
Example: This example creates a ToggelSwitch component using a checkbox input and css classes for styling.
/*  Filename: ./components/ToggleSwitch.css*/
.container {
  text-align: center;
}
.toggle-switch {
  position: relative;
  width: 75px;
  display: inline-block;
  text-align: left;
  top: 8px;
}
.checkbox {
  display: none;
}
.label {
  display: block;
  overflow: hidden;
  cursor: pointer;
  border: 0 solid #bbb;
  border-radius: 20px;
}
.inner {
  display: block;
  width: 200%;
  margin-left: -100%;
  transition: margin 0.3s ease-in 0s;
}
.inner:before,
.inner:after {
  float: left;
  width: 50%;
  height: 36px;
  padding: 0;
  line-height: 36px;
  color: #fff;
  font-weight: bold;
  box-sizing: border-box;
}
.inner:before {
  content: "YES";
  padding-left: 10px;
  background-color: #060;
  color: #fff;
}
.inner:after {
  content: "NO";
  padding-right: 10px;
  background-color: #bbb;
  color: #fff;
  text-align: right;
}
.switch {
  display: block;
  width: 24px;
  margin: 5px;
  background: #fff;
  position: absolute;
  top: 0;
  bottom: 0;
  right: 40px;
  border: 0 solid #bbb;
  border-radius: 20px;
  transition: all 0.3s ease-in 0s;
}
.checkbox:checked + .label .inner {
  margin-left: 0;
}
.checkbox:checked + .label .switch {
  right: 0px;
}
// Filename: App.js
import React, { Component } from "react";
import ToggleSwitch from "./components/ToggleSwitch";
class App extends Component {
  render() {
    return (
      <React.Fragment>
        <ToggleSwitch label="Notifications" />
        <ToggleSwitch label="Subscribe" />
      </React.Fragment>
    );
  }
}
export default App;
// Filename: ./components/ToggleSwitch.js
import React from "react";
import "./ToggleSwitch.css";
const ToggleSwitch = ({ label }) => {
  return (
    <div className="container">
      {label}{" "}
      <div className="toggle-switch">
        <input type="checkbox" className="checkbox" 
               name={label} id={label} />
        <label className="label" htmlFor={label}>
          <span className="inner" />
          <span className="switch" />
        </label>
      </div>
    </div>
  );
};
export default ToggleSwitch;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Conclusion
To create a toggle as reusable component define the component with state,checkbox input and custom switch styling. Add props to handle state and store it as a React Component. Import the component from defined path and use the ToggleSwitch in your applicaiton.

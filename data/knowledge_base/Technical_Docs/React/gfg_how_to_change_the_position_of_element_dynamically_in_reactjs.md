# How to change the position of the element dynamically in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-change-the-position-of-the-element-dynamically-in-reactjs/

To change the position of an element dynamically based on certain conditions or user interactions, we can access and modify its styling and link to certain events. When these events trigger that in return will change the position of the element
Prerequisites
Approach:
To change the position of the element dynamically in ReactJS we will link the element position with with a state. Access the state dynamically and modify its value to change the position of the required element.
Steps to create React Application and install modules
Step 1: Initialize React Project using this command in the terminal
npx create-react-app foldername
Step 2: After creating your project folder, i.e., folder name, move to it using the following command:
cd foldername
Project Structure:
Example: This example implements four buttons to change the position of the component in each direction by updating css values.
// Filename - App.js
import React, { Component } from "react";
class App extends Component {
    // Create state
    state = {
        xoffset: 0,
        yoffset: 0,
        delta: 10,
    };
    moveTitleToDown = () => {
        this.setState({
            yoffset: this.state.yoffset + this.state.delta,
        });
    };
    moveTitleToRight = () => {
        this.setState({
            xoffset: this.state.xoffset + this.state.delta,
        });
    };
    moveTitleToLeft = () => {
        this.setState({
            xoffset: this.state.xoffset - this.state.delta,
        });
    };
    moveTitleToUp = () => {
        this.setState({
            yoffset: this.state.yoffset - this.state.delta,
        });
    };
    render() {
        return (
            <div>
                {/* Element to Move Dynamically */}
                <h2
                    style={{
                        position: "absolute",
                        left: `${this.state.xoffset}px`,
                        top: `${this.state.yoffset}px`,
                    }}
                >
                    GeeksforGeeks
                </h2>
                {/* Move Controls */}
                <div style={{ marginTop: "80px" }}>
                    <button onClick={this.moveTitleToRight}>
                        Move Title To Right
                    </button>
                    <button onClick={this.moveTitleToDown}>
                        Move Title To Down
                    </button>
                    <button onClick={this.moveTitleToLeft}>
                        Move Title To Left
                    </button>
                    <button onClick={this.moveTitleToUp}>
                        Move Title To Up
                    </button>
                </div>
            </div>
        );
    }
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, click on buttons to see output

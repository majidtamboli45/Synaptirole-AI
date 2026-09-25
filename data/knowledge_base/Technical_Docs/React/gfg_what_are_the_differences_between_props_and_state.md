# What are the differences between props and state ?

> Source: https://www.geeksforgeeks.org/reactjs/what-are-the-differences-between-props-and-state/

In React JS, the main difference between Props and State is that the props are a way to pass the data or properties from one component to other components while the state is the real-time data available to use within only that component.
Knowing the differences between props and state is key to building efficient components.
Differences between Props and State
| Property | PROPS | STATE | 
|---|---|---|
| Data Flow | The Data is passed from one component to another. | The Data is managed within the component only. | 
| Mutability | It is Immutable (cannot be modified). | It is Mutable ( can be modified). | 
| Usage | Props can be used with state and functional components. | State is used in both functional (via hooks) and class components, | 
| Accessibility | Props are read-only. | The state is both read and write. | 
| Control | Controlled by parent component | Controlled by the component itself | 
Use Cases of Props
- Parent Data: Used to send data from a parent component to a child for display or logic.
- Reusability: Helps make components flexible by allowing different values to be passed in.
- Callbacks: Allows child components to trigger actions in the parent via function passing.
- Configuration: Controls component behavior like styling, text, or settings externally.
Example: Here the fruits prop is passed and data is displayed in the fruit component.
/* Filename - App.css */
.App {
    text-align: center;
}
// App.js
import Fruit from './Fruit'
function App() {
    const fruits =
    {
        name: "Mango",
        color: "Yellow"
    }
    return (
        <div className="App">
            <Fruit fruits={fruits} />
        </div>
    );
}
export default App;
// Filename - Fruit.js
import React from "react"
const Fruit = (props) => {
    return (
        <div className="fruit">
            <h1>List of Fruits</h1>
            <p>Name: {props.fruits.name}</p>
            <p>Color: {props.fruits.color}</p>
        </div>
    )
}
export default Fruit;
Create a Component known as Fruit.js and add the below code:
Step to Run Application: Run the application using the following command from the root directory of the project:
npm startOutput:
The following will be the output when we execute the above command. The data will be passed from the Parent component i.e. App.js to the Child component i.e. Fruit.js with the usage of the "Props" feature.
Use Cases of State
- Local Data: Stores data inside a component that can change over time.
- User Input: Tracks and updates form values based on user interaction.
- UI Updates: Triggers re-rendering when values change to reflect the latest UI.
- Conditional UI: Controls what gets rendered based on certain conditions.
Example: The previous example is extented with car components having data in state whcih is modified when the button is clicked.
/* Filename - App.css */
.App {
    text-align: center;
}
// Filename - App.js
import './App.css';
import Fruit from './Fruit'
import Car from './Car';
function App() {
    const fruits =
    {
        name: "Mango",
        color: "Yellow"
    }
    return (
        <div className="App">
            <Fruit fruits={fruits} />
            <hr></hr>
            <Car />
        </div>
    );
}
export default App;
// Filename - Car.js
import React, { Component } from "react"
class Car extends Component {
    constructor() {
        super()
        this.state = {
            car: 'Ferrari'
        }
    }
    changeMessage() {
        this.setState({
            car: 'Jaguar'
        })
    }
    render() {
        return (
            <div className="App">
                <h1>{this.state.car}</h1>
                <button onClick={() => this.changeMessage()}>
                    Change
                </button>
            </div>
        )
    }
}
export default Car
// Filename - Fruit.js
import React from "react"
const Fruit = (props) => {
    return (
        <div className="fruit">
            <h1>List of Fruits</h1>
            <p>Name: {props.fruits.name}</p>
            <p>Color: {props.fruits.color}</p>
        </div>
    )
}
export default Fruit;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: The following will be the output when we execute the above command. The data is local to the component "Car" only and it can be updated using the button change in the screen.

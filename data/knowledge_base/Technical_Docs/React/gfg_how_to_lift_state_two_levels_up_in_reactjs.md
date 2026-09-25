# How to lift state two levels up in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-lift-state-two-levels-up-in-reactjs/

We want to lift the state two levels up such that when an event occurs at the lower level component then it should affect the state two levels up. For example, there are three components X, Y, and Z. X is the parent of Component Y, and Component Y is the parent of Component Z.
Prerequisites:
Approach:
When some event occurs in component Z then it should affect the state of component X which is two-level up from component Z. For this we have to pass a function as a prop from component X to component Y then component Y will pass this function to component X so that Component X can call that function and change the state of component X. Following are the components:
State of X
this.state={ stateA: "whatever"}
Function in X:
setStateX(newValue){
this.setState({stateA: newValue});
}
Now pass it as a prop to Y
<Y setStateX={this.setStateX} />
In Y:
<Z setStateX={this.props.setStateX} />
In Z:
this.props.setStateX("new value of stateX");
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file
import React from 'react'
class X extends React.Component {
    state = {
        name: "Kapil"
    }
    setStateX = (newState) => {
        this.setState({ name: newState })
    }
    render() {
        return (
            <div>
                <h4>Hi my name is {this.state.name} </h4>
                <Y setStateX={this.setStateX} />
            </div>
        );
    }
}
class Y extends React.Component {
    render() {
        return (
            <div>
                <Z setStateX={this.props.setStateX} />
            </div>
        );
    }
}
class Z extends React.Component {
    render() {
        return (
            <div>
                <button onClick={() => {
                    this.props.setStateX("Nikhil")
                }}>click to change state</button>
            </div>
        )
    }
}
export default X;
Step to Run the Application: Open the terminal and write the following command in your terminal.
npm start
Output:

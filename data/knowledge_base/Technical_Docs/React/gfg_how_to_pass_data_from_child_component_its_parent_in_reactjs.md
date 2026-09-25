# How to Pass Data From Child Component To Its Parent In ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-pass-data-from-child-component-to-its-parent-in-reactjs/

In ReactJS, the flow of data is typically one-way, meaning data is passed from parent to child components using props. However, there are situations where you may need to pass data from a child component back up to its parent component.
In this article, we will cover how to pass data from a child component to its parent in ReactJS.
Why Do We Need to Pass Data From Child to Parent?
Passing data from a child to a parent is necessary in situations where the parent needs to update its state or trigger certain actions based on data from a child. Common scenarios include:
- State Updates: When a child component needs to notify the parent of a state change (e.g., a user input).
- Event Handling: When a child component triggers an action in the parent, such as form submission or a button click.
- Shared States: For managing common state across multiple components or synchronizing data between them.
Key Points for Passing Data from Child to Parent in ReactJS
Before diving into the implementation, let’s understand the basic principles:
- Props are Unidirectional: In ReactJS, data flows from parent to child through props. However, props can’t be used to pass data from child to parent directly.
- Callback Functions: To pass data from a child component to its parent, a callback function can be passed from the parent to the child as a prop.
- State Management: The callback function updates the state in the parent component, allowing it to react to changes in the child component.
How to Pass Data From Child to Parent in ReactJS
Follow these steps to pass data from a child to a parent component using callback functions.
Step 1: Create a React application using the following command:
npx create-react-app foldername
cd foldername
Project Structure
Step 2: Create a Callback Function in Parent
In the parent component, define a function that will handle the data from the child. This function will be passed as a prop to the child component.
// Filename - App.js
import React from "react";
import Child from "./Child";
class App extends React.Component {
    state = {
        name: "",
    };
    // Callback function to handle data received from the
    //child component
    handleCallback = (childData) => {
        // Update the name in the component's state
        this.setState({ name: childData });
    };
    render() {
        const { name } = this.state;
        return (
            <div>
                <Child
                    parentCallback={this.handleCallback}
                />
                {name}
            </div>
        );
    }
}
export default App;
In this code :
- The parent component (App) defines a handleCallback function that updates the state (name) when the child sends data.
- The parentCallback function is passed as a prop to the child component (Child), allowing the child to call it and send data back to the parent.
- The updated name is then displayed in the parent component.
Step 3: Pass the Function to the Child
The parent component will pass the callback function to the child component as a prop. The child can then invoke this function when necessary.
// Filename - component/Child.js
import React from "react";
class Child extends React.Component {
    // Function triggered when the form is submitted
    onTrigger = (event) => {
        // Call the parent callback function
        this.props.parentCallback(
            event.target.myname.value
        );
        event.preventDefault();
    };
    render() {
        return (
            <div>
                <form onSubmit={this.onTrigger}>
                    <input
                        type="text"
                        name="myname"
                        placeholder="Enter Name"
                    />
                    <br></br>
                    <br></br>
                    <input type="submit" value="Submit" />
                    <br></br>
                    <br></br>
                </form>
            </div>
        );
    }
}
export default Child;
Output:
In this code:
- The onTrigger function is triggered when the form is submitted.
- It calls the parentCallback function (passed from the parent component via props) and sends the entered name (event.target.myname.value) to the parent.
- The form prevents the default submission behavior (event.preventDefault()), allowing the data to be passed without reloading the page.
Advantages of Passing Data from Child to Parent
- State Management: This approach allows the parent to maintain the state and share it with other components.
- Event Handling: It allows the child component to trigger events in the parent, which is useful for handling actions or logic that needs to happen in the parent.
- Reusable Child Components: By passing data back to the parent, child components can be made more reusable and independent of the parent’s state.
Common Use Cases
- Form Handling: Sending form data from child to parent for submission or validation.
- User Interaction: Updating the parent’s UI based on user actions in the child (e.g., when a button is clicked or a selection is made).
- Component Communication: Communicating between sibling components through the parent.
Conclusion
Passing data from a child to a parent in ReactJS is done through callback functions. The parent defines a function and passes it as a prop to the child, allowing the child to send data back to the parent. This approach is useful for state management, handling events, and improving component reusability.

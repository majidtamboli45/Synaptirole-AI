# What is ComponentWillMount() method in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/what-is-componentwillmount-method-in-reactjs/

ReactJS requires several components to represent a unit of logic for specific functionality. The componentWillMount lifecycle method is an ideal choice when it comes to updating business logic, app configuration updates, and API calls.
Prerequisites
ComponentWillMount() method
The componentWillMount() lifecycle hook is primarily used to implement server-side logic before the actual rendering happens, such as making an API call to the server. The componentWillMount() method allows us to execute the React code synchronously when the component gets loaded or mounted in the DOM (Document Object Model). This method is called during the mounting phase of the React Life-cycle.
ComponentWillMount() is generally used to show a loader when the component is being loaded or when the data from the server is being fetched.
Features
- It allows us to modify the contents before displaying them to the end-user, which creates a better impression to the end-user, otherwise, anything can be displayed to the end-user.
- Because it is a react system-defined method, if we want to achieve the same functionality with the help of writing any custom function then it will not be able to give us the same performance as it is part of the React lifecycle, and hence it is optimized.
Syntax:
componentWillMount() {
// Perform the required
// activity inside it
}
// Call the render method to
// display the HTML contents.
render(){
}
- Before performing any activity the first thing they will call is the constructor and then call for the componentWillMount() function.
- Inside this function, we can perform some of the important activities like modification of HTML view for the end-users, etc.
- The next thing will be called to render, as we have already done some modification in the componentWillMount() section the changed value will be displayed at the user end.
Creating React Application
Step 1: Run the below command to create a new project
npx create-react-app my-app
Step 2: The above command will create the app and you can run it by using the below command and you can view your app in your browser.
cd my-app
npm start
Project Structure
It will look like the following
Example 1: Using componentWillMount to manipulate the state in a class component.
import React, { Component } from "react";
class App extends Component {
    constructor() {
        super();
        this.state = {
            message: "This is initial message"
        };
    }
    componentWillMount() {
        this.state = {
            message: "This is an updated message"
        };
    }
    render() {
        return (
            <div>
                <h2>Update the state</h2>
                <h3>  {this.state.message} </h3>
            </div>
        );
    }
};
export default App;
Explanation: When we run the above example, the message variable’s value is updated once the component gets initiated; this is the standard way to manipulate the business logic.
Steps to Run the application: Use this command in the terminal inside project directory.
npm start
Output: This output will be visible on http://localhost:3000/ on the browser window.
Example 2: This example demonstrate the use of componentWillMount method to make the api calls and display the data in the UI.
import React, { Component } from "react";
class ApiCall extends Component {
    constructor() {
        super();
        this.state = {
            todo: {},
        };
    }
    componentWillMount() {
        fetch(
            "https://jsonplaceholder.typicode.com/todos/3"
        )
            .then((response) => response.json())
            .then((json) => {
                this.setState({ todo: json });
            });
    }
    render() {
        const { todo } = this.state;
        console.log(todo);
        return (
            <div
                style={{
                    textAlign: "center",
                    margin: "auto",
                    width: "300px",
                }}
            >
                <h1 style={{ color: "green" }}>
                    GeeksforGeeks
                </h1>
                <h3>
                    React Example for API call inside
                    componentWillMount Method
                </h3>
                <br />
                <h4>API call </h4>
                <b>Todo title : </b>
                {todo.title}
                <p>
                    <b>Todo completed :</b>
                    {todo.completed === true
                        ? "true"
                        : "false"}
                </p>
            </div>
        );
    }
}
export default ApiCall;
Steps to Run the application: Use this command in the terminal inside project directory.
npm start
Output: This output will be visible on http://localhost:3000/ on the browser window.
Note: Changing the state value inside componentWillMount will not re-run the component again and again, unlike other life-cycle methods.

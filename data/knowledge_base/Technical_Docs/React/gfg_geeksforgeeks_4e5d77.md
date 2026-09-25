# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-components-set-2/

In our previous article on ReactJS | Components we had to discuss components, types of components, and how to render components. In this article, we will see some more properties of components.
 
Composing Components: Remember in our previous article, our first example of GeeksforGeeks's homepage which we used to explain components? Let's recall what we have told, "we can merge all of these individual components to make a parent component". This is what we call composing components. We will now create individual components named Navbar, Sidebar, ArticleList and merge them to create a parent component named App and then render this App component.
The below code in the index.js file explains how to do this: 
Filename- App.js:
import React from 'react';
import ReactDOM from 'react-dom';
// Navbar Component
const Navbar=()=>
{
    return <h1>This is Navbar.< /h1>
}
// Sidebar Component
const Sidebar=()=> {
    return <h1>This is Sidebar.</h1>
}
// Article list Component
const ArticleList=()=>
{
    return <h1>This is Articles List.</h1>
}
// App Component
const App=()=>
{
    return(
            <div>
                <Navbar />
                <Sidebar />
                <ArticleList />
            </div>
        );
}
ReactDOM.render(
    <App />, 
    document.getElementById("root")
);
Output:
You can see in the above output that everything worked well, and we managed to merge all the components into a single component App. 
 
Decomposing Components: Decomposing a Component means breaking down the component into smaller components. We have told the thing about composing smaller components to build a parent component from the very start when we started discussing components repeatedly. Let us see why there is a need to do so. Suppose we want to make a component for an HTML form. Let's say our form will have two input fields and a submit button. We can create a form component as shown below:
Filename- App.js:
import React from 'react';
import ReactDOM from 'react-dom';
const Form=()=>
{
    return (
        <div>
            <input type = "text" placeholder = "Enter Text.." />
            <br />
            <br />
            <input type = "text" placeholder = "Enter Text.." />
            <br />
            <br />
            <button type = "submit">Submit</button>
        </div>
    );
}
ReactDOM.render(
    <Form />,
    document.getElementById("root")
);
Output:
The above code works well to create a form. But let us say now we need some other form with three input fields. To do this we will have to again write the complete code with three input fields now. But what if we have broken down the Form component into two smaller components, one for the input field and another one for the button? This could have increased our code reusability to a great extent. That is why it is recommended to React to break down a component into the smallest possible units and then merge them to create a parent component to increase the code modularity and reusability. In the below code the component Form is broken down into smaller components Input and Button. 
Filename- App.js:
import React from 'react';
import ReactDOM from 'react-dom';
// Input field component
const Input=()=>
{
    return(
        <div>
            <input type="text" placeholder="Enter Text.." />
            <br />
            <br />    
        </div>
    );
}
// Button Component
const Button=()=>
{
    return <button type = "submit">Submit</button>;    
}
// Form component
const Form=()=>
{
    return (
        <div>
            <Input />
            <Input />
            <Button />            
        </div>
    );
}
ReactDOM.render(
    <Form />, 
    document.getElementById("root")
);
Output:
Till now, we have worked with Components with only static data. That is, we are writing data directly inside a Component. What if, we want to pass some data to our Components? React allows us to do so with the help of another property called props. We will learn about props in detail in our next article.

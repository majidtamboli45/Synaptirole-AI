# ReactJS Props

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-props-set-2/

In our previous article ReactJS Props - Set 1 we discussed props, passing and accessing props, passing props from one component to another, etc. In this article, we will continue our discussion on props.
So, what if we want to pass some default information using props to our components? React allows us to do so. React provides us with something called defaultProps for this purpose. Let's see about this in detail:
defaultProps: The defaultProps is a method that we can use to store as much information as we want for a particular class. And this information can be accessed from anywhere inside that particular class. Every piece of information you add inside the defaultProps, will be added as the prop of that class. It might seem confusing at this point. Let's look at a program where we will be using defaultProps to create some props for a class.
Open your react project directory and edit the App.js file from src folder:
src/App.js:
import React from 'react';
import ReactDOM from 'react-dom';
// Component
class ExampleClass extends React.Component {
    render() {
        return (
            <div>
                {/* using default prop - title */}
                <h1>This is {this.props.title}'s Website!</h1>
            </div>
        );
    }
}
// Creating default props for 
// ExampleClass Component
ExampleClass.defaultProps = {
    title: "GeeksforGeeks"
}
ReactDOM.render(
    <ExampleClass />,
    document.getElementById("root")
);
Output:
You can see in the above program we have created a default prop named title outside the class ExampleClass and accessed this prop inside that class using this.props statement.
We can also pass arrays as props, instead of passing single elements. Let's just see how it is done in the below program: 
Open your react project directory and edit the App.js file from src folder:
src/App.js:
import React from 'react';
import ReactDOM from 'react-dom';
// Component
class ExampleClass extends React.Component {
    render() {
        return (
            <div>
                {/* accessing array prop directly */}
                <h1>The names of students are: {this.props.names}</h1>
            </div>
        );
    }
}
// Passing an array as prop
ExampleClass.defaultProps = {
    names: ['Ram', 'Shyam', 'Raghav']
}
ReactDOM.render(
    <ExampleClass />,
    document.getElementById("root")
);
In the above program, we have passed an array of names as a prop to the component ExampleClass. We have also accessed this array directly to print the content of the array. Below is the output when the above code is rendered:
You can see in the above output that, printing the content of the array using this.props statement directly, simply prints all elements in the array without any formatting. But this doesn't look good right? This is not how we print array elements in other programming languages. What if we want to add some formatting before we print an array element? Or in other words, what if we want to iterate the array passed as props? To do so, we can use the map() method available in JavaScript. We will have to pass a function as an argument to the map method. The function will be accepting two parameters out of which the first one is an array item and the second one is the index of the array items. To learn about map() in detail please visit this link. Let's see the below code in which we are using the map() method to iterate over an array passed as a defaultProp to a component:
Open your react project directory and edit the App.js file from src folder:
src/App.js:
import React from 'react';
import ReactDOM from 'react-dom';
// Component
class ExampleClass extends React.Component {
    render() {
        return (
            <div>
                {/* iterating over array using map() */}
                <h1>{this.props.names.map(
                    function namesIterator(item, i) {
                        return (
                            "Student " + (i + 1) + ": " +
                            item +
                            ((i != 2) ? ',  ' : '\n')
                        )
                    }
                )}</h1>
            </div>
        );
    }
}
// Passing an array as prop
ExampleClass.defaultProps = {
    names: ['Ram', 'Shyam', 'Raghav']
}
ReactDOM.render(
    <ExampleClass />,
    document.getElementById("root")
);
Output:
You can see in the above program how we are iterating over the array passed to the component ExampleClass using map(). 
That's all for this article. In our next article, we will see how to validate types in props or how to perform type-checking.

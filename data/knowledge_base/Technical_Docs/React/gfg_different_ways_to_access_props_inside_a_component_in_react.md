# Different ways to access props inside a Component in React

> Source: https://www.geeksforgeeks.org/reactjs/different-ways-to-access-props-inside-a-component-in-react/

The props keyword is the shorthand for properties. It is one of the most important features of React which helps in effective communication between various React components. It is a read-only attribute for passing data from the parent component to the child component. There are various ways to access props inside a component.
We will discuss the ways to access props inside a component.
Table of Content
Functional Components:
In this approach, props are passed as a parameter to a function. The props values can then be accessed within the function using the props keyword.
For example - props.propName - props is a keyword and propName is a property whose values are passed from the App.js component to the functional component.
Syntax:
const ComponentName = (props) => {
return <div>{props.propName}</div>
}
Example: Below is an example of accessing props using functional components.
import React from 'react';
const FunctionComponentName = (props) => {
    return <div>{props.propName}</div>;
};
export default FunctionComponentName;
Output :
Class Components:
In this approach props values will be accessed inside a class component using this keyword inside the JSX code written in render() method or any other class method.
For example - this.props.propName - where propName is the actual property whose values are being passed from App component to class component. and this.props is a way to access
Syntax:
class ComponentName extends React.Component  {
render() {
return <div>{this.props.propName}</div>
}
}
Example: Below is an example of accessing props using class components.
import React from 'react';
class ClassComponentName extends React.Component {
    render() {
        return <div>{this.props.propName}</div>;
    }
}
export default ClassComponentName;
Output:
In this approach we extract the values of props (either objects or arrays) using method { propName }. This method can be used in both functional or class component.
Syntax:
const ComponentName = ({propName}) {
return <div>{propName}</div>
}
OR
class ComponentName extends React.Component {
const {propName} = this.props;
return <div>{propName}</div>
}
Example: Below is an example of accessing props using Destructuring.
import React from 'react';
const DestructureComponentName = ({ propName }) => {
    return <div>{propName}</div>;
};
export default DestructureComponentName;
Output:
Using Context API:
In this approach we start with creating context object and using ContextObject.Provider to provide the prop values from parent component to child component. ContextObject.Consumer is used to consume the prop values inside child component provided from parent component.
- createContext() - This is used for creating the Context object
- ContextProvider - This method will help to provide the context values
- ContextConsumer - This method is used to consume the context values
Syntax:
const ContextObject = React.createContext();
const ComponentName = () => {
<ContextObject.Consumer>
{
value => <div>{value}</div>
}
</ContextObject.Consumer>
}
Example: Below is an example of accessing props using context API.
// ContextObject.js
import React from 'react';
const ContextObject = React.createContext();
export default ContextObject;
// Parent.js
import React from 'react';
import Child from './Child';
import ContextObject from './ContextObject';
const Parent = () => {
    return (
        <ContextObject.Provider value="Geeks For Geeks">
            <Child />
        </ContextObject.Provider>
    );
};
export default Parent;
// Child.js
import React from 'react';
import ContextObject from './ContextObject';
const Child = () => {
    return (
        <ContextObject.Consumer>
            {
                value => <div>{value}</div>
            }
        </ContextObject.Consumer>
    );
};
export default Child;
Output:
Using useContext() hook:
This approach is similar to context API approach. In this we start with creating context object and using ContextObject.Provider to provide the prop values from parent component to child component. To consume the prop values in child component we will be using useContext() hook.
- createContext(): This is used for creating the Context object
- ContextProvider: This method will help to provide the context values
- useContext() hook: This is used to consume the context values
Syntax:
const ContextObject = React.createContext();
const ComponentName = () => {
const value = useContext(ContextObject);
return <div>{value}</div>
}
Example: Below is an example of accessing props using useContext hook.
// ContextObject.js
import React from 'react';
const ContextObject = React.createContext();
export default ContextObject;
// Parent.js
import React from 'react';
import Child from './Child';
import ContextObject from './ContextObject';
const Parent = () => {
    return (
        <ContextObject.Provider value="Geeks For Geeks">
            <Child />
        </ContextObject.Provider>
    );
};
export default Parent;
// Child.js
import React, { useContext } from 'react';
import ContextObject from './ContextObject';
const Child = () => {
    const value = useContext(ContextObject);
    return <div>{value}</div>;
};
export default Child;
Output:
Example: Below is an example of accessing props inside a component.
import React from 'react';
import FunctionComponentName from './FunctionComponentName';
import ClassComponentName from './ClassComponentName';
import DestructureComponentName from './DestructureComponentName';
import Parent from './Parent';
function App() {
    return (
        <div>
            <FunctionComponentName propName="Geeks For Geeks" />
            <ClassComponentName propName="Geeks For Geeks" />
            <DestructureComponentName propName="Geeks For Geeks" />
            <Parent />
        </div>
    );
}
export default App;
Output:

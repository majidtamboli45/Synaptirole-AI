# How to create refs in React JS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-refs-in-reactjs/

React JS, a powerful and declarative JavaScript library for building user interfaces, provides a feature known as "refs" that allows developers to interact with the underlying DOM elements directly.
Refs are generally used for the following purposes:
- Managing focus, text selection, or media playback.
- Triggering imperative animations.
- Integrating with third-party DOM libraries.
Note: You should avoid using refs for anything that can be done declaratively.
The following examples are based on only Functional-Components:
Method 1: Using React.createRef().
- It was introduced in React 16.3.
- Create a ref variable using React.createRef()
- Use the element's ref attribute to attach the ref variable
Example: Below is the code example of the React.createRef().
// Importing everything as React
import * as React from "react";
const App = () => {
  // Creating textInputRef variable
  const textInputRef = React.createRef();
  // This method will be used to focus textInput
  const textInputFocusHandler = () => {
    // Focusing input element
    textInputRef.current.focus();
  };
  return (
    <div>
      
      {/** Attaching ref variable using element's ref attribute */}
      <input ref={textInputRef} type="text" 
             placeholder="Enter something" />
      {/** Attaching textInputFocusHandler method to button click */}
      <button onClick={textInputFocusHandler}>
             Click me to focus input
      </button>
    </div>
  );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
Method 2: Using useRef() hook.
- Create a ref variable using React.useRef()
- Use the element's ref attribute to attach the ref variable
- The benefit of using useRef() over createRef() is that it's handy for keeping any mutable value around similar to how you’d use instance fields in classes.
- useRef() also takes an initial value.
Example: Below is the code example of the useRef().
// Importing everything as React
import * as React from "react";
const App = () => {
  // Creating textInputRef variable with initialValue "null"
  const textInputRef = React.useRef(null);
  // This method will be used to focus textInput
  const textInputFocusHandler = () => {
    // Focusing input element
    textInputRef.current.focus();
  };
  return (
    <div>
      
      {/** Attaching ref variable using element's ref attribute */}
      <input ref={textInputRef} type="text" 
             placeholder="Enter something" />
      {/** Attaching textInputFocusHandler method to button click */}
      <button onClick={textInputFocusHandler}>
              Click me to focus input
      </button>
    </div>
  );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
Method 3: Using callback ref().
- This method was used prior to React 16.3. So if you are using React < 16.3 use this method.
- Creating ref using this method is a bit different than the other two methods.
- Instead of passing a ref attribute created using createRef() or useRef() we pass a function.
- The function receives the React element or HTML DOM element as an argument, which can be used.
Example: Below is the code example of the callback Ref().
// Importing everything as React
import * as React from "react";
const App = () => {
  // Creating and initializing textInputRef variable as null 
  let textInputRef = null;
  // Callback function that will set ref for input field
  // Note: It can be used to set ref for any element
  const setTextInputRef = (element) => {
      textInputRef = element;
  };
  // This method will be used to focus textInput
  const textInputFocusHandler = () => {
    // If textInputRef is not null
    // otherwise it will throw an error
    if (textInputRef) {
    
      // Focusing input element
      textInputRef.focus();
    }
  };
  return (
    <div style={{ padding: 16 }}>
      {/** Using setTextInputRef function so that
       *   textInputRef can be set as ref for this input field
       * */}
      <input
        style={{ display: "block" }}
        ref={setTextInputRef}
        type="text"
        placeholder="Enter something"
      />
      {/** Attaching textInputFocusHandler 
           method to button click */}
      <button onClick={textInputFocusHandler}>
          Click me to focus input
      </button>
    </div>
  );
};
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:

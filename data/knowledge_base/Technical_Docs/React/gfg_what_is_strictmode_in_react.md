# What is StrictMode in React ?

> Source: https://www.geeksforgeeks.org/reactjs/what-is-strictmode-in-react/

StrictMode is a react component used to identify the potential issues and bug in the react code. It provides warning and alerts after running a check on complete code. Its goal is to improve the quality of the react apps by avoiding the common mistakes in the development.
What is StrictMode in React ?
StrictMode in React is a tool used to enable the strict checking of the code in the application to ensure the code quality and stability. It activates additional deprecation checks and warnings for its child components.
Syntax:
<React.StrictMode>
<App />
</React.StrictMode>
One of the reasons for its popularity is the fact that it provides visual feedback (warning/error messages) whenever the React guidelines and recommended practices are not followed.
Note: Just like the React Fragment, the React StrictMode Component does not render any visible UI.
Example: Simple example for using StrictMode in React Component.
import React from 'react';
function StictModeDemo() {
    return (
        <div>
            <Component1 />
            <React.StrictMode>
                <React.Fragment>
                    <Component2 />
                    <Component3 />
                </React.Fragment>
            </React.StrictMode>
            <Component4 />
        </div>
    );
}
Explanation: In the above example, the StrictMode checks will be applicable only on Component2 and Component3 (as they the child components of React.StrictMode). Contrary to this, Component1 and Component4 will not have any checks.
What StrictMode Does ?
The React StrictMode helps to identify and detect various warnings/errors during the development phase, namely...
- Helps to identify those components having unsafe lifecycles: Some of the legacy component lifecycle methods are considered to be unsafe to use in async applications. The React StrictMode helps to detect the use of such unsafe methods. Once enabled, it displays a list of all components using unsafe lifecycle methods as warning messages.
- Warns about the usage of the legacy string ref API: Initially, there were two methods to manage refs- legacy string ref API and the callback API. Later, a third alternate method, the createRef API was added, replacing the string refs with object refs, which allowed the StrictMode to give warning messages whenever string refs are used.
- Warns about the usage of the deprecated findDOMNode: Since the findDOMNode is only a one-time read API, it is not possible to handle changes when a child component attempts to render a different node (other than the one rendered by the parent component). These issues were detected by the React StrictMode and displayed as warning messages.
- Helps in Finding Unexpected Side Effects: Helps detect unexpected side effects during rendering. e.g., it will warn if the render function has side effects like mutating variables outside of the component.
Additional Important Points to Remember
- Since the StrictMode is a developer tool, it runs only in development mode. It does not affect the production build in any way whatsoever.
- In order to identify and detect any problems within the application and show warning messages, StrictMode renders every component inside the application twice.

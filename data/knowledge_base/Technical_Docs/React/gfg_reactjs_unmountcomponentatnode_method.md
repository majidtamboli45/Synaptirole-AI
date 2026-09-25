# ReactJS unmountComponentAtNode() Method

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-unmountcomponentatnode-method/

React.js library is all about splitting the app into several components. Each Component has its own lifecycle. React provides us with some in-built methods that we can override at particular stages in the life-cycle of the component.
In class-based components, the unmountComponentAtNode() method Remove a mounted React component from the DOM.
Creating React Application:
- Step 1: Create a React application using the following command.npx create-react-app foldername
- Step 2: After creating your project folder i.e. foldername, move to it using the following command.cd foldername
Project Structure: It will look like the following.
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from 'react'
import ReactDOM from 'react-dom';
// Exporting your App Component
export default function App() {
  // Function to unmount root component
  function unm() {
    ReactDOM.unmountComponentAtNode(document.getElementById("root"));
  }
  return (
    <div>
      <h1>GeeksforGeeks</h1>
      <div>Hi Geek, this is the rendered content</div>
      <button onClick={unm}>Unmount</button>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Reference: https://18.react.dev/reference/react-dom/unmountComponentAtNode

# Context API in React

> Source: https://www.geeksforgeeks.org/reactjs/explain-new-context-api-in-react/

Context API in React provides a way to share data globally across components without prop drilling. It allows creating a lightweight global state accessible by any component.
- Enables global state management without third-party libraries.
- Avoids prop drilling in deeply nested components.
- Created using React.createContext().
- Ideal for sharing themes, user info, or settings across the app.
Purpose of Context API
Context API prevents prop drilling by providing global state accessible anywhere, simplifying state management and improving performance.
- Avoids passing props through multiple layers.
- Creates global variables for all components.
- Boosts performance by reducing re-renders.
- Easier and lighter than Redux.
Working
To work with Context API we need React.createContext(). It has two properties Provider and Consumer. The Provider acts as a parent it passes the state to its children whereas the Consumer uses the state that has been passed.
- Provider: This is used to provide the context to components.
- Consumer: This is used to consume the context value in child components.
Steps to Implement Context API in React
Follow these steps to create and use Context API in a React application.
Step 1: Create a React application using the following command.
npx create-react-app context-api-demo
Step 2: After creating your project folder(i.e. project), move to it by using the following command.
cd context-api-demo
Step 3: We will create two new files one is Context.js to create our context and another file named as WelcomePage.js for creating a component that will consume the context.
Project Structure:
It will look like this:
Approach
The Context API is used to share user data (name and ID) across components without prop drilling.
- Create a UserContext using the Context API in a separate file (Context.js).
- Define and export the Provider to supply user data across the component tree.
- Consume the context in a child component to access and display the user’s name and ID.
- Wrap the root component (App) with the Provider in index.js and pass the required values.
- Ensure values are provided otherwise the consumer will receive undefined data
Example: Write the following code in respective files:
- Context.js: We create the consumer and provider in this file.
- WelcomePage.js: The consumer consumes the value in this file.
- Index.js: The provider is given to the application in this file.
- App.js: The components are imported in this file and then rendered on the webpage.
// App.js
import React from 'react';
import WelcomePage from './WelcomePage';
import UserProvider from './Context';
const App = () => {
  return (
    <UserProvider>
      <WelcomePage />
    </UserProvider>
  );
};
export default App;
// index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
// Context.js
import React, { createContext } from 'react';
export const UserContext = createContext();
const UserProvider = ({ children }) => {
  const user = { name: 'John Doe', id: 1 };
  
  return (
    <UserContext.Provider value={user}>
      {children}
    </UserContext.Provider>
  );
};
export default UserProvider;
import React, { useContext } from 'react';
import { UserContext } from './Context';
const WelcomePage = () => {
  const { user } = useContext(UserContext);
  return (
    <div>
      <h1>Welcome User:</h1>
      <p>Name: {user.name} id: {user.id}</p>
    </div>
  );
};
export default WelcomePage;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output:
Benefits of Context API over React Redux
Context API is simpler, maintains one-way data flow, and allows multiple stores compared to Redux’s single store.
- Less boilerplate and fewer files to update.
- Maintains React’s one-way data binding.
- Supports multiple contexts/stores.
- Easier and lighter than Redux.

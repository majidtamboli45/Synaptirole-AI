# Create a New React App Using npx

> Source: https://www.geeksforgeeks.org/reactjs/create-a-new-react-app-npm-create-react-app/

A new React app can be created using the npx create-react-app command, which provides a fast and simple way to set up a React project. It includes a pre-configured build environment, removing the need to manually set up Webpack, Babel, or other tools.
- Automatically sets up a complete React environment with zero configuration.
- Instantly creates a new React project.
- Includes a pre-configured development environment with tools like Webpack and Babel.
- Installs React, ReactDOM, and all required dependencies automatically.
Note: create-react-app is now deprecated and should only be used for legacy projects. New React apps should use Vite or Next.js.
Initializing a React App with npx
It provides a quick and easy way to set up a ready-to-use React development environment without any manual configuration.
Step 1: Install Node.js and NPM
The first step is to install Node.js and and NPM in your system to create a React application.
Step 2: Initialize the React App Using create-react-app
If you have installed an npm version greater than or equal to 5.6, you can use the following npx command to create a new React app:
npx create-react-app app_name
If you are using npm version 5.1 or less, you cannot use the npx command, you need to install the create-react-app globally by using the command
npm install -g create-react-app
create-react-app app_name
Step 3: Switch to the project directory
Once the project is created switch to the project directory using the following command:
cd app_name
Step 4: Start the development server
To run the app, use the following command. This command will locally run your app.
npm start
React Project Structure
The project structure of your React application will look something like this
- src: This folder contain all the necessary source code of the project.
- public: This folder stores the HTML files and the assets.
- node_modules: Dependencies of the project.
- package.json: Used dependencies and scripts information.
- README.md: Any additional information for documentation.
Dependencies in the package.json file
"dependencies": {
    "@testing-library/jest-dom": "^5.17.0",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4"
},
Modify the React application by making a few changes in the App.js file.
// Filename - App.js
import React from 'react';
function App() {
    const headingStyle = {
        color: 'green',
        textAlign: 'center'
    };
    return <h1 style={headingStyle}>Welcome To GeeksforGeeks!</h1>;
}
export default App;
Output:

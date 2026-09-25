# React Importing and Exporting Components

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-importing-exporting/

React components are the building blocks of an application. Once you create a new React app, you can start breaking complex UIs into smaller, reusable pieces. Importing and exporting components helps organize code by sharing them across different files.
- Export components to make them usable in other files.
- Import components to reuse them where needed.
- Uses ES6 module system for a modular and maintainable structure.
Types of Exports in React
In React, there are two types of exports
- Default Exports and Imports
- Named Exports and Imports
1. Default Export and Import
A default export allows you to export a single component or variable from a file. When importing a default export, you can give it any name you choose.
import React from "react";
import MyComponent from "./components/MyComponent"; 
const App = () => {
    return (
        <div>
            <MyComponent /> {/* Using the imported component */}
        </div>
    );
};
export default App;
import React from "react";
const MyComponent = () => {
    return <h1>Hello from MyComponent!</h1>;
};
export default MyComponent;
Output
- Default Export: Exports one thing from a file (like a component).
- Default Import: Imports the default export from another file, naming it as needed.
2. Named Export and Import
Named exports allow you to export multiple components or variables from a single file. When importing a named export, you must use the exact name of the exported entity.
import { MyComponent, AnotherComponent } from "./components/component.js";
const App = () => {
    return (
        <div>
            <MyComponent />
            <AnotherComponent />
        </div>
    );
};
export default App;
export const MyComponent = () => {
    return <h1>Hello from MyComponent!</h1>;
};
export const AnotherComponent = () => {
    return <h1>Hello from AnotherComponent!</h1>;
};
Output
- Two components (MyComponent and AnotherComponent) are exported individually using the export keyword.
- This makes them available for import in other files..
- We import them from components.js using their exact names inside curly braces{} .
- This is called a Named Import.
- Both are then rendered inside the App component
3. Combining Default and Named Exports
You can also use both named and default exports in a single file. This is useful when you want to export a primary component (default export) and several utility components or functions (named exports).
import { MyComponent, AnotherComponent } from "./components/component.js";
const App = () => {
    return (
        <div>
            <MyComponent />
            <AnotherComponent />
        </div>
    );
};
export default App;
// Named Export
export const MyComponent = () => {
    return <h1>Hello from MyComponent!</h1>;
};
// Another Named Export
export const AnotherComponent = () => {
    return <h1>Hello from AnotherComponent!</h1>;
};
// Default Export
const DefaultComponent = () => {
    return <h1>Hello from DefaultComponent!</h1>;
};
export default DefaultComponent;
Output
4. Exporting Multiple Components from the Same File
You might want to export several components from a single file. React allows you to use named exports for this purpose, and placing these components under a well-organized folder structure for your React project makes such imports far easier to scale..
import React from "react";
import { Header, Footer } from "./components"; 
import MainContent from "./components"; 
const App = () => {
    return (
        <div>
            <Header />
            <MainContent />
            <Footer />
        </div>
    );
};
export default App;
import React from "react";
// Component 1
export const Header = () => {
    return <h1>Welcome to My Website</h1>;
};
// Component 2
export const Footer = () => {
    return <footer>© 2023 My Website</footer>;
};
// Component 3 (default export)
export default function MainContent() {
    return <div>This is the main content of the website.</div>;
}
Output
When to Use Default Export
- Use for a single primary functionality or component in a file.
- When you want flexibility in naming during import.
- Ideal for components or modules that represent the main purpose of the file.
When to Use Named Export
- Use when exporting multiple functionalities or components from the same file.
- When you want consistency in import names.
- Useful for utility functions, constants, or multiple related components.
Best Practices for Importing and Exporting Components
- Use Default Exports for Primary Components: If a file contains a main component, it’s often a good idea to use default export. This makes it easy to import the primary component without specifying its name.
- Use Named Exports for Utilities and Helper Components: If you have multiple components or utility functions in a file, use named exports. This allows you to import only the necessary components.
- Be Consistent: Stick to a consistent pattern for exports and imports across your project. For example, always use default exports for primary components, and named exports for others.

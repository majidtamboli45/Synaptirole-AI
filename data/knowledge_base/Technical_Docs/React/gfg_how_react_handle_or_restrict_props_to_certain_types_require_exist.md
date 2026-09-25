# How React handle or restrict Props to certain types, or require certain Props to exist ?

> Source: https://www.geeksforgeeks.org/reactjs/how-react-handle-or-restrict-props-to-certain-types-or-require-certain-props-to-exist/

In React, data can be transmitted from a parent component to its children using props. PropTypes, a feature in React, facilitates runtime type checks on these props, issuing warnings in the browser console if the checks fail. This ensures data consistency and helps catch potential issues during development.
Syntax:
import PropTypes from 'prop-types';
ComponentName.propTypes = {
name: PropTypes.any.isRequired
};
Steps to Create the React Application And Installing Module:
Step 1: Create a new react project using the following command on the command line.
npx create-react-app foldername
Step 2: Change your directory to the newly created folder by using the following command.
cd foldername
Project Structure:
Approach:
- App Component Structure:
  - In `App.js`, the `App` component includes the `Info` component as its child, passing two props: `name` (Number type) and `username` (String type).
- Info Component Definition:
  - In `Info.js`, the `Info` functional component is defined, receiving props. Prop types are employed to enforce type checks, ensuring that `name` is of type number and `username` is of type string, with the latter being required.
- Type Check Implementation:
  - Prop types are used to enforce strict type checking in the `Info` component, preventing runtime errors by specifying that `name` must be a number and `username` must be a required string.
- Console Warning for Missing Prop:
  - Failure to provide the required `username` prop to the `Info` component results in a warning in the browser console, emphasizing the necessity of fulfilling prop requirements.
Example: Below the code of above explained approach.
//App.js
import Info from './Info';
const App = () => {
    return <Info name={1} username={'gfg@123'} />;
};
export default App;
//Info.js
import PropTypes from 'prop-types';
const Info = (props) => {
    return (
        <div>
            <div>Name: {props.name}</div>
            <div>Username: {props.username}</div>
        </div>
    );
};
Info.propTypes = {
    name: PropTypes.string,
    username: PropTypes.string.isRequired,
};
export default Info;
Step to Run the application: To start your application, use the following command on the command line.
npm start
Output: Open the browser and go to http://localhost:3000

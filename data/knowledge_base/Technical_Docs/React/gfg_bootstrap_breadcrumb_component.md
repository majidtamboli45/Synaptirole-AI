# Bootstrap Breadcrumb Component

> Source: https://www.geeksforgeeks.org/reactjs/react-bootstrap-breadcrumb-component/

React-Bootstrap is a front-end framework that was designed keeping react in mind. Breadcrumb Component provides a way to indicate the location of the current page and that too within a navigational hierarchy. We can use the following approach in ReactJS to use the react-bootstrap Breadcrumb Component.
Breadcrumb Props:
- as: It can be used as a custom element type for this component.
- className: It is used to write our class name for styling.
- label: It is the ARIA label for the nav element.
- listProps: It is used to pass additional props for <ol> element.
- bsPrefix: It is an escape hatch for working with strongly customized bootstrap CSS.
Breadcrumb.Item Props:
- active: It is used to make this element as an active state.
- as: It can be used as a custom element type for this component.
- href: It is used the href attribute to this element.
- linkAs: For this component inner link, it is used to allow the use of a custom element type.
- linkProps: For the non-active items, it is used to pass the additional props passed as-is to the underlying link.
- target: It is used to provide the target attribute for the inner <a> element.
- title: It is used to provide the title attribute for the inner <a> element.
- bsPrefix: It is an escape hatch for working with strongly customized bootstrap CSS.
Creating React Application And Installing Module:
- Step 1: Create a React application using the following command: npx create-react-app foldername
- Step 2: After creating your project folder i.e. foldername, move to it using the following command: cd foldername
- Step 3: After creating the ReactJS application, Install the required module using the following command: npm install react-bootstrap npm install bootstrap
Project Structure: It will look like the following.
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import Breadcrumb from 'react-bootstrap/Breadcrumb';
export default function App() {
  return (
    <div style={{ display: 'block', 
                  width: 700, padding: 30 }}>
      <h4>React-Bootstrap Breadcrumb Component</h4>
      <Breadcrumb>
        <Breadcrumb.Item href="#">
           Dashboard
        </Breadcrumb.Item>
        <Breadcrumb.Item href="#">
          Profile
        </Breadcrumb.Item>
        <Breadcrumb.Item active>
          Details
        </Breadcrumb.Item>
      </Breadcrumb>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:

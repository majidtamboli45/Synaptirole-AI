# Bootstrap Accordion Component

> Source: https://www.geeksforgeeks.org/reactjs/react-bootstrap-accordion-component/

React-Bootstrap is a front-end framework that was designed keeping react in mind. Accordion Component provides a way to control our card components so that we can open them one at a time. We can use the following approach in ReactJS to use the react-bootstrap Accordion Component.
Accordion Props:
- activeKey: It is the currently active key which corresponds to the expanded card which is currently active.
- as: It can be used as a custom element type for this component.
- defaultActiveKey: It is the default active key that expands on start.
- onSelect: It is the callback function named as SelectCallback.
- bsPrefix: It is an escape hatch for working with strongly customized bootstrap CSS.
Accordion.Toggle Props:
- as: It can be used as a custom element type for this component.
- eventKey: It is a key that is used to correspond to the collapse component when the click is triggered on this component.
- onClick: It is the callback function that is triggered when this component is clicked.
Accordion.Collapse Props:
- children: It is used to pass the children's prop which should contain only a single child.
- eventKey: It is a key that is used to correspond to the toggler.
useAccordionToggle Props: It is used to create our custom toggle component with this hook.
- eventKey: It is the key that is given for the specified element/card.
- callback: It is a callback function that is triggered on a toggle event.
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install react-bootstrap 
npm install bootstrap
Project Structure: It will look like the following.
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import Accordion from 'react-bootstrap/Accordion';
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';
export default function App() {
  return (
    <div style={{ display: 'block', 
                  width: 700, padding: 30 }}>
      <h4>React-Bootstrap Accordion Component</h4>
      <Accordion defaultActiveKey="0">
        <Card>
          <Card.Header>
            <Accordion.Toggle as={Button} 
              variant="link" eventKey="0">
              Click Me to Toggle!
            </Accordion.Toggle>
          </Card.Header>
          <Accordion.Collapse eventKey="0">
            <Card.Body>
             Greetings from GeeksforGeeks
            </Card.Body>
          </Accordion.Collapse>
        </Card>
      </Accordion>
    </div>
  );
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:

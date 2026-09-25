# ReactJS Reactstrap Navbar Component

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-reactstrap-navbar-component/

Reactstrap is a popular front-end library that is easy to use React Bootstrap 4 components. This library contains the stateless React components for Bootstrap 4. The Navbar component provides a way for users to provide them navigation controls at the top of an application. We can use the following approach in ReactJS to use the ReactJS Reactstrap Navbar Component.
Navbar Props:
- light: It is used to indicate whether to apply the light color class to it or not.
- dark: It is used to indicate whether to apply the dark color class to it or not.
- fixed: It is used to indicate whether to apply position fixed property or not.
- color: It is used to denote the color for this component.
- role: It is used to denote the value for role property for this component.
- expand: It is used to indicate whether to expand Navbar on click or not.
- tag: It is used to pass in custom elements to use.
NavbarBrand Props:
- tag: It is used to pass in custom elements to use.
NavbarText Props:
- tag: It is used to pass in custom elements to use.
NavbarTogglerProps:
- type: It is used to denote the type for this component.
- tag: It is used to pass in custom elements to use.
Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install reactstrap bootstrap
Project Structure: It will look like the following.
Example 1: Now write down the following code in the App.js file. Here, we have shown the Navbar component with the expand property.
import React from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import {
    Navbar,
    NavItem,
    NavbarToggler,
    Collapse,
    NavLink,
    Nav,
    NavbarBrand
} from 'reactstrap';
function App() {
    // Collapse isOpen State
    const [isOpen, setIsOpen] = React.useState(false);
    return (
        <div style={{
            display: 'block', width: 550, padding: 30
        }}>
            <h5>ReactJS Reactstrap Navbar Component</h5>
            <Navbar color="light" light expand="md">
                <NavbarBrand href="/">Brand</NavbarBrand>
                <NavbarToggler onClick={() => { setIsOpen(!isOpen) }} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav className="mr-auto" navbar>
                        <NavItem>
                            <NavLink href="#">Home</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink href="#">Login</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink href="#">Signup</NavLink>
                        </NavItem>
                    </Nav>
                </Collapse>
            </Navbar>
        </div >
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: Now write down the following code in the App.js file. Here, we have shown the Navbar component without the expand property.
import React from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import {
    Navbar,
    NavItem,
    NavbarToggler,
    Collapse,
    NavLink,
    Nav,
    NavbarBrand
} from 'reactstrap';
function App() {
    // Collapse isOpen State
    const [isOpen, setIsOpen] = React.useState(false);
    return (
        <div style={{
            display: 'block', width: 550, padding: 30
        }}>
            <h5>ReactJS Reactstrap Navbar Component</h5>
            <Navbar color="light" light >
                <NavbarBrand href="/">Brand</NavbarBrand>
                <NavbarToggler onClick={() => { setIsOpen(!isOpen) }} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav className="mr-auto" navbar>
                        <NavItem>
                            <NavLink href="#">Home</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink href="#">Login</NavLink>
                        </NavItem>
                    </Nav>
                </Collapse>
            </Navbar>
        </div >
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
